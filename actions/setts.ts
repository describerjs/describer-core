/// <reference path="../../describer-core/window.d.ts" />
/// <reference path="../../describer-core/libs/require.d.ts" />


import {Prototype} from 'prototype';

export default class Set extends Prototype {
    
    $destination:JQuery;
    data:string;
    
    
    constructor(public elem: HTMLElement, public options:Object, public pluginName: string, public pos: string, public jmname:string){
        super(elem, options, pluginName, pos, jmname);
    }
    
    _exec(e, p_data){
        this.$destination = this.getRelatedToElem();
        this.data = this.is('data');
        switch(this.is('datatype')){
            case 'attr':
                window.requestAnimationFrame(this._setAttr.bind(this));
                break;
            case 'prop':
                window.requestAnimationFrame(this._setProp.bind(this));
                break;
            case 'style':
                window.requestAnimationFrame(this._setStyle.bind(this));
                break;
            case 'val':
            default:
                window.requestAnimationFrame(this._setVal.bind(this));
                break;
        }
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

    _setVal(){
        this.$destination.val(this.data);
        this._finishing();
    }

    _setAttr(){
        var data = this.data.split(':');
        this.$destination.attr(data[0], data[1]);
        this._finishing();
    }

    _setStyle(){
        this.$destination.css(this._getCssObj());
        this._finishing();
    }

    _setProp(){
        var data:any[] = this.data.split(':');
        if(data[0] === 'checked'){
            data[1] = (data[1] === 'true');
        }
        this.$destination.prop(data[0], data[1]);
        this._finishing();
    }
}
