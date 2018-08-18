<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page isELIgnored="false"%>
<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>欢迎使用后台管理系统</title>
    
	<link rel="stylesheet" type="text/css"
			href="<%=basePath%>js/bootstrap/css/bootstrap.css">
		<link rel="stylesheet" type="text/css"
			href="<%=basePath%>css/theme.css">
		<link rel="stylesheet"
			href="<%=basePath%>js/font-awesome/css/font-awesome.css">
		<script src="<%=basePath%>js/jquery-1.7.2.min.js"
			type="text/javascript"></script>

  </head>
  
 <body class="content1">
		<div class="header">
			<h1 class="page-title"> 
				主页
			</h1>
		</div>
		<ul class="breadcrumb">
			
			<li class="active">
				Home
			</li>
		</ul>
		<div class="container-fluid">
			<div class="row-fluid">
	<%-- 			<p>${sessionScope.userId }</p> --%>
				
					<div class="span12">
							<div class="hero-unit" style="margin-top:200px;">
							<h1 style="padding-left:100px;">
								欢迎使用山财大二手交易平台<br />后台管理系统！
							</h1>
				<%-- <%=request.getSession().getAttribute("userId") %> --%>
							</div>
					</div>
				
				
			</div>
		</div>
	</body>
</html>
