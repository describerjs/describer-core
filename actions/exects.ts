/// <reference path="../../describer-core/window.d.ts" />
/// <reference path="../../describer-core/libs/require.d.ts" />


import {Prototype} from 'prototype';

export default class Exec extends Prototype {
    
    constructor(public elem: HTMLElement, public options:Object, public pluginName: string, public pos: string, public jmname:string){
        super(elem, options, pluginName, pos, jmname);
    }
    
    _exec(e, p_data){
        try{
            eval(this.is('exec').replace(/\n/g, ''));
        }catch(e){
            window.dc.dev.warn(e);
        }
        this._finishing();
    }
}
