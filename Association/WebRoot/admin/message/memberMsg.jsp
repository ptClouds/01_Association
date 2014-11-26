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

		<title>班级留言信息</title>

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
				rowsToShow: 4,
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
	</script>
	</head>
	<body>
	<br>
		<h2>
			社员留言信息查询
		</h2>
		<div id="wrapper">
			<div id="table-wrapper">
				<table
					summary="This table holds sample data to test sorting and paging. Please feel free to sort colums by cicking their headers and see all data by clicking at the pager.">
					<caption class="ui-state-highlight ui-corner-all">
						社员留言信息
					</caption>
					<thead>
						<tr>
							<th class="ui-table-asc ui-state-active ui-table-number"
								style="min-width: 6em;">
								<a href="#server_site_order">留言号</a>
							</th>
							<th class="ui-table-text" style="min-width: 10em;">
								<a href="#server_site_order">头像</a>
							</th>
							<th class="ui-table-text" style="min-width: 10em;">
								<a href="#server_site_order">社员名</a>
							</th>
							<th class="ui-table-text" style="min-width: 10em;">
								<a href="#server_site_order">留言内容</a>
							</th>
							<th class="ui-table-date-de" style="min-width: 10em;">
								<a href="#server_site_order">留言时间</a>
							</th>
							<s:if test="%{msgFlag == 0}">
							<th class="ui-table-text" style="min-width: 10em;">
								<a href="#server_site_order">操作</a>
							</th>
							</s:if>
						</tr>
					</thead>
					<tbody>
					<s:iterator value="%{#request.msgAllList}" id="s">
						<tr>
							<td>
								<s:property value='#s.msgId' />
							</td>
							<td>
								<img src="<s:property value='#s.membersInfo.memberPhoto' />" width="60px" />
							</td>
							<td>
								<s:property value='#s.membersInfo.memberName' />
							</td>
							<td>
								<s:property value='#s.msgContent' />
							</td>
							<td>
								<s:property value='#s.msgTime' />
							</td>
							<s:if test="%{msgFlag == 0}">
							<td>
								<a style="text-decoration:none;" href="dealNewsdeleteMsg.action?msgVo.msgId=<s:property value='#s.msgId' />">删除</a>
							</td>
							</s:if>
						</tr>
						</s:iterator>
					</tbody>
				</table>
			</div>
		</div>
	</body>
</html>
