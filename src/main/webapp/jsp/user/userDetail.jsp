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

<title>用户基本信息</title>

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
<script type="text/javascript">
function del(id){
	var userName=$("#"+id).parent().find('td').eq(0).text().trim();
	alert(userName);
	var flag=confirm("确定要删除[ "+userName+" ]的信息吗？");
	if(flag){
	  var url='<%=basePath%>user/delUser?id='+id;
	    $.get(url,function(data){
			if ('success' == data.result) {
				alert('删除成功');
				$("#"+id).parent().remove();
				//window.location.reload();
			} else {
				alert('删除失败');
			}
		});
	}
	}
</script>
</head>

<body class="content1">
	<div class="header">
		<h1 class="page-title">山财大二手交易-修改用户信息</h1>
	</div>

	<ul class="breadcrumb">
		<li><a href="<%=basePath%>">首页</a> <span
			class="divider">/</span></li>
		<li class="active">个人信息</li>
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
								<td>${user.username }</td>
							</tr>
							<tr>
								<td><label><font color="red">*</font>密码:</label></td>
								<td>${user.userpass }</td>
							</tr>
							<tr>
								<td><label><font color="red">*</font>真实姓名：</label></td>
								<td>${user.realname }</td>
							</tr>
							<tr>
								<td><label><font color="red">*</font>学号：</label></td>
								<td>${user.sno }</td>
							</tr>
							<tr>
								<td><label><font color="red">*</font>手机号：</label></td>
								<td>${user.tel }</td>
							</tr>
							<tr>
								<td><label><font color="red">*</font>微信号：</label></td>
								<td>${user.wxaccount }</td>
							</tr>
							<tr>
								<td><label>学院：</label></td>
								<td>${user.department }</td>
							</tr>
							<tr>
								<td><label>专业：</label></td>
								<td>${user.major }
								</td>
							</tr>
							<tr>
								<td><label><font color="red">*</font>邮箱：</label></td>
								<td>${user.email }
								</td>
							</tr>
							<tr>
								<td><label>所在校区：</label></td>
								<td>
								<c:if test="${user.address=='燕山校区' }">燕山校区</c:if>
								<c:if test="${user.address=='舜耕校区' }">舜耕校区</c:if>
								<c:if test="${user.address=='明水校区' }">明水校区</c:if>
								<c:if test="${user.address=='圣井校区' }">圣井校区</c:if>
								<c:if test="${user.address=='莱芜校区' }">圣井校区</c:if>
								</td>
							</tr>
							<%-- <tr>
								<td><label>密码提示问题：</label></td>
								<td>${user.question }</td>
							</tr>
							<tr>
								<td><label>密码提示问题回答：</label></td>
								<td>${user.reply }</td>
							</tr> --%>
							<tr>
								<td id="${user.id }"><a
										href="<%=basePath%>user/getUser?id=${user.id}">编辑</a></td>
							</tr>
						</table>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
