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

		<title>新添管理员</title>

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

	</head>
<script type="text/javascript">
	//生成验证码并验证
	var code ; //在全局 定义验证码
	function createCode(){
		
		//alert("code");
		code = "";
		var codeLength = 4;//验证码的长度
		var checkCode = document.getElementById("getAdminId");
		checkCode.value = "";
		
		var selectChar = new Array(0,1,2,3,4,5,6,7,8,9,'a','b','c','d','e','f','g','h','j','k','l','m','n','p','q','r','s','t','u','v','w','x','y','z');
		
		for(var i=0;i<codeLength;i++) {
		   var charIndex = Math.floor(Math.random()*34);
		   code +=selectChar[charIndex];
		}
		if(code.length != codeLength){
		   createCode();
		}
		checkCode.value = code;
		var img = document.getElementById("img1");
		var span = document.getElementById("vadminid");
		img.src = "./images/validate/valid.gif";
  	  	img.style.display='';
  	  	span.innerHTML = " ";
	}
	
	function notchinese(str){
		var img = document.getElementById("img1");
		var span = document.getElementById("vadminid");
		if (str.length<1) {
			img.src = "./images/validate/invalid.gif";
   	  	    img.style.display='';
   	  	    span.innerHTML = "管理员编号不能为空！";
   	  	    span.style.color="red";
   	  	    document.form1.getAdminId.focus();
   	  	}else if(str.length>6) {
   	  	    img.src = "./images/validate/invalid.gif";
   	  	    img.style.display='';
   	  	    span.innerHTML = "请输入6位内编号！";
   	  	    span.style.color="red";
   	  	    document.form1.getAdminId.focus();
   	  	}else {
   	  		var reg=/[^A-Za-z0-9]/g
	  		if (reg.test(str)){
	  		img.src = "./images/validate/invalid.gif";
  	  	    	img.style.display='';
  	  	   		span.innerHTML = "登录号由数字或字母或其组成组成！";
  	  	   		span.style.color="red";
	  			return (false);
	  		}else{
	  			img.src = "./images/validate/valid.gif";
  	  	    	img.style.display='';
  	  	    	span.innerHTML = " ";
				return(true);    
			}
   	  	}
	}
	
  	function validLogoName (value) {
		var img = document.getElementById("img2");
		var span = document.getElementById("vadminname");
		if (value.length<1) {
			img.src = "./images/validate/invalid.gif";
   	  	    img.style.display='';
   	  	    span.innerHTML = "名称不能为空！";
   	  	    span.style.color="red";
   	  	    document.form1.getAdminId.focus();
   	  	}else if(value.length>6) {
   	  	    img.src = "./images/validate/invalid.gif";
   	  	    img.style.display='';
   	  	    span.innerHTML = "请输入6位内名称！";
   	  	    span.style.color="red";
   	  	    document.form1.getAdminId.focus();
   	  	}else {
  			img.src = "./images/validate/valid.gif";
  	    	img.style.display='';
  	    	span.innerHTML = " ";
			return(true);    
   	  	}
   	 }	
   	  	
   	  	function validType() {
			var img = document.getElementById("img4");
			var span = document.getElementById("type");
	  		img.src = "./images/validate/valid.gif";
	  	    img.style.display='';
	  	    span.innerHTML = " ";
			return(true);    
   	  	}
   	  	
   	  	function testPassword2(passwd) {
   	  		var strVerdict = getPasswordStrengthVerdict(passwd);
   	  		var img = document.getElementById("img3");
			var span = document.getElementById("vpass");
			if (passwd.length<1) {
				img.src = "./images/validate/invalid.gif";
	   	  	    img.style.display='';
	   	  	    span.innerHTML = "名称不能为空！";
	   	  	    span.style.color="red";
	   	  	    document.form1.getAdminId.focus();
	   	  	}else {
	  			img.src = "./images/validate/valid.gif";
	  	    	img.style.display='';
	  	    	span.innerHTML = "(密码强度是 " + strVerdict + ")";
				return(true);    
	   	  	}
			
			
			/*if(strVerdict=="很弱"){
				span.innerHTML = "(密码强度是 " + strVerdict + ")";
				span.style.color="red";
			}else if(strVerdict=="弱"){
				span.innerHTML = "(密码强度是 " + strVerdict + ")";
				span.style.color=="red";
			}else if(strVerdict=="中等"){
				span.innerHTML = "(密码强度是 " + strVerdict + ")";
				span.style.color="blue";
			}else if(strVerdict=="强"){
				span.innerHTML = "(密码强度是 " + strVerdict + ")";
				span.style.color="yellow";
			}else{
				span.innerHTML = "(密码强度是 " + strVerdict + ")";
				span.style.color="red";
			}*/
		}
		function getPasswordStrengthVerdict(passwd)	{
			var intScore   = 0
			var strVerdict = "弱"
			
			// PASSWORD LENGTH
			if (passwd.length<5)                         // length 4 or less
			 intScore = (intScore+3)
			else if (passwd.length>4 && passwd.length<8) // length between 5 and 7
			 intScore = (intScore+6)
			else if (passwd.length>7 && passwd.length<16)// length between 8 and 15
			 intScore = (intScore+12)
			else if (passwd.length>15)                    // length 16 or more
			intScore = (intScore+18)
			
			// LETTERS (Not exactly implemented as dictacted above because of my limited understanding of Regex)
			if (passwd.match(/[a-z]/))                              // [verified] at least one lower case letter
			  intScore = (intScore+1)
			if (passwd.match(/[A-Z]/))                              // [verified] at least one upper case letter
			  intScore = (intScore+5)
			
			// NUMBERS
			if (passwd.match(/\d+/))                                 // [verified] at least one number
			   intScore = (intScore+5)
			
			if (passwd.match(/(.*[0-9].*[0-9].*[0-9])/))             // [verified] at least three numbers
				intScore = (intScore+5)
			
			// SPECIAL CHAR
			if (passwd.match(/.[!,@,#,$,%,^,&,*,?,_,~]/))            // [verified] at least one special character
				intScore = (intScore+5)
																 // [verified] at least two special characters
			if (passwd.match(/(.*[!,@,#,$,%,^,&,*,?,_,~].*[!,@,#,$,%,^,&,*,?,_,~])/))
				intScore = (intScore+5)
			
			// COMBOS
			if (passwd.match(/([a-z].*[A-Z])|([A-Z].*[a-z])/))        // [verified] both upper and lower case
				intScore = (intScore+2)
			
			if (passwd.match(/(\d.*\D)|(\D.*\d)/))                    // [FAILED] both letters and numbers, almost works because an additional character is required
				intScore = (intScore+2)
																  // [verified] letters, numbers, and special characters
			if (passwd.match(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/))
				intScore = (intScore+2)
			
			if(intScore < 16)
			{
			   strVerdict = "很弱"
			}
			else if (intScore > 15 && intScore < 20)
			{
			   strVerdict = "弱"
			}
			else if (intScore > 19 && intScore < 25)
			{
			   strVerdict = "中等"
			}
			else if (intScore > 24 && intScore < 30)
			{
			   strVerdict = "强"
			}
			else
			{
			   strVerdict = "相当强"
			}
			return strVerdict;
		
		}
	</script>
	<body>
		<center>
			<div>
				<br>
				<br>
				<form action="toadminaddAdminInfo.action" method="POST" name="form1">
					<table style="BORDER-COLLAPSE: collapse" borderColor=#66FF33
						height=260 cellPadding=1 width=550 align=center border=2>
						<caption style="background-color: #6sFF66">
							<b>添加管理员</b>
						</caption>
						<tr >
							<td align="left">
								管理员编号:
							</td>
							<td >
								<div>
								<span>
								<input name="adminVo.adminId" id="getAdminId" maxlength="6" size="20" style="background:url(./images/login/username_bg.gif) left no-repeat #FFF; border:1px #ccc solid;height: 20px; font-family:Arial, Helvetica, sans-serif; font-size:14px; font-weight: 800; margin:0; padding-left: 24px;" onblur="notchinese(this.value);">
								</span>
								</div>
							</td>
							<td><img src="./images/validate/invalid.gif" id="img1"
								style="display: none" />
								<span id="vadminid"></span><input type="button" onClick="createCode();" value="自动获取" />
							</td>
						</tr>
						<tr >
							<td align="left">
								管理员姓名:
							</td>
							<td>
								<div>
								<span>
								<input name="adminVo.adminName" maxlength="6" size="20" style="background:url(./images/login/username_bg.gif) left no-repeat #FFF; border:1px #ccc solid;height: 20px; font-family:Arial, Helvetica, sans-serif; font-size:14px; font-weight: 800; margin:0; padding-left: 24px;" onblur="validLogoName(this.value);">
								</span>
								</div>
							</td>
							<td>
								<img src="./images/validate/invalid.gif" id="img2"
								style="display: none" />
								<span id="vadminname"></span>
							</td>
						</tr>
						<tr>
							<td align="left">
								设置密码:
							</td>
							<td>
								<div><span ><input type="password" id="passWord" value="123" name="adminVo.adminPass" maxlength="16" size="20" style="background:url(./images/login/password_bg.gif) left no-repeat #FFF; border:1px #ccc solid;height: 20px; font-family:Arial, Helvetica, sans-serif; font-size:14px; font-weight: 800; margin:0; padding-left: 24px;" onblur="testPassword2(this.value);">
								</span><span>(默认为123)</span></div>
							</td>
							<td>
								<img src="./images/validate/invalid.gif" id="img3"
								style="display: none" />
								<span id="vpass"></span>
							</td>
						</tr>
						<tr >
							<td align="left">
								管理员类型:
							</td>
							<td>
								<select name="adminVo.adminType" size="1" style="width:180px" onblur="validType();">
												<option value="0" onClick="validType();" id="adminVo.adminType" >
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;学校管理员
												</option>
												<option value="1" onClick="validType();" id="adminVo.adminType">
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;站点管理员
												</option>
								</select>
							</td>
							<td>
								<img src="./images/validate/invalid.gif" id="img4"
									style="display: none" />
								<span id="type">请您确定是否选择了管理员类型</span>
							</td>
						</tr>
						<tr>
							<td align="left">
								操作:
							</td>
							<td>
								<input type="submit" name="update" value="添加" />
							</td>
							<td>
								<input type="reset" name="reset" value="取消" />
							</td>
						</tr>
						<tr>
							<td colspan="2" align="center">${errorInfo }
							</td>
						</tr>
					</table>

				</form>
			</div>
		</center>


	</body>
</html>
