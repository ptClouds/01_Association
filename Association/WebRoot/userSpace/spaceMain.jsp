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
		<LINK rel=Bookmark href="http://ly.hnuc.edu.cn/images/hnuc.ico">
		<LINK rel=stylesheet type=text/css href="css/main.css"
			media="screen, projection">
		<SCRIPT type=text/javascript src="js/jquery.min.js"></SCRIPT>

		<SCRIPT type=text/javascript src="js/jquery-ui-1.8.2.custom.min.js"></SCRIPT>

		<SCRIPT type=text/javascript src="js/pirobox_extended.js"></SCRIPT>

		<SCRIPT type=text/javascript src="js/JSer/JSer.js"></SCRIPT>
		<SCRIPT type=text/javascript src="js/JSer/JSer.modalDialog.js"></SCRIPT>
		<LINK rel=stylesheet type=text/css href="css/Piroboxstyle.css">

		<META name=GENERATOR content="MSHTML 8.00.6001.19190">
	</HEAD>
	<SCRIPT type=text/javascript>
		JSer.exec(function(){
      JSer("#btnModal").click(function(){
              JSer("#modal").modalDialog({//显示modalDialog.

                       dragClass:"#jcmTitle",   //选择可拖动区域（可以是任意的JSer选择符）

                       closeClass:"#jcmClose" //选择可关闭区域（可以是任意的JSer选择符）
              });

      });
});

	</SCRIPT>

	<BODY class=homepage>
		<jsp:include page="../head.jsp"></jsp:include>
		<DIV id=subWrapper>
			<DIV style="BACKGROUND: url(Images/bg_homepagecontent.gif) repeat-y"
				id=ChildCenterPage>
				<DIV id=subnav>
					<!-- Make Reservation is dynamically set depending on lang (amex or anything else) -->
					<DIV class=sidenav-form>
						<H2 class=heading-three>

						</H2>
						<img src="images/space/space1.gif" width="170px" />
						<DIV class=hr-solid>
							<HR>
						</DIV>
						<H2 class=heading-three></H2>

						<s:iterator value="%{#request.spaceUserByIdList}" id="s">
							<DIV class=reserve-border>
								<H2 class=heading-three>
									&nbsp;
									<font color="red"><s:property value='#s.memberName' />
									</font>
								</H2>
								<br>
								<H2 class=heading-three>
									个人信息: about me
								</H2>
								<UL style="PADDING-LEFT: 10px">
									<LI class=clear>
										学校：
										<s:if test="%{#s.school == 1}">湖南商学院</s:if>
										<s:if test="%{#s.school == 0}">湖南商学院</s:if>
									</LI>
									<LI class=clear>
										专业：
										<s:property value='#s.magor' />
									</LI>
									<LI class=clear>
										班级：
										<s:property value='#s.class_' />
									</LI>
									<LI class=clear>
										年级：
										<s:property value='#s.grade' />
									</LI>
									<LI class=clear>
										生日：
										<s:property value='#s.birthday' />
									</LI>
									<LI class=clear>
										爱好：
										<s:property value='#s.hobby' />
									</LI>
									<LI class=clear>
										家乡：美丽的
										<s:property value='#s.hometown' />
									</LI>
								</UL>
							</DIV>
							<DIV class=hr-solid>
								<HR>
							</DIV>

							<DIV class=reserve-border>
								<H2 class=heading-three>
									常用联系方式:
								</H2>
								<UL style="PADDING-LEFT: 10px">
									<LI class=clear>
										电话：
										<s:property value='#s.memberTel' />
									</LI>
									<LI class=clear>
										邮箱：
										<s:property value='#s.memberEmail' />
									</LI>
								</UL>
							</DIV>
							<DIV class=hr-solid>
								<HR>
							</DIV>
						</s:iterator>

						<DIV class=reserve-border>
							<H2 class=heading-three>
								TODAY音乐走栏:
							</H2>

							<SCRIPT type=text/javascript>
