!function(a,b){function c(a,b,c){var d=a+":",e=document.createElement("test"),f=e.style;return f.cssText=c?d+b:d+["-webkit-","-moz-","-ms-","-o-",""].join(b+";"+d)+b+";",-1!==f[a].indexOf(b)}function d(a){return parseInt(a,10)||0}var e={classes:{plugin:"fixedsticky",active:"fixedsticky-on",inactive:"fixedsticky-off",clone:"fixedsticky-dummy",withoutFixedFixed:"fixedsticky-withoutfixedfixed"},keys:{offset:"fixedStickyOffset",position:"fixedStickyPosition"},tests:{sticky:c("position","sticky"),fixed:c("position","fixed",!0)},getScrollTop:function(){var b="pageYOffset",c="scrollTop";return a?b in a?a[b]:a.document.documentElement[c]:a.document.body[c]},bypass:function(){return e.tests.sticky&&!e.optOut||!e.tests.fixed||a.FixedFixed&&!b(a.document.documentElement).hasClass("fixed-supported")},update:function(a){function c(){var a=m+h;return a>l&&s+t>=a+k}function f(){return l+(k||0)>m+p-i&&m+p-i>=s+(k||0)}if(a.offsetWidth){var g,h,i,j=b(a),k=j.outerHeight(),l=j.data(e.keys.offset),m=e.getScrollTop(),n=j.is("."+e.classes.active),o=function(a){j[a?"addClass":"removeClass"](e.classes.active)[a?"removeClass":"addClass"](e.classes.inactive)},p=b(window).height(),q=j.data(e.keys.position),r=j.parent(),s=r.offset().top,t=r.outerHeight();void 0===l&&(l=j.offset().top,j.data(e.keys.offset,l),j.after(b("<div>").addClass(e.classes.clone).height(k))),q||(g="auto"!==j.css("top")||"auto"!==j.css("bottom"),g||j.css("position","fixed"),q={top:"auto"!==j.css("top"),bottom:"auto"!==j.css("bottom")},g||j.css("position",""),j.data(e.keys.position,q)),h=d(j.css("top")),i=d(j.css("bottom")),q.top&&c()||q.bottom&&f()?n||o(!0):n&&o(!1)}},destroy:function(c){var d=b(c);if(!e.bypass())return b(a).unbind(".fixedsticky"),d.each(function(){b(this).removeData([e.keys.offset,e.keys.position]).removeClass(e.classes.active).removeClass(e.classes.inactive).next("."+e.classes.clone).remove()})},init:function(c){var d=b(c);if(!e.bypass())return d.each(function(){var c=this;b(a).bind("scroll.fixedsticky",function(){e.update(c)}),e.update(this),b(a).bind("resize.fixedsticky",function(){d.is("."+e.classes.active)&&e.update(c)})})}};a.FixedSticky=e,b.fn.fixedsticky=function(a){if("function"==typeof e[a])return e[a].call(e,this);if("object"!=typeof a&&a)throw new Error("Method `"+a+"` does not exist on jQuery.fixedsticky");return e.init.call(e,this)},a.FixedFixed||b(a.document.documentElement).addClass(e.classes.withoutFixedFixed)}(this,jQuery);