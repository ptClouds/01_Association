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
		
		<SCRIPT type=text/javascript src="js/jquery.min.js"></SCRIPT>

		<SCRIPT type=text/javascript src="js/jquery-ui-1.8.2.custom.min.js"></SCRIPT>

		<SCRIPT type=text/javascript src="js/pirobox_extended.js"></SCRIPT>

		<META name=GENERATOR content="MSHTML 8.00.6001.19190">
	</HEAD>
	<style type="text/css">
#sidebar a:link,
    #sidebar a:visiteid  {
    color:#FF0000;
    text-decoration:none;
    }
    #sidebar a:hover,
    #sidebar a:active  {
    color:#000000;
    text-decoration:underline;
    }

</style>
	<BODY class=homepage>
		<p></p>
		<DIV id=subWrapper>
		<H1 style="COLOR: #000">
						&nbsp;&nbsp;待审批社团&nbsp;&nbsp;>&nbsp;>&nbsp;
					</H1>
		<br>
		<DIV class=hr-solid>
		<table width=1050px align=center>
				<tr align=center>
					<td width=120px>
						<b><font size=2>社团名</font></b>
					</td>
					<td width=120px>
						<b><font size=2>社团简介</font></b>
					</td>
					<td width=120px>
						<b><font size=2>申请人</font></b>
					</td>
					<td width=120px>
						<b><font size=2>申请人电话</font></b>
					</td>
					<td width=120px>
						<b><font size=2>申请人邮箱</font></b>
					</td>
					<td width=120px>
						<b><font size=2>身份证号</font></b>
					</td>
					<td width=120px>
						<b><font size=2>审批状态</font></b>
					</td>
					<td width=120px>
						<b><font size=2>申请日期</font></b>
					</td>
					<td width=120px>
						<b><font size=2>操作</font></b>
					</td>
				</tr>
			</table>
		</DIV>
		<hr width=980px align=center>
		<div id="t1">
		
		<s:iterator value="%{#request.assoNotDealList}" id="s">
			<div><span id="t">
			<table width=1050px align=center>
				<tr align=center>
					<td width=120px>
						<font size=2><s:property value='#s.assoName' /></font>
					</td>
					<td width=120px>
						<font size=2><s:property value='#s.assoDesc' /></font>
					</td>
					<td width=120px>
						<font size=2><s:property value='#s.applicant' /></font>
					</td>
					<td width=120px>
						<font size=2><s:property value='#s.applicantTel' /></font>
					</td>
					<td width=120px>
						<font size=2><s:property value='#s.applicantEmail' /></font>
					</td>
					<td width=120px>
						<font size=2><s:property value='#s.applicantId' /></font>
					</td>
					<td width=120px>
						<s:if test="%{#s.assoStatus == 0}"><font size=2 color=red>未审核</font></s:if>
						<s:if test="%{#s.assoStatus == 1}"><font size=2 color=blue>已审核</font></s:if>
					</td>
					<td width=120px>
						<font size=2><s:property value='#s.regDate' /></font>
					</td>
					<td width=120px>
						<font size=2><a href="adminUserdealApplyAsso.action?assoVo.assoId=<s:property value='#s.assoId' />
								&assoVo.assoName=<s:property value='#s.assoName' />
								&assoVo.assoDesc=<s:property value='#s.assoDesc' />
								&assoVo.applicant=<s:property value='#s.applicant' />
								&assoVo.regDate=<s:property value='#s.regDate' />
								&assoVo.applicantTel=<s:property value='#s.applicantTel' />
								&assoVo.applicantEmail=<s:property value='#s.applicantEmail' />
								&assoVo.applicantId=<s:property value='#s.applicantId' />
								&assoVo.regSchool=<s:property value='#s.regSchool' />
								&assoVo.assoPhoto=<s:property value='#s.assoPhoto' />
								&assoVo.revokeDate=<s:property value='#s.revokeDate' />
								&assoVo.remarks=<s:property value='#s.remarks' />">审批</a></font>
					</td>
				</tr>
			</table>
			</span>
			<hr width=980px align=center>
			</div>
		</s:iterator>
		</div>
		
		<div align=center id="sidebar">
		<font size=2>
		<span>
		总计&nbsp;&nbsp;&nbsp;
		<font color=red><span id="sp1"></span></font>&nbsp;&nbsp;&nbsp;条
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		每页显示&nbsp;&nbsp;&nbsp;
		<font color=red><span id="sp2"></span></font>&nbsp;&nbsp;&nbsp;条&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		总共&nbsp;&nbsp;&nbsp;
		<font color=red><span id="sp3"></span></font>
		&nbsp;&nbsp;&nbsp;页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		当前为第&nbsp;&nbsp;&nbsp;
		<font color=red><span id="sp4"></span></font>
		&nbsp;&nbsp;&nbsp;页
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a id="first" >首页</a>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a id="prev" >上一页</a>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a id="next" >下一页</a>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a id="end" >尾页</a>
		</span>
		</font>
		</DIV>
		</DIV>
		<DIV class=hr-solid>
	</BODY>
 <script type="text/javascript">
		var pgo = $("#p").find("div");
		var obj = $("#t1").find("div");
		var divsize = obj.size(); //数据条数
		var perpage = 8;	//每页条数
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

