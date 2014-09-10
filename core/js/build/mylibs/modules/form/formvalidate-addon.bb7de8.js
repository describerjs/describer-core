define(["jquery","jquery_validate"],function(){!function(a){a.validator.addMethod("jmrelatedelementCheckbyval",function(b,c){var d=a(c).closest("form").find(a(c).data("jmrelatedto")).val();return""!==a(c).val()&&(""===d||"0"===d)?!1:!0},"Es wurde kein zugehöriger Tarif ausgewählt"),a.validator.addMethod("jmrequiredincl0",function(b,c){if("0"===a(c).val())return!1;if("select"===c.nodeName.toLowerCase()){var d=a(c).val();return d&&d.length>0}return this.checkable(c)?this.getLength(b,c)>0:a.trim(b).length>0},"Eine Auswahl ist Erforderlich"),a.validator.addMethod("jmrequired",function(b,c){if("undefined"!==a.type(a(c).attr("data-jmremovejmrequired")))return'"true"';if("select"===c.nodeName.toLowerCase()){var d=a(c).val();return d&&d.length>0}return this.checkable(c)?this.getLength(b,c)>0:a.trim(b).length>0},"{0}"),a.validator.addMethod("jmsurname",function(a,b){return this.optional(b)||/^[a-zA-Z- äÄüÜöÖßÀÁÂàáâÇçÈÉÊèéêĞğÌÍÎİìíîıÒÓÔòóôŞşÙÚÛùúû]{1,40}$/.test(a)},"{0}"),a.validator.addMethod("jmlastname",function(a,b){return this.optional(b)||/^[a-zA-Z- äÄüÜöÖßÀÁÂàáâÇçÈÉÊèéêĞğÌÍÎİìíîıÒÓÔòóôŞşÙÚÛùúû]{1,40}$/.test(a)},"{0}"),a.validator.addMethod("jmcompany",function(a,b){return this.optional(b)||/^\d*[a-z- äÄüÜöÖßÀÁÂàáâÇçÈÉÊèéêĞğÌÍÎİìíîıÒÓÔòóôŞşÙÚÛùúû][a-z -äÄüÜöÖßÀÁÂàáâÇçÈÉÊèéêĞğÌÍÎİìíîıÒÓÔòóôŞşÙÚÛùúû\d]*$/i.test(a)},"{0}"),a.validator.addMethod("jmcompanyAdditional",function(a,b){return this.optional(b)||/^\d*[a-z- äÄüÜöÖßÀÁÂàáâÇçÈÉÊèéêĞğÌÍÎİìíîıÒÓÔòóôŞşÙÚÛùúû][a-z -äÄüÜöÖßÀÁÂàáâÇçÈÉÊèéêĞğÌÍÎİìíîıÒÓÔòóôŞşÙÚÛùúû\d]*$/i.test(a)},"{0}"),a.validator.addMethod("jmlandlinefull",function(a,b){return this.optional(b)||/^((\+)|(0{1})([0-9]{2,5}))([/-]?)[0-9]+$/.test(a)},"{0}"),a.validator.addMethod("jmmsisdnrelaxed",function(a,b){return this.optional(b)||/^((\+\s?|0{1,2}\s?)(?=[1-9]))[\d ()-/\\]+\d$/.test(a)},"{0}"),a.validator.addMethod("jmemail",function(a,b){return this.optional(b)||/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/.test(a)},"{0}"),a.validator.addMethod("jmstreet",function(a,b){return this.optional(b)||/^[a-zA-Z0-9- äÄüÜöÖßÀÁÂàáâÇçÈÉÊèéêĞğÌÍÎİìíîıÒÓÔòóôŞşÙÚÛùúû.]{1,40}$/.test(a)},"{0}"),a.validator.addMethod("jmhousenumber",function(a,b){return this.optional(b)||/^[a-zA-Z0-9- äÄüÜöÖßÀÁÂàáâÇçÈÉÊèéêĞğÌÍÎİìíîıÒÓÔòóôŞşÙÚÛùúû]{1,10}$/.test(a)},"{0}"),a.validator.addMethod("jmkundenkennwort",function(a,b){return this.optional(b)||/^[^<>&]{6,15}$/.test(a)},"{0}"),a.validator.addMethod("jmplz",function(b,c){return a.validator.methods.remote.call(this,b,c,{url:"/validation/ValidatePLZ",type:"post",timeout:1e4,data:{val:b,name:"ZIP"},dataFilter:function(b){var d,e,f,g=JSON.parse(b);if(g.IsValid){if(g.Data.CityNames.length>1)d=a(c).closest("label").next("label").find("input, select"),f=a('<select data-jmname="sync-val" data-jmdominit="true" id="'+d.attr("id")+'" name="'+d.attr("name")+'" class="input-selectbox" x-autocomplete="'+d.attr("x-autocomplete")+'"></select>'),f.html(a.map(g.Data.CityNames,function(a){return'<option value="'+a+'">'+a+"</option>"}).join("")),d.last().after(f),f.requirementsForJmPlugins().triggerSelfexecObj(),f.trigger("change"),d.remove();else{if(d=a(c).closest("label").next("label").find("input, select"),e=a('<input type="text" data-jmname="sync-val" data-jmdominit="true" data-rule-jmcity="Bitte geben Sie einen gültigen Ortsnamen ein." class="input-autocomplete" id="'+d.attr("id")+'" name="'+d.attr("name")+'" maxlength="40" x-autocomplete="'+d.attr("x-autocomplete")+'" value="'+d.val()+'" /><input id="'+d.attr("id")+'" name="'+d.attr("name")+'" type="hidden" value="'+g.Data.CityNames+'">'),d.last().after(e),"Service not available"===g.Data.CityNames[0])return"Wird automatisch ausgefüllt"!==e.eq(0).val()&&""!==e.eq(0).val()?(e.eq(1).val(e.eq(0).val()),e.eq(0).trigger("change"),d.remove(),'"true"'):(e.eq(0).prop("disabled",!1).addClass("input-text").removeClass("input-autocomplete").val("").attr("placeholder","Bitte ausfüllen"),e.eq(1).prop("disabled",!0).val(""),e.eq(0).trigger("change"),d.remove(),'"true"');e.eq(0).val(g.Data.CityNames[0]),e.requirementsForJmPlugins().triggerSelfexecObj(),e.eq(0).trigger("change").prop("disabled",!0),d.remove()}return'"true"'}var h=g.ErrorMessage;return a(c).closest("label").next("label").find("input").val("Wird automatisch ausgefüllt"),JSON.stringify(h)}})},"{0}"),a.validator.addMethod("jmcity",function(a,b){return this.optional(b)||/^[a-zA-Z- äÄüÜöÖßÀÁÂàáâÇçÈÉÊèéêĞğÌÍÎİìíîıÒÓÔòóôŞşÙÚÛùúû]{1,40}$/.test(a)},"{0}"),a.validator.addMethod("jmgeburtsdatumsservice",function(b,c,d,e){var f,g=this,h=a("[data-rule-jmgeburtsdatumsservice]");return"undefined"!==a.type(e)&&"jmvalidcheck"!==e.type&&h.each(function(a,b){b!==c&&g.check(c,jQuery.Event("jmvalidcheck"))}),"0"===h.eq(0).val()||"0"===h.eq(1).val()||"0"===h.eq(2).val()?!0:(f=(h.eq(0).val().length<2?"0"+h.eq(0).val():h.eq(0).val())+"|"+(h.eq(1).val().length<2?"0"+h.eq(1).val():h.eq(1).val())+"|"+(h.eq(2).val().length<2?"0"+h.eq(2).val():h.eq(2).val()),a.validator.methods.remote.call(this,f,c,{url:"/validation/ValidateBirthdate",type:"post",timeout:1e4,data:{val:function(){return f},hasPrepaid:function(){return a("body").find('input[type="hidden"][name="IsPrepaid"]').val()}},dataFilter:function(b){var c=JSON.parse(b);if(c.IsValid)return h.each(function(b,c){a(c).removeClass("error").addClass("valid"),delete g.invalid[c.name]}),'"true"';var d=c.ErrorMessage;return JSON.stringify(d)}}))},"{0}"),a.validator.addMethod("jmrequiredforGeburtsdatumsserviceIncl0",function(b,c,d,e){var f=this,g=a("[data-rule-jmrequiredforGeburtsdatumsserviceIncl0]");return"undefined"===a.type(e)||"submit"!==e.type||g.eq(0).hasClass("userinteraction-js")&&g.eq(1).hasClass("userinteraction-js")&&g.eq(2).hasClass("userinteraction-js")?("undefined"===a.type(e)||"undefined"===a.type(e.target)||"select"!==e.target.nodeName.toLowerCase()||g.eq(0).hasClass("userinteraction-js")&&g.eq(1).hasClass("userinteraction-js")&&g.eq(2).hasClass("userinteraction-js"))&&("undefined"===a.type(e)||"jmvalidcheck"!==e.type||g.eq(0).hasClass("userinteraction-js")&&g.eq(1).hasClass("userinteraction-js")&&g.eq(2).hasClass("userinteraction-js"))?"0"!==g.eq(0).val()&&"0"!==g.eq(1).val()&&"0"!==g.eq(2).val()?(g.each(function(b,c){a(c).removeClass("error").addClass("valid"),delete f.invalid[c.name]}),'"true"'):!1:(g.each(function(b,c){a(c).removeClass("error").addClass("valid"),delete f.invalid[c.name]}),'"true"'):!1},"{0}"),a.validator.addMethod("jmbankleitzahlregex",function(a,b){return this.optional(b)||/^\d{3,20}$/.test(a)},"{0}"),a.validator.addMethod("jmbankleitzahlservice",function(b,c){return a.validator.methods.remote.call(this,b,c,{url:"/validation/ValidateBLZ",type:"post",timeout:1e4,data:{val:b,name:"BLZ"},dataFilter:function(b){var d,e=JSON.parse(b);if(e.IsValid)return d=a(c).closest("fieldset").find("input[data-rule-jmbankname]"),"Service not available"===e.Data.bankName?d.prop("disabled")||""===d.val()?(d.prop("disabled",!1).addClass("input-text").removeClass("input-autocomplete").val("").attr("placeholder","Bitte ausfüllen"),d.siblings("input").prop("disabled",!0).val(""),'"true"'):(d.siblings("input").val(d.val()),'"true"'):(d.val(e.Data.bankName),d.siblings("input").doesExist()?(d.siblings("input").val(e.Data.bankName),d.trigger("change")):(d.after('<input id="Bank" name="Payment.BankName" data-jmname="sync-val" data-jmdominit="true" type="hidden" value="'+e.Data.bankName+'">'),d.requirementsForJmPlugins().triggerSelfexecObj(),d.trigger("change")),'"true"');var f=e.ErrorMessage;return JSON.stringify(f)}})},"{0}"),a.validator.addMethod("jmkontonummerregex",function(a,b){return this.optional(b)||/^\d{3,20}$/.test(a)},"{0}"),a.validator.addMethod("jmkontonummerservice",function(b,c){return a.validator.methods.remote.call(this,b,c,{url:"/validation/ValidateKontonummer",type:"post",timeout:1e4,data:{val:b,name:"Kontonummer",blz:a(c).closest("fieldset").find("input[data-rule-jmbankleitzahlservice]").val()},dataFilter:function(a){var b=JSON.parse(a);if(b.IsValid)return'"true"';var c=b.ErrorMessage;return JSON.stringify(c)}})},"{0}"),a.validator.addMethod("jmbankname",function(b,c){if("select"===c.nodeName.toLowerCase()){var d=a(c).val();return d&&d.length>0}return this.checkable(c)?this.getLength(b,c)>0:a.trim(b).length>0},"{0}"),a.validator.addMethod("jmkreditkartennummerservice",function(b,c){return a.validator.methods.remote.call(this,b,c,{url:"/validation/ValidateCreditCardNumber",type:"post",timeout:1e4,data:{val:b.replace(/ /g,""),name:"KartenNummer1"},dataFilter:function(b){var d,e=JSON.parse(b);if(e.IsValid)return d=a(c).closest("fieldset").find("input[data-rule-jmkreditkartenanbieter]"),"Service not available"===e.Data.CreditCardProviderName?d.prop("disabled")||""===d.val()?(d.prop("disabled",!1).addClass("input-text").removeClass("input-autocomplete").val("").attr("placeholder","Bitte ausfüllen"),d.siblings("input").prop("disabled",!0).val(""),'"true"'):(d.siblings("input").val(d.val()),'"true"'):(d.val(e.Data.CreditCardProviderName),d.siblings("input").doesExist()?(d.siblings("input").val(e.Data.CreditCardProviderName),d.trigger("change")):(d.after('<input id="Bank" name="Payment.Contractor" data-jmname="sync-val" data-jmdominit="true" type="hidden" value="'+e.Data.CreditCardProviderName+'">'),d.requirementsForJmPlugins().triggerSelfexecObj(),d.trigger("change")),'"true"');var f=e.ErrorMessage;return JSON.stringify(f)}})},"{0}"),a.validator.addMethod("jmkreditkartengueltigkeitsservice",function(b,c){var d=a("[data-rule-jmkreditkartengueltigkeitsservice]"),e=this;return d.each(function(b,d){d!==c&&""===a(d).val()&&"undefined"!==a.type(jmGO.checkSiblingsforjmkreditkartengueltigkeitsservice)&&a(d).valid()}),""===d.eq(0).val()||""===d.eq(1).val()?'"true"':"0"===d.eq(0).val()&&!d.eq(0).hasClass("valid")||"0"===d.eq(1).val()&&!d.eq(1).hasClass("valid")?'"true"':(jmGO.checkSiblingsforjmkreditkartengueltigkeitsservice=!0,a.validator.methods.remote.call(this,b,c,{url:"/validation/ValidateCreditCardExpiry",type:"post",timeout:1e4,data:{kartengueltigkeitMonat:function(){return d.eq(0).val()},kartengueltigkeitJahr:function(){return d.eq(1).val()}},dataFilter:function(b){var c=JSON.parse(b);if(c.IsValid)return d.each(function(b,c){a(c).removeClass("error"),delete e.invalid[c.name]}),'"true"';var f=c.ErrorMessage;return JSON.stringify(f)}}))},"{0}"),a.validator.addMethod("jmkreditkartenpruefnummer",function(a,b){return this.optional(b)||/^\d{3,4}$/.test(a)},"{0}"),a.validator.addMethod("jmibanregex",function(b,c){var d=a("[data-jmrelatedto='[data-jmdomselector=\"sepainputforspinner\"]']");return this.optional(c)||/^DE\d{20}$/.test(b)?d.removeClass("btn-inaktiv").addClass("btn"):d.removeClass("btn").addClass("btn-inaktiv"),this.optional(c)||/^DE\d{20}$/.test(b)},"{0}"),a.validator.addMethod("jmibanservice",function(b,c){return a.validator.methods.remote.call(this,b,c,{url:"/validation/ValidateIban",type:"post",timeout:1e4,data:{val:b},dataFilter:function(){}})},"{0}"),a.validator.addMethod("jmsim",function(b,c){return a.validator.methods.remote.call(this,b,c,{url:"/validation/ValidateSim",type:"post",timeout:1e4,data:{sim:b},dataFilter:function(a){var b=JSON.parse(a);if(b.IsValid)return'"true"';var c=b.ErrorMessage;return JSON.stringify(c)}})},"{0}"),a.validator.addMethod("jmpuk",function(b,c){return a.validator.methods.remote.call(this,b,c,{url:"/validation/ValidateSimAndPuk",type:"post",timeout:1e4,data:{sim:a(c).closest("fieldset").find("input[data-rule-jmsim]").val(),puk:b},dataFilter:function(a){var b=JSON.parse(a);if(b.IsValid)return'"true"';var c=b.ErrorMessage;return JSON.stringify(c)}})},"{0}")}(jQuery,window,document)});