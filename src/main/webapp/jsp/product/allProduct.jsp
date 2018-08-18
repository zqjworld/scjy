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
	String phPath="D:/photo/";
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
			<link rel="stylesheet" href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">
  <script src="//apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
  <script src="//apps.bdimg.com/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
  <link rel="stylesheet" href="jqueryui/style.css">
  <style type="text/css">
  .big {
  width:150px;
  height:150px;
  }
  img {
  width:50px;
  height:50px;
  }
  </style>
			<script type="text/javascript">
			window.onload=function(){
				getPname();
			}
			 /* $(function(){
	                $(id).click(function(){
	                    var width = $(this).width();
	                    if(width==50)
	                    {
	                        $(this).width(200);
	                        $(this).height(200);
	                    }
						else
	                    {
	                        $(this).width(50);
	                        $(this).height(50);
	                    }
	                });
	            }); */
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
		//alert(url);
		  $.get(url,function(data){
				if ('success' == data.result) {
					alert('添加购物车成功');
					<%-- window.location.href='<%=basePath %>sorder/findAllSorder'; --%>
					//window.location.reload();
				} else {
					alert('添加购物车失败');
				}
			});
	}
	var arr=[];
	function getPname(){
		var url='<%=basePath%>';
		url+="product/getProName";
		//alert(url);
		var jsonobj;
		
		$.get(url,function(data){
			jsonobj=data;
			//alert(jsonobj.length);
			//console.log(data[0]['pname']);
			
			for(var i=0;i<jsonobj.length;i++){
				arr.push(jsonobj[i]['pname']);
			}
			//alert(arr);
			/* jsonobj=eval("("+data.listJson+")");
			alert(jsonobj); */
		});
		
		/* $("#pname").autocomplete(jsonobj,{
			max:  20,		//列表里的条目数
			minChars: 1,    //自动完成激活之前填入的最小字符
			width: 300,     //提示的宽度，溢出隐藏
			scrollHeight: 150,   //提示的高度，溢出显示滚动条
			matchContains: true,    //包含匹配，就是data参数里的数据，是否只要包含文本框里的数据就显示 
			autoFill: false,    //自动填充
			formatItem: function(row, i, max) {
	            return row.pname;
	        },
	        formatMatch: function(row, i, max) {
	            return row.pname;
	        },
	        formatResult: function(row) {
	           return row.pname ;
	        }
		}).result(function(event, row, formatted) {
			//alert(row.projId);
			pname = row.pname;
	    }); */
	}
	
	 $(function() {
		   
		    $("#pname").autocomplete({
		      source: arr
		    });
		  });
</script>
	</head>

	<body class="content1" >
		<div class="header">
			<h1 class="page-title">
				山财大二手交易-商品管理
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
				商品列表
			</li>
		</ul>
		<div class="container-fluid">
			<div class="row-fluid">
				<form class="form-inline" method="post"
					action="<%=basePath%>product/findProductByproName">
					<input id="pname" class="input-xlarge" placeholder="商品名称..." name="pname"
						type="text" value="${pname}"  >
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
										<%-- <img src="<%=phPath %>${product.ppic}" style="width:200px;height:200px;"/> --%>
										<img id="${product.ppic}" src="<%=basePath%>upload/${product.ppic}" onmouseover="document.getElementById('${product.ppic}').className='big'" onmouseout ="document.getElementById('${product.ppic}').className=''" /> 
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
