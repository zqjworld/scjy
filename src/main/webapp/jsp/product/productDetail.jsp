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
<title>添加文章</title>
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
<script src="<%=basePath%>js/product/product.js" type="text/javascript"></script>
<script type="text/javascript">
function addCart(pid){
	var url='<%=basePath%>';
	url=url+"sorder/addSorder?id="+pid;
	//alert(url);
	  $.get(url,function(data){
			if ('success' == data.result) {
				alert('添加购物车成功');
				//window.location.reload();
			} else {
				alert('添加购物车失败');
			}
		});
}
function addforder(pid,uid){
	//var sName=$("#"+id).parent().find('td').eq(0).text().trim();
	//alert(pName);
	var url='<%=basePath%>';
	var flag=confirm("确定要提交订单吗？");
	if(flag){
	  url=url+'forder/addForderfrompid?pid='+pid+'&uid='+uid;
	 // alert(url);
	    $.get(url,function(data){
			if ('success' == data.result) {
				alert('提交成功');
				//$("#"+id).parent().remove();
				//window.location.reload();
			} else {
				alert('提交失败');
			}
		});
	}
}
</script>

</head>

<body class="content1">
	<div class="header">
		<h1 class="page-title">山财大二手交易-商品详情</h1>
	</div>

	<ul class="breadcrumb">
		<li><a href="<%=basePath %>product/getAllProduct">商品管理</a> <span
			class="divider">/</span></li>
		<li class="active">商品详情</li>
	</ul>

	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span12"></div>

			<form method="post" action="">
				<div class="well">
					<div class="tab-pane active in">
						<input type="hidden" name="id" value="${product.id }" />
						<table align="center">
							<tr>
								<td><label><font color="red">*</font>商品名称：</label></td>
								<td>${product.pname }</td>
							</tr>
							<tr>
								<td><label><font color="red">*</font>商品价格：</label></td>
								<td>${product.pprice }</td>
							</tr>
							<tr>
								<td><label><font color="red">*</font>商品数量：</label></td>
								<td>${product.pcount }</td>
							</tr>
							<tr>
								<td><label><font color="red">*</font>商品规格：</label></td>
								<td>${product.pstandard }</td>
							</tr>
							<tr>
								<td><label><font color="red">*</font>商品描述：</label></td>
								<td>${product.pdesc}</td>
							</tr>
							<tr>
								<td><label>商品图片信息：</label></td>
								<td>
								<%-- <img src="<%=basePath%>upload/${product.ppic}" style="width:200px;height:200px;" /> --%>
								<img src="<%=basePath%>upload/${product.ppic}" style="width:200px;height:200px;" /></td>
							</tr>
							<tr>
								<td><label>商品类别：</label></td>
								<td><c:if test="${product.ptype=='1' }">服装鞋包</c:if> <c:if
										test="${product.ptype=='2' }">手机数码</c:if> <c:if
										test="${product.ptype=='3' }">美妆饰品</c:if> <c:if
										test="${product.ptype=='4' }">运动户外</c:if> <c:if
										test="${product.ptype=='5' }">图书资料</c:if> <c:if
										test="${product.ptype=='6' }">其他</c:if>
								</td>
							</tr>
							<tr>
								<td>
								    <c:if test="${product.uid==sessionScope.userId }">
									<td id="${product.id }"><a
										href="<%=basePath%>product/getProduct?id=${product.id}">编辑</a>
										<a href="javascript:del('${product.id }','${product.ppic }')">删除</a></td>
									</c:if>
									<c:if test="${product.uid!=sessionScope.userId }">
									<td id="${product.id }">
									<a href="javascript:addCart('${product.id}')">加入购物车</a>
				                    <a href="javascript:addforder('${product.id}','${product.uid }')">提交订单</a>
									</c:if>
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
