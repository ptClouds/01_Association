(function() {
/********************************************************************
 **  JSer(v2.1)  -  a lightweight js framework. and GPL license.
 **  -----------------------------------------------------
 **  @author     : 子秋(Folier)
 **  @qq         : 39886616
 *   @Document   : http://jdiy.net/jser-doc/
 **  @copyright  : http://jdiy.net
 **
 *********************************************************************/


    var __agent = navigator.userAgent.toLowerCase();
    var local = {
        browser: {
            agent: __agent,
            msie: /msie/.test(__agent),
            firefox: /mozilla/.test(__agent) && !/(compatible|webkit|chrome)/.test(__agent),
            opera: /opera/.test(__agent),
            chrome: /chrome/.test(__agent),
            safari: /webkit/.test(__agent) && !/chrome/.test(__agent),
            version: (__agent.match(/.+(?:chrome|firefox|msie|version)[\/: ]([\d.]+)/) || [])[1]
        },
        event: {
            add:function(dom, handle, handler,once){
                var d = local.dom.cache(dom);
                if(!d)return;
                if(!d.events)d.events={};
                if(!d.events[handle])d.events[handle]=[];
                d.events[handle].push({handler:handler, once:once});

                if(!d.events['_'+handle]){
                    d.events['_'+handle] = function(e){
                         var de=d.events[handle];
                        if (!e) e = window.event;
                        if (!e.target) e.target = e.srcElement || document;
                        for(var  i=0;i<de.length;i++){
                            var rtn =de[i].exp ? true : de[i].handler.call(dom, e);
                            if(de && de[i] && de[i].once){
                                //once-handler can not be remove because used at clone doms.
                                de[i].exp=true;
                            }
                            if (rtn=== false) {
                                if (e.stopPropagation) e.stopPropagation(); else e.cancelBubble = true;
                                if (e.preventDefault)e.preventDefault();    else e.returnValue = false;
                                return;
                            }
                        }
                    }
                    if (dom.addEventListener)  dom.addEventListener(handle, d.events['_'+handle], false);
                    else dom.attachEvent('on' + handle, d.events['_'+handle]);
                }
            },
            del:function(dom, handle, handler) {
                var d = local.dom.cache(dom);
                if(!d.events || !d.events[handle]) return;
                if(handle.eq('active')){
                    if(d.events['focus'])
                        for(var i=0;i<d.events['focus'].length;i++)
                            if(d.events['focus'][i].handler.active) d.events['focus'].splice(i--,1);
                    if(d.events['blur'])
                        for(var i=0;i<d.events['blur'].length;i++)
                            if(d.events['blur'][i].handler.active) d.events['blur'].splice(i--,1);
                }else if(handle.eq('hover')){
                    if(d.events['mouseover'])
                        for(var i=0;i<d.events['mouseover'].length;i++)
                            if(d.events['mouseover'][i].handler.hover) d.events['mouseover'].splice(i--,1);
                    if(d.events['mouseout'])
                        for(var i=0;i<d.events['mouseout'].length;i++)
                            if(d.events['mouseout'][i].handler.hover) d.events['mouseout'].splice(i--,1);
                }else if(handler){
                    for(var i=0;i<d.events[handle].length;i++)
                        if(d.events[handle][i].handler==handler) d.events[handle].splice(i--,1);
                }else{
                    d.events[handle]=[];
                }
                if(d.events[handle].length==0){
                    if (dom.removeEventListener) dom.removeEventListener(handle, d.events['_'+handle], false);
                    else dom.detachEvent("on" + handle, d.events['_'+handle]);
                    delete d.events[handle];
                    delete d.events['_'+handle];
                }
            }
        },
        task: {
            list: [],
            load: false,
            run : false,
            add: function(t) {
                (local.task.list = local.task.list || []).push(t);
            },
            execProxy: function() {
                if (!local.task.list.load) {
                    JSer.each(local.task.list || [], function() {
                        this.call(document);
                    });
                    local.task.list = null;
                    local.task.load = true;
                }
            },
            exec: function() {
                if (this.run) return;
                this.run = true;
                if (document.addEventListener && !local.browser.opera) {
                    document.addEventListener("DOMContentLoaded", this.execProxy, false);
                } else if (local.browser.msie && window == top) {
                    (function() {
                        if (local.task.load) return;
                        try {
                            document.documentElement.doScroll("left");
                        } catch(error) {
                            setTimeout(arguments.callee, 0);
                            return;
                        }
                        local.task.execProxy();
                    })();
                } else if (local.browser.opera) {
                    document.addEventListener("DOMContentLoaded", function () {
                        if (local.task.load) return;
                        for (var i = 0; i < document.styleSheets.length; i++)
                            if (document.styleSheets[i].disabled) {
                                setTimeout(arguments.callee, 0);
                                return;
                            }
                        local.task.execProxy();
                    }, false);
                } else if (local.browser.safari) {
                    var numStyles;
                    (function() {
                        if (local.task.load) return;
                        if (document.readyState != "loaded" && document.readyState != "complete") {
                            setTimeout(arguments.callee, 0);
                            return;
                        }
                        if (numStyles === undefined)
                            numStyles = JSer("style, link[@rel=stylesheet]").length;
                        if (document.styleSheets.length != numStyles) {
                            setTimeout(arguments.callee, 0);
                            return;
                        }
                        local.task.execProxy();
                    })();
                } else {
                    local.event.add(window, 'load', this.execProxy, true);
                }
            }
        },
        script: {
            exec: function(content) {
                if (typeof content == 'string') {
                    var h = document.getElementsByTagName("head")[0];
                    if (h) {
                        var script = document.createElement("SCRIPT");
                        script.type = "text/ecmascript";
                        if (local.browser.msie)script.text = content;
                        else script.appendChild(document.createTextNode(content));
                        h.insertBefore(script, h.firstChild);
                        h.removeChild(script);
                    }
                } else if (content.src) JSer.url(content.src).exec({ansyc:false, type:'script'});
                else local.script.exec(content.text || content.textContent || content.innerHTML || content.value || "");
                return content;
            }
        },
        dom: {
            searchEngine: function(selectors, rootNode) {
                var pseudo = {
                    disabled: function() {return this.disabled;},
                    enabled: function() {return !this.disabled;},
                    checked: function() {return this.checked;},
                    selected: function() {return this.selected;},
                    text: function() {return "text" == this.type; },
                    input: function() {return /input|select|textarea|button/i.test(this.nodeName);},
                    radio: function() {return "radio" == this.type;},
                    checkbox: function() { return "checkbox" == this.type;},
                    file: function() { return "file" == this.type;},
                    password: function() { return "password" == this.type;},
                    submit: function() {return "submit" == this.type;},
                    image: function() { return "image" == this.type;},
                    reset: function() { return "reset" == this.type;},
                    button: function() { return "button".or(this.type, this.nodeName);},
                    visible: function() { return "hidden" != this.type && JSer(this).css("display") != "none"
                                && JSer(this).css("visibility") != "hidden";},
                    hidden: function() {return "hidden" == this.type || JSer(this).css("display") == "none"
                                || JSer(this).css("visibility") == "hidden";},
                    first:function(i){return i==0},
                    last:function(i){
                        var len=0;
                        for(var s = this.parentNode.firstChild; s; s=s.nextSibling) if(s && s.nodeType==1) len++;
                        return i==len-1;
                    },
                    odd:function(i){return i%2==1},
                    even:function(i){return i%2==0},
                    lt: function(i,p){return i<p-0;},
                    gt: function(i,p){return i>p-0;},
                    eq: function(i,p){return i==p;},
                    'nth-child':function(i,p){
                        if(isNaN(p)){
                            p = p=='odd' && "2n+1" || p=='even' && '2n' || p;
                            if(/^\d+n$/.test(p)){
                                return (i-0+1)%(parseInt(p)-0)==0;// 5n
                            }
                            var t = /(-?)(\d*)n(\+|-)(\d+)/.exec(p);
                            if(t){
                                if(t[1]=='-'){
                                    if(t[2]=='') return i<=t[4]-0;//-n+8
                                    else return (t[4]-i-1)%t[2]==0 && t[4]-1-i>=0;//-3n+8
                                }else{
                                    return (i-0+1)%t[2] == (t[3]=='-'?t[2]-t[4]:t[4]-0);//5n+2,  5n-2
                                }
                            }
                            return false;
                        }else{
                            return i==p-1;// 5  match line 5
                        }
                    },
                    parent: function(){return this.firstChild;},
			        empty: function(){return !this.firstChild;},
                    contains:function(i,p){return (this.textContent||this.innerText||JSer(this).attr('text')
                            ||this.value||'').indexOf(p.replace(/'/g,''))!=-1;},
                    has: function(i,p){return JSer(p, this).length;},
                    hasnot: function(i,p){return JSer(p).length==0;},
                    not: function(i,p, a){return !isMatched(this, i, toSeo(p), a);},
                    header:function(){return /H[1-6]/.test(this.tagName);}
                },testFn = {
                    '#': function(s) {
                        return this.getAttribute && this.getAttribute("id") == s.substring(1);},
                    '.': function(s) {return (this.className || '').split(/\s+/).indexOf(s.substring(1)) != -1;},
                    '*': function() {return true;},
                    '@':function(s) {
                        if (/checked|selected|disabled/i.test(s)) {//simple attrubite
                            return pseudo[s.substring(1)].call(this);
                        } else if (s.indexOf("=") == -1) {// has attribute
                            return this.getAttribute(s.substring(1));
                        } else {                                        //fixed attribute
                            var pv = s.substring(1).split("=");
                            return this.getAttribute(pv[0]) == pv[1];
                        }
                    },
                    ':': function(s, i, a) {
                        var k = s.indexOf("("), n, p;
                        if(k!=-1){
                           n=s.substring(1,k);
                           p=s.substring(k+1, s.lastIndexOf(")"));
                        }else{
                            n=s.substring(1);
                            p='';
                        }
                        return pseudo[n] && pseudo[n].call(this, i, p, a);}
                };

                //analysis one selector and return a array, example: ['td', '@a=b', ':visible']
                function analysis(selector) {
                    var s1 = selector.split(""), x = 0,z = 0,b = false, attr = '',wei = '', i;
                    var left = selector.replace(/(^[^:\[]*).*/g, "$1");
                    for (i = left.length; i < s1.length; i++) {
                        if (s1[i] == '(') {
                            x++;
                        } else if (s1[i] == ')') {
                            x--;
                            if (x == 0) b = false;
                        } else if (s1[i] == '[') {
                            if (x == 0) b = false;
                            z++;
                        } else if (s1[i] == ']') {
                            z--;
                        } else if (s1[i] == ":") {
                            b = true;
                        }
                        //if (x == 0 && (z > 0 || s1[i] == ']')) {
                        if (x == 0 && z > 0 && s1[i] != '[') {
                            attr += s1[i];
                        }
                        if (b || s1[i] == ')') {
                            if(x==0 && s1[i]==":") wei+="${3}:";
                           else  wei += s1[i];
                        }
                    }
                    left = left.replace(/(@|#|\.)/g,"<~>$&").split("<~>");
                    if(left[0]=='')left.shift();

                    var matchArray = left;
                    if (attr.length > 2) {
                        var attrA = attr.split(",");
                        for (i = 0; i < attrA.length; i++) if (attrA[i].charAt(0) != '@')attrA[i] = '@' + attrA[i];
                        matchArray = matchArray.concat(attrA);
                    }
                    if (wei != '') {
                        var weiA = wei.split("${3}");
                        weiA.shift();
                        matchArray = matchArray.concat(weiA);
                    }
                    return matchArray;
                }

                //if one selector matched, return true
                function isMatchOne(dom, domsub, selector, parentsNodeArray){
                    var matchArray = analysis(selector);
                    for (var i = 0; i < matchArray.length; i++) {
                        var tfn = testFn[matchArray[i].charAt(0)];
                        if (tfn) {
                            if (!tfn.call(dom, matchArray[i], domsub, parentsNodeArray))return false;
                        } else {
                            if (!dom.tagName || !dom.tagName.eq(matchArray[i])) return false;
                        }
                    }
                    return true;
                }

                //if all selectors matched, return true
                function isMatched(dom, domsub, seo, parentsNodeArray){
                    var matched;
                    JSer.each(seo, function() {
                        if (this instanceof Array) {
                            if (!isMatchOne(dom, domsub, this[this.length - 1], parentsNodeArray)) return;
                            var iStart = this.length - 2, jStart = parentsNodeArray.length - 1, matchedLen = 0;
                            for (var i = iStart; i >= 0; i--) {
                                if (iStart > jStart) return;
                                for (var j = jStart; j >= 0; j--) {
                                    if (isMatchOne(parentsNodeArray[j], domsub, this[i].trim(), parentsNodeArray)) {   //todo 包含选择时，可能取不到祖父级的domsub
                                        iStart = i - 1,jStart = j - 1,j = -1;
                                        if (this.length - 1 == ++matchedLen) {
                                            matched=true;
                                            return false;
                                        }
                                    }
                                }
                            }
                        }else{
                            if(matched= isMatchOne(dom, domsub, this, parentsNodeArray))return false;
                        }
                    });
                    return matched;
                }

                //convert selectors to seo
                function toSeo(selectors){
                    var kh = 0, s1 = selectors.split(""),yh=false;
                    for (var i = 0; i < s1.length; i++) {
                        if (s1[i].or('(', '[')) kh++;
                        else if (s1[i].or(')', ']')) kh--;
                        else if (s1[i]=="'") yh=!yh;
                        else if (s1[i]== ',' && kh == 0) s1[i] = "${1}";
                        else if (s1[i]==' ' && !yh && kh==0) s1[i] = "${2}";
                    }
                    selectors = s1.join("").split("${1}");
                    selectors = JSer.each(selectors, function(i){
                        if(this.indexOf("${2}") != -1) selectors[i] = this.split("${2}");
                    });
                    return selectors;
                }

                //iterator dom elements.
                function iterator(node, seo, parentsNodeArray) {
                    if (node.hasChildNodes()) {
                        var tArr = parentsNodeArray.slice(0, parentsNodeArray.length),nodes = node.childNodes, j=0;
                        tArr.push(node);
                        for (var i = 0; i < nodes.length; i++) {
                            if(!nodes[i] || nodes[i].nodeType !=1) continue;
                            if(isMatched(nodes[i], j++, seo, tArr)) matchedDoms.push(nodes[i]);
                            iterator(nodes[i], seo, tArr);
                        }
                    }
                }

                var matchedDoms = [];
                iterator(rootNode, toSeo(selectors), []);
                return matchedDoms;
            },

            convert: function(html, content) {
                var doc = document, prop = null,div, wrap, tags;
                if (content) {
                    doc = content.ownerDocument || content[0] && content[0].ownerDocument || document;
                    if (doc == document && typeof content == 'object' && !content.nodeType) prop = content;
                }
                html = html.replace(/(<(\w+)[^>]*?)\/>/g,
                        function(all, left, tag) {
                            return tag.match(/^(abbr|area|br|col|embed|hr|img|input|link|meta|param)$/i)
                                    ? all : left + "></" + tag + ">";
                        }).trim();
                wrap = (!(tags = html.toLowerCase()).indexOf("<td") || !tags.indexOf("<th")) &&
                        [ 3, "<table><tbody><tr>", "</tr></tbody></table>" ] ||
                        !tags.indexOf("<tr") && [ 2, "<table><tbody>", "</tbody></table>" ] ||
                        !tags.indexOf("<opt") && [ 1, "<select multiple=\"multiple\">", "</select>" ] ||
                        !tags.indexOf("<leg") && [ 1, "<fieldset>", "</fieldset>" ] ||
                        tags.match(/^<(thead|tbody|tfoot|colg|cap)/) && [ 1, "<table>", "</table>" ] ||
                        !tags.indexOf("<col") && [ 2, "<table><tbody></tbody><colgroup>", "</colgroup></table>" ] ||
                        local.browser.msie && [ 1, "<div>", "</div>" ] ||
                        [0, "", ""];
                (div = doc.createElement("DIV")).innerHTML = wrap[1] + html + wrap[2];
                while (wrap[0]--) div = div.lastChild;
                if (local.browser.msie) {//移除ie自动添加的tbody标签
                    var tbody = tags.indexOf("<table") == 0 && tags.indexOf("<tbody") == -1
                            ? div.firstChild && div.firstChild.childNodes
                            : wrap[1] == "<table>" && tags.indexOf("<tbody") < 0 ? div.childNodes : [];
                    JSer.each(tbody, function() {
                        if (this.nodeName && 'TBODY'.eq(this.nodeName) && !this.childNodes.length)
                            this.parentNode.removeChild(this);
                    });
                    if (/^\s/.test(html)) div.insertBefore(doc.createTextNode(html.match(/^\s*/)[0]), div.firstChild);
                }
                return prop ? JSer.each(div.childNodes, function() {
                    var jso = JSer(this);
                    for (var i in prop) {
                        //the 'type' is a readonly attribute for tag 'input' in IE.
                        if (!('type'.eq(i) && 'INPUT'.eq(this.tagName))) {
                            if (typeof prop[i] == 'function') jso.on(i, prop[i]);
                            else if (typeof prop[i] == 'object' && 'css'.eq(i)) jso.css(prop[i]);
                            else jso.attr(i, prop[i]);
                        }
                    }
                }) : div.childNodes;
            },

            css2js: function(style) {
                return /float/i.test(style) ?
                        (local.browser.msie ? 'styleFloat' : 'cssFloat') :
                        style.replace(/\-(\w)/g, function(all, letter) {
                            return letter.toUpperCase();
                        });
            },

            setStyle: function(jcObj, dom, style, value) {
                if (/opacity/i.test(style)) return jcObj.opacity(value);
                if (!isNaN(value) &&
                        style.match(/width|height|padding|margin|spacing|border|left|top|bottom|right/i))
                    value += "px";
                style = this.css2js(style);
                if (style == 'display') {
                    if (value != 'none') value = '';
                    if (value == '')dom.style.display = '';
                    if (value == '' && (dom.style.display == '') && ( document.defaultView
                            ? document.defaultView.getComputedStyle(dom, null)
                            : (dom.currentStyle || [])).display == 'none')value = 'block';
                }
                try {
                    dom.style[style] = value;
                } catch(e) {
                }
            },
            getStyle: function(jso, style, realWidthAndHeight) {
                if (jso.length < 1) return null;
                if (/opacity/i.test(style)) return jso.opacity();
                var dom = jso[0];
                style = local.dom.css2js(style);

                var value = dom.style[style] == undefined ? '' : dom.style[style];
                if (String(value).trim() == '') {
                    var styles = document.defaultView
                            ? document.defaultView.getComputedStyle(dom, null)
                            : (dom.currentStyle || []);
                    value = styles[style];
                }
                if ((value == '' || value == 'auto' || /^\d+%$/.test(value) && realWidthAndHeight) && (style == 'width' || style == 'height')) {
                    var xy = style == 'width' ? ['Left','Right'] : ['Top','Bottom'];
                    var isHide = local.dom.getStyle(jso, 'display') == 'none';
                    if (isHide) JSer(dom).css('display', '');
                    value = style == 'width' ? dom.offsetWidth : dom.offsetHeight;
                    JSer.each(xy, function() {
                        value -= parseInt(local.dom.getStyle(jso, 'padding' + this));
                    });
                    if (isHide) JSer(dom).css('display', 'none');
                    return  Math.max(value, 0) + "px";
                }

                if (local.browser.opera && "DISPLAY".eq(style)) {
                    var saved = dom.style.outline;
                    dom.style.outline = "0 solid black";
                    dom.style.outline = saved;
                }
                return value;
            },

            setData:function(dom, data) {
                if (!dom) return;
                var nodata = true;
                var d = local.dom.cache(dom);
                if(!d)return;
                if(data){
                    d.datas=data;
                }else if(d.datas){
                    delete d.datas;
                }
            },

            getData: function(dom) {
                if (!dom) return null;
                var d = local.dom.cache(dom);
                if(!d || !d.datas)return null;
                else return d.datas;
            },
            ieCache:[],
            cache:function(dom){
                try{
                    if(!dom.getAttribute('__JSER_DATA'))
                        dom.setAttribute('__JSER_DATA')={};
                    return dom.__JSER_DATA;
                }catch(e){ //ie9
                    try{
                        var index = dom.getAttribute("__JSer_index");
                        if(index==undefined){
                            index=local.dom.ieCache.length;
                            local.dom.ieCache[index]={dom:dom, data:{}};
                            dom.setAttribute("__JSer_index",index);
                        }
                        return local.dom.ieCache[index];
                    }catch(e){
                        return {};
                    }
                }
            }
        },

        ajax:{
            accepts:{
			    xml: "application/xml, text/xml, */*",
			    html: "text/html, */*",
			    script: "text/javascript, application/javascript, */*",
			    json: "application/json, text/javascript, */*",
			    text: "text/plain, */*",
			    other: "*/*"
            },
            caches:{lastModified:{}, etag:{}}
        }
    };

    var JSer = window.JSer = function(search, domRoot) {
        local.task.exec();
        return new Element().newInstance(search, domRoot);
    };
    JSer.version = 1.1;
    JSer.browser = local.browser;

    var Element = function() {
        this.length=0;
        this.endData=null;
    };

    var setEnd = function(jso){
        var o=JSer(jso.items());
        o.endData=jso.endData;
        jso.endData=o;
    };

    Element.prototype = {
        active: function(a, b) {
            if(!a&&!b) return this.on('active');
            var ta = typeof a, tb = typeof b,fa,fb;
            if('STRING'.eq(ta,tb)) fa = function(){JSer(this).addClass(a).removeClass(b);},
                fb=function(){JSer(this).addClass(b).removeClass(a);};
            else if("OBJECT".eq(ta,tb)) fa = function(){JSer(this).css(a);}, fb = function(){JSer(this).css(b);};
            else if("FUNCTION".eq(ta,tb)) fa = a, fb = b;
            else return this;
            fa.active=fb.active=true;
            return this.on({focus: fa, active: fb, blur:fb});

        },
        add: function(content, noEnd) {
            if(!noEnd) setEnd(this);
            if (content && content.nodeType && this.items().indexOf(content) == -1)
                this[this.length++] = content;
            else if (content instanceof Element || content instanceof Array)
                for (var i = 0; i < content.length; i++) this.add(content[i], true);
            else if (content && content.constructor && content.constructor == String)
                this.add(JSer(content), true);
            return this;
        },

        addClass: function() {
            var args = arguments;
            return this.each(function() {
                var domCls = (this.className || '').split(/\s+/);
                JSer.each(args, function() {
                    JSer.each(this.replace(/[;；,，　]/gi, " ").trim().split(/\s+/), function() {
                        if (this != '' && domCls.indexOf(this) == -1) domCls.push(this);
                    });
                });
                this.className = domCls.join(" ");
            });
        },

        after: function(content, isClone) {
            var jso = JSer(content), elem;
            this.each(function() {
                for (var i = 0; i < jso.length; i++)
                    if ((elem = jso[i]).nodeName && 'SCRIPT'.eq(elem.nodeName)) local.script.exec(elem);
                    else{
                        var o = JSer(jso[i]).clone(true)[0];
                        if(o) this.parentNode.insertBefore(o, this.nextSibling);
                    }
            });
            if (!isClone) jso.remove();
            return this;
        },

        afterTo: function(content, isClone){
            var jso=JSer(content), rtn=JSer([]);
            for(var i=0;i<this.length;i++){
                var dom = this[i];
                if(dom.nodeName && 'SCRIPT'.eq(dom.nodeName)) local.script.exec(dom);
                else jso.each(function(){
                    var o =JSer(dom).clone(true)[0];
                    if(o) rtn.add(this.parentNode.insertBefore(o , this.nextSibling));
                });
            }
            if(!isClone) this.remove();
            rtn.endData=this;
            return rtn;
        },

        append: function(content) {
            return this.each(function() {
                if (content && content.nodeType){
                    var o = JSer(content).clone(true)[0];
                    if(o) this.appendChild(o);
                }
                else if (content.constructor == String) {
                    var o = document.createElement("DIV");
                    o.innerHTML = content;
                    for (var i = 0; i < o.childNodes.length; i++) {
                        var n = o.childNodes[i];
                        if (n && n.nodeType){
							if(n.nodeType == 3) this.appendChild(document.createTextNode(n.nodeValue));
							else JSer(this).append(n);
                        }//else alert(n);
                    }
                } else if (content instanceof Element) {
                    var o1 = JSer(this);
                    content.reverse().each(function() {
                        o1.append(this);
                    });
                } else if (content.length)
                    this.append(JSer(content));
            });
        },

        appendTo: function(selector) {
            var newObj, rtn=JSer([]),targets = JSer(selector);
            for(var i=0;i<this.length;i++){
                var dom =this[i];
                JSer.each(targets, function() {
                    if (dom.nodeName && 'SCRIPT'.eq(dom.nodeName))
                        rtn.add(local.script.exec(dom));
                    else {
                        rtn.add(newObj = JSer(dom).clone(true)[0]);
                        this.appendChild(newObj);
                    }
                });
            }
            rtn.endData=this;
            return rtn;
        },

        attr: function(name, val) {
            if (name.constructor != String) {
                for (var j in name) this.attr(j, name[j]);
                return this;
            } else if (val !== undefined)
                return this.each(function() {
                    if (!('TYPE'.eq(name) && 'INPUT'.eq(this.tagName))) {
                        var styleFloat = local.browser.msie ? "styleFloat" :"cssFloat";
                        var props={
                              "for": "htmlFor",
                                "class": "className",
                                "float": styleFloat,
                                "cssFloat": styleFloat,
                                "styleFloat": styleFloat,
                                "readonly": "readOnly",
                                "maxlength": "maxLength",
                                "cellspacing": "cellSpacing"
                        }
                        if(props[name] && local.browser.msie) name=props[name];
                        if (this[name] !== undefined) {
                            this[name] = val;
                        } else {
                            this.setAttribute(name, val);
                        }
                    }
                });
            else  return this[0] ? (/checked|selected|disabled/i.test(name)? this[0][name]: this[0].getAttribute(name)) : null;
        },

        before: function(content, isClone) {
            var jso = JSer(content), elem;
            this.each(function() {
                for (var i = 0; i < jso.length; i++)
                    if ((elem = jso[i]).nodeName && 'SCRIPT'.eq(elem.nodeName)) local.script.exec(elem);
                    else {
                        var o=JSer(jso[i]).clone(true)[0];
                        if(o) this.parentNode.insertBefore(o, this);
                    }
            });
            if (!isClone) jso.remove();
            return this;
        },


        beforeTo: function(content, isClone){
            var jso=JSer(content), rtn=JSer([]);
            for(var i=0;i<this.length;i++){
                var dom = this[i];
                if(dom.nodeName && 'SCRIPT'.eq(dom.nodeName)) local.script.exec(dom);
                else jso.each(function(){
                    var o =JSer(dom).clone(true)[0];
                    if(o) rtn.add(this.parentNode.insertBefore( o, this));
                });
            }
            if(!isClone)this.remove();
            rtn.endData=this;
            return rtn;
        },

        clone: function(cloneEvents) {
            var rtn=JSer([]);
            this.each(function() {
                var newDom = this.cloneNode(true),data;
                if(local.browser.msie){
                    var d=document.createElement("DIV");
                    d.appendChild(newDom);
                    newDom =local.dom.convert(d.innerHTML)[0];
                }
                if (cloneEvents){
                    var d = local.dom.cache(this);
                    if(d && d.events)
                        for(var handle in d.events)
                            if(d.events[handle].constructor == Array)
                                for(var i=0;i<d.events[handle].length;i++)
                                    local.event.add(newDom,handle, d.events[handle][i].handler, d.events[handle][i].once);
                }
                if(data = local.dom.getData(this)) local.dom.setData(newDom, new Object(data));//todo 对象克隆?
                rtn.add(newDom);
            });
            rtn.reverse();
            rtn.endData=this;
            return rtn;
        },

        css: function(style, value) {
            if (typeof style == 'object') {
                for (var i in style) this.css(i, style[i]);
                return this;
            }
            style = style.trim();
            var jcObj = this;
            return value !== undefined ? this.each(function() {
                local.dom.setStyle(jcObj, this, style, value);
            }) : local.dom.getStyle(this, style);
        },

        data: function(name, value) {
            if (name === null) {
                return this.each(function() {
                    local.dom.setData(this, null);
                });
            } else if (name == undefined) {
                return local.dom.getData(this[0]);
            } else if ('OBJECT'.eq(typeof name)) {
                var jso = this;
                JSer.each(name, function(i){
                    jso.data(i, this);
                });
                return this;
            } else if (value === undefined) {
                var data = local.dom.getData(this[0]);
                return data && data[name]!=undefined ? data[name] : null;
            } else {
                return this.each(function() {
                    var data = local.dom.getData(this) || {};
                    if (value === null){
                        delete data[name];
                        var hasnot = true,i; for(i in data){hasnot=false;}
                        if(hasnot) data=null;
                    }else data[name] = value;
                    local.dom.setData(this, data);
                });
            }
        },

        del: function(content, noEnd) {
            if(!noEnd) setEnd(this);
            var vc;
            if (content != undefined) {
                if (content == (vc = parseInt(content)) && vc > -1 && vc < this.length) {
                    for (var ia = vc; ia < content.length; ia++)
                        if (ia < content.length - 1) this[ia] = this[ia + 1];
                        else delete this[ia];
                    this.length--;
                } else if (content.nodeType)
                    this.del(this.items().indexOf(content), true);
                else if (content instanceof Element || content instanceof Array)
                    for (var i = 0; i < content.length; i++) this.del(content[i], true);
                else if (content.constructor == String)
                    this.del(JSer(content), true);
            }
            return this;
        },

        each: function(callback) {
            return JSer.each(this, callback);
        },

        empty: function() {
            JSer("*", this).remove();
            return this.each(function() {//不能省,上面代码只删标签.
                while ( this.firstChild ) this.removeChild( this.firstChild );
            });
        },

        end: function() {
            return this.endData || JSer([]);
        },

        first: function() {
            return this.get(0);
        },

        get: function(sub) {
            var rtn=JSer([]);
            if (sub == 0 && this.length == 1) rtn.add(this[0]);
            else if(sub>=0 && sub<this.length) rtn.add(this[sub]);
            rtn.endData=this;
            return rtn;
        },

        height: function(val) {
            return val == undefined ? parseInt(local.dom.getStyle(this,'height', true)) : this.css('height', val);
        },

        hide: function(time, bywhat, callback) {// 动画待处理: bywhat: w | h | o

            return this.each(function() {
                var jso =JSer(this);
                if(jso.data("__stop")) jso.data("__stop").call(jso);
                if (jso.css('display') == 'none') return;

                var oldCss =  {
                     width: jso.width(),
                     height:jso.height(),
                     opacity: jso.opacity(),
                     overflow:jso.css('overflow')
                };

                if (!time) time = 0;
                else if ('fast'.eq(time)) time = 50;
                else if ('normal'.eq(time)) time = 100;
                else if ('slow'.eq(time)) time = 200;
                else if (isNaN(time)) time = 0;
                if(local.browser.msie) time/=10;
                else if(local.browser.opera || local.browser.safari) time/=10;
                else if(local.browser.chrome) time/=5;

                if (time <= 0) {
                    jso.css('display', 'none');
                    return;
                }

                function up() {
                    leavetime--;
                    if(leavetime>0){
                        if(wStep)jso.width(leavetime*wStep);
                        if(hStep)jso.height(leavetime*hStep);
                        if(oStep)jso.opacity(leavetime*oStep);
                        timer=setTimeout(arguments.callee, 0);
                    }else{
                        jso.removeData("__stop");
                        jso.css(oldCss);
                        jso.css('display','none');
                        if (callback) callback.call(jso[0]);
                    }
                }

                var timer=null;
                function stop(){
                    if(timer!=null) clearTimeout(timer);
                    this.css(oldCss);
                    this.removeData("__stop");
                }


                if (typeof bywhat == 'function' && !callback) {
                    callback = bywhat;
                    bywhat = 'who';
                }
                bywhat = (bywhat || 'who').toLowerCase();
                jso.css('overflow', 'hidden');
                var leavetime=time,wStep=0,hStep=0,oStep=0;
                if(bywhat.indexOf("w")!=-1){
                    wStep = jso.width()/time;
                    jso.width(0);
                }
                if(bywhat.indexOf("h")!=-1){
                    hStep = jso.height()/time;
                    jso.height(0);
                }

                if(bywhat.indexOf("o")!=-1){
                    oStep = jso.opacity()/time;
                    jso.opacity(0);
                }
                jso.data("__stop", stop);
                up();
            });
        },

        hover: function(a, b) {
            if(!a&&!b) return;
            if(!a&&!b)return this.on('hover');
            var ta = typeof a, tb = typeof b,fa,fb;
            if('STRING'.eq(ta,tb)) fa = function(){JSer(this).addClass(a).removeClass(b);},
                fb=function(){JSer(this).addClass(b).removeClass(a);};
            else if("OBJECT".eq(ta,tb)) fa = function(){JSer(this).css(a);}, fb = function(){JSer(this).css(b);};
            else if("FUNCTION".eq(ta,tb)) fa = a, fb = b;
            else return this;
            fa.hover=fb.hover=true;
            return this.on({mouseover: fa, hover: fb, mouseout:fb});
        },

        html: function(val) {
            return val == undefined
                    ? (this[0] ? this[0].innerHTML : null)
                    : this.empty().append(val);
        },

        inter: function(content) {
            if (content instanceof Element || content instanceof Array) {
                var items = this.items(),rtn=JSer([]), i;
                for(i=0;i<content.length;i++){
                    if (items.indexOf(content[i]) != -1) rtn.add(content[i]);
                }
                rtn.endData=this;
                return rtn;
            }
            return this.inter(typeof content == 'string' ? JSer(content) : [content]);
        },

        items: function() {
            var sa = [];
            for (var i = 0; i < this.length; i++) sa.push(this[i]);
            return sa;
        },

        last: function() {
            return this.get(this.length - 1);
        },

        loadUrl: function(url, prms, fn) {
            var u = JSer.url(url);
            if ('FUNCTION'.eq(typeof prms) && !fn) {
                fn = prms;
                prms = null;
            }
            if (prms) u.set(prms);
            var callback = function(d) {
                arguments.callee.jso.html(d.replace(/<script(.|\s)*?\/script>/gi, ""));
                if (arguments.callee.fn)fn.call(arguments.callee.jso, d);
            };
            callback.jso = this;
            callback.fn = fn;
            u.ajax({
                success:callback
            });
        },

        newInstance: function(search, rootNode) {//doc: 当search是单选id的(#xxx)时候，rootNode无意义。
            this.length = 0;
            search = search || document.documentElement || document.body;
            if (search == window) search.nodeType = 27;
            if (search.nodeType) {
                this.add(search, true);
            } else if (search instanceof Element) {
                return search;
            } else if (typeof search == 'string') {
                search = search.trim().replace(/\s*,\s*/g, ",").replace(/,{2,}/g, ',').replace(/\s{2,}/g," ");
                if (search == '') {
                    this.newInstance();
                } else if (/^#[^\s,:@]+$/.test(search)) { // by id
                    if (rootNode && rootNode != document.documentElement) {//has rootNode
                        this.newInstance("@id=" + search.substring(1), rootNode);
                    } else {
                        var dom = document.getElementById(search.substring(1));
                        if (dom) this.newInstance(dom);
                    }
                } else if (/.*<(.|\s)+>.*/i.test(search.trim())) { // by html
                    var ls = local.dom.convert(search, rootNode);
                    for (var ii = 0; ii < ls.length; ii++) this.add(ls[ii]);
                } else { // by Multiple
                    if (rootNode) {
                        if (rootNode.nodeType && rootNode.nodeType == 1)      // DOM Node  1:element
                            rootNode = [rootNode];
                        else if (typeof rootNode == 'string') // search string
                            rootNode = JSer(rootNode);
                        else if (! (rootNode instanceof Element || rootNode instanceof Array))
                            rootNode = [document.documentElement || document.body];
                    }
                    rootNode = rootNode || [document.documentElement || document.body];

                    var object = this;
                    JSer.each(rootNode, function() {
                        var nodesArr = local.dom.searchEngine(search, this);
                        object.add(nodesArr);
                    })

                }
            } else if (search.length) { // by array or node list
                for (var i = 0; i < search.length; i++) this.add(search[i], true);
            } else {
                this.length = 0;
            }
            return this;
        },

        off: function(handle, fn) {
            return JSer.each(this, function() {
                local.event.del(this, handle, fn);
            });
        },

        on: function(handle, handler, once) {
            if (!handle)return this;
            else if (handle.constructor == Object) for (var prop in handle) this.on(prop, handle[prop], once);
            else if (handler) this.each(function() {
                if ((this == document) && handle == 'unload') local.event.add(window, 'unload', handler, once);
                else local.event.add(this, handle, handler, once);
            });
            else for(var ii=0;ii<this.length;ii++){
                var t = this[ii];
                try{
                    eval('t.'+handle+'()');
                }catch(e){
                    try{
                        local.dom.cache(t).events['_'+handle].call(t,{});
                    }catch(e1){
                    }
                }
            }
            return this;
        },

        once: function(handle, handler) {
            return this.on(handle, handler, true);
        },

        opacity: function(value) {
            if (value == undefined) {
                if (!this.length) return 0;
                var mh;
                if (local.browser.msie) {
                    if (mh = (this[0].style.filter || '').match(/alpha\s*\(opacity\s*=(.*)\)/))
                        return mh[1] ? parseFloat(mh[1].trim()) : 100;
                }
                return !local.browser.msie ? 100 * (this[0].style.opacity || 1) : this[0].style.opacity || 100;
            } else {
                if (isNaN(value)) value = 100;
                return this.each(function() {
                    var opacity = parseInt(value);
                    if (!local.browser.msie) opacity /= 100;
                    if (local.browser.msie) this.style.filter = "alpha(opacity = " + opacity + ")";
                    else this.style.opacity = opacity;
                });
            }
        },


        prepend: function(content) {
            return this.each(function() {
                if (content && content.nodeType){
                    var o = JSer(content).clone(true)[0];
                    if(o)this.insertBefore(o, this.firstChild);
                }
                else if (content.constructor == String) {
                    var o = document.createElement("DIV");
                    o.innerHTML = content;
                    for (var i = 0; i < o.childNodes.length; i++) {
                        var n = o.childNodes[i];
                        if (n && n.nodeType && n.nodeType == 3) {
                            JSer(this).prepend(document.createTextNode(n.nodeValue));
                        } //text node
                        else JSer(this).prepend(n);
                    }
                } else if (content instanceof Element) {
                    var o1 = JSer(this);
                    content.each(function() {
                        o1.prepend(this);
                    });
                } else if (content.length)
                    this.prepend(JSer(content));
            });
        },

        prependTo: function(selector) {
            var targets = JSer(selector), rtn=JSer([]), i;
            for(i=0;i<this.length;i++){
                var dom = this;
                JSer.each(targets, function() {
                    if (dom.nodeName && 'SCRIPT'.eq(dom.nodeName))
                        rtn.add(local.script.exec(dom));
                    else {
                        var o = JSer(dom).clone(true)[0];
                        if(o){
                            this.insertBefore(o, this.firstChild);
                            rtn.add(this.firstChild);
                        }
                    }
                });
            }
            rtn.endData=this;
            return rtn;
        },

        remove: function() {
            return this.each(function() {
                if (this.parentNode) this.parentNode.removeChild(this);
            });
        },

        removeAttr:function() {
            var args = arguments;

            var styleFloat = local.browser.msie ? "styleFloat" :"cssFloat";
            var props={
                "for": "htmlFor",
                "class": "className",
                "float": styleFloat,
                "cssFloat": styleFloat,
                "styleFloat": styleFloat,
                "readonly": "readOnly",
                "maxlength": "maxLength",
                "cellspacing": "cellSpacing"
            }
            return this.each(function() {
                if(this.nodeType==1){
                    var dom = this;
                    JSer.each(args, function(){
                        JSer.each(this.replace(/[;；,，　]/gi, " ").trim().split(/\s+/), function(){
                            if(props[this] && local.browser.msie)dom.removeAttribute(props[this]);
                            else dom.removeAttribute(this);
                        })
                    });
                }
            });
        },

        removeClass: function() {
            var args = arguments;
            return this.each(function() {
                if (args.length == 0) this.className = "";
                else {
                    var dom = this, domCls = (this.className || '').split(/\s+/), index;
                    JSer.each(args, function() {
                        JSer.each(this.replace(/[;；,，　]/gi, " ").trim().split(/\s+/), function() {
                            if (this != '' && (index = domCls.indexOf(String(this))) != -1) domCls.splice(index, 1);
                        });
                    });
                    dom.className = domCls.join(" ");
                }
            });
        },


        removeData:function(name){
            return name ? this.data(name, null): this.data(null);
        },

        removeToggle: function(name){
            return this.toggle(name, null);
        },

        reverse: function() {
            setEnd(this);
            for (var i = 0; i < this.length / 2; i++) {
                var t = this[i];
                this[i] = this[this.length - i - 1];
                this[this.length - i - 1] = t;
            }
            return this;
        },

        serialize: function() {
            var rtn=[];
            this.each(function() {
                if((this.type || '').or('radio','checkbox') && !this.checked) return;
                if (this.value != undefined && this.name){
                    if(this.tagName.eq('select')){
                        var n=this.name;
                        JSer.each(this.options, function(){
                            if(this.selected) rtn.push(n+"="+encodeURIComponent(this.value));
                        });
                    }else{
                        rtn.push(this.name+"="+encodeURIComponent(this.value));
                    }
                }
            });
            return rtn.join("&");
        },

        show: function(time, bywhat, callback) {//动画待处理: bywhat: w | h | o
            return this.each(function() {
                var jso =JSer(this);
                if(jso.data("__stop")) jso.data("__stop").call(jso);
                if (jso.css('display') != 'none'){
                    return;
                }

                var oldCss =  {
                     width: jso.width(),
                     height:jso.height(),
                     opacity: jso.opacity(),
                     overflow: jso.css('overflow')
                };

                if (!time) time = 0;
                else if ('fast'.eq(time)) time = 50;
                else if ('normal'.eq(time)) time = 100;
                else if ('slow'.eq(time)) time = 200;
                else if (isNaN(time)) time = 0;
                if(local.browser.msie) time/=25;
                else if(local.browser.opera || local.browser.safari) time/=10;
                else if(local.browser.chrome) time/=5;

                if (time <= 0) {
                    jso.css('display', '');
                    return;
                }

                function up() {
                    leavetime++;
                    if(leavetime<time){
                        if(wStep)jso.width(leavetime*wStep);
                        if(hStep)jso.height(leavetime*hStep);
                        if(oStep)jso.opacity(leavetime*oStep);
                        timer=setTimeout(arguments.callee, 0);
                    }else{
                        jso.removeData("__stop");
                        jso.css(oldCss);
                        if (callback) callback.call(jso[0]);
                    }
                }

                var timer=null;
                function stop(){
                    if(timer!=null) clearTimeout(timer);
                    this.css(oldCss);
                    this.removeData("__stop");
                }

                jso.css('overflow', 'hidden').css("display", '');
                if (typeof bywhat == 'function' && !callback) {
                    callback = bywhat;
                    bywhat = 'who';
                }
                var leavetime=0,wStep=0,hStep=0,oStep=0;
                bywhat = (bywhat || 'who').toLowerCase();
                if(bywhat.indexOf("w")!=-1){
                    wStep = jso.width()/time;
                    jso.width(0);
                }
                if(bywhat.indexOf("h")!=-1){
                    hStep = jso.height()/time;
                    jso.height(0);
                }

                if(bywhat.indexOf("o")!=-1){
                    oStep = jso.opacity()/time;
                    jso.opacity(0);
                }
                jso.data("__stop", stop);
                up();
            });
        },

        toggle: function(name, array, callback) {
            return this.each(function(){
                if(array===null){
                    JSer(this).data("__toggle:"+name, null);
                }else if(array instanceof Array){
                    JSer(this).data("__toggle:"+name, {next:0, toggles: array, callback:callback});
                }else{
                    var jso=JSer(this), t=jso.data("__toggle:"+name);
                    if(t && t.toggles.length>t.next){
                        JSer.each(t.toggles,function(){if(this instanceof String) jso.removeClass(this);});
                        var next=t.next,o = t.toggles[next];
                        if('STRING'.eq(typeof o)) jso.addClass(o);
                        else if('FUNCTION'.eq(typeof o)) o.call(this);
                        else if('OBJECT'.eq(typeof o)) jso.css(o);
                        t.next = next >= t.toggles.length - 1 ? 0 : next + 1;
                        jso.data('__toggle:'+name, t);
                        if('FUNCTION'.eq(typeof t.callback)) t.callback.call(this, next, t.toggles);
                    }
                }
            });
        },

        toggleClass: function() {
            var jso = this, args = arguments;
            return this.each(function() {

                if (args.length) {
                    var fn = true,str = true, fns = [];
                    JSer.each(args, function() {
                        if ('function'.eq(typeof this)) fns.push(this);
                        else fn = false;
                        if (this.constructor != String) str = false;
                    });
                    if (str) {//toggle class
                        var noHas = true,domCls = (this.className || '').split(/\s+/), index;
                        var sa = [];
                        for (var j = 0; j < args.length; j++)
                            sa = sa.concat(String(args[j]).replace(/[;；,，　]/gi, " ").trim().split(/\s+/));
                        for (var i = 0; i < sa.length; i++)
                            if (sa[i] != '' && (index = domCls.indexOf(sa[i])) != -1) {
                                domCls.splice(index, 1),noHas = false;
                                domCls.push(sa[i == sa.length - 1 ? 0 : i + 1]);
                                break;
                            }
                        if (noHas && sa[0] != '') domCls.push(sa[0]);
                        this.className = domCls.join(" ");
                    } else if (fn) {//toggle function
                        fns.reverse();
                        jso.data({toggleFns: fns, toggleEnd: 0});
                    }
                } else {
                    var fs = jso.data('toggleFns'), end;
                    if (fs && fs.length) {
                        fs[end = jso.data('toggleEnd') || 0].call(this);
                        jso.data('toggleEnd', end < 0 || end >= fs.length - 1 ? 0 : end + 1);
                    }
                }
            });
        },

        unmenu: function(b) {
            this.each(function() {
                if (b === false) JSer(this).removeAttr('__noContextMenu');
                else JSer(this).attr("__noContextMenu", '1');
            });
            if (!document.oncontextmenu) document.oncontextmenu = function(e) {
                var t = local.browser.msie ? event.srcElement : e.target;
                if (JSer(t).attr('__noContextMenu') == 1) return false;
            };
            return this;
        },

        unselect: function(b) {
            if (b === false) {
                if (local.browser.firefox)
                    this.css("-moz-user-select", null);
                if (local.browser.opera || local.browser.msie)
                    this.attr("unselectable", "off");
                if (local.browser.msie || local.browser.safari || local.browser.chrome)
                    this.off('selectstart');
            } else {
                if (local.browser.firefox)
                    this.css("-moz-user-select", "-moz-none");
                else if (local.browser.opera)
                    this.attr("unselectable", "on");
                else
                    this.on('selectstart', function() {
                        return false;
                    });
            }
            return this;
        },

        val:function(arr){
            if(arr!=undefined){
                if(! (arr instanceof Array)) arr=[arr];
                return this.each(function(){
                    if((this.type || '').or('radio','checkbox')) this.checked=arr.indexOf(this.value)!=-1;
                    else if('select'.eq(this.tagName)){
                        JSer.each(this.options, function(){this.selected = arr.indexOf(this.value)!=-1;});
                    }else if(this.value!=undefined){this.value=arr.join(", ");}
                });
            }else{
                if(this.length){
                    var ra=[];
                    if(this.length==1) return this[0].value!= undefined ? this[0].value : null;
                    this.each(function(){
                        if((this.type || '').or('radio','checkbox')){
                            if(this.checked) ra.push(this.value);
                        }else if('select'.eq(this.tagName)){
                            JSer.each(this.options,function(){if(this.selected) ra.push(this.value);});
                        }else if(this.value!=undefined) ra.push(this.value);
                    });
                    ra.reverse();
                    return ra;
               }else return null;
            }
        },

        width: function(val) {
            return val == undefined ? parseInt(local.dom.getStyle(this,'width', true)) : this.css('width', val);
        },

        xy: function() {
            var el,parent = null, pos = [], box;
            if (!this.length || (el = this[0]).parentNode === null || el.style.display == 'none') return {x:0, y:0};
            if (el.getBoundingClientRect) {    //msie & firefox
                box = el.getBoundingClientRect();
                var dd = document.documentElement;
                var scrollTop = Math.max(dd.scrollTop, document.body.scrollTop);
                var scrollLeft = Math.max(dd.scrollLeft, document.body.scrollLeft);
                return {x:box.left + scrollLeft, y:box.top + scrollTop};
            } else if (document.getBoxObjectFor) {    // gecko & chrome
                box = document.getBoxObjectFor(el);
                var borderLeft = (el.style.borderLeftWidth) ? parseInt(el.style.borderLeftWidth) : 0;
                var borderTop = (el.style.borderTopWidth) ? parseInt(el.style.borderTopWidth) : 0;
                pos = [box.x - borderLeft, box.y - borderTop];
            } else {    // safari & opera
                pos = [el.offsetLeft, el.offsetTop];
                parent = el.offsetParent;
                if (parent != el) {
                    while (parent) {
                        pos[0] += parent.offsetLeft;
                        pos[1] += parent.offsetTop;
                        parent = parent.offsetParent;
                    }
                }
                if (local.browser.opera || ( local.browser.safari && el.style.position == 'absolute' )) {
                    pos[0] -= document.body.offsetLeft;
                    pos[1] -= document.body.offsetTop;
                }
            }
            parent = el.parentNode;
            while (parent && !String(parent.tagName).or('BODY', 'HTML')) {
                pos[0] -= parent.scrollLeft;
                pos[1] -= parent.scrollTop;
                parent = parent.parentNode;
            }
            return {x:pos[0], y:pos[1]};
        }
    };

    var Url = function(url) {
        if (url == null || url == "") url = document.location.href;
        var anchor = "";
        if (url.indexOf("#") != -1) {
            anchor = url.substring(url.indexOf("#"));
            url = url.substring(0, url.indexOf("#"));
        }
        var file, prma, t_mh;
        if (t_mh = url.match(/(.*?)\?(.*)/)) {
            file = t_mh[1];
            prma = t_mh[2];
        } else if (t_mh = url.match(/(.+?=.*)+/)) {
            file = "";
            prma = url;
        }else{
            file=url;
            prma="";
        }
        var _names = ":"+prma.replace(/=[^&]*/g,"=:").replace(/&/g,"");
        prma =  prma=='' ? [] :prma.replace(/&amp;/i,'&').split("&");


        this.set = function(name, value) {
            if (typeof(name) == 'string' && name!='') {
                this.del(name);
                if (value != null) {
                    prma.push(name+"="+encodeURIComponent(value));
                } else {
                    var sa = name.replace(/&amp;/i,"&").split("&");
                    if(sa.length) prma=prma.concat(sa);
                }
            } else if (typeof(name) == 'object') {
                for (var pty in name) {
                    var t = name[pty];
                    if (typeof(t) == 'object' || typeof(t) == 'function') continue;
                    this.set(pty,t);
                }
            }
            return this;
        };

        this.sel = function(a, b){
            return this.set(JSer(a,b).serialize());
        };

        this.getF = function() {
            return file;
        };

        this.setF = function(f) {
            file = (t_mh = f.match(/.*\?(.+)/)) ? t_mh[1] : f;
            return this;
        };

        this.get = function(name) {
            if (name) {
                var sa=[];
                for(var i=0;i<prma.length;i++){
                    if(prma[i].indexOf(name+"=")==0) sa.push(decodeURIComponent(prma[i].substring(name.length+1)));
                }
                if(sa.length)
                    return sa.length==1?sa[0]:sa;
                else
                    return null;
            } else {
                return prma.join("&");
            }
        };

        this.del = function() {
            var da=[], ds;
            JSer.each(arguments, function() {
                JSer.each(this.replace(/[;；,，　]/, " ").split(/\s+/), function() {
                   da.push(this+"=");
                });
            });
            ds= "|" + da.join("|");
            for(var i=prma.length-1;i>=0;i--)
                if(ds.indexOf("|"+prma[i].split("=")[0]+"=")!=-1){
                  prma.splice(i, 1);
                }
            return this;
        };

        this.anchor=function(b){
            if(b){
                anchor=b.charAt(0)=='#'?b:"#"+b;
                return this;
            }else{
                return anchor==''? null : anchor.substring(1);
            }
        };

        this.toString = function() {
            url = file + (prma.length ? "?" + prma.join("&") : "");
            return url + anchor;
        };

        //接受target,modal,width,height,left,top参数,left,top为负时自动居中,modal=1时,只有IE才启用modal.
        this.open = function(prm, height) {
            if( prm && height && !isNaN(prm) && !isNaN(height) ) prm = {width: prm, height: height};
            else prm = 'OBJECT'.eq(typeof prm) && prm || {
                target:'',
                modal:false,
                width:800,
                height:600,
                left:-1,
                top:-1
            };

            var w = parseInt(prm.width) || 600,h = parseInt(prm.height) || 800,
                    l = isNaN(prm.left) ? -1 : prm.left, t = isNaN(prm.top) ? -1 : prm.top;
            if (l < 0)  l = Math.max((screen.availWidth - w) / 2, 0);
            if (t < 0)  t = Math.max((screen.availHeight - h) / 2, 0);

            if (prm.modal && local.browser.msie) {//为保证兼容,模态窗口不应该有返回值.
                showModalDialog(this.toString(), window, "edge:Raised;resizable:Yes;status:No;dialogWidth:" + w +
                        "px;dialogHeight:" + h + "px;dialogLeft:" + l + "px;dialogTop:" + t + "px");
                return null;
            } else {
                var win = open(this.toString(), prm.target, "resizable=yes,statusbar=yes,scrollbars=yes,width=" + w + ",height=" + h);
                if (!win) {
                    alert('似乎某个弹出窗口拦截器导致了无法打开该网页。\n\n如果您的浏览器使用了弹出窗口拦截，请尝试关闭它。');
                    return null;
                } else {
                    win.moveTo(l, t);
                    win.focus();
                    return win;
                }
            }
        };

        this.go = function(target) {
            var tUrl = this.toString();
            if (target == 0) {
                document.location.href == tUrl ? document.location.reload() : document.location.replace(tUrl);
            } else if (target) {
                if ('_blank'.eq(target))  top.window.open(tUrl);
                else if ('_top'.eq(target))  top.location.href = tUrl;
                else if ('_parent'.eq(target)) parent.location.href = tUrl;
                else if ('_self'.eq(target))   document.location.href = tUrl;
                else if ('_opener'.eq(target)){
                    var win = window.opener || window.dialogArguments && window.dialogArguments.opener;
                    if(win) win.document.location.href==tUrl ? win.document.location.reload():win.document.location.href=tUrl;
                }else {
                    try {
                        JSer("#" + target + ", frame@name="+target+ ", iframe@name="+target)[0].setAttribute('src',tUrl);
                    } catch(e) {
                        try {
                            (top.document.getElementById(target) || top.window.frames[target]).setAttribute('src',tUrl);
                        } catch(e1) {}
                    }
                }
            } else {
                if (document.location.href == tUrl) {
                    document.location.reload();
                } else {
                    document.location.href = tUrl;
                }
            }
        };

        this.loadTo = function(selector) {
            var o = JSer(selector);
            this.ajax(function(d) {
                o.html(d.replace(/<script(.|\s)*?\/script>/gi, ""));
            });
        };

        this.ajax = function(obj) {
            var _default = {
                method: "AUTO",
                type: "HTML",
                async: true,
                timeout:0,
                cache:true,
                ifModified:false,
                enctype:"application/x-www-form-urlencoded",
                username:null,
                password:null,
                send:null,
                beforeSend:null,
                success: null,
                error: null,
                complete:null
            };

            var gData=[], pData=[]; //init: 'get' what, or 'post' what.
            for(var i=0;i<prma.length;i++){
                if(_names.indexOf(":"+prma[i].split("=")[0]+"=:")==-1){
                    pData.push(prma[i]);
                }else{
                    gData.push(prma[i]);
                }
            }
            if(obj.cache===false)gData.push("_="+new Date().getTime());


            if(!obj) obj=_default;
            else if('FUNCTION'.eq(typeof obj)) obj=JSer.merge(_default, {success:obj});
            else obj=JSer.merge(_default, obj);

            if('SCRIPT'.eq(obj.type) && obj.cache!==false) obj.cache=false;
            if(obj.type) obj.type=(obj.type+'').toLowerCase();

            if(obj.method=='AUTO') obj.method = pData.length ? "POST":"GET";

            var oajax, requestUrl = this.toString();
            if (window.ActiveXObject) oajax = new ActiveXObject("Microsoft.XMLHTTP"); //判断IE8使用xmlhttp,还有msxml2
            else if (window.XMLHttpRequest) oajax = new XMLHttpRequest();
            else throw "unsupport ajax.";

            var owner=this, finished=false, timer=null, doReturn = function() {
                var rtn;
                if ('XML'.eq(obj.type)) {
                    rtn = oajax.responseXML;
                    if("parsererror".eq(rtn.documentElement.tagName)) rtn = "parsererror";
                } else {
                    rtn = (oajax.responseText || "").trim();
                    if ('JSON'.eq(obj.type)) {
                        try{rtn = eval( "(" + rtn + ")" );}catch(e){
                            throw "JSer: ajax returned data is not a json object.";
                        }
                    } else if ('SCRIPT'.eq(obj.type)) {
                        local.script.exec(rtn);
                    }
                }
                return rtn;
            },  now = new Date().getTime(), reqUrl = 'POST'.eq(obj.method) && !obj.send
                    ? JSer.url(this.getF()).set(gData.join("&")).toString()
                    : (obj.cache===false?JSer.url(requestUrl).set("_", now) :this).toString()
                    , onReadyStateChange = function(state){

                if(finished) return; finished=true;

                if(state=='timeout'){
                    oajax.abort();
                }

                if(state.or('success', 'notmodified')){
                    var d = doReturn();
                    if(d=='parsererror' && 'XML'.eq(obj.type)) state=d;
                    else if('FUNCTION'.eq(typeof obj.success)) obj.success.call(owner, d, state);
                }

                if(state!='success' && 'FUNCTION'.eq(typeof obj.error)) obj.error.call(owner, oajax, state);

                if ('FUNCTION'.eq(typeof obj.complete)) obj.complete.call(owner, oajax, state);

                if(timer){ clearTimeout(timer);timer=null; }

            };

            if (obj.async) oajax.onreadystatechange = function() {
                if (oajax.readyState == 4) {
                    // status 0 for opera  1223 for IE
                    if (oajax.status >= 200 && oajax.status<300 || oajax.status == 304 || oajax.status==1223 || oajax.status==0) {
                        if(obj.ifModified){
                            var m = oajax.getResponseHeader("Last-Modified"), e=oajax.getResponseHeader("Etag");
                            if(m) local.ajax.caches.lastModified[requestUrl] = m;
                            if(e) local.ajax.caches.etag[requestUrl] = e;
                        }
                        onReadyStateChange(oajax.status == 304||oajax.status==0?"notmodified":"success");
                    } else {
                        onReadyStateChange("error");
                    }
                }
            };

            if(obj.send && "GET".eq(obj.method)) obj.method="POST";//don't move up!
            if(obj.username) oajax.open(obj.method,reqUrl, obj.async, obj.username, obj.password);
            else oajax.open(obj.method,reqUrl, obj.async);
            oajax.setRequestHeader("CONTENT-TYPE", obj.enctype);
            if(obj.ifModified){
                var m = local.ajax.caches.lastModified[requestUrl], e=local.ajax.caches.etag[requestUrl];
                if(m) oajax.setRequestHeader("If-Modified-Since", m);
                if(e) oajax.setRequestHeader("If-None-Match", e);
            }
            oajax.setRequestHeader("Accept",local.ajax.accepts[obj.type] || local.ajax.accepts.other);
            oajax.setRequestHeader("Ajax-Agent", "jdiy.net/JSer-AJAX");

            if(obj.beforeSend && 'FUNCTION'.eq(typeof obj.beforeSend) && obj.beforeSend.call(this, oajax)===false){
                oajax.abort();
                return;
            }
            if(obj.send) oajax.send(obj.send);
            else if('GET'.eq(obj.method)) oajax.send(null);
            else oajax.send(pData.join("&"));
            if (!obj.async) {
                if('SCRIPT'.eq(obj.type))local.script.exec((oajax.responseText || "").trim());
                return oajax;
            }else{
                if(obj.timeout && !isNaN(obj.timeout)){
                    timer = setTimeout(function(){
                        onReadyStateChange("timeout");
                    }, obj.timeout);
                }
            }
        }
    };

    JSer.url = function(url) {
        return new Url(url);
    };

    JSer.exec = function(fn) {
        local.task.exec();
        if (local.task.load) fn.call(document, JSer);
        else local.task.add(function() {
            return fn.call(this, JSer);
        });
        return this;
    };

    JSer.each = function(obj, callback) {
        var length = obj.length, i = (length || 0) - 1;
        if (length == undefined) {
            for (i in obj) if (callback.call(obj[i], i) === false) break;
        } else {
            for (; i >= 0;) if (callback.call(obj[i], i--) === false) break;
        }
        return obj;
    };


    JSer.extend = function(method, fn) {
        if ('OBJECT'.eq(typeof method) && !fn) {
            JSer.each(method, function(i) {
                Element.prototype[i] = this;
            });
        } else if ('STRING'.eq(typeof method) && fn) {
            Element.prototype[method] = fn;
        }
        return this;
    };

    JSer.favorite = function(title, url) {
        if (!title)title = window.self.title;
        if (!url)url = JSer.url().toString();
        if (window.sidebar && 'function'.eq(typeof window.sidebar.addPanel))
            window.sidebar.addPanel(title, url, '');
        else if (window.external)
            window.external.AddFavorite(url, title);
        else alert("请按快捷键CTRL+D将本页添加到收藏夹.");
    };

    JSer.merge = function(obj1, obj2) {
        for (var i in obj2) obj1[i] = obj2[i];
        return obj1;
    };

    JSer.each(("abort,blur,change,click,dblclick,error,focus,keydown,keypress,keyup,load,"
            + "mousedown,mousemove,mouseout,mouseover,mouseup,reset,resize,select,submit,"
            + "unload,scroll").split(","), function() {
        var handle = this;
        Element.prototype[this] = function(handler) {
            return this.on(handle, handler);
        };
    });


    //**********  global object prototype expand:

    String.prototype.trim = function() {
        return this.replace(/^\s+|\s+$/g, '');
    };

    String.prototype.eq = function() {
        for (var i = 0; i < arguments.length; i++) {
            var o = arguments[i];
            if (o == null || this.toUpperCase() != (o + '').toUpperCase()) return false;
        }
        return true;
    };

    String.prototype.or = function() {
        for (var i = 0; i < arguments.length; i++) {
            var o = arguments[i];
            if (o != null && this.toUpperCase() == (o + '').toUpperCase()) return true;
        }
        return false;
    };

    Array.prototype.indexOf = function(o) {
        for (var i = 0; i < this.length; i++)//don't use each
            if (this[i] == o) return i;
        return -1;
    }
})();