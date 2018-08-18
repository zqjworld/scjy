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
		<title>商品列表</title>
		<link rel="stylesheet" type="text/css"
			href="<%=basePath%>js/bootstrap/css/bootstrap.css">
		<link rel="stylesheet" type="text/css"
			href="<%=basePath%>css/theme.css">
		<link rel="stylesheet"
			href="<%=basePath%>js/font-awesome/css/font-awesome.css">
		<script src="<%=basePath%>js/jquery-1.7.2.min.js"
			type="text/javascript"></script>
			<script type="text/javascript">
function del(id,ppic){
	//alert(id);
	var pName=$("#"+id).parent().find('td').eq(0).text().trim();
	//alert(pName);
	var url='<%=basePath%>';
	var flag=confirm("确定要删除[ "+pName+" ]的信息吗？");
	if(flag){
	  url=url+'product/delProduct?id='+id+'&ppic='+ppic;
	 // alert(url);
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
	
	function addCart(pid,uid){
		var url='<%=basePath%>';
		url=url+"sorder/addSorder?id="+pid;
		alert(url);
		  $.get(url,function(data){
				if ('success' == data.result) {
					alert('添加购物车成功');
					//window.location.reload();
				} else {
					alert('添加购物车失败');
				}
			});
	}
</script>
	</head>

	<body class="content1" >
		<div class="header">
			<h1 class="page-title">
				山财大二手交易-商品管理
			</h1>
		</div>
		<ul class="breadcrumb">
			<li>
				<a href="<%=basePath%>">首页</a>
				<span class="divider">/</span>
			</li>
			<li class="active">
				商品列表
			</li>
		</ul>
		<div class="container-fluid">
			<div class="row-fluid">
				<form class="form-inline" method="post"
					action="<%=basePath%>product/findProductByproName">
					<input class="input-xlarge" placeholder="商品名称..." name="pname"
						type="text" value="${pname}">
					<input class="btn icon-search" type="submit" value="查询" />
					<a class="btn btn-primary" href="<%=basePath%>product/toAddProduct" style="background: #dea32c;">
						<i class="icon-plus"></i> 添加商品
					</a>
					<a class="btn btn-primary" href="<%=basePath%>product/findProductByUid" style="background: #dea32c;">
						 查看我发布的商品
					</a>
				</form>

				<div class="well">
					<table class="table">
						<thead>
							<tr>
							<th>商品名称</th>
							<th>商品价格</th>
							<th>商品规格</th>
							<th>商品描述</th>
							<th>商品图片信息</th>
							<th>微信号</th>
							<th>交易地点</th>
							<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${!empty productList }">
							<c:forEach items="${productList}" var="product">
								<tr>
									<td>${product.pname }</td>
									<td>${product.pprice }</td>
									<td>${product.pcount } ${product.pstandard }</td>
									<td>${product.pdesc }</td>
									<td> 
									<c:if test="${product.ppic==null}">
											无
										</c:if>
										<c:if test="${product.ppic!=null}">
											<img src="<%=basePath%>upload/${product.ppic}" style="width:200px;height:200px;"/>
										</c:if>
									</td>
									<%-- <td>
									<c:if test="${product.ptype=='1' }">服装鞋包</c:if>
									<c:if test="${product.ptype=='2' }">手机数码</c:if>
									<c:if test="${product.ptype=='3' }">美妆饰品</c:if>
									<c:if test="${product.ptype=='4' }">运动户外</c:if>
									<c:if test="${product.ptype=='5' }">图书资料</c:if>
									<c:if test="${product.ptype=='6' }">其他</c:if>
									</td>
									<td>${product.user.username }</td>
									<td>${product.user.email }</td> --%>
									<td>${product.user.wxaccount }</td>
									<td>${product.user.address }</td>
									<c:if test="${product.uid==sessionScope.userId }">
									<td id="${product.id }"><a
										href="<%=basePath%>product/getProduct?id=${product.id}">编辑</a>
										<a href="javascript:del('${product.id }','${product.ppic }')">删除</a></td>
									</c:if>
									<c:if test="${product.uid!=sessionScope.userId }">
									<td id="${product.id }">
									<a href="<%=basePath%>product/productDetail?id=${product.id}">查看商品详情</a>
									<a href="javascript:addCart('${product.id}')">加入购物车</a>
				
									</c:if>
									
									
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
