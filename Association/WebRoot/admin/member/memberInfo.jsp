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

		<title>社员信息</title>

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
				rowsToShow: 7,
				pager: true,
				onInit: function() {
					demoControl();
				},
				colsToHide: {
					1: true,
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
			查询所有社员信息
		</h2>
		<div id="wrapper">
			<div id="table-wrapper">
				<table
					summary="This table holds sample data to test sorting and paging. Please feel free to sort colums by cicking their headers and see all data by clicking at the pager.">
					<caption class="ui-state-highlight ui-corner-all">
						社员信息表
					</caption>
					<thead>
						<tr>
							<th class="ui-table-text" style="min-width: 10em;">
								<a href="#server_site_order">头像</a>
							</th>
							<th class="ui-table-asc ui-state-active ui-table-number"
								style="min-width: 6em;">
								<a href="#server_site_order">社员号</a>
							</th>
							<th class="ui-table-asc ui-table-text" style="min-width: 10em;">
								<a href="#server_site_order">社员名</a>
							</th>
							<th class="ui-table-asc ui-table-text" style="min-width: 10em;">
								<a href="#server_site_order">学校</a>
							</th>
							<th class="ui-table-asc ui-table-text" style="min-width: 10em;">
								<a href="#server_site_order">班级</a>
							</th>
							<th class="ui-table-asc ui-table-text" style="min-width: 10em;">
								<a href="#server_site_order">年级</a>
							</th>
							<th class="ui-table-asc ui-table-text" style="min-width: 10em;">
								<a href="#server_site_order">专业</a>
							</th>
							<th class="ui-table-asc ui-table-number" style="min-width: 10em;">
								<a href="#server_site_order">生日</a>
							</th>
							<th class="ui-table-asc ui-table-number" style="min-width: 10em;">
								<a href="#server_site_order">电话</a>
							</th>
							<th class="ui-table-asc ui-table-text" style="min-width: 10em;">
								<a href="#server_site_order">邮箱</a>
							</th>
							<th class="ui-table-asc ui-table-text" style="min-width: 10em;">
								<a href="#server_site_order">爱好</a>
							</th>
							<th class="ui-table-asc ui-table-text" style="min-width: 10em;">
								<a href="#server_site_order">家乡</a>
							</th>
							<th class="ui-table-asc ui-table-text" style="min-width: 10em;">
								<a href="#server_site_order">社团</a>
							</th>
							<s:if test="%{memberFlag != 1}">
							<th class="ui-table-asc ui-table-text" style="min-width: 10em;">
								<a href="#server_site_order">状态</a>
							</th>
							</s:if>
							<s:if test="%{memberFlag != 0}">
							<th class="ui-table-asc ui-table-text" style="min-width: 10em;">
								<a href="#server_site_order">操作</a>
							</th>
							</s:if>
						</tr>
					</thead>
					<tbody>
					<s:iterator value="%{#request.memberList}" id="s">
						<tr>
							<td>
								<img src="<s:property value='#s.memberPhoto' />" width="60px" />
							</td>
							<td>
								<s:property value='#s.memberId' />
							</td>
							<td>
								<s:property value='#s.memberName' />
							</td>
							<td>
								<s:if test="%{#s.school == 0}">湖南商学院</s:if>
								<s:if test="%{#s.school == 1}">湖南商学院</s:if>
							</td>
							<td>
								<s:property value='#s.class_' />
							</td>
							<td>
								<s:property value='#s.grade' />
							</td>
							<td>
								<s:property value='#s.magor' />
							</td>
							<td>
								<s:property value='#s.birthday' />
							</td>
							<td>
								<s:property value='#s.memberTel' />
							</td>
							<td>
								<s:property value='#s.memberEmail' />
							</td>
							<td>
								<s:property value='#s.hobby' />
							</td>
							<td>
								<s:property value='#s.hometown' />
							</td>
							<td>
								<s:property value='#s.assoName' />
							</td>
							<s:if test="%{memberFlag != 1}">
							<td>
								<s:if test="%{#s.status == 0}"><font color=red>未审核</font></s:if>
								<s:if test="%{#s.status == 1}"><font color=blue>已审核</font></s:if>
							</td>
							</s:if>
							<s:if test="%{memberFlag == 1}">
							<td>
								<a style="text-decoration:none;" href="adminUserupdateMemberInfo.action?memberVo.memberId=<s:property value='#s.memberId' />
								&memberVo.memberName=<s:property value='#s.memberName' />
								&memberVo.school=<s:property value='#s.school' />
								&memberVo.class_=<s:property value='#s.class_' />
								&memberVo.grade=<s:property value='#s.grade' />
								&memberVo.magor=<s:property value='#s.magor' />
								&memberVo.birthday=<s:property value='#s.birthday' />
								&memberVo.memberTel=<s:property value='#s.memberTel' />
								&memberVo.memberEmail=<s:property value='#s.memberEmail' />
								&memberVo.hobby=<s:property value='#s.hobby' />
								&memberVo.hometown=<s:property value='#s.hometown' />
								">冻结</a>
							</td>
							</s:if>
							
							<s:if test="%{memberFlag == 2}">
							<td>
								<a style="text-decoration:none;" href="adminUserupdateEmberStatus.action?memberVo.memberId=<s:property value='#s.memberId' />
								&memberVo.memberName=<s:property value='#s.memberName' />
								&memberVo.school=<s:property value='#s.school' />
								&memberVo.class_=<s:property value='#s.class_' />
								&memberVo.grade=<s:property value='#s.grade' />
								&memberVo.magor=<s:property value='#s.magor' />
								&memberVo.birthday=<s:property value='#s.birthday' />
								&memberVo.memberTel=<s:property value='#s.memberTel' />
								&memberVo.memberEmail=<s:property value='#s.memberEmail' />
								&memberVo.hobby=<s:property value='#s.hobby' />
								&memberVo.hometown=<s:property value='#s.hometown' />
								">激活</a>
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
