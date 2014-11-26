<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>后台左侧导航栏</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" href="./admin/skin/css/base.css"
			type="text/css" />
		<link rel="stylesheet" href="./admin/skin/css/menu.css"
			type="text/css" />
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<script language='javascript'>var curopenItem = '1';</script>
		<script language="javascript" type="text/javascript"
			src="./admin/skin/js/frame/menu.js"></script>
		<base target="main" />
	</head>
	<body target="main">
		<table width='99%' height="100%" border='0' cellspacing='0'
			cellpadding='0'>
			<tr>
				<td style='padding-left: 3px; padding-top: 8px' valign="top">
					<!-- Item 1 Strat -->
					<dl class='bitem'>
						<dt onClick='showHide("items1_1")'>
							<b>管理员信息</b>
						</dt>
						<dd style='display: none' class='sitem' id='items1_1'>
							<ul class='sitemu'>
								<li>
									<div class='items'>
										<div class='fllct'>
											<a href='toadminqueryAdminInfo.action' target='main'>查询管理员信息</a>
										</div>
									</div>
								</li>
								<li>
									<a href='toadminupdateAdminInfo.action' target='main'>管理员修改密码</a>
								</li>
								<li>
									<a href='./admin/admin/addAdmin.jsp' target='main'>新加管理员信息</a>
								</li>
								<li>
									<div class='items'>
										<div class='fllct'>
											<a href='toadminqueryAdminInfo.action' target='main'>冻结激活管理员</a>
										</div>
									</div>
								</li>
							</ul>
						</dd>
					</dl>
					<!-- Item 1 End -->
					<!-- Item 2 Strat -->
					<dl class='bitem'>
						<dt onClick='showHide("items2_1")'>
							<b>社员信息管理</b>
						</dt>
						<dd style='display: block' class='sitem' id='items2_1'>
							<ul class='sitemu'>
								<li>
									<a href='adminUsershowUsersInfo.action?memberFlag=0' target='main'>查询社员信息</a>
								</li>
								<li>
									<a href='adminUsergetNotDealMember.action?memberFlag=2' target='main'>社员注册审核</a>
								</li>
								<li>
									<a href='adminUsershowUsersInfo.action?memberFlag=1' target='main'>删除社员信息</a>
								</li>
								<li>
									<a href='registMember.jsp' target='self'>添加社员信息</a>
								</li>
							</ul>
						</dd>
					</dl>
					
					<dl class='bitem'>
						<dt onClick='showHide("items6_1")'>
							<b>入社申请管理</b>
						</dt>
						<dd style='display: none' class='sitem' id='items6_1'>
							<ul class='sitemu'>
								<li>
									<a href='adminUsershowUsersInfo.action' target='main'>社员详细信息</a>
								</li>
								<li>
									<a href='adminUsershowNotDealContact.action' target='main'>审核待批社员</a>
								</li>
								<li>
									<a href='adminUsershowHadDealContact.action?contactFlag=1' target='main'>查询已批社员</a>
								</li>
								<li>
									<a href='adminUsershowHadDealContact.action?contactFlag=0' target='main'>撤销冻结社员</a>
								</li>
							</ul>
						</dd>
					</dl>
					
					<dl class='bitem'>
						<dt onClick='showHide("items9_1")'>
							<b>社团审批管理</b>
						</dt>
						<dd style='display: none' class='sitem' id='items9_1'>
							<ul class='sitemu'>
								<li>
									<a href='adminAssoqueryAssoForPage.action' target='main'>社团详细信息</a>
								</li>
								<li>
									<a href='adminUsershowNotDealAsso.action' target='main'>审核待批社团</a>
								</li>
								<li>
									<a href='adminUsershowHadDealAsso.action?flag=1' target='main'>审核已批社团</a>
								</li>
								<li>
									<a href='adminUsershowHadDealAsso.action?flag=0' target='main'>撤销冻结社团</a>
								</li>
							</ul>
						</dd>
					</dl>
					
					<!-- Item 2 End -->
					<dl class='bitem'>
						<dt onClick='showHide("items3_1")'>
							<b>社团公告管理</b>
						</dt>
						<dd style='display: none' class='sitem' id='items3_1'>
							<ul class='sitemu'>
								<li>
									<a href='adminMsgshowAdminNotice.action?noticeFlag=2' target='main'>查询公告信息</a>
								</li>
								<li>
									<a href='adminMsgshowAdminNotice.action?noticeFlag=3' target='main'>发布公告信息</a>
								</li>
								<li>
									<a href='adminMsgshowAdminNotice.action?noticeFlag=0' target='main'>修改公告信息</a>
								</li>
								<li>
									<a href='adminMsgshowAdminNotice.action?noticeFlag=1' target='main'>删除公告信息</a>
								</li>
							</ul>
						</dd>
					</dl>
					
					<dl class='bitem'>
						<dt onClick='showHide("items4_1")'>
							<b>社团留言管理</b>
						</dt>
						<dd style='display: none' class='sitem' id='items4_1'>
							<ul class='sitemu'>
								<li>
									<a href='adminMsgshowNewsInfo.action?msgFlag=1' target='main'>查询留言信息</a>
								</li>
								<li>
									<a href='adminMsgshowNewsInfo.action?msgFlag=0' target='main'>删除留言信息</a>
								</li>
							</ul>
						</dd>
					</dl>
					
					<dl class='bitem'>
						<dt onClick='showHide("items7_1")'>
							<b>站点新闻管理</b>
						</dt>
						<dd style='display: none' class='sitem' id='items7_1'>
							<ul class='sitemu'>
								<li>
									<a href='adminNewsshowNewsInfo.action?newsFlag=3' target='main'>查询新闻信息</a>
								</li>
								<li>
									<a href='adminNewsshowNewsInfo.action?newsFlag=2' target='main'>发布新闻信息</a>
								</li>
								<li>
									<a href='adminNewsshowNewsInfo.action?newsFlag=0' target='main'>更新新闻信息</a>
								</li>
								<li>
									<a href='adminNewsshowNewsInfo.action?newsFlag=1' target='main'>删除新闻信息</a>
								</li>
							</ul>
						</dd>
					</dl>
					
					<dl class='bitem'>
						<dt onClick='showHide("items8_1")'>
							<b>图形报表统计</b>
						</dt>
						<dd style='display: none' class='sitem' id='items8_1'>
							<ul class='sitemu'>
								<li>
									<a href='assoImgshowAssoReport.action' target='main'>社团统计图表</a>
								</li>
							</ul>
						</dd>
					</dl>
					
					<dl class='bitem'>
						<dt onClick='showHide("items5_1")'>
							<b>系统数据维护</b>
						</dt>
						<dd style='display: none' class='sitem' id='items5_1'>
							<ul class='sitemu'>
								<li>
									<a href='./admin/data/backupData.jsp' target='main'>数据备份</a>
								</li>
								<li>
									<a href='./admin/data/recoveryData.jsp' target='main'>数据恢复</a>
								</li>
								<li>
									<a href='./admin/data/clearData.jsp' target='main'>数据清零</a>
								</li>
							</ul>
						</dd>
					</dl>
				</td>
			</tr>
		</table>
	</body>
</html>
