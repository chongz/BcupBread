<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--
  ~ Created by zhangchong on 5/30/2016.
  ~ Copyright (c) 2016 com.infohold.BcupBread. All rights reserved.
  --%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<title></title>

<link href="css/mui.min.css" rel="stylesheet" />
<link href="css/swiper.min.css" rel="stylesheet" />
<link href="css/bcup.css" rel="stylesheet" />
<link href="dist/Font-Awesome-3.2.1/css/font-awesome.min.css"
	rel="stylesheet" />

<style type="text/css">
.mui-content {
	background-color: #FFFFFF;
}

.temp-content {
	padding: 20px 20px 0px 20px;
}

.temp-content img {
	width: 100%;
}

.temp-content span {
	line-height: 30px;
}

.temp-content h3 {
	margin-bottom: 10px;
}

.temp-content p {
	font-size: 16px;
}
</style>

</head>
<body>
	<!-- mui-content -->
	<div class="mui-content">
		<!-- 公告内容 此处应展示HTML富文本编辑器编辑的带有HTML格式的内容 以下内容均为临时性静态页展示代码 -->

		<div class="mui-row temp-content">
			<img src="img/banner/1.png" />
		</div>

		<div class="mui-row temp-content">
			<img src="img/banner/2.png" />
		</div>

		<div class="mui-row temp-content">
			<p>2016-04-25 Bcup</p>
		</div>

		<div class="mui-row temp-content">
			<h3>专题&nbsp;|&nbsp;此处为标题</h3>
			<span>此页面应展示HTML富文本编辑器编辑的带有HTML格式的内容 以下内容均为临时性静态页展示代码</span>
		</div>

		<div class="mui-row temp-content">
			<div class="cup-line"></div>
		</div>

		<div class="mui-row temp-content">
			<p style="line-height: 30px;">
				阅读234 <span class="icon-share-alt mui-pull-right"
					style="font-size: 30px;"></span> <span
					class="icon-heart mui-pull-right"
					style="font-size: 30px; margin-right: 20px;"></span>
			</p>
		</div>
	</div>
	<!-- /.mui-content -->

	<!-- 底部导航 -->
	<%@ include file="footer.jsp" %>

	<script src="js/mui.min.js"></script>
	<script src="js/swiper.min.js"></script>
	<script src="js/jquery-2.1.0.js"></script>
	<script src="js/commons.js"></script>
</body>
</html>