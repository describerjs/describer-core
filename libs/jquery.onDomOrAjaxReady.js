// Das Objekt dient zum vorhalten von Funktionen, die unmittelbar nach dem ready-Event von jQuery ausgeführt werden sollen
window.domReadyObject = {
    countProperties: function(){
        var count = 0;
        for(var property in this){
            if(this.hasOwnProperty(property)){
                count += 1;
            }
        }
        return count;
    }
};

// Die übergebenen Funktion wird entweder unmittelbar ausgeführt, wenn jQuery geladen und das 'ready'-Event geschmissen wurde, oder im domReadyObject vorgehalten.
window.onDomOrAjaxReady = function(p_function){
    if(typeof jQuery !== 'undefined'){
        ($.isReady) ? p_function() : $(document).on('ready', p_function);
    }else{
        window.domReadyObject['func_' + window.domReadyObject.countProperties()] = p_function;
    }
};

// Hier werden alle vorgehaltenen Funktionen im domReadyObject ausgeführt
window.execDomReadyObject = function(){
    for(var property in window.domReadyObject){
        if(window.domReadyObject.hasOwnProperty(property) && ('countProperties' !== property)){
            window.domReadyObject[property]();
        }
    }
};