$(document).ready(function() {
	var hidemusic1 = $("#hideyinyue");
	var showyinyue1=$("#showyinyue1");
	hidemusic1.mouseenter(function() {
		hidemusic1.css("color","red");
	});
	hidemusic1.mouseout(function() {
		hidemusic1.css("color","");
	});
	hidemusic1.click(function() {
		showyinyue1.hide();
		hidemusic1.hide();
	})
});
	
$(document).ready(function() {
	var music1 = $("#yinyue1");
	var showyinyue1=$("#showyinyue1");
	var hidemusic1 = $("#hideyinyue");
	music1.mouseenter(function() {
		music1.css("color","red");
	});
	music1.mouseout(function() {
		music1.css("color","");
	});
	music1.click(function() {
		showyinyue1.show();
		hidemusic1.show();
	})
});

</SCRIPT>
							<div id="getyinyue">
								&nbsp;&nbsp;重磅推荐&nbsp;>
							</div>
							<div id="yinyue1">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 思念的距离
							</div>
							<br>
							<div id="showyinyue1" style="display: none">
								<embed id="playembed" src="swf/sinian.mp3"
									_fcksavedurl="swf/sinian.mp3" type="application/x-mplayer3"
									loop="true" ShowStatusBar="true" ShowPositionControls="false"
									EnableContextMenu="false" autostart="false" controls=console
									height="70px" width="180px"></embed>
							</div>
							<div id="hideyinyue" style="display: none">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 隐藏&nbsp;
							</div>
						</DIV>

						<DIV class=hr-solid>
							<HR>
						</DIV>

						<DIV class=reserve-border>
							<H2 class=heading-three>
								瞧瞧藕的一举一动:
							</H2>

							<s:iterator value="%{#request.assoByIDStatusList}" id="s">
								<UL style="PADDING-LEFT: 10px">
									<LI class=clear>
										申请：
										<s:property value='#s.assoName' />
										<font color=red>（未审核）</font>
									</LI>
								</UL>
							</s:iterator>
							<s:iterator value="%{#request.assoAllInfoList}" id="s1">
								<UL style="PADDING-LEFT: 10px">
									<LI class=clear>
										新注册社团：
									</LI>
									<LI class=clear>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<s:property value='#s1.assoName' />
										<font color=red>
										<s:if test="%{#s1.assoStatus == 0}">
										（审批中）
										</s:if>
										<s:if test="%{#s1.assoStatus == 1}">
										（已审批）
										</s:if>
										</font>
									</LI>
								</UL>
							</s:iterator>
						</DIV>
						
						<DIV class=hr-solid>
							<HR>
						</DIV>

						<DIV class=reserve-border>
							<H2 class=heading-three>
								伙计可能访问的链接:
							</H2>

							<UL style="PADDING-LEFT: 10px">
								<LI class=clear>
								<font color="" face="" size='2'>☼</font>
								&nbsp;&nbsp;
									<font size='1'>
									<a href="userSpace/registAsso.jsp">注册新社团</a>
									</font>
								</LI>
								<LI class=clear>
								<font color="" face="" size='2'>☼</font>
								&nbsp;&nbsp;
									<a href="mainqueryAssoForPage.action">商学院社团</a>
								</LI>
								<LI class=clear>
								<font color="" face="" size='2'>☼</font>
								&nbsp;&nbsp;
									<a href="mainqueryMemberForPage.action">商学院社员</a>
								</LI>
								<LI class=clear>
								<font color="" face="" size='2'>☼</font>
								&nbsp;&nbsp;
									<a>新审批社团</a>
								</LI>
								<LI class=clear>
								<font color="" face="" size='2'>☼</font>
								&nbsp;&nbsp;
									<a>新注册社员</a>
								</LI>
							</UL>
						</DIV>

						<!--End of Div of Reserve-border-->
						<DIV class=hr-solid>
							<HR>
						</DIV>
					</DIV>
				</DIV>
				<!--End Of Div SubNav-->
				<DIV id=content style="WIDTH: 775px;">

					<H2 style="COLOR: #785d30; FONT-SIZE: 1.5em">
						&nbsp;&nbsp;&nbsp;心情便笺 honey fly &nbsp;&nbsp;>&nbsp;
					</H2>
					<DIV
						style="BACKGROUND-IMAGE: url(images/main/quote.gif); PADDING-BOTTOM: 2px; PADDING-LEFT: 15px; PADDING-RIGHT: 10px; BACKGROUND-REPEAT: no-repeat; PADDING-TOP: 10px">
						<P>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							该家伙忒懒呀，竟然还没心情便笺哦,求求管理员把他踢走吧
						</P>
					</DIV>
					<div>

					</div>
					<BR>
					<DIV class=hr-solid>
						<HR>
					</DIV>

					<H2 style="COLOR: #785d30; FONT-SIZE: 1.5em">
						&nbsp;&nbsp;&nbsp;偶的留言 Donkey message &nbsp;&nbsp;>&nbsp;
					</H2>
					<c:if test="${ !empty (#request.spaceMsgByIdList)}">
						<DIV
							style="BACKGROUND-IMAGE: url(images/main/quote.gif); PADDING-BOTTOM: 2px; PADDING-LEFT: 15px; PADDING-RIGHT: 10px; BACKGROUND-REPEAT: no-repeat; PADDING-TOP: 10px">
							<P>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								该家伙忒懒呀，竟然还没留言哦,求求管理员把他踢走吧
							</P>
						</DIV>
					</c:if>

					<s:iterator value="%{#request.spaceMsgByIdList}" id="s">
						<div>
							<span id="t">
								<table width="670px" align="center">
									<tr align=left>
										<td width=550px>
											<font size="2"><s:property value='#s.msgContent' /> </font>
										</td>
										<td width=150px>
											<font size="1"><s:property value='#s.msgTime' /> </font>
										</td>
									</tr>
								</table> </span>
							<br>
						</div>
					</s:iterator>

					<BR>
					<DIV class=hr-solid>
						<HR>
					</DIV>

					<H2 style="COLOR: #785d30; FONT-SIZE: 1.5em">
						&nbsp;&nbsp;&nbsp;入伙滴社团 Joined Association &nbsp;&nbsp;>&nbsp;
						<s:property value='#s.newsTitle' />
					</H2>
					<br>
					<DIV
						style="BACKGROUND-IMAGE: url(images/main/quote.gif); PADDING-BOTTOM: 2px; PADDING-LEFT: 15px; PADDING-RIGHT: 10px; BACKGROUND-REPEAT: no-repeat; PADDING-TOP: 10px">
						<c:if test="${ empty (#request.spaceAssoByIdList)}">
							<s:iterator value="%{#request.spaceAssoByIdList}" id="s">
								<div>
									<span id="t">
										<table width="670px" align="center">
											<tr align=left>
												<td width=90px>
													<font size="2"><s:property value='#s.assoName' /> </font>
												</td>
												<td width=150px>
													<font size="2"><s:property value='#s.assoDesc' /> </font>
												</td>
												<td width=90px>
													<font size="1">创始人：<s:property value='#s.applicant' />
													</font>
												</td>
												<td width=90px>
													<font size="2"><s:property value='#s.regSchool' />
													</font>
												</td>
												<td width=100px>
													<font size="1">目前人数：<s:property value='#s.memberNum' />&nbsp;
													</font>
												</td>
											</tr>
										</table> </span>
									<br>
								</div>
							</s:iterator>
						</c:if>
						<c:if test="${ !empty (#request.spaceAssoByIdList)}">
							<DIV>
								<P>
									<s:property value='#s.newsContent' />
									该家伙很怪呢，还没加入任何社团哦，求求管理员把他踢走吧
								</P>
							</DIV>
						</c:if>
					</div>
					<BR>
					<DIV class=hr-solid>
						<HR>
					</DIV>

					<H2 style="COLOR: #785d30; FONT-SIZE: 1.5em">
						&nbsp;&nbsp;&nbsp;今日图片吧 today picture &nbsp;&nbsp;>&nbsp;
					</H2>
					<DIV
						style="BACKGROUND-IMAGE: url(images/main/quote.gif); PADDING-BOTTOM: 2px; PADDING-LEFT: 60px; PADDING-RIGHT: 10px; BACKGROUND-REPEAT: no-repeat; PADDING-TOP: 10px">

						<style type="text/css">
