<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>邮件发送状态</title>
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

	<BODY class=homepage>
		<jsp:include page="../head.jsp"></jsp:include>
		<p></p>
		<DIV id=subWrapper>
			<H1 style="COLOR: #000">
				&nbsp;&nbsp;邮件投递状态 &nbsp;&nbsp;>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="sendMail/sendMail.jsp"><font size=2>返回邮件发送页面</font></a>
			</H1>
			<DIV class=hr-solid >
			<table width=1000px align=center cellspacing="0" cellpadding=0 border=0>
			
				<tr>
					<td style="background-color:#ffffff" width=242px>
						
					</td>
					<c:if test="${sendflag eq 'success'}" >
					<td width=516px>
						<img src="images/sendMail/mail_1.jpg" width=516px />
					</td>
					</c:if>
					
					<c:if test="${sendflag eq 'error'}" >
					<td width=516px>
						<img src="images/sendMail/mail_2.jpg" width=516px />
					</td>
					</c:if>
					<td style="background-color:#ffffff" width=242px>
						
					</td>
				</tr>
				
			</table>
			</DIV>
		</DIV>
		<DIV class=hr-solid>
			<jsp:include page="../foot.jsp"></jsp:include>
	</BODY>
</html>

