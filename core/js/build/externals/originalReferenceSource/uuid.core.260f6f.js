function UUID(){}UUID.generate=function(){var a=UUID._gri,b=UUID._ha;return b(a(32),8)+"-"+b(a(16),4)+"-"+b(16384|a(12),4)+"-"+b(32768|a(14),4)+"-"+b(a(48),12)},UUID._gri=function(a){return 0>a?0/0:30>=a?0|Math.random()*(1<<a):53>=a?(0|Math.random()*(1<<30))+(0|Math.random()*(1<<a-30))*(1<<30):0/0},UUID._ha=function(a,b){for(var c=a.toString(16),d=b-c.length,e="0";d>0;d>>>=1,e+=e)1&d&&(c=e+c);return c};