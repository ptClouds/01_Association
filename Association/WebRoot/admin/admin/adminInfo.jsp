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

		<title>后台管理员信息</title>

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
				rowsToShow: 5,
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
			管理员信息查询
		</h2>
		<div id="wrapper">
			<div id="table-wrapper">
				<table
					summary="This table holds sample data to test sorting and paging. Please feel free to sort colums by cicking their headers and see all data by clicking at the pager.">
					<caption class="ui-state-highlight ui-corner-all">
						管理员信息表
					</caption>
					<thead>
						<tr>
							<th class="ui-table-asc ui-state-active ui-table-number"
								style="min-width: 6em;">
								<a href="#server_site_order">管理员编号</a>
							</th>
							<th class="ui-table-text" style="min-width: 10em;">
								<a href="#server_site_order">管理员姓名</a>
							</th>
							<th class="ui-table-text" style="min-width: 10em;">
								<a href="#server_site_order">管理员类型</a>
							</th>
							<th class="ui-table-text" style="min-width: 10em;">
								<a href="#server_site_order">是否冻结</a>
							</th>
							<th class="ui-table-text" style="min-width: 10em;">
								<a href="#server_site_order">操作</a>
							</th>
						</tr>
					</thead>
					<tbody>
					<s:iterator value="%{#request.adminList}" id="s">
						<tr>
							<td>
								<s:property value='#s.adminId' />
							</td>
							<td>
								<s:property value='#s.adminName' />
							</td>
							<td>
								<s:if test="%{#s.adminType == 1}">网站管理员</s:if>
								<s:if test="%{#s.adminType == 0}">学校管理员</s:if>
							</td>
							<td>
								<s:if test="%{#s.adminStatus == 0}"><font color="red">已冻结</font></s:if>
								<s:if test="%{#s.adminStatus == 1}">现有效</s:if>
							</td>
							<td>
							<s:if test="%{#s.adminStatus == 1}">
								<a style="text-decoration:none;" href="toadmindeleteAdmin.action?adminVo.adminId=<s:property value='#s.adminId' />
								&adminVo.adminName=<s:property value='#s.adminName' />
								&adminVo.adminPass=<s:property value='#s.adminPass' />
								&adminVo.adminStatus=<s:property value='#s.adminStatus' />
								&adminVo.adminType=<s:property value='#s.adminType' />&adminVo.dealFlag=todelete">冻结</a>
							</s:if>
							<s:if test="%{#s.adminStatus == 0}">
								<a style="text-decoration:none;" href="toadmindeleteAdmin.action?adminVo.adminId=<s:property value='#s.adminId' />
								&adminVo.adminName=<s:property value='#s.adminName' />
								&adminVo.adminPass=<s:property value='#s.adminPass' />
								&adminVo.adminStatus=<s:property value='#s.adminStatus' />
								&adminVo.adminType=<s:property value='#s.adminType' />&adminVo.dealFlag=todelete"><font color="red">激活</font></a>
							</s:if>
							</td>
						</tr>
						</s:iterator>
					</tbody>
				</table>
			</div>
		</div>
	</body>
</html>
