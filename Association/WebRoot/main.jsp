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
		<jsp:include page="head.jsp"></jsp:include>
		<DIV id=subWrapper>
			<DIV style="BACKGROUND: url(Images/bg_homepagecontent.gif) repeat-y"
				id=ChildCenterPage>
				<DIV id=subnav>
					<!-- Make Reservation is dynamically set depending on lang (amex or anything else) -->
					<DIV class=sidenav-form>
						<H2 class=heading-three>
							每日动画-mebers flash:
						</H2>
						<EMBED src=swf/flash.swf width=195 height=135
							type=application/x-shockwave-flash wmode="transparent "
							quality="high " autostart=true loop=true>
						</EMBED>
						<DIV class=hr-solid>
							<HR>
						</DIV>
						<H2 class=heading-three></H2>
						<DIV
							style="PADDING-BOTTOM: 10px; MIN-HEIGHT: 145px; PADDING-LEFT: 10px; PADDING-RIGHT: 25px; BACKGROUND: url(images/main/Note.png) no-repeat; PADDING-TOP: 55px">
							<SCRIPT> 
function   checkLoop(obj,   bound)   { 
obj.count++; 
if   (obj.count==bound)   { 
obj.count=0; 
obj.stop(); 
window.setTimeout(obj.uniqueID   +   ".start() ",   2000); 
} 
} 
</SCRIPT>

							<MARQUEE onscroll=checkLoop(this,this.height/this.scrollAmount)
								onmousemove=this.stop() onmouseout=this.start() direction=up
								height=120 width=160 loop=-1 scrollAmount=3 scrollDelay=150
								count="0">
								<s:iterator value="%{#request.noticeList}" id="s">
									<UL class=noteslist_diy>
										<LI class=noteslist_diy>
											<A class=STYLE href="#" target=_top><s:property
													value='#s.noticeTitle' /> </A>
										</LI>
									</UL>
								</s:iterator>
							</MARQUEE>
						</DIV>
						<A style="PADDING-LEFT: 130px" class=medium-link
							href="http://ly.hnuc.edu.cn/NewsList.asp?n_type=NOTES">更多通知</A>
						<DIV class=hr-solid>
							<HR>
						</DIV>
						<DIV class=reserve-border>
							<H2 class=heading-three>
								联系方式: Contact US
							</H2>
							<DIV class=reservation-panel>
								<A href="http://ly.hnuc.edu.cn/aboutus.asp"><SPAN
									class=heading>0731-88687688 </SPAN><SPAN class=opening-hours>周一至周五8：00-17：00</SPAN>
									<SPAN class="opening-hours bottom">午休时间 12:00-14:00</SPAN> </A>
							</DIV>
							<UL style="PADDING-LEFT: 10px">
								<LI class=clear>
									<A class=small-link href="mailto:tourism@hnuc.edu.cn">您可用邮件通知我们：893736334@qq.com</A>
								</LI>
								<LI class=clear>
									<A class=small-link
										href="javascript:alert('暂时不提供此功能,请用电话及邮件与我们联系。电话:0731-88687688')">您也可以在网站上给我们留言</A>
								</LI>
							</UL>
						</DIV>
						<!--End of Div of Reserve-border-->
						<DIV class=hr-solid>
							<HR>
						</DIV>
						<H2 class=heading-three>
							友情链接: Links
						</H2>
						<H2 class=heading-three>
							中国教育部
						</H2>
						<DIV class="left-hotel-summary clear">
							<A href="http://www.moe.edu.cn/"><IMG class=thumb alt=中国教育部
									src="images/main/moeedu.png" width=70> </A>
							<DIV>
								<P>
									中国教育部网
								</P>
							</DIV>
							<A class=medium-link href="http://www.moe.edu.cn/">进入链接</A>
						</DIV>
						<H2 class=heading-three>
							湖南省旅游网
						</H2>
						<DIV class="left-hotel-summary clear">
							<A href="http://www.hnt.gov.cn/"><IMG class=thumb alt=湖南省旅游网
									src="images/main/hntour.png" width=70> </A>
							<DIV>
								<P>
									湖南省旅游局的官方网站,可以查询与旅游相关的政策与法规
								</P>
							</DIV>
							<A class=medium-link href="http://www.hnt.gov.cn/">进入链接</A>
						</DIV>
						<P>
							<A style="FLOAT: right" class=medium-link
								href="http://ly.hnuc.edu.cn/partners.asp">更多链接...</A>
						</P>
					</DIV>
				</DIV>
				<!--End Of Div SubNav-->
				<DIV id=content>
					<H1 style="COLOR: #000">
						&nbsp;&nbsp;&nbsp;新闻头条 Headline News &nbsp;&nbsp;>&nbsp;>&nbsp;>
					</H1>
					<s:iterator value="%{#request.newTopList}" id="s">
						<H2 style="COLOR: #785d30; FONT-SIZE: 1.5em">
							&nbsp;&nbsp;
							<s:property value='#s.newsTitle' />
						</H2>
						<DIV
							style="BACKGROUND-IMAGE: url(images/main/quote.gif); PADDING-BOTTOM: 2px; PADDING-LEFT: 15px; PADDING-RIGHT: 10px; BACKGROUND-REPEAT: no-repeat; PADDING-TOP: 10px">
							<P>
								<s:property value='#s.newsContent' />
							</P>
						</DIV>
					</s:iterator>
					<P>
						<A style="FLOAT: right" class=medium-link
							href="newsqueryNewsForPage.action?page=1&strChoice=newsId:<s:property value='#s.newsId' />"
							target=_self>详细内容</A>
					</P>
					<BR>
					<!--分隔线-->
					<DIV class=hr-solid>
						<HR>
					</DIV>
					<DIV class=col-one>
						<DIV>
							<H2>
								优秀社团-Popular Association
							</H2>
							<DIV>
								<DIV align=center>
									<IMG
										style="BORDER-RIGHT-WIDTH: 0px; WIDTH: 200px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; HEIGHT: 95px; BORDER-LEFT-WIDTH: 0px"
										alt=专业建设 src="images/main/Special.png">
								</DIV>
								<UL class=newslist_diy>
									<s:iterator value="%{#request.associationList}" id="s">
										<c:if test="${!empty(s)}">
											<LI class=newslist_diy>
												<font color="" face="" size='3'>☼</font> &nbsp;
												<A href="mainqueryAssoForPage.action" target=_self><s:property
														value='#s.assoName' /> &nbsp;(&nbsp;<s:property
														value='#s.assoDesc' />&nbsp;)</A>
											</LI>
										</c:if>

										<c:if test="${empty(s)}">
											<LI class=newslist_diy>
												<font color="" face="" size=5>今天没有头条哦，快来爆料吧</font>
											</LI>
										</c:if>
									</s:iterator>
								</UL>
							</DIV>
							<P>
								<A style="FLOAT: right" class=medium-link href="mainqueryAssoForPage.action">全部社团信息</A>
							</P>
						</DIV>
					</DIV>
					<!-- End of Div col-one-->
					<DIV class=col-two>
						<DIV>
							<H2>
								活跃社员-Active mebers
							</H2>
							<DIV>
								<DIV align=center>
									<IMG
										style="BORDER-RIGHT-WIDTH: 0px; WIDTH: 200px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; HEIGHT: 95px; BORDER-LEFT-WIDTH: 0px"
										alt="" src="images/main/Teaching.png">
								</DIV>
								<UL class=newslist_diy>

									<s:iterator value="%{#request.memberList}" id="s">
										<LI class=newslist_diy>
											<font color="" face="" size='3'>☼</font> &nbsp;
											<A href="spaceshowSpaceInfo.action?userId=<s:property value='#s.userId' /> " target=_self><s:property
													value='#s.strValue' />&nbsp; </A>
										</LI>
									</s:iterator>
								</UL>
							</DIV>
							<P>
								<A style="FLOAT: right" class=medium-link href="mainqueryMemberForPage.action">全部社员信息</A>
							</P>
						</DIV>
					</DIV>
					<!-- End of Div col-two-->
					<!--分隔线-->
					<DIV class=hr-solid>
						<HR>
					</DIV>
					<DIV class=col-one>
						<DIV>
							<H2>
								社团活动-Association Activities
							</H2>
							<DIV>
								<DIV align=center>
									<IMG
										style="BORDER-RIGHT-WIDTH: 0px; WIDTH: 200px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; HEIGHT: 95px; BORDER-LEFT-WIDTH: 0px"
										alt=学生工作 src="images/main/Student.png">
								</DIV>
								<UL class=newslist_diy>
									<s:iterator value="%{#request.activInfoList}" id="s">
										<c:if test="${!empty(s)}">
											<LI class=newslist_diy>
												<font color="" face="" size='3'>☼</font> &nbsp;
												<A href="#" target=_self><s:property value='#s.assoName' />&nbsp;<s:property value='#s.activTopic' />
													<s:property value='#s.strActivDate' />&nbsp;</A>
											</LI>
										</c:if>

										<c:if test="${empty(s)}">
											<LI class=newslist_diy>
												<font color="" face="" size=5>今天没有头条哦，快来爆料吧</font>
											</LI>
										</c:if>
									</s:iterator>
								</UL>
							</DIV>
							<P>
								<A style="FLOAT: right" class=medium-link href="#">更多社团活动信息</A>
							</P>
						</DIV>
					</DIV>
					<!-- End of Div col-one-->
					<DIV class=col-two>
						<DIV>
							<H2>
								社员留言-mebers Message
							</H2>
							<DIV>
								<DIV align=center>
									<IMG
										style="BORDER-RIGHT-WIDTH: 0px; WIDTH: 200px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; HEIGHT: 95px; BORDER-LEFT-WIDTH: 0px"
										alt=科研工作 src="images/main/msg.jpg">
								</DIV>
								<UL class=newslist_diy>
									<s:iterator value="%{#request.msgInfoList}" id="s">
										<LI class=newslist_diy>
											<font color="" face="" size='3'>☼</font> &nbsp;
											<A href="#" target=_self><s:property value='#s.strValue' />&nbsp;
											</A>
										</LI>
									</s:iterator>
								</UL>
							</DIV>
							<P>
								<A style="FLOAT: right" id="btnModal" class=medium-link>更多社员留言信息</A>
							</P>
						</DIV>
					</DIV>
					<!-- End of Div col-two-->
					<!--分隔线-->
					<DIV class=hr-solid>
						<HR>
					</DIV>
					<DIV id=BookRecommended>
						<H2 class=heading-three>
							七嘴八舌 Forum and Message fly
						</H2>
						<input type="button" id="btnModal" value="点击按钮弹出" />
					</DIV>

					<!-- End of Div BookRecommended-->
				</DIV>
				<!-- End of Div content-->
				<DIV id=rightnav>
					<H2 class=heading-three>
						图片新闻 School News
					</H2>
					<style type="text/css">
