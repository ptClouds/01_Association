<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		<LINK rel=Bookmark href="http://ly.hnuc.edu.cn/images/hnuc.ico">
		<LINK rel=stylesheet type=text/css href="css/main.css"
			media="screen, projection">
		<SCRIPT type=text/javascript src="js/jquery.min.js"></SCRIPT>

		<SCRIPT type=text/javascript src="js/jquery-ui-1.8.2.custom.min.js"></SCRIPT>

		<SCRIPT type=text/javascript src="js/pirobox_extended.js"></SCRIPT>
		<LINK rel=stylesheet type=text/css href="css/Piroboxstyle.css">


		<META name=GENERATOR content="MSHTML 8.00.6001.19190">
	</HEAD>
	<BODY class=homepage>
		<DIV id=head-wrapper>
			<DIV id=header>
				<DIV id=logo-slh>
					<A id=ctl00_ctl05_A1 href="http://www.hnuc.edu.cn/"><IMG
							id=logo-slh-print alt=欢迎光临湖南商学院大学生社团主页 src="images/logo.png"
							width=780 height=153> </A>
				</DIV>

				<DIV id=tools>
					<UL class=territory>
						<c:if test="${!empty(loginName)}">
						<LI class=first>
				 		      <font color="red">欢迎你: ${loginName}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font>
						</LI>
						</c:if>
						<LI class=first>
							<A title=English href="javascript:alert('英文版网站尚未开通')"><IMG
									style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
									id=ctl00_ctl05_flagsControl_repeatLang_ctl00_imgLang
									alt=English src="images/main/en.gif"> </A>
						</LI>
						<LI>
							<A title="Traditional Chinese" href="javascript:alert('您现在访问的是中文版网站')"><IMG
									style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
									id=ctl00_ctl05_flagsControl_repeatLang_ctl01_imgLang
									alt="Traditional Chinese" src="images/main/zh-CN.gif"> </A>
						</LI>
					</UL>
					<UL>
						<LI>
							&nbsp;&nbsp;<A href="mainshowMainInfo.action">学校首页</A>&nbsp;&nbsp;
						</LI>
						<LI>
							&nbsp;&nbsp;<A
								onclick="window.external.addFavorite('http://localhost:8086/Association/login.jsp','湖南商学院大学生社团管理'); return(false);"
								href="http://localhost:8086/Association/login.jsp">加入收藏</A>&nbsp;&nbsp;
						</LI>
						<LI>
							&nbsp;&nbsp;<A href="http://ly.hnuc.edu.cn/aboutus.asp">关于我们</A>&nbsp;&nbsp;
						</LI>
						<LI class=last>
							&nbsp;&nbsp;<A href="registMember.jsp">社员注册</A>&nbsp;&nbsp;
						</LI>
						<LI class=last>
							<A href="http://ly.hnuc.edu.cn/aboutus.asp">亲老婆，爱老婆，茶茶宝贝老婆</A>
						</LI>
					</UL>
				</DIV>

				<TABLE>
					<TBODY>
						<tr>
							<td>
								&nbsp;
							</td>
						</tr>
						<tr align="left">
							<td align="left">
								<font size="7" face="方正舒体"> 大学生社团管理系统 </font>
							</td>
						</tr>
						<tr align="left">
							<td align="left">
								<font size="2" face="Verdana"> STUDENTS ASSOCIATIONS OF
									HUNAN UNIVERSITY OF COMMERCE </font>
							</td>
						</tr>
					</TBODY>
				</TABLE>
			</DIV>
		</DIV>
		<DIV id=navigation>
			<DIV class=navigation-wrapper>
				<LINK rel=stylesheet type=text/css href="css/menu.css">
				<DIV class=menu>
					<UL>
						<LI class=first>
							<A class=drop href="mainshowMainInfo.action">学院首页</A>
						</LI>
						<LI class=first>
							<A class=drop href="mainqueryAssoForPage.action">社团首页</A>
						</LI>
						<LI class=first>
							<A class=drop href="spaceshowMySpaceInfo.action">个人主页</A>
						</LI>
						<LI class=first>
							<A class=drop href="http://ly.hnuc.edu.cn/default.asp">活动园地</A>
						</LI>
						<LI class=first>
							<A class=drop href="newsqueryNewsForPage.action?page=1&strChoice=all">社团新闻</A>
						</LI>
						<LI class=first>
							<A class=drop href="sendMail/sendMail.jsp">发送邮件</A>
						</LI>
						<LI class=first>
							<A class=drop href="sendMail/getMail.jsp">接收邮件</A>
						</LI>
						<LI class=first>
							<A class=drop href="sendMail/mailList.jsp">帮助中心</A>
						</LI>
					</UL>
				</DIV>
				<!-- End of Div of Menu -->
			</DIV>
			<!-- End of Div TOP-NAVIGATION-wrapper -->
		</DIV>
	</BODY>
</HTML>

