/*!
 * modules.video v0.9
 *
 * http://joinmedia.de/
 *
 * Copyright (c) 2014 join.media GmbH & Co. KG
 *
 * Created by aotten77 on 22.08.2014.
 *
 * Released under the MIT license
 */
define(['jquery', '_super', 'video', 'css!require-css.video'], function ($, _super) {
    'use strict';
    var video = $.extend({}, _super, {
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
            //
        },
        options: {
            //
        },

        _exec: function () {
            var steps = $(".app_tutorial_step");
            var step1 = $(".app_tutorial_step1");
            var step2 = $(".app_tutorial_step2");
            var step3 = $(".app_tutorial_step3");
            var step4 = $(".app_tutorial_step4");
            var step5 = $(".app_tutorial_step5");
            var getTime;
            this._addHtml();
        },

        _addHtml: function () {
            var that = this;
            this.$elem.append('<video class="myapp-tutorial-video video-js vjs-default-skin" controls preload="none" width="' + this.is('width') + '" height="' + this.is('height') + '" poster="' + this.is('poster') + '">' +
                                '<source src="'+ this.is('src') +'.mp4" type="video/mp4" />'+
                                '<source src="'+ this.is('src') +'.webm" type="video/webm" />'+
                                '<source src="'+ this.is('src') +'.ogv" type="video/ogg" />'+
                             '</video>');
            window.videojs(this.$elem.find('video').eq(0)[0], {}, function(){
                that.$video = this;
                that._playerReady();
                that._addListener();
            });
        },

        _addListener: function () {
            var that = this;
            that.$video.on('timeupdate', function () {
                var currentPlayTime = that.$video.currentTime();
                if (currentPlayTime > 33 && currentPlayTime < 36) {
                    that._resetList();
                    $('#vid2').addClass("active");
                } else if (currentPlayTime > 76 && currentPlayTime < 79) {
                    that._resetList();
                    $('#vid3').addClass("active");
                } else if (currentPlayTime > 97 && currentPlayTime < 100) {
                    that._resetList();
                    $('#vid4').addClass("active");
                } else if (currentPlayTime > 138 && currentPlayTime < 141) {
                    that._resetList();
                    $('#vid5').addClass("active");
                }
            });
        },

        _resetList: function(){
            $('.bullet-list li').removeClass('active');
        },

        _playerReady: function () {
            var that = this;
            $('.bullet-list li').on('click', function (e) {
                that._resetList();
                $('#' + e.target.id).addClass('active');
                switch (e.target.id) {
                    case 'vid1':
                        that.$video.currentTime(0).play();
                        break;
                    case 'vid2':
                        that.$video.currentTime(33).play();
                        break;
                    case 'vid3':
                        that.$video.currentTime(76).play();
                        break;
                    case 'vid4':
                        that.$video.currentTime(97).play();
                        break;
                    case 'vid5':
                        that.$video.currentTime(138).play();
                        break;
                }
            });
         }                                                   
    });

    $.plugin('modules.video', video);
    return video;
});
