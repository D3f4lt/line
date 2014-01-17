/* lazyload.js (c) Lorenzo Giuliani
 * MIT License (http://www.opensource.org/licenses/mit-license.html)
 *
 * expects a list of:  
 * `<img src="blank.gif" data-src="my_image.png" width="600" height="400" class="lazy">`
 */

!function(e){function i(e,t){var n=new Image,r=e.getAttribute("data-src");n.onload=function(){if(!!e.parent)e.parent.replaceChild(n,e);else e.src=r;t?t():null};n.src=r}function s(t){var n=t.getBoundingClientRect();return n.top>=0&&n.left>=0&&n.top<=(e.innerHeight||document.documentElement.clientHeight)}var t=function(e,t){if(document.querySelectorAll){t=document.querySelectorAll(e)}else{var n=document,r=n.styleSheets[0]||n.createStyleSheet();r.addRule(e,"f:b");for(var i=n.all,s=0,o=[],u=i.length;s<u;s++)i[s].currentStyle.f&&o.push(i[s]);r.removeRule(0);t=o}return t},n=function(t,n){e.addEventListener?this.addEventListener(t,n,false):e.attachEvent?this.attachEvent("on"+t,n):this["on"+t]=n},r=function(e,t){return Object.prototype.hasOwnProperty.call(e,t)};var o=new Array,u=t("img.lazy"),a=function(){for(var e=0;e<o.length;e++){if(s(o[e])){i(o[e],function(){o.splice(e,e)})}}};for(var f=0;f<u.length;f++){o.push(u[f])}a();n("scroll",a)}(this)
