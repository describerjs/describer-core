/*!
 * modules.modal v0.9
 *
 * http://joinmedia.de/
 *
 * Copyright (c) 2014 join.media GmbH & Co. KG
 *
 * Created by aotten77 on 22.08.2014.
 *
 * Released under the MIT license
 */
define(['jquery', 'actions.ajax', 'md5'], function ($, extendOjb, md5){
	'use strict';
	var modal = $.extend({}, extendOjb, {
		onInitExec: function () {
			extendOjb.onInitExec.call(this);
			this.subObj_injection = 'html';
		},

		options: {

		},

		_exec: function(){
			this.$modal = $('#'+this._getID());
			if(this.$modal.doesExist()){
				window.requestAnimationFrame(this._open.bind(this));
			}else{
				window.requestAnimationFrame(this._createModal.bind(this));
			}
		},

		_createModal: function(){
			this.$modal = $('<div id="'+this._getID()+'" class="mask">' +
								'<div class="modal-bar">' +
									'<a class="modal-close">Close</a>' +
								'</div>' +
								'<div class="modal">' +
									'<div class="modal-dialog"></div>' +
								'</div>' +
							'</div>');
			$('body').append(this.$modal);
			window.requestAnimationFrame(this._open.bind(this));
			window.requestAnimationFrame(this._execAjax.bind(this));
		},

		_getID: function(){
			return (this.$elem.attr('href').match(/^#(.*)/g)) ? this.$elem.attr('href').replace('#', '') : md5(this.$elem.attr('href'));
		},

		_execAjax: function(){
			this.subObj_$destination = this.$modal.find('.modal-dialog');
			extendOjb._exec.call(this);
			this.$modal.addClass('is-loading');
		},

		_open: function(){
			var that = this;
			this.div = ((jmHF.getScrollPos()/$(document).height())*25)-50;
			this.$modal.find('.modal-dialog').css({'transform': 'translateY('+this.div+'%) rotateX(15deg)'});
			this.$modal.css({
				'height': $(document).height(),
				'padding-top': jmHF.getScrollPos()
			});
			setTimeout(function(){
				this.$modal.find('.modal-dialog').css({'transform': 'translateY(0%) rotateX(0deg)'});
				this.$modal.addClass('open');
			}.bind(this),100);
//			this.$modal.on('click', '.modal-close', function(e){
			this.$modal.find('.modal-dialog').on('click', function(e){
				/* // umsetzung um ein rt-modal mit üblicher Event-Delegation umzusätzen.
				if($(e.target).attr('data-jmname') !== 'modal'){
					e.stopPropagation();
				}*/
				e.stopPropagation();
			});
			this.$modal.find('.modal-dialog').on('click', '.modal-close', this._close.bind(this));

			this.$modal.find('.rt-modal-btn').on('click', function(e){
				e.preventDefault();
				$('.modal-legal').remove();
				$('.modal-dialog').append('<div class="modal-legal"></div>');
				$(".modal-legal").load(e.currentTarget.href);
				$("html, body").animate({ scrollTop: $(document).height() }, 1000);
			});

			this.$modal.on('click', this._close.bind(this));
		},

		_close: function(e){
			var that = this;
			e.preventDefault();
			that.$modal.css('padding-top', 0);
			that.$modal.find('.modal-dialog').css('transform', 'translateY('+this.div+'%) rotateX(15deg)');
			that.$modal.addClass('close');
			setTimeout(function(){
				that.$modal.removeClass('close open');
				$('.modal-legal').remove();
			}, 800);
		},

		ajaxCompleteCallback: function(){
			this.$modal.removeClass('is-loading');
		}
	});

	$.plugin('modules.modal', modal);
	return modal;
});
