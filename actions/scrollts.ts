/// <reference path="../../describer-core/window.d.ts" />
/// <reference path="../../describer-core/libs/require.d.ts" />


import {Prototype} from 'prototype';

export default class Scroll extends Prototype {
    
    constructor(public elem: HTMLElement, public options:Object, public pluginName: string, public pos: string, public jmname:string){
        super(elem, options, pluginName, pos, jmname);
    }
    
    _exec(e, p_data){
        this._finishing();   
    }
}
