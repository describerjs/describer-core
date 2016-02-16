/// <reference path="../../describer-core/window.d.ts" />
/// <reference path="../../describer-core/libs/require.d.ts" />


import {Prototype} from 'prototype';

export default class Remove extends Prototype {
    
    $destination:JQuery;
    
    
    constructor(public elem: HTMLElement, public options:Object, public pluginName: string, public pos: string, public jmname:string){
        super(elem, options, pluginName, pos, jmname);
    }
    
    _exec(e, p_data){
        this.$destination = this.getRelatedToElem();
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
    }
    
    _removeClass(){
        this.$destination.removeClass(this.is('data'));
        this._finishing();
    }

    _removeHtml(){
        this.$destination.remove();
        this._finishing();
    }

    _removeAttr(){
        this.$destination.removeAttr(this.is('data'));
        this._finishing();
    }

    _removeProp(){
        this.$destination.removeProp(this.is('data'));
        this._finishing();
    }
}
