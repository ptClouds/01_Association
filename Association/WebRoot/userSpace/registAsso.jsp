<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<html>
	<head>
		<base href="<%=basePath%>">

		<title>欢迎来到大学生社团管理系统主页</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<META content="text/html; charset=utf-8" http-equiv=Content-Type>
		<LINK rel="Shortcut Icon" href="images/hnuc.ico">

		<SCRIPT type=text/javascript src="js/jquery.min.js"></SCRIPT>


		<META name=GENERATOR content="MSHTML 8.00.6001.19190">
	</HEAD>
	<style type="text/css">
#sidebar a:link,#sidebar a:visiteid {
	color: #FF0000;
	text-decoration: none;
}

#sidebar a:hover,#sidebar a:active {
	color: #000000;
	text-decoration: underline;
}
</style>
	<BODY class=homepage>
		<jsp:include page="../head.jsp"></jsp:include>
		<p></p>
		<DIV id=subWrapper>
			<H1 style="COLOR: #000">
				&nbsp;&nbsp;申请注册新社团 &nbsp;&nbsp;>&nbsp;
			</H1>
			<DIV class=hr-solid>
			<form action="spaceaddAssoInfo.action" method="POST" name="form1">
				<table width=660px align=center>
					<tr>
						<td width=230px>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<font size=2>社&nbsp;团&nbsp;名：</font>
						</td>
						<td width=550px>
							<input name="assoVo.assoName" >
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<font size=2>(&nbsp;社团名尽量不要含生僻字和特殊符号&nbsp;)</font>
						</td>
					</tr>
					<tr>
						<td width=230px>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<font size=2>申请人姓名：</font>
						</td>
						<td width=550px>
							<input name="assoVo.applicant" width="200px">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<font size=2>(&nbsp;请如实填写真实姓名，这样便于审核通过&nbsp;)</font>
						</td>
					</tr>
					<tr>
						<td width=230px>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<font size=2>申请人电话：</font>
						</td>
						<td width=550px>
							<input width="200px" name="assoVo.applicantTel">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<font size=2>(&nbsp;此项必须，请真实填写&nbsp;)</font>
						</td>
					</tr>
					<tr>
						<td width=230px>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<font size=2>申请人邮箱：</font>
						</td>
						<td width=550px>
							<input width="200px" name="assoVo.applicantEmail">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<font size=2>(&nbsp;邮箱便于收取一些注册通知及注意事项&nbsp;)</font>
						</td>
					</tr>
					<tr>
						<td width=230px>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<font size=2>身份证号：</font>
						</td>
						<td width=550px>
							<input width="200px" name="assoVo.applicantId">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<font size=2>(&nbsp;证件号必填，便于社团及时审核通过&nbsp;)</font>
						</td>
					</tr>
					<tr>
						<td width=230px>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<font size=2>注册学校：</font>
						</td>
						<td width=550px>
							<select name="assoVo.regSchool" size="1" style="width:157px" onblur="validType();">
												<option value="1" onClick="validType();" id="assoVo.regSchool" >
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;湖南商学院
												</option>
								</select>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<font size=2>(&nbsp;此项是你社团所注册的学校&nbsp;)</font>
						</td>
					</tr>
					<tr>
						<td width=230px>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<font size=2>社团logo：</font>
						</td>
						<td width=550px>
							<input type="file" width="200px" name="assoVo.assoPhoto">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<font size=2>(&nbsp;为你的社团选个好logo吧&nbsp;)</font>
						</td>
					</tr>
					<tr>
						<td width=230px>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<font size=2>社团简介：</font>
						</td>
						<td width=550px>
							<textarea name="assoVo.assoDesc" rows="3" cols="50"></textarea>
						</td>
					</tr>
					<tr>
						<td width=230px>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<font size=2>其他说明：</font>
						</td>
						<td width=550px>
							<textarea name="assoVo.remarks" rows="3" cols="50"></textarea>
						</td>
					</tr>
					<tr>
						<td width=230px>
							&nbsp;
						</td>
						<td width=550px>
							&nbsp;
						</td>
					</tr>
					<tr>
						<td width=230px>
							&nbsp;
						</td>
						<td width=550px>
							<input type="submit" name="submit" value="注册" />
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="reset" name="" value="重置" />
						</td>
					</tr>
				</table>
				</form>
			</DIV>
		</DIV>
		<DIV class=hr-solid>
			<jsp:include page="../foot.jsp"></jsp:include>
	</BODY>
</HTML>

