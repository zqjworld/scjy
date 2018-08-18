function checkLogin(){
	var adminName= $("input[name='adminName']").val();
	var adminPass=$("input[name='adminPass']").val();
	if(adminName==""){
		alert("管理员姓名不能为空！");
		$("input[name='adminName']").focus();
		return false;
	}
	if(adminPass==""){
		alert("管理员密码不能为空！");
		$("input[name='adminPass']").focus();
		return false;
	}
}