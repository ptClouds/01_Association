<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

		<title>站点新闻信息</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">

		<link type="text/css"
			href="js/plugin/ui-lightness/jquery-ui-1.7.1.custom.css"
			rel="stylesheet" />
		<link type="text/css" href="js/plugin/css/style.css"
			rel="stylesheet" />
		<!--[if gte IE 6]>	
		<style type="text/css">@import url(css/style_ie.css);</style>
		<![endif]-->
		<script type="text/javascript" src="js/plugin/js/jquery.js"></script>
		<script type="text/javascript" src="js/plugin/js/ui.core.js"></script>
		<script type="text/javascript"
			src="js/plugin/js/ui.ariaSorTable.js"></script>
		<script type="text/javascript" src="./js/plugin/js/demo.js"></script>
		<script type="text/javascript">	
		$(function() {			
			var table1 = $("table").ariaSorTable({
				rowsToShow: 4,
				pager: true,
				onInit: function() {
					demoControl();
				},
				colsToHide: {
					6: true,
					7: true
				}
			});
			
			$("#destroy").click(function (event) { 
				table1.ariaSorTable('destroy');
			});		
			$("#disable").click(function (event) { 
				table1.ariaSorTable('disable');
			});					
		});	
		
		function toUpdateNews(value1,value2,value3){
			//alert("hello");
			var updateNewsId = document.getElementById("updateNewsId");
			var updateNewsTitle = document.getElementById("updateNewsTitle");
			var updateNewsContent = document.getElementById("updateNewsContent");
			updateNewsId.value = value1;
			updateNewsTitle.value = value2;
			updateNewsContent.value = value3;
			return true；
   	  	}
   	  	
   	  	function checkbt(){
   	  		var updateNewsId = document.getElementById("updateNewsId");
   	  		//var updatebt = document.getElementById("updatebt");
			if(updateNewsId.value.length<=0){
				alert("请选择要修改的新闻");
				//window.confirm("请选择要删除的公告");
				//updatebt.readyState=false;
			}
   	  	}
	</script>
	</head>
	<body>
	<br>
		<h2>
			站点新闻信息
		</h2>
		<div id="wrapper">
			<div id="table-wrapper">
			<s:if test="%{newsFlag != 2}">
				<table
					summary="This table holds sample data to test sorting and paging. Please feel free to sort colums by cicking their headers and see all data by clicking at the pager.">
					<caption class="ui-state-highlight ui-corner-all">
						站点新闻信息
					</caption>
					<thead>
						<tr>
							<th class="ui-table-asc ui-state-active ui-table-number"
								style="min-width: 6em;">
								<a href="#server_site_order">新闻编号</a>
							</th>
							<th class="ui-table-text" style="min-width: 10em;">
								<a href="#server_site_order">发布者</a>
							</th>
							<th class="ui-table-text" style="min-width: 10em;">
								<a href="#server_site_order">新闻标题</a>
							</th>
							<th class="ui-table-text" style="min-width: 10em;">
								<a href="#server_site_order">新闻内容</a>
							</th>
							<th class="ui-table-date-de" style="min-width: 10em;">
								<a href="#server_site_order">发布时间</a>
							</th>
							<s:if test="%{newsFlag != 3}">
							<th class="ui-table-text" style="min-width: 10em;">
								<a href="#server_site_order">操作</a>
							</th>
							</s:if>
						</tr>
					</thead>
					<tbody>
					<s:iterator value="%{#request.newsList}" id="s">
						<tr>
							<td>
								<s:property value='#s.newsId' />
							</td>
							<td>
								<s:property value='#s.newsPublisher' />
							</td>
							<td>
								<s:property value='#s.newsTitle' />
							</td>
							<td>
								<s:property value='#s.newsContent' />
							</td>
							<td>
								<s:property value='#s.publishDate' />
							</td>
							<td>
								<s:if test="%{newsFlag == 0}">
								<a style="text-decoration:none;" onclick="toUpdateNews('<s:property value='#s.newsId' />','<s:property value='#s.newsTitle' />','<s:property value='#s.newsContent' />');"><font color=red>修改</font></a>
								</s:if>
								<s:if test="%{newsFlag == 1}">
								<a style="text-decoration:none;" href="dealNewsdeleteNews.action?newsVo.newsId=<s:property value='#s.newsId' />">删除</a>
								</s:if>
							</td>
							
						</tr>
						</s:iterator>
					</tbody>
				</table>
				</s:if>
				<s:if test="%{newsFlag == 0}">
				<form action="dealNewsupdateNews.action"  method="POST" name="form2">
				<br>
				<div><hr></div>
				<div><b>修改新闻</b></div>
				<br>
				<div>新闻编号:</div>
				<div><input name="newsVo.updateNewsId" id="updateNewsId" readonly></div>
				<div>新闻标题:</div>
				<div><textarea name="newsVo.updateNewsTitle" id="updateNewsTitle" rows="2" cols="50" ></textarea></div>
				<div>新闻内容:</div>
				<div><textarea name="newsVo.updateNewsContent" id="updateNewsContent" rows="5" cols="50"></textarea></div>
				<span>
					<input type="submit" name="save" value="确定" id="updatebt" onclick="checkbt();"/>
				</span>
				</form>
				</s:if>
				
				<s:if test="%{newsFlag == 2}">
				<form action="dealNewsaddNews.action"  method="POST" name="form1">
				<br>
				<div><hr></div>
				<div><b>发布新闻</b></div>
				<br>
				<div>新闻标题:</div>
				<div><textarea name="newsVo.newsTitle" rows="2" cols="50"></textarea></div>
				<div>新闻内容:</div>
				<div><textarea name="newsVo.newsContent" rows="5" cols="50"></textarea></div>
				<span>
					<input type="submit" name="save" value="发布" />
				</span>
				</form>
				</s:if>
			</div>
		</div>
	</body>
</html>
