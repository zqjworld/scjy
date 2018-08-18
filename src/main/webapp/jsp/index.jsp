<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>山财大二手交易平台</title>
<link href="<%=request.getContextPath()%>/css/bootstrap.css"
	rel="stylesheet" type="text/css" media="all">
<link href="<%=request.getContextPath()%>/css/style.css"
	rel="stylesheet" type="text/css" media="all" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="山财大二手交易平台" />
<script type="application/x-javascript">
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 

</script>
<link href="<%=request.getContextPath()%>/css/camera.css"
	rel="stylesheet" type="text/css" media="all" />
<script type='text/javascript'
	src='<%=request.getContextPath()%>/js/jquery.min.js'></script>
<script type='text/javascript'
	src='<%=request.getContextPath()%>/js/jquery.mobile.customized.min.js'></script>
<script type='text/javascript'
	src='<%=request.getContextPath()%>/js/jquery.easing.1.3.js'></script>
<script type='text/javascript'
	src='<%=request.getContextPath()%>/js/camera.min.js'></script>
<script>
	jQuery(function() {

		jQuery('#camera_wrap_1').camera({
			thumbnails : true
		});

		jQuery('#camera_wrap_2').camera({
			height : '400px',
			loader : 'bar',
			pagination : false,
			thumbnails : true
		});
	});
</script>
<!--start lightbox -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/jquery.lightbox.css">
<script src="<%=request.getContextPath()%>/js/jquery.lightbox.js"></script>
<script>
	// Initiate Lightbox
	$(function() {
		$('.gallery a').lightbox();
	});
