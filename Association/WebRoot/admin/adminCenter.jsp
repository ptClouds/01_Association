<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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

		<title>后台主页</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" type="text/css" href="./admin/skin/css/base.css" />
		<link rel="stylesheet" type="text/css" href="./admin/skin/css/main.css" />
	</head>
	<body leftmargin="8" topmargin='8'>
		<table width="98%" border="0" align="center" cellpadding="0"
			cellspacing="0">
			<tr>
				<td>
					<div style='float: left'>
						<img height="14" src="./admin/skin/images/frame/book1.gif" width="20" />
						&nbsp;欢迎来到大学生社团管理系统后台主页，下面为您介绍一下本站的基本信息。
					</div>
					<div style='float: right; padding-right: 8px;'>
						<!--  //保留接口  -->
					</div>
				</td>
			</tr>
			<tr>
				<td height="1" background="./admin/skin/images/frame/sp_bg.gif"
					style='padding: 0px'></td>
			</tr>
		</table>
		<table width="98%" align="center" border="0" cellpadding="3"
			cellspacing="1" bgcolor="#CBD8AC"
			style="margin-bottom: 8px; margin-top: 8px;">
			<tr>
				<td background="./admin/skin/images/frame/wbg.gif" bgcolor="#EEF4EA"
					class='title'>
					<span>系统简介</span>
				</td>
			</tr>
			<tr bgcolor="#FFFFFF">
				<td>
					 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;校园文化的多元化与自由化，不断涌现出各种形式的大学社团，新老社团蓬勃发展，为广大大学生提供了一个展现自己才华及发展锻炼自身的一个良好平台。为了更好的更便捷的让社团与社团，社团成员与成员间进行交流，开发一个基于WEB的大学社团管理系统得到了各方面的支持与重视。
大学社团管理已成为校园管理中不可或缺的一部分，虽然目前关于以web形式开发出的大学社团管理系统为数不多，但其开发的意义及价值却非常的大，值得大家去共同探讨。相信本人开发出的这个基于WEB的大学社团管理系统能够促进大家对大学社团管理系统的进一步研究及完善。

				</td>
			</tr>
		</table>
		<table width="98%" align="center" border="0" cellpadding="4"
			cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom: 8px">
			<tr>
				<td colspan="2" background="./admin/skin/images/frame/wbg.gif"
					bgcolor="#EEF4EA" class='title'>
					<div style='float: left'>
						<span>功能概括</span>
					</div>
					<div style='float: right; padding-right: 10px;'></div>
				</td>
			</tr>
			<tr bgcolor="#FFFFFF">
				<td height="30" colspan="2" align="letf" valign="bottom">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;本系统由三个最基本的模块组成：社团管理模块、社员管理模块、信息管理模块。而每个模块下又包含了很多子模块。&nbsp;&nbsp;&nbsp;&nbsp;社团管理模块细分为社团申请、社团审批、社团基本信息管理、社团费用管理四个大的基本功能，而其中各个基本功能中又包含了相应的查询、修改、删除及增加功能。&nbsp;&nbsp;&nbsp;&nbsp;社员管理模块可分为注册新社员、修改社员信息、社员冻结、社员登录与注销及社员个人空间五个功能。&nbsp;&nbsp;&nbsp;&nbsp;信息管理模块按照实际业务需求分为社团活动信息发布、社团活动信息查询、社团活动信息修改、社团活动信息删除、社员留言讨论等五个功能。
				</td>
			</tr>
		</table>
		<table width="98%" align="center" border="0" cellpadding="4"
			cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom: 8px">
			<tr bgcolor="#EEF4EA">
				<td colspan="2" background="./admin/skin/images/frame/wbg.gif" class='title'>
					<span>系统基本信息</span>
				</td>
			</tr>
			<tr bgcolor="#FFFFFF">
				<td width="25%" bgcolor="#FFFFFF">
					开发时间：
				</td>
				<td width="75%" bgcolor="#FFFFFF">
					2012年3月15-2012年4月15日
				</td>
			</tr>
			<tr bgcolor="#FFFFFF">
				<td>
					开发团队：
				</td>
				<td>
					个人
				</td>
			</tr>
			<tr bgcolor="#FFFFFF">
				<td>
					系统开发者：
				</td>
				<td>
					潘志祥
				</td>
			</tr>
			<tr bgcolor="#FFFFFF">
				<td>
					当前版本：
				</td>
				<td>
					pzhx-1.0.1
				</td>
			</tr>
			<tr bgcolor="#FFFFFF">
				<td>
					系统框架：
				</td>
				<td>
					struts2+hibernate3+spring2&nbsp;&nbsp;&nbsp;&nbsp;(涉及到jquery+jser+css+xml+ajax+jfreeChart等相关技术，数据库选用sqlserver 2000)
				</td>
			</tr>
			<tr bgcolor="#FFFFFF">
				<td>
					使用平台：
				</td>
				<td>
					windows xp
				</td>
			</tr>
		</table>
		<table width="98%" align="center" border="0" cellpadding="4"
			cellspacing="1" bgcolor="#CBD8AC">
			<tr bgcolor="#EEF4EA">
				<td colspan="2" background="./admin/skin/images/frame/wbg.gif" class='title'>
					<span>使用帮助</span>
				</td>
			</tr>
			<tr bgcolor="#FFFFFF">
				<td height="32">
					个人交流：
				</td>
				<td>
					<u>893736334或tel：15116377869</u>
				</td>
			</tr>
			<tr bgcolor="#FFFFFF">
				<td width="25%" height="32">
					帮助文档：
				</td>
				<td width="75%">
					<u>WebRoot/files</u>
				</td>
			</tr>
		</table>
	</body>
</html>
