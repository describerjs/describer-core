define(['jquery', '_super'], function ($, _super){
	'use strict';
	var remove = $.extend({}, _super, {
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
			//this._exec();
			//{ url:'/bla', data:'parameter', method:'post', destination:'data-jmconfig*=domselectro:exampleID', inject:'before/after/prepend/append/html(replace)' }
		},
		//{'event': 'click', datatype': 'class', 'relatedTo': '.manage', 'data': 'manage-open'}">
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
			this.$destination = (this.is('relatedTo') !== '') ? $(this.is('relatedTo')) : this.$elem;
			switch(this.is('datatype')){
				case 'class':
					window.requestAnimationFrame(this._removeClass.bind(this));
					break;
				case 'html':
					window.requestAnimationFrame(this._removeHtml.bind(this));
					break;
				case 'attr':
					window.requestAnimationFrame(this._removeAttr.bind(this));
					break;
				case 'prop':
					window.requestAnimationFrame(this._removeProp.bind(this));
					break;
			}
		},

		_removeClass: function(){
			this.$destination.removeClass(this.is('data'));
			if(this.is('scrollTo') !== ''){
				this._scrollTo();
			}
		},

		_removeHtml: function(){
			this.$destination.remove();
			if(this.is('scrollTo') !== ''){
				this._scrollTo();
			}
		},

		_removeAttr: function(){
			this.$destination.removeAttr(this.is('data'));
			if(this.is('scrollTo') !== ''){
				this._scrollTo();
			}
		},

		_removeProp: function(){
			this.$destination.removeProp(this.is('data'));
			if(this.is('scrollTo') !== ''){
				this._scrollTo();
			}
		}

	});

	$.plugin('action.remove', remove);
	return remove;
});
