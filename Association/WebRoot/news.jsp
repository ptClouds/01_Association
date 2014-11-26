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
		<jsp:include page="head.jsp"></jsp:include>
		<p></p>
		<DIV id=subWrapper>
			<DIV style="BACKGROUND: url(Images/bg_homepagecontent.gif) repeat-y"
				id=ChildCenterPage>
				<p></p>
				<DIV >
						<b>&nbsp;&nbsp;&nbsp;您现在浏览的新闻 the News &nbsp;&nbsp;>&nbsp;>&nbsp;></b>
					<p></p>
					<s:iterator value="%{#request.newsListById}" id="s">
					<H2 style="COLOR: #785d30; FONT-SIZE: 1.5em" align=center>
						&nbsp;&nbsp;<s:property value='#s.newsTitle' />
					</H2>
					<DIV
						style="BACKGROUND-IMAGE: url(images/main/quote.gif); PADDING-BOTTOM: 2px; PADDING-LEFT: 15px; PADDING-RIGHT: 10px; BACKGROUND-REPEAT: no-repeat; PADDING-TOP: 10px">
							<center><c:if test="${!empty(s.newsImgLink)}">
							<img alt="" src="<s:property value='#s.newsImgLink' />" width=680px height=450px />
							</c:if>
							</center>
						<P>
							<s:property value='#s.newsContent' />
						</P>
					</DIV>
					</s:iterator>
					
					<BR>
					<!--分隔线-->
					<DIV class=hr-solid>
						<HR>
					</DIV>
					
					<h2>
									<span></span>
									&nbsp;&nbsp;&nbsp;新闻信息列表
								</h2>
								<br>
								
								<table align="center" width='973px' border="0" cellspacing="0" >
								
									<s:iterator value="%{#request.newsList}" id="s">
										<tr>
											<td>
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												&nbsp;&nbsp;
												<font size=2><s:property value='#s.newsPublisher' /></font>
											</td>
											<td class="usip">
												&nbsp;&nbsp;
												
												<a href="newsqueryNewsForPage.action?page=1&strChoice=newsId:<s:property value='#s.newsId' />"
									target=_self >
												<font size=2><s:property value='#s.newsTitle' /></font>
												</a>
												&nbsp;&nbsp;
											</td>
											<td class="usip">
												&nbsp;&nbsp;
												<font size=2><s:property value='#s.publishDate' /></font>
												&nbsp;&nbsp;
											</td>
										</tr>
										<tr>
											<td colspan=3>
												&nbsp;
											</td>
										</tr>
										<tr>
											<td colspan=3>
												<font size=2><s:property value='#s.newsContent' /></font>
											</td>
										</tr>
										<tr>
											<td colspan="3">
												<DIV class=hr-solid>
						<HR>
					</DIV>
											</td>
										</tr>
									</s:iterator>
									<tr><td colspan="3">&nbsp;</td></tr>
									<tr align=center>
										<td colspan="3">
											<font size=2>共&nbsp;&nbsp;&nbsp;
											<font color="#99CC00"><s:property value="pageBean.allRow" /></font>
											&nbsp;&nbsp;&nbsp;条记录&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											共&nbsp;&nbsp;&nbsp;
											<font color="#99CC00"><s:property value="pageBean.totalPage" /></font>
											&nbsp;&nbsp;&nbsp;页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											每页显示&nbsp;&nbsp;&nbsp;
											<font color="#99CC00"><s:property value="pageBean.pageSize" /></font>
											&nbsp;&nbsp;&nbsp;条&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											当前第&nbsp;&nbsp;&nbsp;
											<font color="#99CC00"><s:property value="pageBean.currentPage" /></font>
											&nbsp;&nbsp;&nbsp;页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<s:if test="%{pageBean.currentPage == 1}">第一页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;上一页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</s:if>
											<s:else>
												<a href="newsqueryNewsForPage.action?page=1">第一页</a>&nbsp;&nbsp;&nbsp;
												<a
													href="newsqueryNewsForPage.action?page=<s:property value="%{pageBean.currentPage-1}"/>">上一页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</s:else>
											<s:if test="%{pageBean.currentPage != pageBean.totalPage}">
												<a
													href="newsqueryNewsForPage.action?page=<s:property value="%{pageBean.currentPage+1}"/>">下一页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<a
													href="newsqueryNewsForPage.action?page=<s:property value="pageBean.totalPage"/>">尾页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</s:if>
											<s:else>下一页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;尾页</s:else>
											&nbsp;&nbsp;&nbsp;
											</font>
										</td>
									</tr>
								</table>
								<br>
					
			</DIV>
			<!--End of Div ChildCenterPage-->
		</DIV>
		<jsp:include page="foot.jsp"></jsp:include>
	</BODY>

</HTML>

