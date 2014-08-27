/*!
 * actions.toggle v0.9
 *
 * http://joinmedia.de/
 *
 * Copyright (c) 2014 join.media GmbH & Co. KG
 *
 * Created by aotten77 on 22.08.2014.
 *
 * Released under the MIT license
 */
define(['jquery', '_super'], function ($, _super){
    'use strict';
    var toggle = $.extend({}, _super, {
        init: function (options, elem) {
            this.options = $.extend({}, this.options, options);
            this.name = this.options.pluginName;
            this.pos = this.options.pos;
	        this.jmname = this.options.jmname;
            this.$elem = $(elem);
            _super.config.call(this);

            this.onInitExec();
            return this;
        },

        onInitExec: function () {
	        if(this.includes('event', 'change') && this._isRadio()){
		        switch(this.$elem.attr('type')){
			        case 'radio':
				        this.currentstate = this.$elem.prop('checked');
				        break;
		        }
	        }
        },

        options: {

        },

        _exec: function(){
	        var that = this;
	        // wait - section
	        // 1. this.waited = false -> geht in setTimeout
	        // 2. this.waited = true && Aufruf der Funktion _exec
	        // 3. da jetzt wait === true ist wird setTimeout übersprungen
	        // 4. this.waited = false, um beim nächsten Aufruf wieder in setTimeout zu kommen
	        if(!this.waited && this.isNow('wait') !== '' && this.is('wait') !== 'raf'){
		        this.waited = true;
		        setTimeout(function(){ that._exec(); }, parseInt(this.is('wait'), 10));
		        return;
	        }
	        this.waited = false;
	        // check auf Zustandsänderung bei Radios und Checkboxen um den Toggel valida auf change-Events anzuwenden.
	        if(this.includes('event', 'change') && this._isRadio()){
		        this.newstate = this._getNewState();
		        if(this.currentstate === this.newstate){
			        return;
		        }
		        this.currentstate = this.newstate;
	        }
	        this.$destination = (this.is('relatedTo') !== '') ? $(this.is('relatedTo')) : this.$elem;
		    switch(this.is('datatype')){
				case 'class':
					window.requestAnimationFrame(this._toggleClass.bind(this));
					break;
				case 'attr':
					window.requestAnimationFrame(this._toggleAttr.bind(this));
					break;
				case 'prop':
					window.requestAnimationFrame(this._toggleProp.bind(this));
					break;
			}
		},

	    _isRadio: function(){
		    return (this.$elem[0].tagName.toLowerCase() === 'input' && this.$elem.attr('type') === 'radio');
	    },

	    _getNewState: function(){
		    if(this.$elem[0].tagName.toLowerCase() === 'input'){
			    switch(this.$elem.attr('type')){
				    case 'radio':
					    return this.$elem.prop('checked');
			    }
		    }
	    },

		_toggleClass: function(){
			this.$destination.toggleClass(this.is('data'));
			if(this.is('scrollTo') !== ''){
				this._scrollTo();
			}
		},

		_toggleAttr: function() {
			var data = this.is('data').split(':');
			//this.$destination.attr(data[0], data[1]);
			if ($.type(this.$destination.attr(data[0])) !== 'undefined'){
				this.$destination.removeAttr(data[0]);
			}else{
				this.$destination.attr(data[0], data[1]);
			}
		},

	    _toggleProp: function() {
		    switch(this.is('data')){
			    case 'checked':
				    this.$destination.prop('checked', !this.$destination.prop('checked'));
				    //this.$destination.trigger('change');
		    }
		    //this.$destination.attr(data[0], data[1]);

	    }
    });

    $.plugin('action.toggle', toggle);
    return toggle;
});
