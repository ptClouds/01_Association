<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>公告信息</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">

		<link type="text/css"
			href="js/plugin/ui-lightness/jquery-ui-1.7.1.custom.css"
			rel="stylesheet" />
		<link type="text/css" href="js/plugin/css/style.css"
			rel="stylesheet" />
		<!--[if gte IE 6]>	
		<style type="text/css">@import url(css/style_ie.css);</style>
		<![endif]-->
		<script type="text/javascript" src="js/plugin/js/jquery.js"></script>
		<script type="text/javascript" src="js/plugin/js/ui.core.js"></script>
		<script type="text/javascript"
			src="js/plugin/js/ui.ariaSorTable.js"></script>
		<script type="text/javascript" src="./js/plugin/js/demo.js"></script>
		<script type="text/javascript">	
		$(function() {			
			var table1 = $("table").ariaSorTable({
				rowsToShow: 8,
				pager: true,
				onInit: function() {
					demoControl();
				},
				colsToHide: {
					6: true,
					7: true
				}
			});
			
			$("#destroy").click(function (event) { 
				table1.ariaSorTable('destroy');
			});		
			$("#disable").click(function (event) { 
				table1.ariaSorTable('disable');
			});					
		});	
		
		function updateCont(value1,value2){
			//alert("hello");
			var updateNoticId = document.getElementById("updateNoticId");
			var context = document.getElementById("updateContent");
			updateNoticId.value = value1;
			context.value = value2;
			return true；
   	  	}
   	  	
   	  	function checkbt(){
   	  		var updateNoticId = document.getElementById("updateNoticId");
			var context = document.getElementById("updateContent");
			if(updateNoticId.value.length<=0){
				alert("请选择要修改的公告");
				//window.confirm("请选择要删除的公告");
			}
   	  	}
	</script>
	</head>
	<body>
	<br>
		<h2>
			站点公告信息
		</h2>
		<div id="wrapper">
			<div id="table-wrapper">
			<s:if test="%{noticeFlag != 3}">
				<table
					summary="This table holds sample data to test sorting and paging. Please feel free to sort colums by cicking their headers and see all data by clicking at the pager.">
					<caption class="ui-state-highlight ui-corner-all">
						公告信息表
					</caption>
					<thead>
						<tr>
							<th class="ui-table-asc ui-state-active ui-table-number"
								style="min-width: 6em;">
								<a href="#server_site_order">公告编号</a>
							</th>
							<th class="ui-table-text" style="min-width: 10em;">
								<a href="#server_site_order">发布者</a>
							</th>
							<th class="ui-table-text" style="min-width: 10em;">
								<a href="#server_site_order">公告标题</a>
							</th>
							<th class="ui-table-date-de" style="min-width: 10em;">
								<a href="#server_site_order">发布时间</a>
							</th>
							<s:if test="%{noticeFlag != 2}">
							<th class="ui-table-text" style="min-width: 10em;">
								<a href="#server_site_order">操作</a>
							</th>
							</s:if>
						</tr>
					</thead>
					<tbody>
					<s:iterator value="%{#request.adminNoticeList}" id="s">
						<tr>
							<td>
								<s:property value='#s.noticeId' />
							</td>
							<td>
								<s:property value='#s.adminInfo.adminName' />
							</td>
							<td>
								<s:property value='#s.noticeTitle' />
							</td>
							<td>
								<s:property value='#s.sendTime' />
							</td>
							<s:if test="%{noticeFlag == 0}">
							<td>
								<a style="text-decoration:none;"  onclick="updateCont('<s:property value='#s.noticeId' />','<s:property value='#s.noticeTitle' />');"><font color=red>修改</font></a>
							</td>
							</s:if>
							<s:if test="%{noticeFlag == 1}">
							<td>
								<a style="text-decoration:none;" href="dealNewsdeleteNotice.action?noticeVo.noticeId=<s:property value='#s.noticeId' />">删除</a>
							</td>
							</s:if>
						</tr>
						</s:iterator>
					</tbody>
				</table>
				</s:if>
				
				<s:if test="%{noticeFlag == 0}">
				<form action="dealNewsupdateNotice.action"  method="POST" name="form2">
				<br>
				<div><hr></div>
				<div><b>修改公告</b></div>
				<br>
				<div>公告编号:</div>
				<div><input readonly  name="noticeVo.updateNoticId" id="updateNoticId"></div>
				<div>公告内容:</div>
				<div><textarea name="noticeVo.updateContent" rows="5" cols="50" id="updateContent"></textarea></div>
				<span>
					<input type="submit" name="save" value="确定" onclick="checkbt();"/>
				</span>
				</form>
				</s:if>
				
				<s:if test="%{noticeFlag == 3}">
				<form action="dealNewsaddNotice.action"  method="POST" name="form1">
				<br>
				<div><hr></div>
				<div><b>发布公告</b></div>
				<br>
				<div>公告内容:</div>
				<div><textarea name="noticeContent" rows="5" cols="50"></textarea></div>
				<span>
					<input type="submit" name="save" value="发布" />
				</span>
				</form>
				</s:if>
			</div>
		</div>
	</body>
</html>
