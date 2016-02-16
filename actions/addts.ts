/// <reference path="../../describer-core/window.d.ts" />


import {Prototype} from 'prototype';

export default class Add extends Prototype {
    $destination:JQuery;
    data:string;
    injectMethod:string;
    
    constructor(public elem: HTMLElement, public options:Object, public pluginName: string, public pos: string, public jmname:string){
        super(elem, options, pluginName, pos, jmname);
    }
    
    _exec(e, p_data){
        this.$destination = this.getRelatedToElem();

        if($.type(p_data) !== 'undefined'){
            this.data = (p_data.match(/<(.*)[^>]*>/)) ? $(p_data) : p_data;
        }else if(this.is('data') !== ''){
            this.data = this.is('data');
        }else{
            this.data = this._getOutcommendHtml();
        }

        switch(this.is('datatype')){
            case 'class':
                window.requestAnimationFrame(this._addClass.bind(this));
                break;
            case 'style':
                window.requestAnimationFrame(this._addStyle.bind(this));
                break;
            case 'html':
                this.injectMethod = (this.is('inject') !== '') ? this.is('inject') : 'html';
                window.requestAnimationFrame(this._addHtml.bind(this));
                break;
            case 'attr':
                window.requestAnimationFrame(this._addAttr.bind(this));
                break;
            case 'prop':
                window.requestAnimationFrame(this._addProp.bind(this));
                break;
            case 'text':
                window.requestAnimationFrame(this._addText.bind(this));
                break;
        }
    }

    _getOutcommendHtml(){
        var i = 0;
        var length = this.$destination[0].childNodes.length;
        for(; i < length; i++) {
            // node type 8 is comment
            if(this.$destination[0].childNodes[i].nodeType === 8) {
                this.$destination[0].childNodes[i].nodeValue
                return (this.$destination[0].childNodes[i].textContent !== undefined) ? this.$destination[0].childNodes[i].textContent.replace('comment in by JS', '') : this.$destination[0].childNodes[i].nodeValue.replace('comment in by JS', '');
            }
        }
        window.dc.dev.warn('data is not define or an empty string');
        return '';
    }

    _getCssObj(){
        var _obj = {};
        var _arr;
        var _dataArray = this.data.split('|');
        for(var i = 0, leni = _dataArray.length; i < leni; i++){
            _arr = _dataArray[i].split(':');
            _obj[_arr[0]] = _arr[1];
        }
        return _obj;
    }

    _addClass(){
        this.$destination.addClass(this.data);
        this._finishing();
    }

    _addStyle(){
        this.$destination.css(this._getCssObj());
        this._finishing();
    }

    _addAttr(){
        var data = this.data.split(':');
        this.$destination.attr(data[0], data[1]);
        this._finishing();
    }

    _addHtml(){
        var $data = $(this.data);
        this.$destination[this.injectMethod]($data);
        if(this.is('data') === ''){
            this._finishing($data);
        }else{
            this._finishing();
        }
    }

    _addText(){
        this.$destination.text(this.data);
        this._finishing();
    }

    _addProp(){
        var data:any[] = this.data.split(':');
        if(data[0] === 'checked'){
            // create a valid bool state
            data[1] = (data[1] === 'true');
        }
        this.$destination.prop(data[0], data[1]);
        this._finishing();
    }
}