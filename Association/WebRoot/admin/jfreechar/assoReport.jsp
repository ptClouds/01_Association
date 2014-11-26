<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>视频点播统计图</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <br>
   <center>
    <table>
    	<caption><b>社团统计图</b></caption>
    	<tr height="30px" align="center">
    		<td>
    			社团统计饼形图
    		</td>
    		<td>
    			社团统计柱形图
    		</td>
    	</tr>
    	<tr>
    		<td>
    		<img src="./jfreechar/bingtu.jpg" />
    		</td>
    		<td>
    		 <img src="./jfreechar/zhuxing.jpg" />
    		</td>
    	</tr>
    </table>
    </center>
  </body>
</html>
