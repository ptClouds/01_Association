<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

		<TITLE>欢迎进入湖南商学院大学生社团管理系统</TITLE>
		<META content="text/html; charset=gb2312" http-equiv=Content-Type>
		<META content=gb2312 http-equiv=Content-Language>
		<META name=robots content=all>
		<META name=author content=http://www.hnuc.edu.cn>
		<META name=Copyright content=http://www.hnuc.edu.cn>
		<META name=description
			content="湖南商学院，中国湖南省长沙市岳麓区岳麓大道569号 邮政编码：410205&#13;&#10;,电 话：0731-88689016 招生办电话:0731-88686693 &#13;&#10;">
		<META name=keywords
			content="湖南商学院，hunan business college，中国湖南省长沙市岳麓区岳麓大道569号,电 话：0731-88689016 招生办电话:0731-88686693">
		<META name=baidu_union_verify content=09f2715dfd9639649556cef51e9351ea>
		<LINK rel=icon type=image/x-icon href="/logo.ico">
		<LINK rel="shortcut icon" type=image/x-icon
			href="http://www.hnuc.edu.cn/logo.ico">
		<LINK rel=stylesheet type=text/css href="css/index.css" rev=stylesheet>
		<SCRIPT type=text/javascript src="js/index.js"></SCRIPT>

		<META name=GENERATOR content="MSHTML 8.00.6001.19190">
	</head>
	<body>
	<center>
		<br/>
		<br/>
		<br/>
		<DIV class=logo>
			<TABLE>
				<TBODY>
					<tr align="left">
					<td align="left">
						<font size="7" face="方正舒体">
						大学生社团管理系统
						</font>
					</td>
				</tr>
				<tr align="left">
					<td align="left">
						<font size="2" face="Verdana">
						STUDENTS ASSOCIATIONS OF HUNAN UNIVERSITY OF COMMERCE
						</font>
					</td>
				</tr>
				</TBODY>
			</TABLE>
		</DIV>
		<DIV class=total>
			<DIV class=left>
				<DIV class=pic_01></DIV>
				<DIV class=pic_02></DIV>
				<DIV class=pic_03></DIV>
				<DIV class=pic_04></DIV>
			</DIV>
			<DIV class=right>
				<DIV >
					<IMG border=0
							src="images/new.gif" width=383 height=69> 
				</DIV>
				<DIV class=new_t>
				<FORM name="form1"  action="floginlogin.action" method="post" >
					<table border=0 cellSpacing=0 cellPadding=0 height=121px>
						<tr>
							<td>
								&nbsp;&nbsp;类&nbsp;&nbsp;&nbsp;别：&nbsp;&nbsp;&nbsp;&nbsp;
							</td>
							<td>
								<select name="userType" size="1" style="width:140px">
												<option value="1">
													普通社员
												</option>
												<option value="2">
													社团管理
												</option>
												<option value="3">
													学校管理
												</option>
												<option value="4">
													站点管理
												</option>
								</select>
							</td>
						</tr>
						<tr>
							<td colspan=2 height=8px>
								
							</td>
						</tr>
						<tr>
							<td>
								&nbsp;&nbsp;登录名：&nbsp;&nbsp;&nbsp;&nbsp;
							</td>
							<td>
								<input type="text" name="memberVo.memberId" style="width:140px" />
							</td>
						</tr>
						<tr>
							<td colspan=2 height=8px>
								
							</td>
						</tr>
						<tr>
							<td>
								&nbsp;&nbsp;密&nbsp;&nbsp;&nbsp;码：&nbsp;&nbsp;&nbsp;&nbsp;
							</td>
							<td>
								<input type="password" name="memberVo.memberPass" style="width:140px" />
							</td>
						</tr>
						
						<tr>
							<td>
								&nbsp;
								<input type="button" value="注册" onclick="javascript:location='registMember.jsp'" />
							</td>
							<td>
								<input type="submit" value="登录"  />
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input  type="reset" value="重置" />
							</td>
						</tr>
					</table>
					</FORM>
				</DIV>
				
				<DIV class=new_02>

				</DIV>
			</DIV>
		</DIV>
		<DIV></DIV>

		<DIV class=line></DIV>
		<DIV class=copyright>
			版权所有 湖南商学院 长沙市岳麓大道569号
			<BR>
			<IMG border=0 src="images/mail.gif" width=400 height=14>
			<BR>
			<A >湘ICP备09029830</A>
		</DIV>
		<DIV></DIV>

		<SCRIPT type=text/javascript src="js/urchin.js">
</SCRIPT>

		<SCRIPT type=text/javascript>
_uacct = "UA-3106877-1";
urchinTracker();
</SCRIPT>
</center>
	</body>
</html>

