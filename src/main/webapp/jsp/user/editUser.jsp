<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	 String userType=request.getSession().getAttribute("userType").toString();
	 String url=userType=="1"?basePath:(basePath+"user/userDetail");
	 System.out.println(url);
	// System.out.println(userType);
%>

<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">

<title>修改管理员</title>

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
		<h1 class="page-title">山财大二手交易-修改用户信息</h1>
	</div>

	<ul class="breadcrumb">
		<li><a href="<%=basePath%>user/getAllUser">用户列表</a> <span
			class="divider">/</span></li>
			<c:if test="${admin_name!='superadmin'}">
			<li><a href="<%=basePath%>user/userDetail">个人信息</a><span
			class="divider">/</span></li>
			</c:if>
		<li class="active">修改用户信息</li>
	</ul>

	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span12"></div>

			<form method="post" action="<%=basePath%>user/updateUser">


				<div class="well">
					<div class="tab-pane active in">
						<input type="hidden" name="id" value="${user.id }" />
						<table align="center">
							<tr>
								<td><label><font color="red">*</font>用户名：</label></td>
								<td><input type="text" name="username"
									value="${user.username }" onblur="checkuserName()" /></td>
							</tr>
							<tr>
								<td><label><font color="red">*</font>密码:</label></td>
								<td><input type="text" name="userpass"
									value="${user.userpass }" onblur="checkuserPass()" /></td>
							</tr>
							<tr>
								<td><label><font color="red">*</font>真实姓名：</label></td>
								<td><input type="text" name="realname"
									value="${user.realname }" onblur="checkrealname()" /></td>
							</tr>
							<tr>
								<td><label><font color="red">*</font>学号：</label></td>
								<td><input type="text" name="sno" value="${user.sno }"
									onblur="checksno()" /></td>
							</tr>
							<tr>
								<td><label><font color="red">*</font>手机号：</label></td>
								<td><input type="text" name="tel" value="${user.tel }"
									onblur="checktel()" /></td>
							</tr>
							<tr>
								<td><label><font color="red">*</font>微信号：</label></td>
								<td><input type="text" name="wxaccount"
									value="${user.wxaccount }" onblur="checkwx()" /></td>
							</tr>
							<tr>
								<td><label>学院：</label></td>
								<td><input type="text" name="department"
									value="${user.department }" /></td>
							</tr>
							<tr>
								<td><label>专业：</label></td>
								<td><input type="text" name="major" value="${user.major }" />
								</td>
							</tr>
							<tr>
								<td><label><font color="red">*</font>邮箱：</label></td>
								<td><input type="text" name="email" value="${user.email }" onblur="checkEmail()" />
								</td>
							</tr>
							<tr>
								<td><label>所在校区：</label></td>
								<td><select name="address">
										<option value="燕山校区"
											<c:if test="${user.address=='燕山校区' }">selected="true"</c:if>>燕山校区</option>
										<option value="舜耕校区"
											<c:if test="${user.address=='舜耕校区' }">selected="true"</c:if>>舜耕校区</option>
										<option value="明水校区"
											<c:if test="${user.address=='明水校区' }">selected="true"</c:if>>明水校区</option>
										<option value="圣井校区"
											<c:if test="${user.address=='圣井校区' }">selected="true"</c:if>>圣井校区</option>
										<option value="莱芜校区"
											<c:if test="${user.address=='莱芜校区' }">selected="true"</c:if>>莱芜校区</option>
								</select></td>
							</tr>
							<%-- <tr>
								<td><label>密码提示问题：</label></td>
								<td><input type="text" name="question"
									value="${user.question }" /></td>
							</tr>
							<tr>
								<td><label>密码提示问题回答：</label></td>
								<td><input type="text" name="reply" value="${user.reply }" />
								</td>
							</tr> --%>
							<tr>
								<td>
									<div class="btn-toolbar">
										<input type="submit" class="btn btn-primary"
											style="background: #dea32c;" value="保存 " onclick="saveUser()">
											
											<a href="<%=url%>" class="btn">取消</a>
											
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
