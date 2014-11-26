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

		<title>后台公共顶部页面</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link href="./admin/skin/css/base.css" rel="stylesheet" type="text/css">
		<script language='javascript'>
var preFrameW = '206,*';
var FrameHide = 0;
var curStyle = 1;
var totalItem = 9;
function ChangeMenu(way){
	var addwidth = 10;
	var fcol = top.document.all.btFrame.cols;
	if(way==1) addwidth = 10;
	else if(way==-1) addwidth = -10;
	else if(way==0){
		if(FrameHide == 0){
			preFrameW = top.document.all.btFrame.cols;
			top.document.all.btFrame.cols = '0,*';
			FrameHide = 1;
			return;
		}else{
			top.document.all.btFrame.cols = preFrameW;
			FrameHide = 0;
			return;
		}
	}
	fcols = fcol.split(',');
	fcols[0] = parseInt(fcols[0]) + addwidth;
	top.document.all.btFrame.cols = fcols[0]+',*';
}


function mv(selobj,moveout,itemnum)
{
   if(itemnum==curStyle) return false;
   if(moveout=='m') selobj.className = 'itemsel';
   if(moveout=='o') selobj.className = 'item';
   return true;
}

function changeSel(itemnum)
{
  curStyle = itemnum;
  for(i=1;i<=totalItem;i++)
  {
     if(document.getElementById('item'+i)) document.getElementById('item'+i).className='item';
  }
  document.getElementById('item'+itemnum).className='itemsel';
}

</script>
		<style>
body {
	padding: 0px;
	margin: 0px;
}

#tpa {
	color: #009933;
	margin: 0px;
	padding: 0px;
	float: right;
	padding-right: 10px;
}

#tpa dd {
	margin: 0px;
	padding: 0px;
	float: left;
	margin-right: 2px;
}

#tpa dd.ditem {
	margin-right: 8px;
}

#tpa dd.img {
	padding-top: 6px;
}

div.item {
	text-align: center;
	background: url(./admin/skin/images/frame/topitembg.gif) 0px 3px no-repeat;
	width: 82px;
	height: 26px;
	line-height: 28px;
}

.itemsel {
	width: 80px;
	text-align: center;
	background: #226411;
	border-left: 1px solid #c5f097;
	border-right: 1px solid #c5f097;
	border-top: 1px solid #c5f097;
	height: 26px;
	line-height: 28px;
}

* html .itemsel {
	height: 26px;
	line-height: 26px;
}

a:link,a:visited {
	text-decoration: underline;
}

.item a:link,.item a:visited {
	font-size: 12px;
	color: #ffffff;
	text-decoration: none;
	font-weight: bold;
}

.itemsel a:hover {
	color: #ffffff;
	font-weight: bold;
	border-bottom: 2px solid #E9FC65;
}

.itemsel a:link,.itemsel a:visited {
	font-size: 12px;
	color: #ffffff;
	text-decoration: none;
	font-weight: bold;
}

.itemsel a:hover {
	color: #ffffff;
	border-bottom: 2px solid #E9FC65;
}

.rmain {
	padding-left: 10px;
	/* background:url(./admin/skin/images/frame/toprightbg.gif) no-repeat; */
}
</style>
	</head>
	<body bgColor='#ffffff'>
		<table width="100%" border="0" cellpadding="0" cellspacing="0"
			background="./admin/skin/images/frame/topbg.gif">
			<tr>
				<td width='30%' height="80">
					<h1>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;大学生社团管理系统后台
					</h1>
				</td>
				<td width='80%' align="right" valign="bottom">
					<table width="750" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td align="right" height="26"
								style="padding-right: 10px; line-height: 26px;">
								您好：
								<span class="username"><font color="red" size=3 ><b>&nbsp;${adminName}&nbsp;&nbsp;</b></font></span>，欢迎来到大学生社团管理系统！
								[
								<a href="./admin/adminCenter.jsp" target="main">后台主页</a>] [
								<a href="./admin/manager/updatePass.jsp" target="main">修改密码</a>] [
								<a href="toadminadminExit.action" target="_parent">注销退出</a>]
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</td>
						</tr>
						<tr>
							<td align="right" height="54" class="rmain">
								<dl id="tpa">
									<dd>
										<div class='itemsel' id='item1'
											onMouseMove="mv(this,'move',1);" onMouseOut="mv(this,'o',1);">
											<a href="./admin/adminLeft.jsp" onclick="changeSel(1)" target="menu">主菜单</a>
										</div>
									</dd>
									<dd>
										<div class='item' id='item8' onMouseMove="mv(this,'m',8);"
											onMouseOut="mv(this,'o',8);">
											<a href="./main.jsp" onclick="changeSel(8)" target="main">前台主页</a>
										</div>
									</dd>
									<dd>
										<div class='item' id='item2' onMouseMove="mv(this,'m',2);"
											onMouseOut="mv(this,'o',2);">
											<a href="./admin/adminCenter.jsp" onclick="changeSel(2)" target="main">后台主页</a>
										</div>
									</dd>
									<dd>
										<div class='item' id='item2' onMouseMove="mv(this,'m',2);"
											onMouseOut="mv(this,'o',2);">
											<a href="classNewsqueryNews.action" onclick="changeSel(2)" target="main">发布公告</a>
										</div>
									</dd>
									<dd>
										<div class='item' id='item4' onMouseMove="mv(this,'m',4);"
											onMouseOut="mv(this,'o',4);">
											<a href="./admin/data/backupData.jsp" onclick="changeSel(4)" target="main">数据维护</a>
										</div>
									</dd>
									<dd>
										<div class='item' id='item5' onMouseMove="mv(this,'m',5);"
											onMouseOut="mv(this,'o',5);">
											<a href="./admin/errorJsp.jsp" onclick="changeSel(5)" target="main">系统设置</a>&nbsp;&nbsp;&nbsp;&nbsp;
										</div>&nbsp;&nbsp;&nbsp;&nbsp;
									</dd>
									<dd class='img'>
										<a href="javascript:ChangeMenu(-1);"><img vspace="5"
												src="./admin/skin/images/frame/arrl.gif" border="0" width="15"
												height="12" alt="缩小左框架" title="缩小左框架" />
										</a>&nbsp;&nbsp;
									</dd>
									<dd class='img'>
										<a href="javascript:ChangeMenu(0);"><img vspace="0"
												src="./admin/skin/images/frame/quanping.jpg" border="0" width="25"
												height="20" alt="显示/隐藏左框架" title="显示/隐藏左框架" />
										</a>&nbsp;&nbsp;
									</dd>
									<dd class='img' style="margin-right: 10px;">
										<a href="javascript:ChangeMenu(1);"><img vspace="5"
												src="./admin/skin/images/frame/arrr.gif" border="0" width="15"
												height="12" alt="增大左框架" title="增大左框架" />
										</a>
									</dd>
									<dd>
										<div>
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</div>
									</dd>
								</dl>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>

	</body>
</html>
