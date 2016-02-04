interface Prototype {
    $elem: JQuery;
	myPos: string;
	myJmName: string;
	namePostfix: string;
	name: string;
	configObj: Object;
	initConfigObj: Object;
    dcEvents:string[];
	oneTimeExec:boolean;
	renderDelay:number;
	conditionSource:string;
	staticObj: Object;
	staticAttrFromDom: string;
	staticObjFromDom: Object;
	_exec(e:Event, p_data?:any):void;
    relatedTo:JQuery;
    uniqueId:string;
    thempCountedFrames:number;
    $acount:JQuery;
    $initByPerfCounter:JQuery;
    renderFunctionIndex:number;
    
    initExec():void;
    onInitExec():void;
    click(e:JQueryEventConstructor):void;
    change(e:JQueryEasingFunction):void;
    jmtrigger(e:JQueryEasingFunction, e_param?:any):void;
    dominit(e:JQueryEasingFunction):void;
    is(p_dataAttr:string, p_value?:string, p_now?:boolean):void;
    isNow(p_dataAttr:string, p_value?:string):void;
    isCondition(p_value?:string, p_now?:boolean):boolean;
    includes(p_dataAttr:string, p_value:string, p_now?:boolean)
    
    
    
    
    
    _execWaitAfterCondition(e?:JQueryEventConstructor):void;
}
