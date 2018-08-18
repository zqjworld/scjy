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
		<title>购物车列表</title>
		<link rel="stylesheet" type="text/css"
			href="<%=basePath%>js/bootstrap/css/bootstrap.css">
		<link rel="stylesheet" type="text/css"
			href="<%=basePath%>css/theme.css">
		<link rel="stylesheet"
			href="<%=basePath%>js/font-awesome/css/font-awesome.css">
<style type="text/css">
.big {
	width: 150px;
	height: 150px;
}

img {
	width: 50px;
	height: 50px;
}
</style>
<script src="<%=basePath%>js/jquery-1.7.2.min.js"
			type="text/javascript"></script>
			<script type="text/javascript">
function del(fid,ppic){
	//alert(id);
	var sName=$("#"+fid).parent().find('td').eq(0).text().trim();
	//alert(pName);
	var url='<%=basePath%>';
	var flag=confirm("确定要删除[ "+sName+" ]的信息吗？");
	if(flag){
	  url=url+'forder/delForder?fid='+fid+'&ppic='+ppic;
	 // alert(url);
	    $.get(url,function(data){
			if ('success' == data.result) {
				alert('删除成功');
				$("#"+fid).parent().remove();
				//window.location.reload();
			} else {
				alert('删除失败');
			}
		});
	}
	}
	function findForder(){
		var form=document.forms[0];
/* 		var pname=$("input[name='pname']").val(); */
/* 		alert(pname); */
		form.action='<%=basePath%>forder/findForderByProName';
	/* 	alert(form.action); */
		form.method='post';
		form.submit();
	}
	
	<%-- function findForderByFid(fid){
		var form=document.forms[0];
		form.action='<%=basePath%>forder/findForderByfId?fid='+fid;
		alert(form.action);
		form.method='get';
		form.submit();
		
	} --%>

			</script>
	</head>

	<body class="content1" >
		<div class="header">
			<h1 class="page-title">
				山财大二手交易-订单管理
			</h1>
		</div>
		<ul class="breadcrumb">
		<c:if test="${admin_name!='superadmin'}">
			<li>
				<a href="<%=basePath%>">首页</a>
				<span class="divider">/</span>
			</li>
		</c:if>
			<li class="active">
				订单列表
			</li>
		</ul>
		<div class="container-fluid">
			<div class="row-fluid">
				<form class="form-inline"
					action="">
					<input class="input-xlarge" placeholder="商品名称..." name="pname" type="text">
					<input class="btn icon-search" type="button" onclick="findForder()" value="查询"/>
				</form>

				<div class="well">
					<table class="table">
						<thead>
							<tr>
							<th>商品名称</th>
							<th>商品价格</th>
							<th>商品规格</th>
							<th>商品图片信息</th>
							<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${!empty forderList }">
							<c:forEach items="${forderList}" var="forder">
								<tr>
									<td>${forder.pname }</td>
									<td>${forder.pprice }</td>
									<td>${forder.pcount } ${forder.pstandard }</td>
									<td> 
									<c:if test="${forder.ppic==null}">
											无
										</c:if>
										<c:if test="${forder.ppic!=null}">
											<img id="${forder.ppic}" src="<%=basePath%>upload/${forder.ppic}" onmouseover="document.getElementById('${forder.ppic}').className='big'" onmouseout ="document.getElementById('${forder.ppic}').className=''" />
										</c:if>
									</td>
									<td id="${forder.fid }">
									    <a href="<%=basePath%>forder/findForderByfId?fid=${forder.fid}">查看订单详细信息</a>&nbsp;&nbsp;&nbsp;&nbsp;
										<a href="javascript:del('${forder.fid }','${forder.ppic }')">删除订单</a>
									</td>
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
