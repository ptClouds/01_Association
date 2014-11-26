// Copyright (c) 2009 Felix Nagel for Namics (Deustchland) GmbH
// Licensed under Creative Commens Attribution-Share Alike 3.0 Unported (http://creativecommons.org/licenses/by-sa/3.0/)
(function (a) {
	var b = 0;
	a.widget("ui.ariaSorTable", {_init:function () {
		var g = this.options, e = this;
		var d = e.element.attr("id");
		if (d != "") {
			g.uid = d;
		} else {
			g.uid = new Date().getTime();
			e.element.attr("id", "ui-table-" + g.uid);
		}
		e.element.find("caption").attr("id", "ui-table-" + g.uid + "-caption");
		e.element.attr("role", "grid").attr("aria-readonly", "true").attr("aria-labelledby", "ui-table-" + g.uid + "-caption");
		var i = e.element.find("thead tr").bind("click", function (l) {
			if (!g.disabled) {
				var k = th = a(l.target);
				while (!th.is("th")) {
					th = th.parents("th");
				}
				if (!th.hasClass("ui-table-deactivate")) {
					l.preventDefault();
					e.rowSort(th.prevAll("th:visible").length);
				}
			}
		}).attr("role", "row");
		g.headers = i.find("th");
		g.headers.each(function (k) {
			var l = a(g.headers[k]);
			l.attr("id", "ui-table-" + g.uid + "-header-" + k).attr("role", "columnheader").attr("scope", "col");
			var n = (g.defaultSortBy == "asc") ? g.textAsc : g.textDesc;
			var m = l.find("a").length;
			if (!l.hasClass("ui-table-deactivate")) {
				if (!m) {
					l.html("<a title=\"" + n + "\" href=\"#ui-table-dummy\">" + l.html() + "</a>");
				}
				l.children("a").attr("title", n).bind("mouseenter", function () {
					a(this).parent().addClass("ui-state-hover");
				}).bind("mouseleave", function () {
					a(this).parent().removeClass("ui-state-hover");
				});
			} else {
				if (!m) {
					l.attr("tabindex", 0);
				}
			}
			if (l.hasClass("ui-state-active")) {
				if (l.hasClass("ui-table-asc")) {
					l.attr("aria-sort", "ascending").children("a").attr("title", g.textDesc);
				} else {
					if (l.hasClass("ui-table-desc")) {
						l.attr("aria-sort", "descending").children("a").attr("title", g.textAsc);
					}
				}
				g.activeCol = k;
			}
		});
		var h = e.element.find("tbody tr");
		for (var c = 0; c < h.length; c++) {
			g.originalData[c] = [];
			var f = a(h[c]).children("td");
			for (var j = 0; j < f.length; j++) {
				g.originalData[c][j] = a(f[j]).html();
			}
		}
		if (!g.rowsToShow) {
			g.rowsToShow = h.length;
		}
		e.updateData();
		e.setHTML();
		if (g.pager) {
			e.buildPager();
		}
		if (g.keyboard) {
			e._setKeyboard();
		}
		e._trigger("onInit", 0);
	}, updateData:function () {
		var f = this.options, e = this;
		f.tableData = [];
		var d = 0;
		for (var c = 0; c < f.originalData.length; c++) {
			if (!f.rowsToHide[c]) {
				f.tableData[d] = [];
				for (var g = 0; g < f.headers.length; g++) {
					if (!f.colsToHide[g]) {
						f.tableData[d].push(f.originalData[c][g]);
					}
				}
				d++;
			}
		}
		e._trigger("onUpdateData", 0);
	}, setHTML:function () {
		var k = this.options, j = this;
		var c = true;
		var e = [];
		e.push("<tbody class=\"ui-table-tbody-active\" aria-live=\"polite\" aria-relevant=\"text\">\n");
		for (var i = k.rowToStart - 1; i < k.rowToStart - 1 + k.rowsToShow; i++) {
			if (k.tableData[i]) {
				var f = (c) ? "class=\"odd\"" : "";
				c = (c) ? false : true;
				e.push("\t\t\t\t<tr role=\"row\"" + f + ">\n");
				for (var h = 0; h < k.tableData[i].length; h++) {
					if (h + 1 == k.colScopeRow) {
						e.push("\t\t\t\t\t<td headers=\"ui-table-" + k.uid + "-header-" + h + "\" scope=\"row\" role=\"rowheader\">" + k.tableData[i][h] + "</td>\n");
					} else {
						e.push("\t\t\t\t\t<td headers=\"ui-table-" + k.uid + "-header-" + h + "\" role=\"gridcell\">" + k.tableData[i][h] + "</td>\n");
					}
				}
				e.push("\t\t\t\t</tr>\n");
			}
		}
		e.push("\t\t\t</tbody>");
		var g = "";
		g = e.join("");
		var d = j.element.find("tbody.ui-table-tbody-active");
		if (d.length) {
			d.replaceWith(g);
		} else {
			j.element.find("tbody").hide();
			j.element.append(g);
		}
		if (k.colsToHide) {
			k.headers.each(function (l) {
				if (!k.colsToHide[l]) {
					a(this).show();
				} else {
					a(this).hide();
				}
			});
		}
		a(k.headers[0]).parent().parent().attr("aria-live", "polite").attr("aria-relevant", "text");
		j._updateVitualBuffer();
		j._trigger("onSetHTML", 0);
	}, rowSort:function (g) {
		var k = this.options, j = this;
		var c = k.headers.filter(":visible");
		th = a(c[g]);
		b = g;
		if (th.hasClass("ui-table-number")) {
			k.tableData.sort(j._sortNumber);
		} else {
			if (th.hasClass("ui-table-number-de")) {
				k.tableData.sort(j._sortNumberDE);
			} else {
				if (th.hasClass("ui-table-date")) {
					k.tableData.sort(j._sortDate);
				} else {
					if (th.hasClass("ui-table-date-de")) {
						k.tableData.sort(j._sortDateDE);
					} else {
						if (th.hasClass("ui-table-date-iso")) {
							k.tableData.sort(j._sortDateISO);
						} else {
							k.tableData.sort(j._sortText);
						}
					}
				}
			}
		}
		var i = th.hasClass("ui-table-asc");
		if (i || th.hasClass("ui-table-desc")) {
			var l = (i) ? "desc" : "asc";
		} else {
			var l = k.defaultSortBy;
		}
		if (l == "desc") {
			k.tableData.reverse();
		}
		var e = a(c[k.activeCol]);
		var f = (e.hasClass("ui-table-asc")) ? "asc" : "desc";
		e.removeClass("ui-table-" + f).removeClass("ui-state-active").attr("aria-sort", "none");
		a(c[k.selectedCol]).removeClass("ui-state-focus");
		var d = (l == "asc") ? k.textDesc : k.textAsc;
		var h = (l == "asc") ? "ascending" : "descending";
		th.addClass("ui-state-active").addClass("ui-table-" + l).attr("aria-sort", h).children("a").attr("title", d);
		k.activeCol = k.selectedCol = g;
		j._trigger("onRowSort", 0);
		j.setHTML();
	}, _sortNumber:function (d, c) {
		return (d[b] - c[b]);
	}, _sortNumberDE:function (d, c) {
		return (d[b].replace(",", ".") - c[b].replace(",", "."));
	}, _sortDateDE:function (d, c) {
		var f = d[b].substr(3, 2) + "/" + d[b].substr(0, 2) + "/" + d[b].substr(6, 4);
		var e = c[b].substr(3, 2) + "/" + c[b].substr(0, 2) + "/" + c[b].substr(6, 4);
		return (Date.parse(f) < Date.parse(e));
	}, _sortDate:function (d, c) {
		return (Date.parse(d[b]) < Date.parse(c[b]));
	}, _sortDateISO:function (d, c) {
		var f = d[b].substr(5, 2) + "/" + d[b].substr(8, 2) + "/" + d[b].substr(0, 4);
		var e = c[b].substr(5, 2) + "/" + c[b].substr(8, 2) + "/" + c[b].substr(0, 4);
		return (Date.parse(f) < Date.parse(e));
	}, _sortText:function (d, c) {
		return (d[b] > c[b]);
	}, _setKeyboard:function () {
		var d = this.options, c = this;
		d.shift = false;
		a(document).keyup(function (f) {
			if (f.keyCode == a.ui.keyCode.SHIFT && !d.disabled) {
				d.shift = false;
				return true;
			}
		}).keydown(function (f) {
			if (f.keyCode == a.ui.keyCode.SHIFT && !d.disabled) {
				d.shift = true;
				return true;
			}
		});
		c.element.keydown(function (g) {
			if (!d.disabled) {
				switch (g.keyCode) {
				  case a.ui.keyCode.DOWN:
				  case a.ui.keyCode.PAGE_DOWN:
					if (d.rowToStart < d.tableData.length - 1 && d.rowsToShow != d.tableData.length) {
						if (d.pager) {
							c.setPager(d.rowToStart + d.rowsToShow);
						}
						d.rowToStart += d.rowsToShow;
						c.setHTML();
					}
					break;
				  case a.ui.keyCode.UP:
				  case a.ui.keyCode.PAGE_UP:
					if (d.rowToStart > 0 + d.rowsToShow && d.rowsToShow != d.tableData.length) {
						if (d.pager) {
							c.setPager(d.rowToStart - d.rowsToShow);
						}
						d.rowToStart -= d.rowsToShow;
						c.setHTML();
					}
					break;
				  case a.ui.keyCode.HOME:
					if (d.rowsToShow != d.tableData.length) {
						d.rowToStart = 1;
						c.setHTML();
					}
					break;
				  case a.ui.keyCode.END:
					if (d.rowsToShow != d.tableData.length) {
						d.rowToStart = ((Math.ceil(d.tableData.length / d.rowsToShow)) * d.rowsToShow) - d.rowsToShow + 1;
						c.setHTML();
					}
					break;
				  case a.ui.keyCode.TAB:
					if (d.shift) {
						if (d.selectedCol > 0) {
							c.colSwitch(-1);
						} else {
							return true;
						}
					} else {
						if (d.selectedCol < d.headers.filter(":visible").length - 1) {
							c.colSwitch(1);
						} else {
							return true;
						}
					}
					break;
				  case a.ui.keyCode.LEFT:
					if (d.selectedCol > 0) {
						c.colSwitch(-1);
					}
					break;
				  case a.ui.keyCode.RIGHT:
					if (d.selectedCol < d.headers.filter(":visible").length - 1) {
						c.colSwitch(1);
					}
					break;
				  case a.ui.keyCode.SPACE:
					var f = d.headers.filter(":visible");
					a(f[d.selectedCol]).find("a").click();
					break;
				  default:
					return true;
					break;
				}
				return false;
			}
		});
	}, colSwitch:function (f) {
		var e = this.options, d = this;
		var c = e.headers.filter(":visible");
		a(c[e.selectedCol]).removeClass("ui-state-focus");
		e.selectedCol = e.selectedCol + f;
		el = a(c[e.selectedCol]);
		el.addClass("ui-state-focus");
		if (el.find("a").length) {
			el.find("a").focus();
		} else {
			el.focus();
		}
	}, destroy:function () {
		this.element.unbind(".ariaSorTable").removeData("ariaSorTable").removeAttr("role").removeAttr("aria-readonly").removeAttr("aria-labelledby").find("caption").removeAttr("id").end().find("thead").removeAttr("aria-live").removeAttr("aria-relevant").find("tr").removeAttr("role").unbind("click").end().end().find("tbody.ui-table-tbody-active").remove().end().find("tbody").show();
		a.each(this.options.headers, function () {
			a(this).show().removeAttr("id").removeAttr("role").removeAttr("aria-sort").removeAttr("tabindex").removeAttr("scope");
			var c = a(this).children("a");
			if (c.length) {
				c.unbind("mouseenter mouseleave").removeAttr("title");
				if (c.attr("href") == "#ui-table-dummy") {
					a(this).html(c.html());
				}
			}
		});
		if (this.options.pager) {
			a("#ui-table-pager").remove();
		}
		a("#virtualBufferForm").parent().remove();
	}, _updateVitualBuffer:function () {
		var d = a("#virtualBufferForm");
		if (d.length) {
			(d.val() == "1") ? d.val("0") : d.val("1");
		} else {
			var c = "<form><input id=\"virtualBufferForm\" type=\"hidden\" value=\"1\" /></form>";
			a("body").append(c);
		}
	}});
	a.extend(a.ui.ariaSorTable, {version:"1.7.1", defaults:{rowToStart:1, rowsToShow:false, colScopeRow:1, defaultSortBy:"asc", colsToHide:false, rowsToHide:false, keyboard:true, pager:false, textPager:"Page:", textAsc:"Sort ascending", textDesc:"Sort descending", selectedCol:0, activeCol:0, tableData:[], originalData:[]}});
	a.fn.extend(a.ui.ariaSorTable.prototype, {buildPager:function () {
		var e = this.options, c = this;
		var d = 0;
		var g = 0;
		var f = "<div id=\"ui-table-pager\" aria-controls=\"ui-table-" + e.uid + "\">" + "\n";
		f += "<span id=\"ui-table-" + e.uid + "-pager-title\" class=\"ui-corner-all\">" + e.textPager + "</span>" + "\n";
		while (g < e.tableData.length) {
			f += "\t<button title=\"" + e.textPager + " " + (d + 1) + "\" type=\"button\" class=\"ui-state-default ui-corner-all\" aria-selected=\"false\" aria-labelledby=\"ui-table-" + e.uid + "-pager-title\">" + (d + 1) + "</button>" + "\n";
			d++;
			g = g + e.rowsToShow;
		}
		f += "</div>" + "\n";
		c.element.after(f);
		e.pager = a("#ui-table-pager").attr("aria-valuemin", 1).attr("aria-valuemax", d);
		e.pagerButtons = e.pager.find("button").each(function (h) {
			a(this).bind("click", function () {
				var i = (e.rowsToShow * h == 0) ? 1 : (e.rowsToShow * h) + 1;
				c.setPager(i);
				e.rowToStart = i;
				c.setHTML();
			}).bind("mouseenter", function () {
				a(this).addClass("ui-state-hover");
			}).bind("mouseleave", function () {
				a(this).removeClass("ui-state-hover");
			}).bind("focus", function () {
				a(this).addClass("ui-state-focus");
			}).bind("blur", function () {
				a(this).removeClass("ui-state-focus");
			});
		});
		c.setPager(e.rowToStart);
	}, setPager:function (e) {
		var d = this.options, c = this;
		a(d.pagerButtons[Math.floor(d.rowToStart / d.rowsToShow)]).removeClass("ui-state-active").attr("aria-selected", false);
		a(d.pagerButtons[Math.floor(e / d.rowsToShow)]).addClass("ui-state-active").attr("aria-selected", true);
		d.pager.attr("aria-valuenow", Math.floor(e / d.rowsToShow) + 1);
	}});
})(jQuery);

