<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

<title>用户列表</title>
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>js/bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/theme.css">
<link rel="stylesheet"
	href="<%=basePath%>js/font-awesome/css/font-awesome.css">
<script src="<%=basePath%>js/jquery-1.7.2.min.js" type="text/javascript"></script>
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
		<h1 class="page-title">山财大二手交易-用户管理</h1>
	</div>
	<ul class="breadcrumb">
	<c:if test="${admin_name!='superadmin'}">
		<li><a href="<%=basePath%>/jsp/welcome.jsp">首页</a> <span
			class="divider">/</span></li>
			</c:if>
		<li class="active">用户列表</li>
	</ul>
	<div class="container-fluid">
		<div class="row-fluid">
			<form class="form-inline" method="post"
				action="<%=basePath%>user/findUserByuserName">
				<input class="input-xlarge" placeholder="用户名称..." name="username"
					type="text" value="${username}"> <input
					class="btn icon-search" type="submit" value="查询" /> <a
					class="btn btn-primary" href="<%=basePath%>user/toAddUser"
					style="background: #dea32c;"> <i class="icon-plus"></i> 添加用户
				</a>
			</form>

			<div class="well">
				<table class="table">
					<thead>
						<tr>
							<th>用户名</th>
							<th>密码</th>
							<th>真实姓名</th>
							<th>学号</th>
							<th>手机号</th>
							<th>微信号</th>
							<th>学院</th>
							<th>专业</th>
							<th>邮箱</th>
							<th>学校住址</th>
							<!-- <th>密码提示问题</th>
							<th>密码提示问题回答</th> -->
							<th colspan="2" style="width: 90px; text-align: left">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${!empty userList }">
							<c:forEach items="${userList}" var="user">
								<tr>
									<td>${user.username }</td>
									<td>${user.userpass }</td>
									<td>${user.realname }</td>
									<td>${user.sno }</td>
									<td>${user.tel }</td>
									<td>${user.wxaccount }</td>
									<td>${user.department }</td>
									<td>${user.major }</td>
									<td>${user.email }</td>
									<td>${user.address }</td>
									<%-- <td>${user.question }</td>
									<td>${user.reply }</td> --%>
									<td id="${user.id }"><a
										href="<%=basePath%>user/getUser?id=${user.id}">编辑</a> <a
										href="javascript:del('${user.id }')">删除</a></td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>

			</div>
		</div>
	</div>
</body>
</html>
