/**
 * Created by aotten77 on 17.11.2014.
 */

define(['jquery', '_super', 'jquery_canvasResize'], function($, _super){
	'use strict';

	var fotoupload = $.extend({}, _super, {
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

		},

		_exec: function(){
			var $inputFileElem = this.$elem.siblings('input[type="file"]');
            this.$elem.on('click', function (e) {
                $inputFileElem.trigger('click');
                e.preventDefault();
            });
            $inputFileElem.change(function (e) {
                var that = this;
                var file;
                //var $relatedElem = $(that.$elem.data('jmrelatedto'));
                //var $removeBtn;
                file = e.target.files[0];
                $.canvasResize(file, {
                    width: 1382,
                    crop: false,
                    quality: 80,
                    //rotate: 90,
                    callback: function (data, width, height) {
                        $inputFileElem.siblings('.form-upload-canvas').append($('<img src="' + data + '" />'));
                        $inputFileElem.after($('<input type="hidden" name="file" value="' + data + '" />'));
                        //if ($relatedElem.find('input[name="statementfile"]').doesExist()) {
                        //    $relatedElem.find('input[name="statementfile"]').val(data);
                        //} else {
                        //    $relatedElem.find('form').append($('<input type="hidden" name="statementfile" value="' + data + '" />'));
                        //}
                    }
                });
            });
		}
	});

	$.plugin('modules.fotoupload', fotoupload);
	return fotoupload;
});
        //var file;
//                var $relatedElem = $(that.$elem.data('jmrelatedto'));
//                var $removeBtn;
//                /*$('.cta-btns').transition({ opacity: 0 }, 300, 'ease');
//                setTimeout(function () {
//                    $('.cta-btns').hide();
//                }, 300);*/

//                if (Modernizr.filereader) {
//                    file = e.target.files[0];
//                    $.canvasResize(file, {
//                        width: 1382,
//                        crop: false,
//                        quality: 80,
//                        //rotate: 90,
//                        callback: function (data, width, height) {
//                            $inputFileElem.siblings('.form-upload-canvas').append($('<img src="' + data + '" />'));
                            
//                            if ($relatedElem.find('input[name="statementfile"]').doesExist()) {
//                                $relatedElem.find('input[name="statementfile"]').val(data);
//                            } else {
//                                $relatedElem.find('form').append($('<input type="hidden" name="statementfile" value="' + data + '" />'));
//                            }
//                        }
//                    });
//                    $removeBtn = $('<a data-jmelement="kalbini-duyur.buttons.removeFoto" class="btn-remove">Foto zum Beitrag entfernen</a>');
//                    that.$elem.siblings('input').after($removeBtn);
//                    $removeBtn.requirementsForJmElements();
//                    $removeBtn.triggerSelfexecObj();
//                    $('[data-jmdomselector="jmTextarea"]').attr('data-jmremovejmrequired', 'true').siblings('.error').remove();
//                    that.$elem.siblings('input[type="file"]').blur();
//                    that.$elem.closest('[ data-jmdomselector="fileupload"]').find('.form-upload-choice, .form-upload-video').remove();
//                    that.$elem.remove();
//                }else{
//                    this.$elem.closest('[ data-jmdomselector="fileupload"]').find('.form-upload-choice, .form-upload-video').remove();
//                }