#preview_wrap {
	margin: 0 auto;
	padding: 15px;
	width: 450px;
	height: 240px;
	background: url('images/imgBar/bg_preview.jpg') top left no-repeat;
}

#preview_outer {
	overflow: hidden;
	width: 450px;
	height: 240px;
	position: relative;
}

#preview_inner {
	text-align: center;
	height: 100%;
	position: relative;
}

#preview_inner div {
	float: left;
	width: 450px;
	height: 240px;
	position: relative;
}

#preview_inner div a {
	position: absolute;
	bottom: 0;
	left: 0;
	display: block;
	width: 100%;
	text-indent: 20px;
	padding: 20px 0;
	color: #fff;
	background: url(images/imgBar/bg_trans.png);
	text-decoration: none;
	font-size: 18px;
}

#thumbs {
	padding-top: 6px;
	position: relative;
	width: 480px;
	text-align: center;
}

#thumbs span {
	padding: 10px;
	width: 80px;
	height: 80px;
	cursor: pointer;
	background: url('images/imgBar/bg_thumb.jpg') top left no-repeat;
	display: inline-block;
}

#arrow {
	position: absolute;
	top: -8px;
	background: url('images/imgBar/bg_arrow.jpg') top center no-repeat;
	width: 80px;
	height: 36px;
	display: none;
}
</style>
						<script type="text/javascript">
		$(document).ready(function() {
			var outer		= $("#preview_outer");
			var arrow		= $("#arrow");
			var thumbs		= $("#thumbs span");
			var preview_pos;
			var preview_els	= $("#preview_inner div");
			var image_width	= preview_els.eq(0).width(); // Get width of imaages
			thumbs.click(function() {
				preview_pos = preview_els.eq( thumbs.index( this) ).position();
				outer.stop().animate( {'scrollLeft' : preview_pos.left},	400 );
				arrow.stop().animate( {'left' : $(this).position().left },	400 );
			});
			arrow.css( {'left' : thumbs.eq(0).position().left } ).show();
			outer.animate( {'scrollLeft' : 0}, 0 );
			$("#preview_inner").css('width', preview_els.length * image_width);
		});
