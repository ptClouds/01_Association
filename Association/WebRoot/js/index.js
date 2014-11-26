function AddDomain() {
		if(document.login.orgname.value!="" && document.login.Password.value!=""){
		var t=Math.random() * 100000000;
		document.login.action=document.login.action+"?token="+t;
		document.login.target="_blank";
        document.login.LoginName.value = document.login.orgname.value + "@" + "hnbc.com.cn";
		document.login.submit();
		}else{
			alert("\n      用户登录信息不完整！         \n\n");
			return false;
		}
	}
function EnterGo(){
	if(event.keyCode==13&&document.login.orgname.value!="" && document.login.Password.value!=""){
		AddDomain();
	}else{
		return false;
	}
}
function g(){
if(document.sfm.word.value!=""){
	var url = "http://www.baidu.com/baidu";
	document.sfm.ct.value = "2097152";
	document.sfm.target="_blank";
	document.sfm.action = url;
	document.sfm.submit();
	return true;
	}
}