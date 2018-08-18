function checkAdminName(){
	var adminName= $("input[name='adminName']").val();
	if(adminName==""){
		alert("管理员姓名不能为空！");
		$("input[name='adminName']").focus();
		return false;
	}
}

function checkAdminPass(){
	var adminPass=$("input[name='adminPass']").val();
	if(adminPass==""){
		alert("管理员密码不能为空！");
		$("input[name='adminPass']").focus();
		return false;
	}else if(adminPass.length<=6){
		alert("管理员的密码长度太短，请重新填写！");
		$("input[name='adminPass']").focus();
		return false;
	}
}

function saveAdmin(){
	checkAdminName();
	checkAdminPass();
}