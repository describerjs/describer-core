/// <reference path="../../describer-core/window.d.ts" />
/// <reference path="../../describer-core/libs/require.d.ts" />


import {Prototype} from 'prototype';

export default class Trigger extends Prototype {
    
    $destination:JQuery;
    
    
    constructor(public elem: HTMLElement, public options:Object, public pluginName: string, public pos: string, public jmname:string){
        super(elem, options, pluginName, pos, jmname);
    }
    
    _exec(e, p_data){
        this.$destination = this.getRelatedToElem();
        this.$destination.trigger(this.is('data'));
        this._finishing();
    }
}
