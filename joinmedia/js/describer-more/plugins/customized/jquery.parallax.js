/**
 * jQuery || Zepto Parallax Plugin
 * @author Matthew Wagerfield - @wagerfield
 * @description Creates a parallax effect between an array of layers,
 *              driving the motion from the gyroscope output of a smartdevice.
 *              If no gyroscope is available, the cursor position is used.
 */
;(function($, window, document, undefined) {

  // Strict Mode
  'use strict';

  // Constants
  var NAME = 'parallax';
  var MAGIC_NUMBER = 90;
  var DEFAULTS = {
    relativeInput: false,
    clipRelativeInput: false,
    calibrationThreshold: 100,
    calibrationDelay: 500,
    supportDelay: 500,
    calibrateX: false,
    calibrateY: true,
    invertX: true,
    invertY: true,
    limitX: false,
    limitY: false,
    scalarX: 10.0,
    scalarY: 10.0,
    frictionX: 0.1,
    frictionY: 0.1,
    originX: 0.5,
    originY: 0.5,
	gyromouseX: false,
	gyromouseY: false,
	scrollX: false,
	scrollY: false
  };

  function Plugin(element, options) {

    // DOM Context
    this.element = element;

    // Selections
    this.$context = $(element).data('api', this);
    this.$layers = this.$context.find('.layer');

    // Data Extraction
    var data = {
      calibrateX: this.$context.data('calibrate-x') || null,
      calibrateY: this.$context.data('calibrate-y') || null,
      invertX: this.$context.data('invert-x') || null,
      invertY: this.$context.data('invert-y') || null,
      limitX: parseFloat(this.$context.data('limit-x')) || null,
      limitY: parseFloat(this.$context.data('limit-y')) || null,
      scalarX: parseFloat(this.$context.data('scalar-x')) || null,
      scalarY: parseFloat(this.$context.data('scalar-y')) || null,
      frictionX: parseFloat(this.$context.data('friction-x')) || null,
      frictionY: parseFloat(this.$context.data('friction-y')) || null,
      originX: parseFloat(this.$context.data('origin-x')) || null,
      originY: parseFloat(this.$context.data('origin-y')) || null
    };

    // Delete Null Data Values
    for (var key in data) {
      if (data[key] === null) delete data[key];
    }

    // Compose Settings Object
    $.extend(this, DEFAULTS, options, data);

    // States
    this.calibrationTimer = null;
    this.calibrationFlag = true;
    this.enabled = false;
    this.depths = [];
    this.raf = null;

    // Element Bounds
    this.bounds = null;
    this.ex = 0;
    this.ey = 0;
    this.ew = 0;
    this.eh = 0;

    // Element Center
    this.ecx = 0;
    this.ecy = 0;

    // Element Range
    this.erx = 0;
    this.ery = 0;

    // Calibration
    this.cx = 0;
    this.cy = 0;

    // Input
    this.ix = 0;
    this.iy = 0;

    // Motion
    this.mx = 0;
    this.my = 0;

    // Velocity
    this.vx = 0;
    this.vy = 0;

	this.tempXArray = [];
	this.tempYArray = []    ;

    // Callbacks
    this.onMouseMove = this.onMouseMove.bind(this);
    this.onDeviceOrientation = this.onDeviceOrientation.bind(this);
    this.onOrientationTimer = this.onOrientationTimer.bind(this);
    this.onCalibrationTimer = this.onCalibrationTimer.bind(this);
    this.onAnimationFrame = this.onAnimationFrame.bind(this);
    this.onWindowResize = this.onWindowResize.bind(this);
    this.onRAF = this.onRAF.bind(this);

    // Initialise
    this.initialise();
  }

  Plugin.prototype.transformSupport = function(value) {
    var element = document.createElement('div');
    var propertySupport = false;
    var propertyValue = null;
    var featureSupport = false;
    var cssProperty = null;
    var jsProperty = null;
    for (var i = 0, l = this.vendors.length; i < l; i++) {
      if (this.vendors[i] !== null) {
        cssProperty = this.vendors[i][0] + 'transform';
        jsProperty = this.vendors[i][1] + 'Transform';
      } else {
        cssProperty = 'transform';
        jsProperty = 'transform';
      }
      if (element.style[jsProperty] !== undefined) {
        propertySupport = true;
        break;
      }
    }
    switch(value) {
      case '2D':
        featureSupport = propertySupport;
        break;
      case '3D':
        if (propertySupport) {
          var body = document.body || document.createElement('body');
          var documentElement = document.documentElement;
          var documentOverflow = documentElement.style.overflow;
          if (!document.body) {
            documentElement.style.overflow = 'hidden';
            documentElement.appendChild(body);
            body.style.overflow = 'hidden';
            body.style.background = '';
          }
          body.appendChild(element);
          element.style[jsProperty] = 'translate3d(1px,1px,1px)';
          propertyValue = window.getComputedStyle(element).getPropertyValue(cssProperty);
          featureSupport = propertyValue !== undefined && propertyValue.length > 0 && propertyValue !== "none";
          documentElement.style.overflow = documentOverflow;
          body.removeChild(element);
        }
        break;
    }
    return featureSupport;
  };

  Plugin.prototype.ww = null;
  Plugin.prototype.wh = null;
  Plugin.prototype.wcx = null;
  Plugin.prototype.wcy = null;
  Plugin.prototype.wrx = null;
  Plugin.prototype.wry = null;
  Plugin.prototype.portrait = null;
  Plugin.prototype.desktop = !navigator.userAgent.match(/(iPhone|iPod|iPad|Android|BlackBerry|BB10|mobi|tablet|opera mini|nexus 7)/i);
  Plugin.prototype.vendors = [null,['-webkit-','webkit'],['-moz-','Moz'],['-o-','O'],['-ms-','ms']];
  Plugin.prototype.motionSupport = !!window.DeviceMotionEvent;
  Plugin.prototype.orientationSupport = !!window.DeviceOrientationEvent;
  Plugin.prototype.orientationStatus = 0;
  Plugin.prototype.transform2DSupport = Plugin.prototype.transformSupport('2D');
  Plugin.prototype.transform3DSupport = Plugin.prototype.transformSupport('3D');
  Plugin.prototype.propertyCache = {};
  Plugin.prototype.aot = null;
  Plugin.prototype.aob = null;
  Plugin.prototype.eot = null;
  Plugin.prototype.animationRange = null;

  Plugin.prototype.initialise = function() {

    // Configure Styles
    if (this.$context.css('position') === 'static') {
      this.$context.css({
        position:'relative'
      });
    }

	// Hardware Accelerate Context
    this.accelerate(this.$context);

    // Setup
	$('body').on('dc-documentHeightChange', this.setProperties.bind(this));
	this.setProperties();
    this.updateLayers();
    this.updateDimensions();
    this.enable();
    this.queueCalibration(this.calibrationDelay);
  };

  Plugin.prototype.setProperties = function() {
	  this.aot = (this.actionOffsetTop !== '') ? (parseInt(this.actionOffsetTop.split('%')[0], 10)/100) : 0;
	  this.aob = (this.actionOffsetBottom !== '') ? (parseInt(this.actionOffsetBottom.split('%')[0], 10)/100) : 0;
	  this.eot = $(this.element).offset().top;
	  this.animationRange = (this.animationRange !== '') ? (parseInt(this.animationRange, 10)) : 0;
  };

  Plugin.prototype.updateLayers = function() {

    // Cache Layer Elements
    this.$layers = this.$context.find('[data-depth]');
    this.depths = [];

    // Configure Layer Styles
    this.$layers.css({
      position:'absolute',
      display:'block',
      left: 0,
      top: 0
    });
    this.$layers.first().css({
      position:'relative'
    });

    // Hardware Accelerate Layers
    this.accelerate(this.$layers);

    // Cache Depths
    this.$layers.each($.proxy(function(index, element) {
	  var declarDepth = $(element).data('depth') || 0;
	  var calcDepth = (declarDepth !== 0) ? ((declarDepth-1)*5) : 0;
	  this.depths.push(calcDepth);
    }, this));
  };

  Plugin.prototype.updateDimensions = function() {
    this.ww = window.innerWidth;
    this.wh = window.innerHeight;
    this.wcx = this.ww * this.originX;
    this.wcy = this.wh * this.originY;
    this.wrx = Math.max(this.wcx, this.ww - this.wcx);
    this.wry = Math.max(this.wcy, this.wh - this.wcy);
  };

  Plugin.prototype.updateBounds = function() {
    this.bounds = this.element.getBoundingClientRect();
    this.ex = this.bounds.left;
    this.ey = this.bounds.top;
    this.ew = this.bounds.width;
    this.eh = this.bounds.height;
    this.ecx = this.ew * this.originX;
    this.ecy = this.eh * this.originY;
    this.erx = Math.max(this.ecx, this.ew - this.ecx);
    this.ery = Math.max(this.ecy, this.eh - this.ecy);
  };

  Plugin.prototype.queueCalibration = function(delay) {
    clearTimeout(this.calibrationTimer);
    this.calibrationTimer = setTimeout(this.onCalibrationTimer, delay);
  };

  Plugin.prototype.enable = function() {
    if (!this.enabled) {
      this.enabled = true;
      if(this.gyromouseX || this.gyromouseY){
        if (this.orientationSupport) {
	      this.portrait = null;
	      window.addEventListener('deviceorientation', this.onDeviceOrientation);
	      setTimeout(this.onOrientationTimer, this.supportDelay);
	    }else{
	      this.cx = 0;
	      this.cy = 0;
	      this.portrait = false;
	      window.addEventListener('mousemove', this.onMouseMove);
	    }
      }
	  if(this.scrollY){
	    this.myraf = requestAnimationFrame(this.onRAF);
	  }
      window.addEventListener('resize', this.onWindowResize);
      this.raf = requestAnimationFrame(this.onAnimationFrame);
    }
  };

  Plugin.prototype.disable = function() {
    if (this.enabled) {
      this.enabled = false;
      if (this.orientationSupport) {
        window.removeEventListener('deviceorientation', this.onDeviceOrientation);
      } else {
        window.removeEventListener('mousemove', this.onMouseMove);
      }
      window.removeEventListener('resize', this.onWindowResize);
      cancelAnimationFrame(this.raf);
    }
  };

  Plugin.prototype.calibrate = function(x, y) {
    this.calibrateX = x === undefined ? this.calibrateX : x;
    this.calibrateY = y === undefined ? this.calibrateY : y;
  };

  Plugin.prototype.invert = function(x, y) {
    this.invertX = x === undefined ? this.invertX : x;
    this.invertY = y === undefined ? this.invertY : y;
  };

  Plugin.prototype.friction = function(x, y) {
    this.frictionX = x === undefined ? this.frictionX : x;
    this.frictionY = y === undefined ? this.frictionY : y;
  };

  Plugin.prototype.scalar = function(x, y) {
    this.scalarX = x === undefined ? this.scalarX : x;
    this.scalarY = y === undefined ? this.scalarY : y;
  };

  Plugin.prototype.limit = function(x, y) {
    this.limitX = x === undefined ? this.limitX : x;
    this.limitY = y === undefined ? this.limitY : y;
  };

  Plugin.prototype.origin = function(x, y) {
    this.originX = x === undefined ? this.originX : x;
    this.originY = y === undefined ? this.originY : y;
  };

  Plugin.prototype.clamp = function(value, min, max) {
    value = Math.max(value, min);
    value = Math.min(value, max);
    return value;
  };

  Plugin.prototype.css = function(element, property, value) {
    var jsProperty = this.propertyCache[property];
    if (!jsProperty) {
      for (var i = 0, l = this.vendors.length; i < l; i++) {
        if (this.vendors[i] !== null) {
          jsProperty = $.camelCase(this.vendors[i][1] + '-' + property);
        } else {
          jsProperty = property;
        }
        if (element.style[jsProperty] !== undefined) {
          this.propertyCache[property] = jsProperty;
          break;
        }
      }
    }
    element.style[jsProperty] = value;
  };

  Plugin.prototype.accelerate = function($element) {
    for (var i = 0, l = $element.length; i < l; i++) {
      var element = $element[i];
      this.css(element, 'transform', 'translate3d(0,0,0)');
      this.css(element, 'transform-style', 'preserve-3d');
      this.css(element, 'backface-visibility', 'hidden');
    }
  };

  Plugin.prototype.setPosition = function(element, x, y) {
    x += 'px';
    y += 'px';
    if (this.transform3DSupport) {
      this.css(element, 'transform', 'translate3d('+x+','+y+',0)');
    } else if (this.transform2DSupport) {
      this.css(element, 'transform', 'translate('+x+','+y+')');
    } else {
      element.style.left = x;
      element.style.top = y;
    }
  };

  Plugin.prototype.onOrientationTimer = function(event) {
    if (this.orientationSupport && this.orientationStatus === 0) {
      this.disable();
      this.orientationSupport = false;
      this.enable();
    }
  };

  Plugin.prototype.onCalibrationTimer = function(event) {
    this.calibrationFlag = true;
  };

  Plugin.prototype.onWindowResize = function(event) {
    this.updateDimensions();
  };

  Plugin.prototype.onAnimationFrame = function() {
    this.updateBounds();
    var dx = this.ix - this.cx;
    var dy = this.iy - this.cy;
    if ((Math.abs(dx) > this.calibrationThreshold) || (Math.abs(dy) > this.calibrationThreshold)) {
      this.queueCalibration(0);
    }
    if (this.portrait) {
      this.mx = this.calibrateX ? dy : this.iy;
      this.my = this.calibrateY ? dx : this.ix;
    } else {
      this.mx = this.calibrateX ? dx : this.ix;
      this.my = this.calibrateY ? dy : this.iy;
    }
    this.mx *= this.ew * (this.scalarX / 100);
    this.my *= this.eh * (this.scalarY / 100);
    if (!isNaN(parseFloat(this.limitX))) {
      this.mx = this.clamp(this.mx, -this.limitX, this.limitX);
    }
    if (!isNaN(parseFloat(this.limitY))) {
      this.my = this.clamp(this.my, -this.limitY, this.limitY);
    }
    this.vx += (this.mx - this.vx) * this.frictionX;
    this.vy += (this.my - this.vy) * this.frictionY;
    for (var i = 0, l = this.$layers.length; i < l; i++) {
      var depth = this.depths[i];
      var layer = this.$layers[i];
      var xOffset = this.vx * depth * (this.invertX ? -1 : 1);
      var yOffset = this.vy * depth * (this.invertY ? -1 : 1);
	  if((this.tempXArray[i] !== xOffset) || this.tempYArray[i] !== yOffset){
		this.setPosition(layer, xOffset, yOffset);
	  }
	  this.tempXArray[i] = xOffset;
	  this.tempYArray[i] = yOffset;
      this.setPosition(layer, xOffset, yOffset);
    }
    this.raf = requestAnimationFrame(this.onAnimationFrame);
  };

  Plugin.prototype.onDeviceOrientation = function(event) {

    // Validate environment and event properties.
    if (!this.desktop && event.beta !== null && event.gamma !== null) {

      // Set orientation status.
      this.orientationStatus = 1;

      // Extract Rotation
      var x = (event.beta  || 0) / MAGIC_NUMBER; //  -90 :: 90
      var y = (event.gamma || 0) / (MAGIC_NUMBER); // -180 :: 180
	  // Um einen flip zu vermeinden range nur -1 u 1. Andernfalls ist die Range von -2 u. 2
	  if(y>1){
		  y = 1 - (y-1)
	  }else if(y<-1){
		  y = -1 - (y +1)
	  }
      // Detect Orientation Change
      var portrait = window.dc.win.innerHeight > window.dc.win.innerWidth;
      if (this.portrait !== portrait) {
        this.portrait = portrait;
        this.calibrationFlag = true;
      }

      // Set Calibration
      if (this.calibrationFlag) {
        this.calibrationFlag = false;
	      this.cx = -x;
	      this.cy = y;
      }

      // Set Input
      if (portrait) {
	    if(this.gyromouseX) this.iy = y;
	    if(this.gyromouseY) this.ix = x;
      }else{
	    if(this.gyromouseX) this.ix = -x;
	    if(this.gyromouseY) this.iy = y;
      }
    }
  };

  Plugin.prototype.onMouseMove = function(event) {

    // Cache mouse coordinates.
    var clientX = event.clientX;
    var clientY = event.clientY;
	//this.invertX = false;// add by JM
    // Calculate Mouse Input
    if (!this.orientationSupport && this.relativeInput) {

      // Clip mouse coordinates inside element bounds.
      if (this.clipRelativeInput) {
        clientX = Math.max(clientX, this.ex);
        clientX = Math.min(clientX, this.ex + this.ew);
        clientY = Math.max(clientY, this.ey);
        clientY = Math.min(clientY, this.ey + this.eh);
      }

      // Calculate input relative to the element.
      this.ix = (clientX - this.ex - this.ecx) / this.erx;
	  if(!this.gyromouseY) this.iy = (clientY - this.ey - this.ecy) / this.ery;

    } else {
      // Calculate input relative to the window.
	  if(this.gyromouseX) this.ix = (clientX - this.wcx) / this.wrx;
	  if(this.gyromouseY) this.iy = (clientY - this.wcy) / this.wry;
    }
  };

  Plugin.prototype.onRAF = function() {
	  // 1 -> ab 0% - 50% Parallax-Range Ani von Center - Top
	  // -1 -> ab 50% - 100% Parallax-Range Ani von Bottom - Center
	  if(this.element.offsetHeight === 0){
		  this.myraf = requestAnimationFrame(this.onRAF);
		  return;
	  }
	  var calc;
	  var _viewportTop = window.dc.win.pageYOffset - (window.dc.win.innerHeight * this.aob);
	  var _viewportBottom = window.dc.win.pageYOffset + window.dc.win.innerHeight - (window.dc.win.innerHeight * this.aot);
	  var range = _viewportBottom - _viewportTop + this.eh;
	  var portrait = window.dc.win.innerHeight > window.dc.win.innerWidth;
	  if(_viewportBottom < this.eot){
		  calc = 1;
	  }else if(_viewportTop > this.eot + this.eh){
		  calc = -1;
	  }else{
		  calc = -2*((_viewportBottom - this.eot) / range)+1;
	  }
	  calc = calc + this.animationRange;//rangeStart  rangeStop
	  calc =  (calc > 1) ? 1 : calc;
	  calc =  (calc < -1) ? -1 : calc;
	  //console.log(calc);
//0.5 - -0.7 calc
    /*var eot = $(this.element).offset().top;
    var wih = window.dc.win.innerHeight;
    var wpo = window.dc.win.pageYOffset;
    var first = wpo + window.dc.win.innerHeight  > eot;
    var secont = wpo < eot + this.eh;
    var range = wih + this.eh;
	var portrait = window.dc.win.innerHeight > window.dc.win.innerWidth;
    if(first && ! secont){
	    calc = 0;
    }else if(!first && secont){
	    calc = 1;
    }else if(first && secont){
	    calc = -2*((wpo + wih - eot) / range)+1;
    }*/

	if(portrait && (this.gyromouseX || this.gyromouseY) && !this.desktop){
	  if(this.scrollY) this.ix = calc;
	  if(this.scrollX) this.iy = calc;
	}else{
	  if(this.scrollY) this.iy = calc;
	  if(this.scrollX) this.ix = calc;
	}
	  this.myraf = requestAnimationFrame(this.onRAF);

  };

  var API = {
    enable: Plugin.prototype.enable,
    disable: Plugin.prototype.disable,
    updateLayers: Plugin.prototype.updateLayers,
    calibrate: Plugin.prototype.calibrate,
    friction: Plugin.prototype.friction,
    invert: Plugin.prototype.invert,
    scalar: Plugin.prototype.scalar,
    limit: Plugin.prototype.limit,
    origin: Plugin.prototype.origin
  };

  $.fn[NAME] = function (value) {
    var args = arguments;
    return this.each(function () {
      var $this = $(this);
      var plugin = $this.data(NAME);
      if (!plugin) {
        plugin = new Plugin(this, value);
        $this.data(NAME, plugin);
      }
      if (API[value]) {
        plugin[value].apply(plugin, Array.prototype.slice.call(args, 1));
      }
    });
  };

})(window.jQuery || window.Zepto, window, document);
