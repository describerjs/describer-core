/*!
 * actions.link v0.9
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
	var link = $.extend({}, _super, {
		init: function(options, elem){
			this.options = $.extend({}, this.options, options);
			this.name = this.options.pluginName;
			this.pos = this.options.pos;
			this.jmname = this.options.jmname;
			this.$elem = $(elem);
			_super.config.call(this);

			this.onInitExec();
			return this;
		},

		onInitExec: function(){
			this.loader = this.is('loader');
			if(this.loader !== ''){
				switch(this.loader){
					case 'sticky':
						this.$ani = $('<div class="loader-sticky">'+
							'<div class="rect1"></div>'+
							'<div class="rect2"></div>'+
							'<div class="rect3"></div>'+
							'<div class="rect4"></div>'+
							'<div class="rect5"></div>'+
							'</div> ');
						break;
					case 'spinner':
						this.$ani = $('<div class="loading-container"><div class="loading"></div></div>');
						break;
					case 'none':
						break;
					default:
						this.$ani = $('<div class="loader">'+
							'<div class="rect1"></div>'+
							'<div class="rect2"></div>'+
							'<div class="rect3"></div>'+
							'<div class="rect4"></div>'+
							'<div class="rect5"></div>'+
							'</div> ');
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
			if(!this.waited && this.is('wait') !== '' && this.is('wait') !== 'raf'){
				this.waited = true;
				setTimeout(function(){ that._exec(); }, parseInt(this.is('wait'), 10));
				return;
			}
			this.waited = false;
			this.$elem.append(this.$ani);
			window.location.href = this.$elem.attr('href');
		}
	});

	$.plugin('actions.link', link);
	return link;
});
