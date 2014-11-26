(function() {
    /**
     * JSer.modalDialog plugin.
     *
     * @Depend   : JSer.js
     * @author   : 子秋(folier)
     * @qq       : 39886616
     * @copyright: http://jdiy.net
     *
     * to use it like this:
     *
     * JSer("#modal").modalDialog({
     *     dragClass: "#jcmTitle",   // The area of the mouse click and drag. (JSer search string, default value: '#jcmTitle')
     *     closeClass: "#jcmClose",  // The area of the mouse click to close the dialog. (JSer string searcher, default value:'#jcmClose')
     *     opacity: 90,              // The opacity value of the dialog. (int range:0-100,  default value: 90)
     *     dragOpacity: 60,          // When the dialog box by dragging the opacity value. (int range: 0-100, default value: 60)
     *     maskOpacity: 48,          // The opacity value of the dialog mask. (int range:0-100, default value:48)
     *     maskColor:'black',        // The color of the dialog mask. (color value, default value:'black')
     *     left: value,              // The 'left' style of the modal dialog(with absolute position). if not set, default display on center of the visable area.
     *     top: value,               // The 'top' style of the modal dialog(with absolute position ). if not set, default display on middle of the visable area.
     *     modal: false,             // show as modal: true | false. the default value is true.
     *
     *     //Optional event listener functions: you can use built object 'this' to access DOM node of the dialog box,
     *                                You can pass a parameter to the function to access the Javascript Event Object.
     *     onDrag: function(event){},     // when the dialog box is start drag.
     *     onMove: function(event){},     // When the dialog box is moving.
     *     onRelease: function(event){},  // when the dialog box is stop drag.
     *     onClose: function(event){}     // when the dialog box is closed.
     * });
     *
     * */


    JSer.extend({
        modalDialog:function(args) {
            if (!this[0] || JSer(this[0]).data("modaling")) return;
            var defaultConfig = {
                dragClass:'#jcmTitle',
                closeClass:'#jcmClose',
                opacity:90,
                dragOpacity: 60,
                maskOpacity: 48,
                maskColor:'black'
            };
            if ('OBJECT'.eq(typeof args)) {
                for (var i in defaultConfig) if (args[i] == undefined) args[i] = defaultConfig[i];
            } else args = defaultConfig;

            function x(e) {
                return e.x ? e.clientX : e.pageX;
            }

            function y(e) {
                return e.y ? e.clientY : e.pageY
            }

            function c(e) {
                if(JSer.browser.chrome) JSer('body').unselect(false);
                if (e)arguments.callee.e = e;
                if (args.maskOpacity > 0) {
                    args.maskOpacity -= 10;
                    modal.opacity(args.maskOpacity);
                    setTimeout(arguments.callee, 50);
                } else if (os) {
                    mask.remove();
                    body.css(os.b);
                    if(navigator.userAgent.indexOf("MSIE 6")!=-1){
                        modal.hide();
                    }else{
                        modal.opacity(os.mo).css(os.m);
                    }
                    d.off('mousedown', r).css(os.t);
                    f.css(os.f);
                    os = null;
                    if (args.onClose) args.onClose.call(modal, arguments.callee.e);
                }
                modal.removeData('modaling');
                return false;
            }

            function r(e) {
                function m(e) {
                    modal.css({left: r.jl + x(e) - r.il, top:  r.jt + y(e) - r.it});
                    if (args.onMove) args.onMove.call(modal, e);
                }

                function s(e) {
                    modal.opacity(args.opacity);
                    body.off('mousemove', m).off('mouseup', arguments.callee);
                    if (args.onRelease) args.onRelease.call(modal, e);
                }

                var r = {jl:parseInt(modal.css("left")),jt:parseInt(modal.css("top")),il:x(e),it:y(e)};
                body.on({mousemove:m,mouseup:s});
                modal.opacity(args.dragOpacity);
                if (args.onDrag) args.onDrag.call(modal, e);
            }

            var dde = document.documentElement,db = document.body, body = JSer('body'),bf = body.css('overflow');
            var modal = JSer(this[0]).data('modaling',1), mask = document.createElement("DIV"), maskId = "_J_M_" + new Date().getTime();
            mask.setAttribute("id", maskId);
            JSer(mask).css({
                position:'absolute',
                zIndex: 99998,
                left:0,
                top:0,
                width:screen.width + dde.scrollWidth,
                height:screen.height + dde.scrollHeight,
                backgroundColor:args.maskColor
            }).opacity(0);
            if(JSer.browser.chrome) JSer('body').unselect();

            if(args.modal!==false)body.append(mask).css('overflow', 'hidden');
            mask = JSer('#' + maskId);
            var a = 0, d = JSer(args.dragClass, modal), f = JSer(args.closeClass, modal).css('cursor', 'pointer'), os = {
                b:{overflow: bf},
                m:{
                    position: modal.css('position'),
                    zIndex:modal.css('z-index'),
                    left:modal.css('left'),
                    top:modal.css('top'),
                    display:modal.css('display')
                },
                t:{cursor:d.css('cursor')},
                f:{cursor:f.css('cursor')},
                mo:modal.opacity()
            };
            d.on('mousedown', r).css('cursor', 'move').unselect();
            f.once('click', c);

            (function() {
                if (args.maskOpacity > a) a += 10,mask.opacity(a),setTimeout(arguments.callee, 50);
                else mask.opacity(args.maskOpacity);
            })();
            var ch = Math.min(dde.clientHeight, db.clientHeight),cw = Math.min(dde.clientWidth, db.clientWidth);
            ch = ch || Math.max(dde.clientHeight, db.clientHeight);
            cw = cw || Math.max(dde.clientWidth, db.clientWidth);
            modal.css({
                position:'absolute',zIndex:99999,
                left:args.left!==undefined ? args.left: Math.max(dde.scrollLeft, db.scrollLeft) + (Math.abs(cw - parseInt(modal.css('width')))) / 2,
                top:args.top!==undefined ? args.top : Math.max(dde.scrollTop, db.scrollTop) + (Math.abs(ch - parseInt(modal.css('height')))) / 2
            }).opacity(args.opacity).show();

        }
    });
})();

