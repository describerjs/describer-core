/// <reference path="libs/jquery.d.ts" />
/// <reference path="prototype.d.ts" />


interface DCClient {
    getHeight():number;
    setUserOS():string;
    vendors:any[];
    orientation:string;
    setDeviceState():void;
    deviceState:string;
    touch:boolean;
    _orientation_old:number;
}

interface DCConfig {
    debug:boolean;
}

interface DCDev {
    alert(data:string):void;
    log(data:string):void;
    error(data:string):void;
    warn(data:string):void;
    checkConfigJS():void;
    checkEqualIDs():void;
    checkJmNameElementenOnNecessaryDominitAttribut():void;
    debugview:boolean;
}

interface DCDomready {
    addStateIndicator():void;
    checkUrl():void;
}

interface DCEventflow {
    eventDelegationTrigger(e:Event, param:any):void;
    eventDelegationTriggerForDomInit(e:JQueryEventObject, param?:any):void;
    eventDelegationTriggerForATags(e:JQueryEventObject):void;
    eventDelegationTriggerForLabels(e:JQueryEventObject):void;
    eventDelegationTriggerForRadios(e:JQueryEventObject):void;
    eventDelegationHelper($this:JQuery, e:JQueryEventObject, param?:any):void;
    getConfigObj(p_name:string):Object;
    bindPlugin(obj:Object):void;
    matchTriggerEventWithConfigEvents(p_index:number, p_Obj:Object, p_pluginConfigOjb:Object):boolean;
    isDominitEvent(p_event:string):boolean;
    helperForBindPlugin(Obj:Object, p_plugin:string, index:number):void;
    bindAndExecPlugin(Obj:Object, p_plugin:string, _index:number, pluginObj:Object):void;
    triggerJmtriggerEventForAllOtherRadiosInGroup(e:JQueryEventObject):void;
    isEventKeyInDomConfigObj(p_index:number, p_Obj:Object, p_indexAttr:number):boolean;
}

interface DCForm {
    serviceCheck():void
}

interface DCHelper {
    addXhrProgressEvent():void;
    attrPrefixCounter(elem:HTMLElement, prefix:string):number;
    attrPrefix(elem:HTMLElement, prefix:string, index:number):string;
    camelCase(str:string):string;
    doTimeout:Object;
    setDevicePerfForParallax():void;
    checkOrientationAndTriggerDcResize():void;
    createModal(html:string, isNotCloseable:boolean):JQuery;
    countProperties(obj:Object):number;
    returnRequireLoadPlugin(p_plugin:string):string;
    getScrollPos():number;
    hasClass(elem:HTMLElement, selector:string):boolean;
    scrollToPosition(pos:number, speed?:number);
    escapeHtml(str:string):string;
    transformSupport(value:string):boolean;
    uuID:UUID;
}

interface UUID {
    generate():string;
}

interface DCModulPreloader {
    helperForRequirementsForJmPlugins(jmname:string):void;
}

interface DCPerf {
    level:number;
    onHoldArray:DCPerfOnHoldArray[];//{ 'obj': this, 'e': e, 'exec': false }
    onHoldArrayExecuted:boolean;
    intervalIDForOnHoldPlugins:number
}

interface DCPerfOnHoldArray {
    obj:IPrototype;
    e:JQueryEventObject;
    exec:boolean;
}

interface DCRaf {
    iterationSingleton:boolean;
    execIterationObj:Object;
    win:DCRafWin;

}

interface DCRafWin {
    _avgrafs:number;
    pageYOffset:number;
    innerHeight:number;
    outerHeight:number;
    innerWidth:number;
    _counter:number;
    documentHeight:number;
    _rafs:number;
    _startTime:number;
}

interface Describer {
    client: DCClient;
    config: DCConfig;
    dev: DCDev;
    domready: DCDomready;
    eventflow : DCEventflow;
    form: DCForm;
    helper: DCHelper;
    modulPreloader: DCModulPreloader;
    perf: DCPerf;
    raf: DCRaf;
}

interface Window {
    dc:Describer
}