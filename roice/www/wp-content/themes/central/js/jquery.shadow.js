/*
 Shadow animation 20130124
 http://www.bitstorm.org/jquery/shadow-animation/
 Copyright 2011, 2013 Edwin Martin <edwin@bitstorm.org>
 Contributors: Mark Carver, Xavier Lepretre
 Released under the MIT and GPL licenses.
*/
jQuery(function(e,i){function j(){var b=e("script:first"),a=b.css("color"),c=false;if(/^rgba/.test(a))c=true;else try{c=a!=b.css("color","rgba(0, 0, 0, 0.5)").css("color");b.css("color",a)}catch(d){}return c}function k(b,a,c){var d=[];b.b&&d.push("inset");typeof a.left!="undefined"&&d.push(parseInt(b.left+c*(a.left-b.left),10)+"px "+parseInt(b.top+c*(a.top-b.top),10)+"px");typeof a.blur!="undefined"&&d.push(parseInt(b.blur+c*(a.blur-b.blur),10)+"px");typeof a.a!="undefined"&&d.push(parseInt(b.a+c*
(a.a-b.a),10)+"px");if(typeof a.color!="undefined"){var g="rgb"+(e.support.rgba?"a":"")+"("+parseInt(b.color[0]+c*(a.color[0]-b.color[0]),10)+","+parseInt(b.color[1]+c*(a.color[1]-b.color[1]),10)+","+parseInt(b.color[2]+c*(a.color[2]-b.color[2]),10);if(e.support.rgba)g+=","+parseFloat(b.color[3]+c*(a.color[3]-b.color[3]));g+=")";d.push(g)}return d.join(" ")}function h(b){var a,c,d={};if(a=/#([0-9a-fA-F]{2})([0-9a-fA-F]{2})([0-9a-fA-F]{2})/.exec(b))c=[parseInt(a[1],16),parseInt(a[2],16),parseInt(a[3],
16),1];else if(a=/#([0-9a-fA-F])([0-9a-fA-F])([0-9a-fA-F])/.exec(b))c=[parseInt(a[1],16)*17,parseInt(a[2],16)*17,parseInt(a[3],16)*17,1];else if(a=/rgb\(\s*([0-9]{1,3})\s*,\s*([0-9]{1,3})\s*,\s*([0-9]{1,3})\s*\)/.exec(b))c=[parseInt(a[1],10),parseInt(a[2],10),parseInt(a[3],10),1];else if(a=/rgba\(\s*([0-9]{1,3})\s*,\s*([0-9]{1,3})\s*,\s*([0-9]{1,3})\s*,\s*([0-9\.]*)\s*\)/.exec(b))c=[parseInt(a[1],10),parseInt(a[2],10),parseInt(a[3],10),parseFloat(a[4])];d=(a=/(-?[0-9]+)(?:px)?\s+(-?[0-9]+)(?:px)?(?:\s+(-?[0-9]+)(?:px)?)?(?:\s+(-?[0-9]+)(?:px)?)?/.exec(b))?
{left:parseInt(a[1],10),top:parseInt(a[2],10),blur:a[3]?parseInt(a[3],10):0,a:a[4]?parseInt(a[4],10):0}:{left:0,top:0,blur:0,a:0};d.b=/inset/.test(b);d.color=c;return d}e.extend(true,e,{support:{rgba:j()}});var l=e("html").prop("style"),f;e.each(["boxShadow","MozBoxShadow","WebkitBoxShadow"],function(b,a){if(typeof l[a]!=="undefined"){f=a;return false}});if(f)e.Tween.propHooks.boxShadow={get:function(b){return e(b.elem).css(f)},set:function(b){var a=b.elem.style,c=h(e(b.elem).get(0).style[f]||e(b.elem).css(f)),
d=e.extend({},c,h(b.end));if(c.color==i)c.color=d.color||[0,0,0];b.run=function(g){a[f]=k(c,d,g)}}}});

