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



</head>

<body class="content1">
	<div class="header">
		<h1 class="page-title">山财大二手交易-修改商品</h1>
	</div>

	<ul class="breadcrumb">
		<li><a href="<%=basePath %>product/getAllProduct">商品管理</a> <span
			class="divider">/</span></li>
		<li class="active">修改商品</li>
	</ul>

	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span12"></div>

			<form method="post" action="<%=basePath%>product/updateProduct"
				enctype="multipart/form-data">


				<div class="well">
					<div class="tab-pane active in">
						<input type="hidden" name="id" value="${product.id }" />
						<table align="center">
							<tr>
								<td><label><font color="red">*</font>商品名称：</label></td>
								<td><input type="text" name="pname"
									value="${product.pname }" onblur="checkpName()" /></td>
							</tr>
							<tr>
								<td><label><font color="red">*</font>商品价格：</label></td>
								<td><input type="text" name="pprice"
									value="${product.pprice }" onblur="checkpPrice()" /></td>
							</tr>
							<tr>
								<td><label><font color="red">*</font>商品数量：</label></td>
								<td><input type="text" name="pcount"
									value="${product.pcount }" onblur="checkpCount()" /></td>
							</tr>
							<tr>
								<td><label><font color="red">*</font>商品规格：</label></td>
								<td><input type="text" name="pstandard"
									value="${product.pstandard }" onblur="checkpStandard()" /></td>
							</tr>
							<tr>
								<td><label><font color="red">*</font>商品描述：</label></td>
								<td><textarea rows="10" cols="30" name="pdesc"
										onblur="checkpDesc()">${product.pdesc}</textarea></td>
							</tr>
							<tr>
								<td><label>商品图片信息：</label></td>
								<td><input type="file" name="file" /></td>
							</tr>
							<tr>
								<td><label>商品类别：</label></td>
								<td><select name="ptype">
										<option value="1"
											<c:if test="${product.ptype=='1' }">selected="true"</c:if>>服装鞋包</option>
										<option value="2"
											<c:if test="${product.ptype=='2' }">selected="true"</c:if>>手机数码</option>
										<option value="3"
											<c:if test="${product.ptype=='3' }">selected="true"</c:if>>美妆饰品</option>
										<option value="4"
											<c:if test="${product.ptype=='4' }">selected="true"</c:if>>运动户外</option>
										<option value="5"
											<c:if test="${product.ptype=='5' }">selected="true"</c:if>>图书资料</option>
										<option value="6"
											<c:if test="${product.ptype=='6' }">selected="true"</c:if>>其他</option>
								</select></td>
							</tr>
							<tr>
								<td>
									<div class="btn-toolbar">
										<input type="submit" class="btn btn-primary" value="保存 "
											style="background: #dea32c;" onclick="savePro()"> <a
											href="<%=basePath%>product/getAllProduct" class="btn">取消</a>
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
