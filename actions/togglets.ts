/// <reference path="../../describer-core/window.d.ts" />
/// <reference path="../../describer-core/libs/require.d.ts" />


import {Prototype} from 'prototype';

export default class Toggle extends Prototype {
    
    $destination:JQuery;
    currentstate:boolean;
    newstate:boolean;
    
    
    constructor(public elem: HTMLElement, public options:Object, public pluginName: string, public pos: string, public jmname:string){
        super(elem, options, pluginName, pos, jmname);
    }
    
    onInitExec () {
        if(this.includes('event', 'change') && this._isRadio()){
            switch(this.$elem.attr('type')){
                case 'radio':
                    this.currentstate = this.$elem.prop('checked');
                    break;
            }
        }
    }
    
    _exec(e, p_data){
        // check auf Zustandsänderung bei Radios und Checkboxen um den Toggel valida auf change-Events anzuwenden.
        if(this.includes('event', 'change') && this._isRadio()){
            this.newstate = this._getNewState();
            if(this.currentstate === this.newstate){
                return;
            }
            this.currentstate = this.newstate;
        }
        this.$destination = this.getRelatedToElem();
        switch(this.is('datatype')){
            case 'class':
                window.requestAnimationFrame(this._toggleClass.bind(this));
                break;
            case 'attr':
                window.requestAnimationFrame(this._toggleAttr.bind(this));
                break;
            case 'prop':
                window.requestAnimationFrame(this._toggleProp.bind(this));
                break;
        }
    }
    
    _isRadio(){
        return (this.$elem[0].tagName.toLowerCase() === 'input' && this.$elem.attr('type') === 'radio');
    }

    _getNewState(){
        if(this.$elem[0].tagName.toLowerCase() === 'input'){
            switch(this.$elem.attr('type')){
                case 'radio':
                    return this.$elem.prop('checked');
            }
        }
    }

    _toggleClass(){
        this.$destination.toggleClass(this.is('data'));
        this._finishing();
    }

    _toggleAttr() {
        var data = this.is('data').split(':');
        //this.$destination.attr(data[0], data[1]);
        if ($.type(this.$destination.attr(data[0])) !== 'undefined'){
            this.$destination.removeAttr(data[0]);
        }else{
            this.$destination.attr(data[0], data[1]);
        }
        this._finishing();
    }

    _toggleProp() {
        switch(this.is('data')){
            case 'checked':
                this.$destination.prop('checked', !this.$destination.prop('checked'));
        }
        this._finishing();

    }
}