#oTransContainer {
	FILTER: progid :   DXImageTransform .   Microsoft . 
		 Wheel(duration =   2, spokes =   16), BlendTrans(duration =   2),
		RevealTrans(duration =   2, transition =   23), progid :  
		DXImageTransform .   Microsoft . 
		 Wipe(duration =   3, gradientsize =   0.25, motion =   reverse),
		progid : 
		 DXImageTransform .   Microsoft . 
		 RadialWipe(duration =   2, wipeStyle =   CLOCK), progid :  
		DXImageTransform .   Microsoft .  
		Slide(duration =   2, bands =   1, slideStyle =   SWAP), progid :  
		DXImageTransform .   Microsoft . 
		 Spiral(duration =   2, gridSizeX =   50, gridSizeY =   50), progid : 
		 DXImageTransform .   Microsoft .   RandomDissolve(duration =   2),
		progid : 
		 DXImageTransform .   Microsoft .  
		Wheel(duration =   2, spokes =   16), progid :   DXImageTransform .  
		Microsoft . 
		 Stretch(duration =   2, stretchStyle =   PUSH), progid :  
		DXImageTransform .   Microsoft . 
		
		GradientWipe(duration =   2, gradientSize =   0.25, motion =   forward),
		progid :   DXImageTransform .   Microsoft . 
		 Fade(duration =   2, overlap =   0), progid :   DXImageTransform .  
		Microsoft .  
		Pixelate(, enabled =   false, duration =   2, maxSquare =   25),
		progid : 
		 DXImageTransform .   Microsoft . 
		 Wipe(GradientSize =   1.0, wipeStyle =   0, motion =   'forward');
	WIDTH: 241px;
	HEIGHT: 135px;
}
</style>

					<div id="oTransContainer">
						<div>
							<img src="images/photonews/07.png">
							<br>
							<br>
							<a href="#">保护地球</a>
						</div>
						<div>
							<img src="images/photonews/04.png">
							<br>
							<br>
							<a href="#">图片新闻2</a>
						</div>
						<div>
							<img src="images/photonews/15.png">
							<br>
							<br>
							<a href="#">图片新闻3</a>
						</div>
						<div>
							<img src="images/photonews/16.png">
							<br>
							<br>
							<a href="#">图片新闻4</a>
						</div>
						<div>
							<img src="images/photonews/03.png">
							<br>
							<br>
							<a href="#">保护地球</a>
						</div>
						<div>
							<img src="images/photonews/14.png">
							<br>
							<br>
							<a href="#">图片新闻6</a>
						</div>
					</div>
					<script type="text/javascript">  
