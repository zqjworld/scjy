

function checkpPrice(){
	var pprice=$("input[name='pprice']").val();
	var reg = /^[0-9]*$/;
	if(pprice==""){
		alert("商品价格不能为空");
//		$("input[name='pprice']").focus();
		return false;
	}else if(!reg.test(pprice)){
		alert("您输入的商品价格不符合要求，请重新输入");
//		$("input[name='pprice']").focus();
		return false;
	}
}
function checkpCount(){
	var pcount=$("input[name='pcount']").val();
	var reg = "^\\d+$";
	if(pcount==""){
		alert("商品数量不能为空");
//		$("input[name='pcount']").focus();
		return false;
	}else if(!reg.test(pcount)){
		alert("您输入的商品数量不符合要求，请重新输入");
//		$("input[name='pcount']").focus();
		return false;
	}
}
function checkpStandard(){
	var pstandard=$("input[name='pstandard']").val();
	if(pstandard==""){
		alert("商品规格不能为空");
//		$("input[name='pstandard']").focus();
		return false;
	}else if(pstandard.length>32){
		alert("商品规格输入的长度过长，请重新输入");
//		$("input[name='pstandard']").focus();
		return false;
	}
}
function checkpDesc(){
	var pdesc=$("input[name='pdesc']").val();
	if(pdesc==""){
		alert("商品描述不能为空");
//		$("input[name='pdesc']").focus();
		return false;
	}
}

function savePro(){
	checkpName();
	//checkpPrice();
	checkpCount();
	checkpStandard();
	checkpDesc();
}
