<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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

<title>登录</title>
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>js/bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/theme.css">
<link rel="stylesheet"
	href="<%=basePath%>js/font-awesome/css/font-awesome.css">
<script src="<%=basePath%>js/jquery-1.7.2.min.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=basePath%>js/admin/login.js"></script>
<script>

			if (window != top) 
			top.location.href = location.href; 

		</script>

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
			</ul>
			<span class="brand"><font color="#FFF">欢迎登录</font></span>
		</div>
	</div>

	<div class="row-fluid">
		<div class="dialog">
			<div class="block">
				<p class="block-heading">管理员登录</p>
				<div class="block-body">
					<form method="post" action="<%=basePath%>/admin/login">
						<label> 用户名： </label> <input type="text" name="adminName"
							class="span12" maxlength="32"> <label> 密码： </label> <input
							type="password" name="adminPass" class="span12" maxlength="32">
							<a href="<%=basePath%>jsp/user/user_login.jsp">系统首页</a>
						<input type="submit" onclick="checkLogin()" class="btn btn-primary pull-right" value="登录"
							style="background: #dea32c;" />
						<div class="clearfix"></div>
						<div>${sessionScope.msg}</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
