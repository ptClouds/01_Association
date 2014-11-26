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

		<title>清零数据</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

	</head>

	<body>
		<center>
			<div>
				<br>
				<br>
				<form action="adminclearData.action" method="POST" name="form1">
					<table style="BORDER-COLLAPSE: collapse" borderColor=#66FF33
						height=260 cellPadding=1 width=550 align=center border=2>
						<caption style="background-color: #66FF66">
							<b>数据清零</b>
						</caption>
						<tr align="center">
							<td>
								<input type="radio" name="clearTable" value="1" />&nbsp;&nbsp;&nbsp;&nbsp;班级信息清零
							</td>
							<td>
								<input type="radio" name="clearTable" value="2" />&nbsp;&nbsp;&nbsp;&nbsp;学生信息清零
							</td>
						</tr>
						<tr align="center">
							<td>
								<input type="radio" name="clearTable" value="3" />&nbsp;&nbsp;&nbsp;&nbsp;班级留言清零
							</td>
							<td>
								<input type="radio" name="clearTable" value="4" />&nbsp;&nbsp;&nbsp;&nbsp;班级公告清零
							</td>
						</tr>
						<tr align="center">
							<td>
								<input type="radio" name="clearTable" value="5" />管理员信息清零
							</td>
							<td>
								<input type="radio" name="clearTable" value="6" />&nbsp;&nbsp;&nbsp;&nbsp;全部信息清零
							</td>
						</tr>
						<tr align="center">
							<td>
								<input type="submit" name="update" value="执行" />
							</td>
							<td>
								<input type="reset" name="reset" value="取消" />
							</td>
						</tr>
						<tr>
							<td colspan="2" align="center">${errorInfo }
							</td>
						</tr>
					</table>

				</form>
			</div>
		</center>



	</body>
</html>
