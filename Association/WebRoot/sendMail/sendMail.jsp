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
				&nbsp;&nbsp;发送邮件 &nbsp;&nbsp;>&nbsp;&nbsp;
			</H1>
			<DIV class=hr-solid style="background:#ffffff url(images/sendMail/mail.jpg);background-repeat:no-repeat;">
			<form name="form1" method="post" action="mailsendMail.action">
			<table width=760px align=center>
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
						<font size=2>SMTP服务器：</font>
					</td>
					<td width=550px>
						<input type="text" id="SMTPHost" name="SMTPHost"
							value="smtp.qq.com" readonly style="background-color:#abcdef">
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
						<input type="text" id="user" name="user" value="" onblur="setSendMail();">&nbsp;<font size=2><b>@qq.com</b></font>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<font size=2>(&nbsp;请如实填写登录账号，这样便于邮件发送&nbsp;)</font>
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
						<input type="password" id="password" name="password" value="">
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
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<font size=2>发件人&nbsp;&nbsp;邮箱：</font>
					</td>
					<td width=550px>
						<input type="text" id="from" name="from" value="" readonly style="background-color:#abcdef">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<font size=2>(&nbsp;请认真填写发件人邮箱&nbsp;)</font>
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
						<font size=2>收件人&nbsp;&nbsp;邮箱：</font>
					</td>
					<td width=550px>
						<input type="text" id="to" name="to"
							value="panzx07663@hundsun.com">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<font size=2>(&nbsp;请如实填写收件人邮箱，否则将发送不成功&nbsp;)</font>
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
						<font size=2>邮&nbsp;&nbsp;件&nbsp;&nbsp;标&nbsp;&nbsp;题：</font>
					</td>
					<td width=550px>
						<input type="text" id="subject" name="subject" value="你好，我是邮件测试">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<font size=2>(&nbsp;建议填写标题，便于对方查阅&nbsp;)</font>
					</td>
				</tr>
				<tr>
					<td width=260px>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<font size=2>邮&nbsp;&nbsp;件&nbsp;&nbsp;内&nbsp;&nbsp;容：</font>
					</td>
					<td width=550px>
						<textarea name="content" rows="5" cols="40"></textarea>
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
						<font size=2>添&nbsp;&nbsp;加&nbsp;&nbsp;附&nbsp;&nbsp;件：</font>
					</td>
					<td width=550px>
						<input type="file" id="filename" name="filename">
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
					<td>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<font size=2>邮&nbsp;件&nbsp;优先&nbsp;级：</font>
					</td>
					<td>
						<input type="radio" name="mailtype" value="1" />&nbsp;&nbsp;<font size=2>紧急</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="mailtype" value="3" checked="checked"/>&nbsp;&nbsp;<font size=2>普通</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="mailtype" value="5" />&nbsp;&nbsp;<font size=2>缓慢</font>
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
						<input type="submit" name="submit" value="发送">
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
			</table>
		</form>
			</DIV>
		</DIV>
		<DIV class=hr-solid>
			<jsp:include page="../foot.jsp"></jsp:include>
	</BODY>
</html>
