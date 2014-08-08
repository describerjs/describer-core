define(['jquery', '_super'], function ($, _super){
	'use strict';
	var scroll = $.extend({}, _super, {
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
			if(this.is('scrollTo') !== ''){
				this._scrollTo();
			}
		}
	});

	$.plugin('action.scroll', scroll);
	return scroll;
});
