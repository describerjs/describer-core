/// <reference path="libs/jquery.d.ts"/>

interface JQuery {
    scrollToTop(position:number):JQuery;
    scrollToMe(p_delta_offset:number, speed?:number):JQuery;
    doesExist():boolean;
    requirementsForJmPlugins():JQuery;
    triggerSelfexecObj():JQuery;
    picturefill():void;
    jmtrigger(event:string, data:any):JQuery;
    
    
    //external plugins
    
    validate(any):any;
    valid():boolean;
}

interface JQueryStatic{
    //external plugins
    doTimeout(string):any;
}