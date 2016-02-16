/// <reference path="../../describer-core/window.d.ts" />
/// <reference path="../../describer-core/libs/require.d.ts" />


import {Prototype} from 'prototype';

export default class Link extends Prototype {
    
    $destination:JQuery;
    loader:string;
    $ani:JQuery;
    url:string;
    
    
    constructor(public elem: HTMLElement, public options:Object, public pluginName: string, public pos: string, public jmname:string){
        super(elem, options, pluginName, pos, jmname);
    }
    
    onInitExec(){
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
    }
    
    _exec(e, p_data){
        this.$elem.append(this.$ani);
        this.url = (this.$elem.attr('href').substring(0,1) !== '#') ? this.$elem.attr('href') : this.is('prefix') + this.$elem.attr('href');
        (this.$elem.attr('target') === '_blank') ? window.open(this.url, '_blank') : window.location.href = this.url;
    }
}
