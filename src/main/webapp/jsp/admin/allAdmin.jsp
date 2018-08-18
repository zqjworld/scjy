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

		<title>管理员列表</title>
		<link rel="stylesheet" type="text/css"
			href="<%=basePath%>js/bootstrap/css/bootstrap.css">
		<link rel="stylesheet" type="text/css"
			href="<%=basePath%>css/theme.css">
		<link rel="stylesheet"
			href="<%=basePath%>js/font-awesome/css/font-awesome.css">
		<script src="<%=basePath%>js/jquery-1.7.2.min.js"
			type="text/javascript"></script>
		<script type="text/javascript">
		function del(id){
			var adminName=$("#"+id).parent().find('td').eq(0).text().trim();
			//alert(adminName);
			var flag=confirm("确定要删除[ "+adminName+" ]的信息吗？");
			if(flag){
			  var url='<%=basePath%>admin/delAdmin?id='+id;
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
			<h1 class="page-title">
				山财大二手交易-管理员管理
			</h1>
		</div>
		<ul class="breadcrumb">
		<c:if test="${admin_name!='superadmin'}">
			<li>
				<a href="<%=basePath%>/jsp/welcome.jsp">首页</a>
				<span class="divider">/</span>
			</li>
		</c:if>
			<li class="active">
				管理员列表
			</li>
		</ul>
		<div class="container-fluid">
			<div class="row-fluid">
				<form class="form-inline" method="post"
					action="<%=basePath%>admin/findAdminByadminName">
					<input class="input-xlarge" placeholder="管理员名称..." name="adminName"
						type="text" value="${adminName}">
					<input class="btn icon-search" type="submit" value="查询" />
					<a class="btn btn-primary" href="<%=basePath%>admin/toAddAdmin" style="background: #dea32c;">
						<i class="icon-plus"></i> 添加管理员
					</a>
				</form>

				<div class="well">
					<table class="table">
						<thead>
							<tr>
								<th>
									管理员名称
								</th>
								<th>
									管理员密码
								</th>
								<th>
									管理员类型
								</th>
								<th colspan="2" style="width: 90px;text-align:left">
									操作
								</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${!empty adminList }">
				<c:forEach items="${adminList}" var="admin">
					<tr>
						<td>${admin.adminName }</td>
						<td>${admin.adminPass }</td>
						<td>
						<c:if test="${admin.adminType=='1' }">超级管理员</c:if>
						<c:if test="${admin.adminType=='2' }">普通管理员</c:if>
						</td>
						<td id="${admin.id }"><a href="<%=basePath%>admin/getAdmin?id=${admin.id}">编辑</a>
							<a href="javascript:del('${admin.id }')">删除</a></td>
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
