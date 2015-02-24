/*!
 * actions.move
 *
 * http://joinmedia.de/
 *
 * Copyright (c) 2014 join.media GmbH & Co. KG
 *
 * Created by aotten77 on 22.12.2014.
 *
 * Released under the MIT license
 */
define(['jquery', '_super'], function ($, _super){
	'use strict';
	var move = $.extend({}, _super, {
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

		_exec: function(e){
			this.$destination = this.getRelatedToElem();
			this.injectMethod = (this.is('inject') !== '') ? this.is('inject') : 'append';
			window.requestAnimationFrame(this._move.bind(this));
		},

		_move: function(){
			this.$destination[this.injectMethod](this.$elem);
			this._finishing();
		}

	});

	$.plugin('actions.move', move);
	return move;
});
