function checkuserName(){
	var userName=$("input[name='username']").val();
	if(userName==""){
		alert("用户名不能为空");
		//$("input[name='username']")[0].focus();
		return false;
	}else if(userName.length<6){
		alert("用户名太短，不能小于6位");
		//$("input[name='username']")[0].focus();
		return false;
	}
}
function addUserName(address){
	var userName=$("input[name='username']").val();
	if(userName==""){
		alert("用户名不能为空");
		//$("input[name='username']")[0].focus();
		return false;
	}else if(userName.length<6){
		alert("用户名太短，不能小于6位");
		//$("input[name='username']")[0].focus();
		return false;
	}
	var url=address+'user/checkUserName?username='+userName;
	$.get(url,function(data){
		if('success'==data.result){
			alert("用户名可以使用");
		}else{
			alert("用户名已存在,请重新填写");
			$("input[name='username']").val("");
		}
	});
}

function checkuserPass(){
	var userPass=$("input[name='userpass']").val();
	if(userPass==""){
		alert("密码不能为空");
		//$("input[name='userpass']").focus();
		return false;
	}else if(userPass.length<6){
		alert("密码太短，不能小于6位");
		//$("input[name='userpass']").focus();
		return false;
	}
}

function checkrealname(){
	var realname=$("input[name='realname']").val();
	var myReg = /^[\u4e00-\u9fa5]+$/;
	if(realname==""){
		alert("真实姓名不能为空");
		//$("input[name='realname']").focus();
		return false;
	}else if(!myReg.test(realname)){
		alert("真实姓名输入值不是全部中文");
		return false;
	}
}

function checksno(){
	var sno=$("input[name='sno']").val();
	var reg="/^\d{11}$";
	if(sno==""){
		alert("学号不能为空");
		//$("input[name='sno']").focus();
		return false;
	}else if(!reg.test(sno)){
		alert("您输入的学号无效，请重新输入");
		//$("input[name='sno']").focus();
		return false;
	}
}

function checktel(){
	var tel=$("input[name='tel']").val();
	var myreg = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/; 
	if(tel.length==0||tel.length!=11){
		alert("请输入手机号码");
		//$("input[name='tel']").focus();
		return false;
	}else if(!myreg.test(tel)){
		alert("请输入有效的手机号码");
		//$("input[name='tel']").focus();
		return false;
	}
}

function checkwx(){
	var wx=$("input[name='wxaccount']").val();
	if(wx.length==0){
		alert("请输入微信号");
		//$("input[name='wxaccount']").focus();
		return false;
	}
}

function checkEmail(){
	var email=$("input[name='email']").val();
	var reg=/^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/ ;
	if(email.length==0){
		alert("请输入邮箱账号");
		//$("input[name='email']").focus();
		return false;
	}else if(!reg.test(email)){
		alert("请输入有效邮箱账号");
		//$("input[name='email']").focus();
		return false;
	}
}

function saveUser(){
	checkuserName();
	//checkuserPass();
	checkrealname();
	checksno();
	checktel();
	checkwx();
	checkEmail();
}

