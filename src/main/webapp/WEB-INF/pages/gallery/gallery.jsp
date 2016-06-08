<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html ng-app="cupcake">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">

    <title></title>
    <link href="css/mui.min.css" rel="stylesheet"/>
    <link href="css/bread.css" rel="stylesheet"/>
    <style type="text/css">
        .favorite_item {
            background-image: url(img/mine/bg-favorite-pro.png);
            /*				width: 159.36px;
                            height: 204.48px;*/
            width: 80%;
            display: inline-block;
            background-attachment: fixed center center no-repeat;
            background-size: cover;
            margin: 0px 0px 0px 0%;
            padding: 10px 15px 24% 15px;
            text-align: center;
        }

        .favorite_item img {
            width: 100%;
        }
    </style>

    <script type="text/javascript" src="js/mui.min.js"></script>
    <script type="text/javascript" src="js/mui.zoom.js" charset="utf-8"></script>
    <script type="text/javascript" src="js/mui.previewimage.js" charset="utf-8"></script>
    <script type="text/javascript" src="js/jquery-2.1.0.js"></script>
    <script type="text/javascript" src="js/swiper.min.js"></script>
    <script type="text/javascript" src="js/angular1.3.0.min.js"></script>
    <script type="text/javascript" src="js/localforage.min.js"></script>
    <script type="text/javascript" src="js/angular-localForage.min.js"></script>
    <script type="text/javascript" src="js/commons.js"></script>
    <script type="text/javascript" src="js/cupcake.js"></script>
</head>
<body ng-controller="gallery" ng-init="isLogin='${isLogin}';isEmpty='${isEmpty}';picUrl='${picUrl}';">
<div class="mui-content-no-login bg-self-adaption" ng-show="isLogin == '0' ">
    <div class="mui-row bg-nologin-nocontent">
        <span>未登录</span>
        <p>定制您喜欢的</p>
        <a class="cup-btn cup-btn-red" ng-click="goToLoginRegister();">现在去登录或注册</a>
    </div>
</div>

<div class="mui-content" style="margin-bottom: 5%;" ng-show="isLogin == '1' && isEmpty == '1'">
    <div class="mui-row mui-text-center bread-row" style="margin-top: 3%;margin-bottom: 3%; color: #7A7A7A;">
        <img src="img/mine/no-cake.png" style="width: 100px; margin-top: 50%;" />
        <br />
        <span>您暂时没有收藏</span>
        <br />
        <a class="bread-btn bread-btn-black" ng-click="goToIndex();" style="margin-top:40%;">随便看看</a>
    </div>
</div>

<div class="mui-content" style="margin-bottom: 5%;" ng-show="isLogin == '1' && isEmpty == '0' ">
    <div class="mui-row cup-page-header">
        <span>收藏</span>
    </div>
</div>
<div class="mui-row" ng-show="isLogin == '1' && isEmpty == '0'" >
    <div class="mui-col-xs-6 mui-text-center" style="margin-top: 5%;" ng-repeat="g in list">

        <div class="favorite_item ">
            <div class="mui-row" style="padding-top: 5%;">
                <a ng-click="removeGallery($index);"><span class="mui-badge mui-badge-danger mui-pull-left">&times;</span></a>
                <span style="margin-left: -10px;"> {{g.name}} </span>
            </div>

            <div class="mui-row" style="padding-top: 20%; padding-bottom: 8%;">
                <a ng-click="viewDetail(g.productID);"><img src="{{picUrl}}{{g.pic}}" ></a>
            </div>
        </div>

    </div>
</div>

<%@include file="../footer.jsp"%>
</body>
</html>