<%@ page language="java"  pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="edge" />
<title>站长统计</title>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<base href="<%=basePath%>">
<script type="text/javascript" src="<%=basePath %>js/webmasterStatistics/statistics.js"></script>
<script type="text/javascript" src="<%=basePath%>js/echart3/echarts.js"></script>
<script src="<%=basePath%>js/jquery-1.7.2.min.js" type="text/javascript"></script>
<script type="text/javascript">
var baseurl='<%=basePath%>';
window.onload=function(){
	drawImg();
}
</script>

</head>
<body>
<table align="center" border="1" style="border-collapse: collapse;"> 
<!-- <p>山财大二手交易平台-站长统计</p> -->
<tr align="center">
<td colspan="2"><font size="18px">山财大二手交易平台-站长统计</font><a href="<%=basePath%>">返回首页</a></td>
</tr>
<tr>
<td>
<div id="productCount" style="width:600px;height:400px;">

</div>
</td>
<td>
<div id="userCount" style="width:600px;height:400px;">

</div>
</td>
</tr>
<tr>
<td>
<div id="forderCountBySchoolAddress" style="width:600px;height:400px;">

</div>
</td>
<td>
<div id="forderCountByZheXian" style="width:600px;height:400px;">

</div>
</td>
</tr>
</table>
</body>
</html>