/// <reference path="../../describer-core/window.d.ts" />
/// <amd-dependency path="css!config.require-css.ajax" />

import {Prototype} from 'prototype';

export default class Ajax extends Prototype {
    loader:string;
    $ani:JQuery;
    $additionalloader:JQuery;
    $destination:JQuery;
    subObj_$destination:JQuery;
    injection:string;
    $loadertargetani:JQuery;
    data:JQuery | string;
    
    constructor(public elem: HTMLElement, public options:Object, public pluginName: string, public pos: string, public jmname:string){
        super(elem, options, pluginName, pos, jmname);
    }
    
    onInitExec() {
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
            }else{
                this.$ani = $('<div class="loading-container"><div class="loading"></div></div>');
            }
	        if(this.is('loaderTo') !== ''){
		        this.$additionalloader = $('<div class="loading-container"><div class="loading"></div></div>');
	        }
            
            //this._exec();
            //{ url:'/bla', data:'parameter', method:'post', destination:'data-jmconfig*=domselectro:exampleID', inject:'before/after/prepend/append/html(replace)' }
        }
    
    _exec(e, p_data){
        var that = this;
        if(this.is('loaderTo') !== ''){
	        $(this.is('loaderTo')).append(this.$additionalloader);
        }
        // TODO Andreas bitte hier mal checken, wie hier eine algemeine Syntax zur Variablendefinition für erbende Plugins
        // TODO Andreas in den anderen actions wird nun auch this.$destination = this.getRelatedToElem(); verwendet. Bitte verallgemeinern
        this.$destination = this.subObj_$destination || this.getRelatedToElem();
        this.injection = this.is('inject');
        $.ajax({
            type: (that.is('type') !== '') ? ((that.is('type', 'post')) ? 'POST' : 'GET') : 'GET',
            url: that._getUrl(),
            data: that._getData(),
            beforeSend: function (){
                that._beforeSend(that.$destination);
            }
        }).done(function (p_data) {
            // if HTML -> wrap in jQuery
	        that.data = ($.type(p_data) === 'string' && p_data.match(/<(.*)[^>]*>/)) ? $(p_data) : p_data;
            window.requestAnimationFrame(that._injectAfterFrame.bind(that));
        }).always(function () {

        }).fail(function () {
            that.$ani.remove();
            if(that.is('loaderTo') !== ''){
	            that.$additionalloader.remove();
            }
        });
    }
    
    // TODO Andreas bereinigen der _getData-Funktion Sonderfall $$ als neues Modul, welches von ajax abgeleitet wird.
        _getData(){
        	var _obj = {};
	        // TODO Andreas ist doppelt siehe _super.js
	        if(this.is('data').indexOf('this.') !== -1){
		        return eval(this.is('data'));
	        }
	        // this.is('data').match auf String mit beginnenden $$ -Zeichen dann wird die Value des Elements in das window.dc als Objekt $$... gespeichert.
	        // Dieses Objekt wird dann in einen Query-String umgewandelt und zurückgegeben.
	        // Somit kann einen Form-Auswahl im $$.. gespeichert werden und diese wird dann via Ajax gesendet.
            if(this.is('data').match(/^\$\$(.*)/)){
	            window.dc[this.is('data')] = window.dc[this.is('data')] || {};
	            if(this.$elem[0].tagName.toLowerCase() === 'select'){
		            window.dc[this.is('data')][this.$elem.attr('name')] = this.$elem.val();
	            }
	            return this._convertObjToQueryString(window.dc[this.is('data')]);
            }

	        // ist this.$elem ein form-Tag und es wird auf den event submit gematcht, werden die Formulardaten als Querystring zurückgegebent.
            // !!! wird nicht mehr menötigt, da es jetzt möglich ist, mit data auch einen string zu evaluieren.
            /*if(this.is('event', 'submit')){
	            return this.$elem.serialize();
            }*/
			// data oder lehrString wird zuürckgegeben.
			if(this.is('data') !== ''){
				return this.is('data');
			}

			if (this.is('data') === '' && this.$elem[0].tagName.toLowerCase() === 'select') {
				_obj[this.$elem.attr('name')] = this.$elem.val();
				return _obj;
			}

	        return '';

        }

	    _getUrl(){
		    if(this.is('url') !== ''){
			    return this.is('url');
		    }
		    if($.type(this.$elem.attr('href')) !== 'undefined' && !this.$elem.attr('href').match(/^#(.*)/g)){
			    return this.$elem.attr('href');
		    }
		    window.dc.dev.warn('There is no valid url defined');
	    }

        _convertObjToQueryString(p_Obj){
            var q = '';
            $.each(p_Obj, function(key, value){
                if(value !== ''){
                    q = q + ((q !== '') ? '&' : '') + key+'='+value;
                }
            });
            return q;
        }


        _beforeSend(p_$target){
/*	        if(this.is('inject', 'html')){
		        p_$target
			        .removeClass('visible')
			        .addClass('hidden');
	        }else{
		        p_$target
			        [this.is('inject')](this.$ani);
	        }*/
	        if($.type(this.$ani) !== 'undefined'){
		        this.$ani.css({
			        'top': window.dc.client.getHeight()/2
		        });
		        if(this.injection !== ''){
			        p_$target[this.injection](this.$ani);
		        }
	        }
	        if(this.is('scrollTo') !== ''){
		        this._scrollTo();
	        }
        }

        
	    _injectAfterFrame(){
		    var that = this;
		    if($.type(this.$ani) !== 'undefined'){
				this.$ani.remove();
		    }
		    if(this.is('loadertarget') !== ''){
			    this.$loadertargetani.remove();
		    }
		    if(this.injection === 'html'){
				this.$destination.empty();
		    }
			if(this.$destination.doesExist() && this.injection !== ''){
				this.$destination[this.injection](this.data);
			}
		    if(this.data instanceof jQuery){
			    this._finishing(this.data);
		    }else{
			    this._finishing();
		    }
            
		    // TODO Andreas bitte testen: Das Auskommentierte sollte jetzt durch die Angabe via 'callback' oblosate sein
		    /*if(this.is('afterexec') === 'remove'){
		        //this.$elem.parent().data('masonry').masonry( 'appended', that.data );
			    this.$elem.remove();
		    }*/
		    this.ajaxCompleteCallback();
	    }

	    getResponse(){
		    return this.data;
	    }

	    // TODO Andreas bitte hier mal checken, wie hier eine algemeine Syntax zur Funktionsdefinition für erbende Plugins
	    ajaxCompleteCallback(){

	    }

   
}