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

<title>用户注册</title>

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
<script src="<%=basePath %>js/user/user.js" type="text/javascript"></script>
</head>

<body class="content1">
	<div class="header">
		<h1 class="page-title">山财大二手交易-用户注册</h1>
	</div>

	<ul class="breadcrumb">
		<li><a href="<%=basePath %>">Home</a> <span class="divider">/</span>
		</li>
		<li class="active">用户注册</li>
	</ul>

	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span12"></div>

			<form method="post" action="<%=basePath%>user/registerUser">


				<div class="well">
					<div class="tab-pane active in">
						<table align="center">
							<tr>
								<td><label><font color="red">*</font>用户名：</label></td>
								<td><input type="text" name="username" maxlength="32"
									 onblur="addUserName('<%=basePath%>')" /></td>
							</tr>
							<tr>
								<td><label><font color="red">*</font>密码:</label></td>
								<td><input type="password" name="userpass" maxlength="32"
									 /></td>
							</tr>
							<tr>
								<td><label><font color="red">*</font>真实姓名：</label></td>
								<td><input type="text" name="realname" maxlength="32"
									onblur="checkrealname()" /></td>
							</tr>
							<tr>
								<td><label><font color="red">*</font>学号：</label></td>
								<td><input type="text" name="sno" maxlength="32"
									onblur="checksno()" /></td>
							</tr>
							<tr>
								<td><label><font color="red">*</font>手机号：</label></td>
								<td><input type="text" name="tel" maxlength="32"
									onblur="checktel()" /></td>
							</tr>
							<tr>
								<td><label><font color="red">*</font>微信号：</label></td>
								<td><input type="text" name="wxaccount" onblur="checkwx()" />
								</td>
							</tr>
							<tr>
								<td><label>学院：</label></td>
								<td><input type="text" name="department" /></td>
							</tr>
							<tr>
								<td><label>专业：</label></td>
								<td><input type="text" name="major" /></td>
							</tr>
							<tr>
								<td><label><font color="red">*</font>邮箱：</label></td>
								<td><input type="text" name="email" onblur="checkEmail()" />
								</td>
							</tr>
							<tr>
								<td><label>所在校区：</label></td>
								<td><select name="address">
										<option value="燕山校区">燕山校区</option>
										<option value="舜耕校区">舜耕校区</option>
										<option value="明水校区">明水校区</option>
										<option value="圣井校区">圣井校区</option>
										<option value="莱芜校区">莱芜校区</option>
								</select></td>
							</tr>
							<!-- <tr>
								<td><label>密码提示问题：</label></td>
								<td><input type="text" name="question" /></td>
							</tr>
							<tr>
								<td><label>密码提示问题回答：</label></td>
								<td><input type="text" name="reply" /></td>
							</tr> -->
						<%-- 	<tr>
								<div style="color: red">${msg}</div>
							</tr> --%>
							<tr>
								<td>
									<div class="btn-toolbar">
										<input type="submit" class="btn btn-primary"
											style="background: #dea32c;" onclick="saveUser()" value="保存 "> <a
											href="<%=basePath%>" class="btn">取消</a>
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
