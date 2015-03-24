/*!
 * modules.modal
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

		_exec: function(e){
			this.refID = this._getID();
			this.$ref = $('#'+this.refID);
			if(this.$ref.doesExist() && !this.$ref.hasClass('mask')){
				this.$outcommentHTML = this._getOutcommendHtml();
				this.$ref.replaceWith(this.$outcommentHTML);
			}
			window.requestAnimationFrame(this._switchModalDoesExist.bind(this));
		},

		_switchModalDoesExist: function(){
			this.$modal = $('#'+this.refID);
			if(this.$modal.doesExist()){
				window.requestAnimationFrame(this._openAndCallFinishing.bind(this));
			}else{
				window.requestAnimationFrame(this._createModal.bind(this));
			}
		},

		_getOutcommendHtml: function(){
			var i = 0;
			var length = this.$ref[0].childNodes.length;
			for(; i < length; i++) {
				// node type 8 is comment
				if(this.$ref[0].childNodes[i].nodeType === 8) {
					return (this.$ref[0].childNodes[i].textContent !== undefined) ? this.$ref[0].childNodes[i].textContent.replace('comment in by JS', '') : this.$ref[0].childNodes[i].data.replace('comment in by JS', '');
				}
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
			// return ID or md5 hash for Modal-ID
			return (this.$elem.attr('href').match(/^#(.*)/g)) ? this.$elem.attr('href').replace('#', '') : md5(this.$elem.attr('href'));
		},

		_execAjax: function(){
			// TODO Andreas bitte hier mal checken, wie hier eine algemeine Syntax zur Variablendefinition für erbende Plugins
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
			setTimeout(function(){
				this.$modal.find('.modal-dialog').css({'transform': 'translateY(0%) rotateX(0deg)'});
				this.$modal.addClass('open');
			}.bind(this),100);
		},

		_openAndCallFinishing: function(){
			this._open();
			setTimeout(function(){
				this._finishing();
			}.bind(this),100);
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
