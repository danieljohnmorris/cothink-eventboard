var Typekit=(function(i){var z={ua:function(H){if(H){for(var I=0;I<this.enabledMatchers.length;I++){var K=this.enabledMatchers[I][1];if(K.call(null,H)){var J=this.enabledMatchers[I][0];return{fonts:(!!J),format:J}}}return{fonts:false}}},enabledMatchers:[],enable:function(J){this.enabledMatchers=[];for(var H=0;H<this.matchers.length;H++){var K=this.matchers[H];for(var I=0;I<J.length;I++){if(K[0]==J[I]){this.enabledMatchers.push([K[1],K[2]]);break}}}},matchers:[],add:function(I,J,H){this.matchers.push([J,I,H])}};var n={};z.add("d","ff36",function(J){var I=J.match(/rv:(\d+\.\d+)\.(\d+).*Gecko\//);if(I){var H=parseFloat(I[1]);var K=parseInt(I[2]);if(H>=1.9&&K>1){return true}else{return false}}});z.add("a","ff35",function(I){var H=I.match(/rv:1\.9\.1.*Gecko\//);if(I.match(/rv:1.9.1b[123]{1}/)){return false}if(H){return true}else{return false}});n.isMobileOSX=function(I){var H=I.match(/OS.(\d)_(\d)/);if(H){if(H[1]=="3"){return parseInt(H[2])>0}else{if(parseInt(H[1])>3){return true}}}return false};z.add("f","iphone",function(H){if(!H.match(/(iPhone|iPod)/)){return false}return n.isMobileOSX(H)});z.add("f","ipad",function(H){if(!H.match(/iPad/)){return false}return n.isMobileOSX(H)});n.isSafari=function(J){if(J.match(/Chrome/)){return false}if(J.match(/(iPhone|iPad|iPod)/)){return false}if(J.match(/webOS/)){return false}if(J.match(/Android/)){return false}var I=J.match(/AppleWebKit\/(\d+\.\d+)/);if(I){var H=I[1];return parseFloat(H)>=525.13}};n.isChrome=function(J){var I;if(J.match(/Chrome/)){I=J.match(/Chrome\/(\d+\.\d+)\.(\d+)\.(\d+)/);if(I){var H=parseFloat(I[1]);var K=parseInt(I[2]);var L=parseInt(I[3]);if(H>4){return true}else{if(H==4&&K>249){return true}else{if(H==4&&K==249&&L>=4){return true}else{return false}}}}}};z.add("b","chromewin",function(H){if(!H.match(/Windows/)){return false}return n.isChrome(H)});z.add("a","safari",n.isSafari);z.add("a","chrome",n.isChrome);z.add("c","ie",function(J){var I=J.match(/MSIE\s(\d+\.\d+)/);if(I){var H=I[1];return parseFloat(H)>=6}});var c=(function(){var I=document.defaultView||{};var K=false;var M=false;var L=[];function H(){if(!K){K=true;for(var N=0;N<L.length;N++){L[N].call(null)}}}function J(){if(M){return}M=true;if(document.addEventListener){document.addEventListener("DOMContentLoaded",function(){document.removeEventListener("DOMContentLoaded",arguments.callee,false);H()},false)}else{if(document.attachEvent){document.attachEvent("onreadystatechange",function(){if(document.readyState==="complete"){document.detachEvent("onreadystatechange",arguments.callee);H()}});if(document.documentElement.doScroll&&window==window.top){(function(){if(K){return}try{document.documentElement.doScroll("left")}catch(O){setTimeout(arguments.callee,0);return}H()})()}}}if(window.onload){var N=window.onload;window.onload=function(){N();H()}}else{window.onload=H}}return{ready:function(N){J();if(K){N()}else{L.push(N)}},insertInto:function(O,P){var N=document.getElementsByTagName(O)[0];if(N&&N.lastChild){N.insertBefore(P,N.lastChild);return true}else{return false}},createStyleElement:function(N){var O=document.createElement("style");O.setAttribute("type","text/css");if(O.styleSheet){O.styleSheet.cssText=N}else{O.appendChild(document.createTextNode(N))}return O},createCssLink:function(O){var N=document.createElement("link");N.setAttribute("rel","stylesheet");N.setAttribute("type","text/css");N.setAttribute("href",O);return N},css:function(O,P){if(I.getComputedStyle){var N=I.getComputedStyle(O,null);return N?N.getPropertyValue(P):null}else{if(O.currentStyle){return O.currentStyle[P]}}},loadScript:function(R,Q){var P=document.getElementsByTagName("head")[0];if(P){var O=document.createElement("script");O.src=R;var N=false;O.onload=O.onreadystatechange=function(){if(!N&&(!this.readyState||this.readyState=="loaded"||this.readyState=="complete")){N=true;if(Q){Q()}O.onload=O.onreadystatechange=null;if(O.parentNode.tagName=="HEAD"){P.removeChild(O)}}};P.appendChild(O)}},appendClassName:function(P,N){var O=" "+P.className+" ";if(!O.match("\\s+"+N+"\\s+")){P.className=P.className+" "+N}},removeClassName:function(R,O){var Q=" "+R.className+" ";if(Q.match("\\s+"+O+"\\s+")){var N=Q.split(/\s+/);var P=0;var S=[];for(P=0;P<N.length;P++){if(N[P]!=O&&N[P]!=""){S.push(N[P])}}R.className=S.join(" ")}}}})();function f(){return"/k"}function p(){return document.location.protocol=="https:"?"https://":"http://"}var g={};var e={};var u={};var G={};var A={};var l=[];if(window.tkKitsTracked==undefined){window.tkKitsTracked=0}function y(I){for(var H in I){e[H]=I[H]}j("setOptions",e)}function E(J){if(J.enabledBrowsers){z.enable(J.enabledBrowsers)}var I=e.ua;if(I){var H=z.ua(I);e.fonts=H.fonts;e.compatibility=H.format;j("detectUA",e.fonts,e.compatibility)}}function j(H){if(e.debug&&window.console&&window.console.log){window.console.log(arguments)}}function o(H,I){if(!G[H]){G[H]=[]}if(I){G[H].push(I);j("addCallback",H,G[H].length,I)}}function C(H){var I=document.getElementsByTagName("html")[0];if(I){c.appendClassName(I,H)}}function d(H){var I=document.getElementsByTagName("html")[0];if(I){c.removeClassName(I,H)}}function q(I){var H=new Date().getTime();o(I,function(J){s(I).time=(new Date().getTime())-H})}function x(K,J){j("executeCallbacks",K);var I=G[K];if(I){for(var H=0;H<I.length;H++){I[H](J)}}}function a(K,H,L,I,J){j("addDataSet",K,H,L,I,J);u[K]={kitId:K,securityToken:H,badgeOptions:L,kitOptions:I,callbackData:J};u[K].callbackData.kitId=K}function w(I,H){if(I){j("loading kit",I);v(u[I],H)}else{for(var J in u){j("loading kit",J);v(u[J],H)}}}function v(H,I){E(H.kitOptions);if(H&&H.kitId){j("loadKit",H);l.push(H);k(H.callbackData);if(I["kit-initialized"]){I["kit-initialized"](H.callbackData)}if(e.fonts){q(H.kitId);d("wf-inactive");C("wf-loading");if(I.loading){I.loading(H.callbackData)}o(H.kitId,function(){d("wf-loading");C("wf-active");if(I.active){I.active(H.callbackData)}});t(H.kitId,H.securityToken,e.compatibility)}else{d("wf-loading");C("wf-inactive");if(I.inactive){I.inactive(H.callbackData)}}if(I["kit-loaded"]){I["kit-loaded"](H.callbackData)}}else{j("loadKit","data is invalid",H)}}function k(N){if(N&&N.fonts){var O=N.fonts;var L=[];for(var K=0;K<O.length;K++){var H=O[K];if(H){var M=O[K].css_stack;var J=O[K].css_selectors;if(M&&J){for(var I=0;I<J.length;I++){L.push(J[I]+"{font-family:"+M+";}")}}}}c.insertInto("head",c.createStyleElement(L.join("")))}}function t(K,H,I){var J=p()+e.host+e.root+f()+"/"+K+"-"+I+".css?"+H;j("loadKitStyle",J);if(c.insertInto("head",c.createCssLink(J))){B(K)}}function B(K){j("waitForStyleLoaded",K);var H=function(O){var N=document.createElement("span");N.setAttribute("class","wf-font-watcher");N.setAttribute("style","position:absolute;left:-999px;font-size:200px;font-family:"+O+",NONE");N.innerHTML="Mm";return N};var L=function(O,S){var N=H("NONE");var R=H(M[I].css_stack);c.insertInto("html",N);c.insertInto("html",R);var Q=N.offsetWidth;var P=function(){if(R.offsetWidth!=Q){S()}else{setTimeout(P,e.styleLoadIntervalTime)}};P()};var M=u[K].callbackData.fonts;if(M&&M.length>0){var J=M.length;for(var I=0;I<M.length;I++){L(M[I].css_stack,function(){if(--J==0){if(u[K]){x(K,u[K].callbackData)}}})}}else{x(K,u[K].callbackData)}}function s(I){var H=A[I];if(!H){H=A[I]={time:0}}return H}function h(I,H){g[I]=H}function F(){if(!e.fonts){return}for(var J=0;J<l.length;J++){var I=l[J];var L=I.badgeOptions;if(L&&L.enabled){var K=g["default"];if(K){var H=K(I.kitId,L,e);if(H){H.setAttribute("id","typekit-badge-"+I.kitId);c.insertInto("body",H)}}}}}function b(){if(window.tkKitsTracked>0){return}for(var I=0;I<l.length;I++){var H=l[I];var J=H.kitOptions;if(J&&J.ga){if(window._gat){m()}else{var L=p();var K=L.match(/https/)?"ssl":"www";c.loadScript(L+K+".google-analytics.com/ga.js",m)}break}}}function m(){try{window._gat._getTracker("UA-8850781-3")._trackPageview()}catch(H){}window.tkKitsTracked++}c.ready(F);c.ready(b);y({host:"use.typekit.com",root:"",assetHost:"use.typekit.com",assetRoot:"",colophonHost:"typekit.com",ua:navigator.userAgent,styleLoadIntervalTime:30,bodyWaitIntervalTime:20,debug:false});function D(){return{addDataSet:a,clearDataSets:function(){u={}},insertBadges:F,optionallyCallGoogleAnalytics:b}}function r(){return{configure:y,load:function(H){var J,I;if(typeof arguments[0]=="string"){J=arguments[0];I=arguments[1]}else{J=null;I=arguments[0]}w(J,I||{})},stats:s}}a("qyv4iaf","3bb2a6e53c9684ffdc9a98f7195b2a621af3706c43fd27fb1c2ac817c85e8b05c0c75d0b55b0972af5171aeb38f6bf1701fafea2d12986ad45dc65a19dfb9663970810e6f15983b2f7e7ca4c260401988dd0189473f0103e71702567569b3a3de6572c45b8aae2fb5bf16406d2e58cd223c889a32efda1a91c432f0f6ea7f0b7f53dc54ed5beecf699806c5bbb6c7025def9b04feff7afa09bafac5915ab634f588ef16fe970469f1a061791ad06b9924076576d5a6c5f853a433eb8a5b901ce4dbaca71ef2392508f48cf80a7e5e0d6eb04a5abb8",{enabled:false},{enabledBrowsers:["ff36","ff35","safari","chrome","chromewin","ie","iphone","ipad"],ga:true},{fonts:[{css_selectors:[".tk-ff-tisa-web-pro","div.header-container h2","div.jobs h1","div.listing-header-container h1","div.no_results h1"],css_stack:'"ff-tisa-web-pro-1","ff-tisa-web-pro-2","Times","\'Times New Roman\'",serif'}]});return r()})();