</script>
						<div>
							<div id="preview_wrap">
								<div id="preview_outer">
									<div id="preview_inner">
										<div>
											<img src="images/imgBar/1_b.jpg" alt="Leonardo Maia" />
											<a href="http://www.codefans.net/">Leonardo Maia</a>
										</div>
										<div>
											<img src="images/imgBar/2_b.jpg" alt="skillicorn" />
											<a href="http://www.codefans.net/">skillicorn</a>
										</div>
										<div>
											<img src="images/imgBar/3_b.jpg" alt="theenergycell" />
											<a href="http://www.codefans.net/">theenergycell</a>
										</div>
										<div>
											<img src="images/imgBar/4_b.jpg" alt="Fred Maya" />
											<a href="http://www.codefans.net/">Fred Maya</a>
										</div>

										<div>
											<img src="images/imgBar/1_b.jpg" alt="Leonardo Maia" />
											<a href="http://www.codefans.net/">Leonardo Maia</a>
										</div>
									</div>
								</div>
							</div>
							<div id="thumbs">
								<div id="arrow"></div>
								<span><img src="images/imgBar/1_s.gif"
										alt="Leonardo Maia" width="60px" /> </span>
								<span><img src="images/imgBar/2_s.gif" alt="skillicorn"
										width="60px" /> </span>
								<span><img src="images/imgBar/3_s.gif"
										alt="theenergycell" width="60px" /> </span>
								<span><img src="images/imgBar/4_s.gif" alt="Fred Maya"
										width="60px" /> </span>
								<span><img src="images/imgBar/1_s.gif" alt="Fred Maya"
										width="60px" /> </span>
							</div>
						</div>
					</DIV>
					<BR>
					<DIV class=hr-solid>
						<HR>
					</DIV>
				</DIV>
			</DIV>
			<!--End of Div ChildCenterPage-->
		</DIV>
		<br>
		<br>
		<jsp:include page="../foot.jsp"></jsp:include>
	</BODY>
</HTML>

