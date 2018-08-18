<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">

<title>添加商品</title>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>js/bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/theme.css">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>js/bootstrap/css/bootstrap-datetimepicker.min.css">
<link rel="stylesheet"
	href="<%=basePath%>js/font-awesome/css/font-awesome.css">
<script src="<%=basePath%>js/jquery-1.7.2.min.js" type="text/javascript"></script>
<script src="<%=basePath%>js/bootstrap/js/bootstrap.min.js"></script>
<script
	src="<%=basePath%>js/bootstrap/js/bootstrap-datetimepicker.min.js"></script>
<script
	src="<%=basePath%>js/bootstrap/js/bootstrap-datetimepicker.zh-CN.js"></script>
<script type="text/javascript" src="<%=basePath%>js/product/product.js"></script>
<script type="text/javascript">
function checkProName(){
	var pname=$("input[name='pname']").val();
	if(pname==""){
		alert("商品名称不能为空");
		return false;
	}
	var url='<%=basePath%>'+'product/checkProduct?pname='+pname;
	$.get(url,function(data){
		if('success'==data.result){
			//alert("商品名称可以使用");
		}else{
			alert("商品名称已存在，请重新填写");
			$("input[name='pname']").val("");
		}
	});
}
</script>
</head>

<body class="content1">
	<div class="header">
		<h1 class="page-title">山财大二手交易-添加商品</h1>
	</div>

	<ul class="breadcrumb">
		<li><a href="<%=basePath %>product/getAllProduct">商品管理</a> <span
			class="divider">/</span></li>
		<li class="active">添加商品</li>
	</ul>

	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span12"></div>

			<form method="post" action="<%=basePath%>product/addProduct"
				enctype="multipart/form-data">
				<div class="well">
					<div class="tab-pane active in">
						<table align="center">
							<tr>
								<td><label><font color="red">*</font>商品名称： </label></td>
								<td><input type="text" name="pname" maxlength="32"
									onblur="checkProName()" /></td>
							</tr>
							<tr>
								<td><label><font color="red">*</font>商品价格： </label></td>
								<td><input type="text" name="pprice"  />
								</td>
							</tr>
							<tr>
								<td><label><font color="red">*</font>商品数量： </label></td>
								<td><input type="text" name="pcount" maxlength="10"
									onblur="checkpCount()" /></td>
							</tr>
							<tr>
								<td><label><font color="red">*</font>商品规格： </label></td>
								<td><input type="text" name="pstandard" maxlength="32"
									onblur="checkpStandard()" /></td>
							</tr>
							<tr>
								<td><label><font color="red">*</font>商品描述： </label></td>
								<td><textarea rows="6" cols="20" name="pdesc"
										maxlength="256" onblur="checkpDesc()"></textarea></td>
							</tr>
							<tr>
								<td><label>商品类型： </label></td>
								<td><select name="ptype">
										<option value="1">服装鞋包</option>
										<option value="2">手机数码</option>
										<option value="3">美妆饰品</option>
										<option value="4">图书资料</option>
										<option value="5">运动户外</option>
										<option value="6">其他</option>
								</select></td>
							</tr>

							<tr>
								<td><label> 商品图片： </label></td>
								<td><input type="file" name="file" /></td>
							</tr>
							<%-- <tr>
								<td>
									<div style="color: red">${msg}</div>
								</td>
							</tr> --%>
							<tr>
							<td>
								<div class="btn-toolbar" align="center">
									<input type="submit" class="btn btn-primary"
										style="background: #dea32c;" value="保存 " onclick="savePro()">
                                    <a href="<%=basePath %>product/getAllProduct" class="btn">取消</a>
								</div>
							</td>
							</tr>
						</table>
					</div>

				</div>
			</form>
		</div>
	</div>
</body>
</html>