var nowFrame = 0;   
function fnToggle() {      
    var imgs=oTransContainer.getElementsByTagName("div");   
    var j=(Math.floor(Math.random()*oTransContainer.filters.length))   
    var filter=oTransContainer.filters[j];   
    var maxFrame=parseInt(imgs.length);   
       
        nowFrame++;        
    if(nowFrame==maxFrame)nowFrame=0;   
       
    filter.Apply();   
    imgs[nowFrame].style.display = "block";   
    filter.Play(duration = 2);   
       
    for(var i=0;i<imgs.length;i++){   
        if(i!=nowFrame)   
        imgs[i].style.display = "none";            
    }      
    setTimeout("fnToggle()", 6000);   
}   
fnToggle();   
</script>
					<!-- End of Div SlideImg-->
					<DIV class=hr-solid>
						<HR>
					</DIV>

					<H2 class=heading-three>
						学院新闻 School News
					</H2>
					<UL class=news-items>
						<s:iterator value="%{#request.newsList}" id="s">
							<c:if test="${!empty(s)}">
								<LI>
									<H3>
										<A
											href="newsqueryNewsForPage.action?page=1&strChoice=newsId:<s:property value='#s.newsId' />"
											target=_self><s:property value='#s.newsTitle' /> </A>
									</H3>
									<P>
										&nbsp;&nbsp;&nbsp;&nbsp;
										<s:property value='#s.newsContent' />
									</P>
								</LI>
							</c:if>
							<c:if test="${empty(s)}">
								<LI>
									<H3>
										<font color="" face="" size=5>今天没有头条哦，快来爆料吧</font>
									</H3>
								</LI>
							</c:if>
						</s:iterator>
						<P class=clear>
							<A style="FLOAT: right" class=medium-link
								href="newsqueryNewsForPage.action?page=1&strChoice=all">查看全部新闻</A>
						</P>
					</UL>
					<DIV class=hr-solid>
						<HR>
					</DIV>
					<H2 class=heading-three>
						菁菁校园 New Photos...
					</H2>
					<DIV style="MIN-HEIGHT: 65px" class="left-hotel-summary clear">
						<A href="http://ly.hnuc.edu.cn/photogrouplist.asp?h_group=实景校园"
							target=_top><IMG
								style="BORDER-BOTTOM: 10px solid; BORDER-LEFT: 1px solid; WIDTH: 80px; HEIGHT: 55px; BORDER-TOP: 1px solid; BORDER-RIGHT: 1px solid"
								class=thumb alt=实景校园 src="images/main/Photaf4.jpg"> </A>
						<DIV>
							<H3>
								<A href="http://ly.hnuc.edu.cn/photogrouplist.asp?h_group=实景校园"
									target=_top>实景校园</A>
							</H3>
							<P>
								校园一角
							</P>
						</DIV>
					</DIV>
					<DIV style="MIN-HEIGHT: 65px" class="left-hotel-summary clear">
						<A href="http://ly.hnuc.edu.cn/photogrouplist.asp?h_group=实习基地"
							target=_top><IMG
								style="BORDER-BOTTOM: 10px solid; BORDER-LEFT: 1px solid; WIDTH: 80px; HEIGHT: 55px; BORDER-TOP: 1px solid; BORDER-RIGHT: 1px solid"
								class=thumb alt=实习基地 src="images/main/trace001.jpg"> </A>
						<DIV>
							<H3>
								<A href="http://ly.hnuc.edu.cn/photogrouplist.asp?h_group=实习基地"
									target=_top>实习基地</A>
							</H3>
							<P>
								这是学生在广州白天鹅宾馆前厅部实习。
							</P>
						</DIV>
					</DIV>
					<P class=clear>
						<A style="FLOAT: right" class=medium-link
							href="http://ly.hnuc.edu.cn/photolist.asp?h_type=ALL">查看全部图片</A>
					</P>

					<DIV class=hr-solid>
						<HR>
					</DIV>
					<DIV style="HEIGHT: 50px">
						<P class=clear>
							&nbsp;
							<a href="#"
								style="a: link {   color :   red; text-decoration: none;"> <img
									src="images/main/bt01-2.jpg" width="90px" height="35px"
									border="0"> </a> &nbsp;&nbsp;&nbsp;&nbsp;
							<a><img src="images/main/bt02-2.jpg" width="90px"
									height="33px" border="0"> </a>
						</P>
					</DIV>
					<DIV style="HEIGHT: 50px">
						<P class=clear>
							&nbsp;
							<a href="#"
								style="a: link {   color :   red; text-decoration: none;"> <img
									src="images/main/bt03-2.jpg" width="90px" height="35px"
									border="0"> </a> &nbsp;&nbsp;&nbsp;&nbsp;
							<a><img src="images/main/bt04-2.jpg" width="90px"
									height="33px" border="0"> </a>
						</P>
					</DIV>
					<DIV class=hr-solid>
						<HR>
					</DIV>
				</DIV>
				<!-- End of Div rightnav-->
			</DIV>
			<!--End of Div ChildCenterPage-->
		</DIV>
		<jsp:include page="foot.jsp"></jsp:include>
		<div id="modal"
			style="display: none; width: 415px; height: 330px; background-color: white; border: 1px gray solid;">
			<div id="jcmTitle"
				style="float: left; width: 415px; line-height: 25px; background-color: #eee;">
				<span id="jcmClose" style="float: right; background-color: #ddd">关闭</span>
				<strong>最新社员留言信息</strong>
			</div>
			<div style="clear: both; padding: 8px;">
				<DIV align=center>
					<IMG
						style="BORDER-RIGHT-WIDTH: 0px; WIDTH: 300px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; HEIGHT: 95px; BORDER-LEFT-WIDTH: 0px"
						alt=最新社员留言 src="images/main/msg.jpg">
				</DIV>
				<div id="t1">
					<s:iterator value="%{#request.msgNotSubList}" id="s">
						<div>
							<span id="t">
								<table width=400px>
									<tr>
										<td rowspan=2>
											<img src="<s:property value='#s.value2' />" width="50px" />
										</td>
										<td>
											<font size=1.8><s:property value='#s.value1' />
											</font>
										</td>
									</tr>
									<tr>
										<td colspan=2>
											<font size=1.8><s:property value='#s.value3' />
											</font>
										</td>
									</tr>
								</table> </span>
							<hr width=400px />
						</div>

					</s:iterator>
				</div>
				<div align=center id="sidebar">
					<span> 总计 <font color=red><span id="sp1"></span>
					</font>&nbsp;条 &nbsp; <font color=red><span id="sp2"></span>
					</font>&nbsp;条/页&nbsp; 共 <font color=red><span id="sp3"></span>
					</font> &nbsp;页&nbsp; 当前第 <font color=red><span id="sp4"></span>
					</font> &nbsp;页 &nbsp; <a id="first">首页</a> &nbsp; <a id="prev">上页</a>
						&nbsp; <a id="next">下页</a> &nbsp; <a id="end">尾页</a> </span>
				</DIV>
			</div>
	</BODY>
	<script type="text/javascript">
		var pgo = $("#p").find("div");
		var obj = $("#t1").find("div");
		var divsize = obj.size(); //数据条数
		var perpage = 3;	//每页条数
		var sumpage = Math.ceil(divsize/perpage);	//总页数	
		var i = 1;  //默认第一页
		document.getElementById("sp1").innerHTML= divsize;
		document.getElementById("sp3").innerHTML= sumpage;
		document.getElementById("sp4").innerHTML= i;
		document.getElementById("sp2").innerHTML= perpage;
		obj.hide();
		obj.slice(0,perpage).show();
		//首页
		$("#first").click(function(){		
			i = 0;
			obj.hide();
			obj.slice(i*perpage,i*perpage+perpage).show();
			++i;
			document.getElementById("sp4").innerHTML= i;
		});
		//上一页
		$("#prev").click(function(){			
			--i;
			if(i<=0)
			{
				alert("您好，现在已是首页");
				i = 1;
				return false;
			}
			obj.hide();
			obj.slice(i*perpage-perpage,i*perpage).show();	
			document.getElementById("sp4").innerHTML= i;
		});
		//下一页
		$("#next").click(function(){			
			if(i>=sumpage)
			{
				i = sumpage;
				alert("您好，现在已是尾页");
				return false;
			}
			obj.hide();
			obj.slice(i*perpage,i*perpage+perpage).show();
			++i;
			document.getElementById("sp4").innerHTML= i;
		});
		//尾页
		$("#end").click(function(){			
			i = sumpage;
			if(i<=0)
			{
				i = 1;
				return false;
			}
			obj.hide();
			obj.slice(i*perpage-perpage,i*perpage).show();	
			document.getElementById("sp4").innerHTML= i;
		});
		
  </script>
</HTML>

