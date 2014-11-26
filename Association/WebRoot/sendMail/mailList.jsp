<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
				&nbsp;&nbsp;我的收件箱 &nbsp;&nbsp;>&nbsp;&nbsp;
			</H1>
			<DIV class=hr-solid style="background:#ffffff url(images/sendMail/mail.jpg);background-repeat:no-repeat;">
			<form name="form1" method="post" action="mailsendMail.action">
			<table width=860px align=center cellspacing="0" cellpadding=0 border=0>
				<tr height=1px>
					<td height=1px>
						&nbsp;
					</td>
					<td height=1px>
						&nbsp;
					</td>
					<td height=1px>
						&nbsp;
					</td>
					<td height=1px>
						&nbsp;
					</td>
					<td height=1px>
						&nbsp;
					</td>
				</tr>
				<tr height=30>
			    	<td align=center>邮件标题</td>
			    	<td width=150 align=center>发件人</td>
			    	<td width=180 align=center>发件时间</td>
			    	<td width=80 align=center>邮件大小</td>
			    	<td width=80 align=center>附件</td>
			    </tr>
			    
			    <s:iterator value="%{#request.mailList}" id="s">
			    <tr height=30>
			    	<td align=center>
			    		<font size=2><s:property value='#s.subject' /></font>
					</td>
			    	<td width=150 align=center>
						<font size=2><s:property value='#s.sender' /></font>
					</td>
			    	<td width=180 align=center>
						<font size=2><s:property value='#s.senddate' /></font>
					</td>
			    	<td width=80 align=center>
						<font size=2><s:property value='#s.size' /></font>
					</td>
			    	<td width=80 align=center>
						<font size=2><s:property value='#s.hasAttach' /></font>
					</td>
			    </tr>
			    </s:iterator>
			    
			    <tr height=1px>
					<td height=1px>
						&nbsp;
					</td>
					<td height=1px>
						&nbsp;
					</td>
					<td height=1px>
						&nbsp;
					</td>
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
