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
		<base target="main" />
		<title>欢迎使用山财大二手交易平台</title>
		<link rel="stylesheet" type="text/css"
			href="<%=basePath%>js/bootstrap/css/bootstrap.css">
		<link rel="stylesheet" type="text/css"
			href="<%=basePath%>css/theme.css">
		<link rel="stylesheet"
			href="<%=basePath%>js/font-awesome/css/font-awesome.css">
		<script src="<%=basePath%>js/jquery-1.7.2.min.js"
			type="text/javascript"></script>
		<script src="<%=basePath%>js/bootstrap/js/bootstrap.js"></script>
		<style type="text/css">
#line-chart {
	height: 300px;
	width: 800px;
	margin: 0px auto;
	margin-top: 1em;
}

.brand {
	font-family: georgia, serif;
}

.brand .first {
	color: #ccc;
	font-style: italic;
}

.brand .second {
	color: #fff;
	font-weight: bold;
}
</style>
		<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
	</head>

	<!--[if lt IE 7 ]> <body class="ie ie6"> <![endif]-->
	<!--[if IE 7 ]> <body class="ie ie7 "> <![endif]-->
	<!--[if IE 8 ]> <body class="ie ie8 "> <![endif]-->
	<!--[if IE 9 ]> <body class="ie ie9 "> <![endif]-->
	<!--[if (gt IE 9)|!(IE)]><!-->
	<body class="">
		<!--<![endif]-->

		<div class="navbar">
			<div class="navbar-inner" style="background: #dea32c;">
				<ul class="nav pull-right">
					<li id="fat-menu" class="dropdown">
						<a href="#" role="button" class="dropdown-toggle"
							data-toggle="dropdown"> <i class="icon-user"></i>
							${admin_name} <i class="icon-caret-down"></i>
						</a>

						<ul class="dropdown-menu">
							<%-- <li>
								<a href="<%=basePath%>/sys/user/modifyPwd.jsp" tabindex="-1">修改密码</a>
							</li> --%>
							<li class="divider"></li>
							<!-- <li>
								<a tabindex="-1" class="visible-phone" href="#">Settings</a>
							</li> -->
							<li class="divider visible-phone"></li>
							<li>
								<a tabindex="-1" href="<%=basePath%>admin/logout" target="_top">Logout</a>
							</li>
						</ul>
					</li>

				</ul>
				<span class="brand"><font color="#FFF">欢迎使用山财大二手交易平台</font></span>
			</div>
		</div>

		<div class="sidebar-nav">
		<!-- 管理员、用户管理，只有超级管理员才有对管理员、用户管理的权限-->
		<c:if test="${admin_name=='superadmin'}">
		<a href="#error-menu1" class="nav-header collapsed"
						data-toggle="collapse"><i class="icon-briefcase"></i>管理员管理<i
						class="icon-chevron-up"></i> </a>
					<ul id="error-menu1" class="nav nav-list collapse">
						
								<li>
									<a href="<%=basePath%>/admin/getAllAdmin">管理员管理</a>
								</li>
					</ul>
					<a href="#error-menu2" class="nav-header collapsed"
						data-toggle="collapse"><i class="icon-briefcase"></i>用户管理<i
						class="icon-chevron-up"></i> </a>
					<ul id="error-menu2" class="nav nav-list collapse">
						
								<li>
									<a href="<%=basePath%>/user/getAllUser">用户管理</a>
								</li>
					</ul>
		</c:if>
		<!-- 商品管理  -->
					<a href="#error-menu3" class="nav-header collapsed"
						data-toggle="collapse"><i class="icon-briefcase"></i>商品管理<i
						class="icon-chevron-up"></i> </a>
					<ul id="error-menu3" class="nav nav-list collapse">
						
								<li>
									<a href="<%=basePath%>/product/getAllProduct">商品管理</a>
								</li>
					</ul>
					
					<a href="#error-menu4" class="nav-header collapsed"
						data-toggle="collapse"><i class="icon-briefcase"></i>购物车管理<i
						class="icon-chevron-up"></i> </a>
					<ul id="error-menu4" class="nav nav-list collapse">
						
								<li>
									<a href="<%=basePath%>/sorder/findAllSorder">购物车管理</a>
								</li>
							
					</ul>
					<a href="#error-menu5" class="nav-header collapsed"
						data-toggle="collapse"><i class="icon-briefcase"></i>订单管理<i
						class="icon-chevron-up"></i> </a>
					<ul id="error-menu5" class="nav nav-list collapse">
						
								<li>
									<a href="<%=basePath%>/forder/findAllForder">订单管理</a>
								</li>
							
					</ul>
		</div>
		<div class="content">
			<iframe name="main" height="600px" width="100%" scrolling="auto"
				frameborder="0" src="jsp/welcome.jsp">

			</iframe>
		</div>
		
	</body>
</html>