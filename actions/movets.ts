/// <reference path="../../describer-core/window.d.ts" />
/// <reference path="../../describer-core/libs/require.d.ts" />


import {Prototype} from 'prototype';

export default class Move extends Prototype {
    
    $destination:JQuery;
    injectMethod:string;
    
    
    constructor(public elem: HTMLElement, public options:Object, public pluginName: string, public pos: string, public jmname:string){
        super(elem, options, pluginName, pos, jmname);
    }
    
    _exec(e, p_data){
        this.$destination = this.getRelatedToElem();
        this.injectMethod = (this.is('inject') !== '') ? this.is('inject') : 'append';
        window.requestAnimationFrame(this._move.bind(this));
    }
    
    _move(){
        this.$destination[this.injectMethod](this.$elem);
        this._finishing();
    }
}