</script>
<!-- <style type="text/css">
a{padding: 5px;}
</style> -->
</head>
<body>
	<div class="container">
		<div class="main-header">
			<div class="inner-side">
				<div class="header">
					<div class="logo">
						<h1 style="font-family: STXingkai">
							<a href="index.html">山财大二手交易平台</a>
						</h1>
					</div>
					<div style="float: right;margin-right:50px;">
						<h5>
							<c:if test="${sessionScope.userName==null }">
                             <a href="<%=basePath %>user/tologin">请先登录</a>
                             <a href="<%=basePath %>user/toregister">注册用户</a>
                            </c:if>
							<c:if test="${sessionScope.userName!=null }">
                                                                               您好,${sessionScope.userName }
                               <a href="<%=basePath %>user/loginout">退出</a>                                          
                            </c:if>
						</h5>
					</div>
					<div class="head-top">
						<div class="top-menu">
							<span class="menu"><img src="images/nav.png" alt="" /> </span>
							<ul>
								<li class="active"><a href="<%=basePath %>"><span>首页</span></a></li>
								<li><a href="<%=basePath %>product/getAllProduct"><span>商品预览</span></a></li>
								<li><a href="<%=basePath %>sorder/findAllSorder"><span>购物车</span></a></li>
								<li class="has-sub"><a href="<%=basePath%>forder/findAllForderBybid"><span>订单查询</span></a></li>
								<li class="has-sub"><a href="<%=basePath%>user/userDetail"><span>个人信息</span></a></li>
								<li><a href="<%=basePath%>jsp/webmasterStatistics/statistic.jsp"><span>站长统计</span></a></li>
								<li><a href="<%=basePath%>jsp/index/typo.html"><span>购物指南</span></a></li>
								<li class="last"><a href="<%=basePath%>jsp/index/contact.html"><span>关于我们</span></a></li>
							</ul>
						</div>
						<script>
							$("span.menu").click(
									function() {
										$(".top-menu ul").slideToggle("slow",
												function() {
												});
									});
						</script>
						<!-- //script for menu -->

						<div class="clearfix"></div>
					</div>
					<!-- 	<div class="logo">
						<h1><a href="html/index.html"><span>i</span>nland</a></h1>
					</div> -->
				</div>
				<div class="fluid_container">
					<div class="camera_wrap camera_azure_skin" id="camera_wrap_1">
						<div
							data-thumb="<%=request.getContextPath()%>/images/thumbs/slider1.jpg"
							data-src="<%=request.getContextPath()%>/images/slider1.jpg"></div>
						<div
							data-thumb="<%=request.getContextPath()%>/images/thumbs/slider2.jpg"
							data-src="<%=request.getContextPath()%>/images/slider2.jpg"></div>
						<div
							data-thumb="<%=request.getContextPath()%>/images/thumbs/slider3.jpg"
							data-src="<%=request.getContextPath()%>/images/slider5.jpg"></div>
						<div
							data-thumb="<%=request.getContextPath()%>/images/thumbs/slider4.jpg"
							data-src="<%=request.getContextPath()%>/images/slider4.jpg"></div>
					</div>
					<!-- #camera_wrap_1 -->
					<div class="clearfix"></div>
				</div>
				<div class="copyrights">
					Collect from <a href="http://www.cssmoban.com/">企业网站模板</a>
				</div>
				<div class="interior-grids">
					<div class="col-md-4 interior-grid"
						style="background-color: #E7E7E7;">
						<h3>服装鞋包类</h3>
						<div class="gallery" align="center">
							<img
								onclick="window.location.href='<%=basePath %>product/findProductByPtype/1'"
								src="<%=request.getContextPath()%>/images/fzxb.jpg"
								class="img-responsive" alt="/" title="服装鞋包类">
							<%-- <a href="product/findProductByPtype/1" ><img src="<%=request.getContextPath() %>/images/fzxb.jpg" class="img-responsive" alt="/" title="image-name"></a> --%>
						</div>
						<p>超前享受,率领潮流</p>
						<div class="plus_btn">
							<!-- <a href="#"><span></span></a> -->
						</div>
					</div>
					<div class="col-md-4 interior-grid"
						style="background-color: #E7E7E7;">
						<h3>手机数码类</h3>
						<div class="gallery" align="center">
							<img
								onclick="window.location.href='<%=basePath %>product/findProductByPtype/2'"
								src="<%=request.getContextPath()%>/images/sjsm.jpg"
								class="img-responsive" alt="/" title="手机数码类">
							<%-- <a href="<%=basePath%>product/findProductByPtype/2" target="_blank"><img src="<%=request.getContextPath() %>/images/sjsm.jpg" class="img-responsive" alt="/" title="image-name"></a> --%>
						</div>
						<p>科技让你更轻松</p>
						<div class="plus_btn">
							<!-- <a href="#"><span></span></a> -->
						</div>
					</div>
					<div class="col-md-4 interior-grid"
						style="background-color: #E7E7E7;">
						<h3>美妆饰品类</h3>
						<div class="gallery" align="center">
							<img
								onclick="window.location.href='<%=basePath %>product/findProductByPtype/3'"
								src="<%=request.getContextPath()%>/images/mzsp.jpg"
								class="img-responsive" alt="/" title="美妆饰品类">
							<%-- <a href="<%=basePath%>product/findProductByPtype/3" target="_blank"><img src="<%=request.getContextPath() %>/images/mzsp.jpg" class="img-responsive" alt="/" title="image-name"></a> --%>
						</div>
						<p>护理肌肤，尽享美妆</p>
						<div class="plus_btn">
							<!-- <a href="#"><span></span></a> -->
						</div>
					</div>
				</div>
				<div class="interior-grids">
					<div class="col-md-4 interior-grid"
						style="margin-top: 20px; background-color: #E7E7E7;">
						<h3>运动户外类</h3>
						<div class="gallery" align="center">
							<img
								onclick="window.location.href='<%=basePath %>product/findProductByPtype/4'"
								src="<%=request.getContextPath()%>/images/ydhw.jpg"
								class="img-responsive" alt="/" title="运动户外类">
							<%-- <a href="<%=basePath%>product/findProductByPtype/4" target="_blank"><img src="<%=request.getContextPath() %>/images/ydhw.jpg" class="img-responsive" alt="/" title="image-name"></a> --%>
						</div>
						<p>生命在于运动</p>
						<div class="plus_btn">
							<!-- <a href="#"><span></span></a> -->
						</div>
					</div>
					<div class="col-md-4 interior-grid"
						style="margin-top: 20px; background-color: #E7E7E7;">
						<h3>图书资料类</h3>
						<div class="gallery" align="center">
							<img
								onclick="window.location.href='<%=basePath %>product/findProductByPtype/5'"
								src="<%=request.getContextPath()%>/images/tszl.jpg"
								class="img-responsive" alt="/" title="图书资料类">
							<%-- <a href="<%=basePath%>product/findProductByPtype/5" target="_blank"><img src="<%=request.getContextPath() %>/images/tszl.jpg" class="img-responsive" alt="/" title="image-name"></a> --%>
						</div>
						<p>学习改变命运,知识成就未来</p>
						<div class="plus_btn">
							<!-- <a href="#"><span></span></a> -->
						</div>
					</div>
					<div class="col-md-4 interior-grid"
						style="margin-top: 20px; background-color: #E7E7E7;">
						<h3>其他</h3>
						<div class="gallery" align="center">
							<img
								onclick="window.location.href='<%=basePath %>product/findProductByPtype/6'"
								src="<%=request.getContextPath()%>/images/others.jpg"
								class="img-responsive" alt="/" title="其他">
							<%-- <a href="<%=basePath%>product/findProductByPtype/6" target="_blank"><img src="<%=request.getContextPath() %>/images/others.jpg" class="img-responsive" alt="/" title="image-name"></a> --%>
						</div>
						<p>重质重量，高高在上</p>
						<div class="plus_btn">
							<!-- <a href="#"><span></span></a> -->
						</div>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="product-section">
					<h3>最新商品</h3>
					<div class="product-grids">
						<c:if test="${!empty newList }">
							<c:forEach items="${newList}" var="product">
								<div class="col-md-3 product-grid">
								<%-- <img onclick="window.location.href=''"
										src="D:/photo/${sorder.ppic}"
										class="img-responsive" title="${product.pname}"> --%>
									<a href="<%=basePath%>product/productDetail?id=${product.id}">
									<img src="<%=basePath%>upload/${product.ppic}" style="width:150px;height:150px;"/>
									</a> 
								</div>
							</c:forEach>
						</c:if>
						<c:if test="${empty newList }">
						暂时没有任何商品信息
						</c:if>
						<div class="clearfix"></div>
					</div>
				</div>
				<div class="footer-section">
					<div class="footer-top">
						<p>
							<font style="font-size: 15px;">Copyright &copy; 2017.SCJY
								All rights reserved.</font>
						</p>
						<p>
							<font style="font-size: 15px;">鲁公网安备
								11000002000088号|鲁ICP证070359号</font>
						</p>
						<p>
							<font style="font-size: 15px;">消费者维权热线：0531-88666688</font>
						</p>

					</div>
				</div>
			</div>

		</div>
</body>
</html>
