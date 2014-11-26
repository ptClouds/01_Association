<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
			<DIV id=footer>
				<DIV class=footer-inner>
					<UL>
						<LI>
							<A class=first href="mainshowMainInfo.action">返回首页</A>
						<LI>
							<A href="http://ly.hnuc.edu.cn/webmap.asp">网站地图</A>
						<LI>
							<A id=a3 href="http://ly.hnuc.edu.cn/partners.asp">友情链接</A>
						<LI>
							<A id=a4 href="http://ly.hnuc.edu.cn/newslist.asp?n_type=ALL">新闻中心</A>
						<LI>
							<A id=a5 href="http://ly.hnuc.edu.cn/photolist.asp?h_type=ALL">图片库</A>
						<LI>
							<A id=a6 href="http://ly.hnuc.edu.cn/aboutus.asp">关于我们</A>
						<LI>
							<A id=a7
								href="javascript:alert('暂时不提供此功能,请用电话及邮件与我们联系。电话:0731-88687688')">信息反馈</A>
						<LI>
							<A id=a8 class=last href="http://ly.hnuc.edu.cn/admin/login.asp">网站管理</A>
						</LI>
					</UL>
					<P>
						© Copyright 2011
						<A href="http://ly.hnuc.edu.cn/#">Power By Linhong ,Hunan
							Phoenix Software.</A>
					</P>
				</DIV>
				<!-- End of Div Footer-inner-->
			</DIV>
			<!-- End of Div Footer-->
	</BODY>
</HTML>

