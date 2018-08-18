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
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/theme.css">
<link rel="stylesheet"
	href="<%=basePath%>js/font-awesome/css/font-awesome.css">
<script src="<%=basePath%>js/jquery-1.7.2.min.js" type="text/javascript"></script>
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
<script type="text/javascript">
function del(id){
	//alert(id);
	var sName=$("#"+id).parent().find('td').eq(0).text().trim();
	//alert(pName);
	var url='<%=basePath%>';
	var flag=confirm("确定要删除[ "+sName+" ]的信息吗？");
	if(flag){
	  url=url+'sorder/delSorder?sid='+id;
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
	function findSorder(){
		var form=document.forms[0];
		var pname=$("input[name='pname']").val();
		alert(pname);
		form.action='<%=basePath%>sorder/findSorderByProName?pname='+pname;
		form.method='post';
		form.submit();
	}
	function addfsorder(sid){
		//var sName=$("#"+id).parent().find('td').eq(0).text().trim();
		//alert(pName);
		var url='<%=basePath%>';
		var flag=confirm("确定要提交订单吗？");
		if(flag){
		  url=url+'forder/addForder?sid='+sid;
		 // alert(url);
		    $.get(url,function(data){
				if ('success' == data.result) {
					alert('提交成功');
					//$("#"+id).parent().remove();
					window.location.href='<%=basePath%>forder/findAllForderBybid';
					//window.location.reload();
				} else {
					alert('提交失败');
				}
			});
		}
	}
			</script>
</head>

<body class="content1">
	<div class="header">
		<h1 class="page-title">山财大二手交易-购物车管理</h1>
	</div>
	<ul class="breadcrumb">
	<c:if test="${admin_name!='superadmin'}">
		<li><a href="<%=basePath%>">首页</a> <span class="divider">/</span>
		</li>
	</c:if>
		<li class="active">购物车列表</li>
	</ul>
	<div class="container-fluid">
		<div class="row-fluid">
			<form class="form-inline" action="">
				<input class="input-xlarge" placeholder="商品名称..." name="pname"
					type="text"> <input class="btn icon-search" type="button"
					onclick="findSorder()" value="查询" />
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
						<c:if test="${!empty sorderList }">
							<c:forEach items="${sorderList}" var="sorder">
								<tr>
									<td>${sorder.pname }</td>
									<td>${sorder.pprice }</td>
									<td>${sorder.pcount }${sorder.pstandard }</td>
									<td><c:if test="${sorder.ppic==null}">
											无
									</c:if> <c:if test="${sorder.ppic!=null}">
									<%-- <img src="D:/photo/${sorder.ppic}"
												style="width: 200px; height: 200px;" /> --%>
											<img id="${sorder.ppic}" src="<%=basePath%>upload/${sorder.ppic}"
												onmouseover="document.getElementById('${sorder.ppic}').className='big'" onmouseout ="document.getElementById('${sorder.ppic}').className=''" />
										</c:if></td>
									<td id="${sorder.sid }"><a
										href="javascript:del('${sorder.sid }')">删除</a>&nbsp;&nbsp;&nbsp;&nbsp;
										<a href="javascript:addfsorder('${sorder.sid }')">提交订单</a></td>
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
