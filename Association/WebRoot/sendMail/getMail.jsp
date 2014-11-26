<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>喔要发送邮件</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<META content="text/html; charset=utf-8" http-equiv=Content-Type>
	<LINK rel="Shortcut Icon" href="images/hnuc.ico">

	<SCRIPT type=text/javascript src="js/jquery.min.js"></SCRIPT>
</head>
	
	
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

<script type="text/javascript">
	function setSendMail(){
		var user = document.getElementById("user");
		var fromMail = document.getElementById("from");
		if(user.value.length>0){
			fromMail.value = user.value+'@qq.com';
		}else{
			fromMail.value = '';
		}
	}
	
	</script>
	<BODY class=homepage>
		<jsp:include page="../head.jsp"></jsp:include>
		<p></p>
		<DIV id=subWrapper>
			<H1 style="COLOR: #000">
				&nbsp;&nbsp;收取邮件 &nbsp;&nbsp;>&nbsp;&nbsp;
			</H1>
			<DIV class=hr-solid style="background:#ffffff url(images/sendMail/mail.jpg);background-repeat:no-repeat;">
			<form name="form1" method="post" action="readmailgetMail.action">
			<table width=760px align=center>
				<tr height=1px>
					<td height=1px>
						&nbsp;
					</td>
					<td height=1px>
						&nbsp;
					</td>
				</tr>
				<tr height=1px>
					<td height=1px>
						&nbsp;
					</td>
					<td height=1px>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td width=260px>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<font size=2>POP3服务器：</font>
					</td>
					<td width=550px>
						<input type="text" id="POP3Host" name="POP3Host" value="pop.qq.com" readonly style="background-color:#abcdef">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<font size=2>(&nbsp;请确保已经开通SMTP的服务器&nbsp;)</font>
					</td>
				</tr>
				<tr height=1px>
					<td height=1px>
						&nbsp;
					</td>
					<td height=1px>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td width="260px">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<font size=2>登&nbsp;&nbsp;录&nbsp;&nbsp;帐&nbsp;&nbsp;号：</font>
					</td>
					<td width=550px>
						<input type="text" id="user" name="user">&nbsp;<font size=2><b>@qq.com</b></font>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<font size=2>(&nbsp;请如实填写登录账号，这样便于邮件收取&nbsp;)</font>
					</td>
				</tr>
				<tr height=1px>
					<td height=1px>
						&nbsp;
					</td>
					<td height=1px>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td width=260px>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<font size=2>登&nbsp;&nbsp;录&nbsp;&nbsp;密&nbsp;&nbsp;码：</font>
					</td>
					<td width=550px>
						<input type="password" id="password" name="password">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<font size=2>(&nbsp;请确定密码是否填写正确&nbsp;)</font>
					</td>
				</tr>
				<tr height=1px>
					<td height=1px>
						&nbsp;
					</td>
					<td height=1px>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td width=260px>
						&nbsp;
					</td>
					<td width=550px>
						<input type="submit" name="submit" value="接收">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="reset" name="reset" value="重置">
					</td>
				</tr>
				<tr height=1px>
					<td height=1px>
						&nbsp;
					</td>
					<td height=1px>
						&nbsp;
					</td>
				</tr>
				<tr height=1px>
					<td height=1px>
						&nbsp;
					</td>
					<td height=1px>
						&nbsp;
					</td>
				</tr>
				<tr height=1px>
					<td height=1px>
						&nbsp;
					</td>
					<td height=1px>
						&nbsp;
					</td>
				</tr>
			</table>
		</form>
			</DIV>
		</DIV>
		<DIV class=hr-solid>
			<jsp:include page="../foot.jsp"></jsp:include>
	</BODY>
</html>
