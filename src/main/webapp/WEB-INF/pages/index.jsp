<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html ng-app="cupcake">
<head>
	<base href="<%=basePath%>">
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">

    <link href="css/mui.min.css" rel="stylesheet" />
    <link href="css/swiper.min.css" rel="stylesheet" />
    <link href="css/bread.css" rel="stylesheet" />

	<style type="text/css">
		.swiper-container {
			width: 100%;
			height: 170px;
		}
		/* 轮播模块 */

		.swiper-slide {
			text-align: center;
			font-size: 18px;
			background: #fff;
			/* Center slide text vertically */
			display: -webkit-box;
			display: -ms-flexbox;
			display: -webkit-flex;
			display: flex;
			-webkit-box-pack: center;
			-ms-flex-pack: center;
			-webkit-justify-content: center;
			justify-content: center;
			-webkit-box-align: center;
			-ms-flex-align: center;
			-webkit-align-items: center;
			align-items: center;
		}

		.swiper-slide img {
			width: 100%;
			height: 100%;
		}
		/* 轮播图翻页非选中 */

		.swiper-pagination-bullet {
			width: 5px;
			height: 5px;
			background: white;
			opacity: 1;
		}
		/* 轮播图翻页选中 */

		.swiper-pagination-bullet-active {
			background: #d62551;
		}

		body,
		.mui-content,
		.mui-row {
			background-color: #FFFFFF;
		}
		/* ---------------------------------------------------- */

	</style>

	<script type="text/javascript" src="js/mui.min.js"></script>
	<script type="text/javascript" src="js/jquery-2.1.0.js"></script>
	<script type="text/javascript" src="js/swiper.min.js"></script>
	<script type="text/javascript" src="js/angular1.3.0.min.js"></script>
	<script type="text/javascript" src="js/localforage.min.js"></script>
	<script type="text/javascript" src="js/angular-localForage.min.js"></script>
	<script type="text/javascript" src="js/commons.js"></script>
	<script type="text/javascript" src="js/cupcake.js"></script>
</head>
<body ng-controller="index" ng-init="picUrl='${picUrl}';">
<div class="mui-content" >
	<div class="mui-row mui-text-center"  style="position:relative; z-index:1; ">
		<div class="swiper-container" id="swiper-container1">
			<div class="swiper-wrapper" >
				<div class="swiper-slide" ng-repeat="e in noticeList" ng-click="goToBreadInfo(e.noticeID);" on-finish-render-filters>
					<a><img src="{{picUrl}}{{e.firPic}}" /></a>
				</div>
			</div>
			<!-- Add Pagination -->
			<div class="swiper-pagination"></div>
		</div>
	</div>

	<div class="mui-row mui-text-center index-row index-menu">
        <span>
                &bull;&nbsp;SPELT&nbsp;&bull;
                <span ng-click="breadGallery();" class="mui-icon mui-icon-bars mui-pull-right index-menu-icon"></span>
        </span>
	</div>

	<div class="mui-row index-row index-featured" ng-repeat="e in list">
		<a ng-click="goToBreadDetail(e.productID);"><img src="{{picUrl}}{{e.overPic}}" /></a>
	</div>

</div>
<%@ include file="footer.jsp" %>
</body>
</html>