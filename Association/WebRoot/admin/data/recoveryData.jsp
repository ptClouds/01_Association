<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>数据恢复</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript">
		function goTo(){
			var choice =  document.getElementsByName("backData");
			var fileName = document.getElementById("fileName");
			if (choice[0].checked){
				document.backForm.action = "backupdataResume.action?fileName="+fileName.value;
			}else{
				 return;
			
			}
			document.backForm.submit();
		}
	</script>
  </head>
  <body>
  <br><br><br><br><br><br>
  <center>
    <form action="" method="post" name="backForm" id="backForm" >
    	<input type='radio' name="backData"    checked>还原数据库
    	<br><br>
    	<input type="file" id="fileName" name="fileName" value="选择文件" >
    	<br>
    	<br>
    	<button onClick="goTo()" title='点击操作'> 开 始 </button>
    		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    	<input type="reset" value="重 设"/>
    </form> 
    <br> 
     </center>
  </body>
</html>
