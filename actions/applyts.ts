/// <reference path="../../describer-core/window.d.ts" />
/// <reference path="../../describer-core/libs/require.d.ts" />


import {Prototype} from 'prototype';

export default class Apply extends Prototype {
    
    $destination:JQuery | any;
    
    
    constructor(public elem: HTMLElement, public options:Object, public pluginName: string, public pos: string, public jmname:string){
        super(elem, options, pluginName, pos, jmname);
    }
    
    _exec(e, p_data){
        var that = this;
        var options = {};
        var _opt;
        if(that.is('options') !== ''){
            if(this.is('optionsParse') === 'true'){
                _opt = this.is('options').replace('"', '\"')
                options = JSON.parse(this.is('options'));
            }else{
                options = that.is('options');
            }
        }
        this.$destination = this.getRelatedToElem();
        if(this.is('function') !== ''){
            require([this.is('require')], function(){
                that.$destination[that.is('function')](options);
            });
        }
        this._finishing();
    }
}
