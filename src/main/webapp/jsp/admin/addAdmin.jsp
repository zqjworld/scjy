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

<title>添加管理员</title>

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
<script src="<%=basePath %>js/admin/admin.js" type="text/javascript"></script>

</head>

<body class="content1">
	<div class="header">
		<h1 class="page-title">山财大二手交易-添加管理员</h1>
	</div>

	<ul class="breadcrumb">
		<li><a href="<%=basePath %>admin/getAllAdmin">管理员管理</a> <span
			class="divider">/</span></li>
		<li class="active">添加管理员</li>
	</ul>

	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span12"></div>

			<form method="post" action="<%=basePath%>admin/addAdmin">


				<div class="well">
					<div class="tab-pane active in">
						<table>
							<tr>
								<td><label><font color="red">*</font>管理员姓名：</label></td>
								<td><input type="text" name="adminName" maxlength="32"
									onblur="checkAdminName()"></td>
							</tr>
							<tr>
								<td><label><font color="red">*</font>管理员密码：</label></td>
								<td><input type="text" name="adminPass" maxlength="32"
									onblur="checkAdminPass()"></td>
							</tr>
							<tr>
								<td><label>管理员类型：</label></td>
								<td><select name="adminType">
										<option value="1">超级管理员</option>
										<option value="2">普通管理员</option>
								</select></td>
							</tr>
							<%-- <tr>
								<td>
									<div style="color: red">${msg}</div>
								</td>
							</tr> --%>
							<tr>
							<td>
								<div class="btn-toolbar">
									<input type="submit" class="btn btn-primary"
										style="background: #dea32c;" value="保存 " onclick="saveAdmin()"> <a
										href="<%=basePath%>admin/getAllAdmin" class="btn">取消</a>
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
