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
		<title>订单详情页</title>
		<link rel="stylesheet" type="text/css"
			href="<%=basePath%>js/bootstrap/css/bootstrap.css">
		<link rel="stylesheet" type="text/css"
			href="<%=basePath%>css/tdeme.css">
		<link rel="stylesheet"
			href="<%=basePath%>js/font-awesome/css/font-awesome.css">
		<script src="<%=basePath%>js/jquery-1.7.2.min.js"
			type="text/javascript"></script>
	
	</head>

	<body class="content1" >
		<div class="header">
			<h1 class="page-title">
				山财大二手交易-订单详情
			</h1>
		</div>
		<ul class="breadcrumb">
			<li>
				<a href="<%=basePath%>">首页</a>
				<span class="divider">/</span>
			</li>
			<li class="active">
				订单详情
			</li>
		</ul>
		<div class="container-fluid">
			<div class="row-fluid">

				<div class="well">
					<table class="table" align="center">
						
						<tr>
						<td>商品名称</td>
						<td>${forder.pname }</td>
						</tr>
						<tr>
						<td>商品规格</td>
						<td>${forder.pcount } ${forder.pstandard }</td>
						</tr>
						<tr>						
						<td>商品价格</td>
						<td>${forder.pprice }</td>
						</tr>
					<%-- 	<tr>
						<td>商品类型</td>
						<td>
						<c:if test="${forder.ptype=='1' }">服装鞋包</c:if> 
						<c:if test="${forder.ptype=='2' }">手机数码</c:if> 
						<c:if test="${forder.ptype=='3' }">美妆饰品</c:if> 
						<c:if test="${forder.ptype=='4' }">运动户外</c:if> 
						<c:if test="${forder.ptype=='5' }">图书资料</c:if> 
						<c:if test="${forder.ptype=='6' }">其他</c:if>
						</td>
					   </tr> --%>
						<tr>
						<td>商品图片</td>
						<td>
							<c:if test="${forder.ppic==null}">无 </c:if>
							<c:if test="${forder.ppic!=null}">
                             <img src="<%=basePath%>upload/${forder.ppic}" style="width:200px;height:200px;"/>
							</c:if>
						</td>
						</tr>
						<tr>
						<td>买家微信号</td>
						<td>${forder.bwxAccount }</td>
						</tr>
						<tr>
						<td>买家手机号</td>
						<td>${forder.btel }</td>
						</tr>
						<tr>
						<td>卖家微信号</td>
						<td>${forder.swxAccount }</td>
						</tr>
						<tr>
						<td>卖家手机号</td>
						<td>${forder.stel }</td>
						</tr>
						<tr>
						<td>交易地点</td>
						<td>${forder.saddress }</td>
						</tr>
					</table>
		
				</div>
			</div>
		</div>
	</body>
</html>
