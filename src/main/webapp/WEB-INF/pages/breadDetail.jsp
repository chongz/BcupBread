<%--
  Created by IntelliJ IDEA.
  User: zhangchong
  Date: 6/2/16
  Time: 10:20 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html ng-app="cupcake">
<head>
    <meta charset="utf-8">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <link rel="stylesheet" href="css/mui.min.css" />
    <link rel="stylesheet" href="css/swiper.min.css" />
    <link rel="stylesheet" href="css/bread.css" />
    <style type="text/css">
        body,
        .mui-content,
        .mui-row {
            background-color: #FFFFFF;
        }

        .swiper-container {
            width: 100%;
            height: 330px;
            margin-left: auto;
            margin-right: auto;
        }

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

        .swiper-pagination-bullet {
            width: 5px;
            height: 5px;
            background: white;
            opacity: 1;
        }

        .swiper-pagination-bullet-active {
            background: #d62551;
        }

        .swiper-slide img {
            width: 100%;
        }

        .swiper-button-next,
        .swiper-button-prev {
            width: 40px;
            height: 40px;
            background-size: 40px 40px;
        }

        .swiper-button-prev {
            background-image: url(img/icon/icon-left.png);
            left: 15px;
        }

        .swiper-button-next {
            background-image: url(img/icon/icon-right.png);
            right: 15px;
        }

        .mui-preview-image.mui-fullscreen {
            position: fixed;
            z-index: 20;
            background-color: #000;
        }

        .mui-preview-header,
        .mui-preview-footer {
            position: absolute;
            width: 100%;
            left: 0;
            z-index: 10;
        }

        .mui-preview-header {
            height: 44px;
            top: 0;
        }

        .mui-preview-footer {
            height: 50px;
            bottom: 0px;
        }

        .mui-preview-header .mui-preview-indicator {
            display: none;
        }

        .mui-preview-image {
            display: none;
            -webkit-animation-duration: 0.5s;
            animation-duration: 0.5s;
            -webkit-animation-fill-mode: both;
            animation-fill-mode: both;
        }

        .mui-preview-image.mui-preview-in {
            -webkit-animation-name: fadeIn;
            animation-name: fadeIn;
        }

        .mui-preview-image.mui-preview-out {
            background: none;
            -webkit-animation-name: fadeOut;
            animation-name: fadeOut;
        }

        .mui-preview-image.mui-preview-out .mui-preview-header,
        .mui-preview-image.mui-preview-out .mui-preview-footer {
            display: none;
        }

        .mui-zoom-scroller {
            position: absolute;
            display: -webkit-box;
            display: -webkit-flex;
            display: flex;
            -webkit-box-align: center;
            -webkit-align-items: center;
            align-items: center;
            -webkit-box-pack: center;
            -webkit-justify-content: center;
            justify-content: center;
            left: 0;
            right: 0;
            bottom: 0;
            top: 0;
            width: 100%;
            height: 100%;
            margin: 0;
            -webkit-backface-visibility: hidden;
        }

        .mui-zoom {
            -webkit-transform-style: preserve-3d;
            transform-style: preserve-3d;
        }

        .mui-slider .mui-slider-group .mui-slider-item img {
            width: auto;
            height: auto;
            max-width: 100%;
            max-height: 100%;
        }

        .mui-android-4-1 .mui-slider .mui-slider-group .mui-slider-item img {
            width: 100%;
        }

        .mui-android-4-1 .mui-slider.mui-preview-image .mui-slider-group .mui-slider-item {
            display: inline-table;
        }

        .mui-android-4-1 .mui-slider.mui-preview-image .mui-zoom-scroller img {
            display: table-cell;
            vertical-align: middle;
        }

        .mui-preview-loading {
            position: absolute;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            display: none;
        }

        .mui-preview-loading.mui-active {
            display: block;
        }

        .mui-preview-loading .mui-spinner-white {
            position: absolute;
            top: 50%;
            left: 50%;
            margin-left: -25px;
            margin-top: -25px;
            height: 50px;
            width: 50px;
        }

        .mui-preview-image img.mui-transitioning {
            -webkit-transition: -webkit-transform 0.5s ease, opacity 0.5s ease;
            transition: transform 0.5s ease, opacity 0.5s ease;
        }

        @-webkit-keyframes fadeIn {
            0% {
                opacity: 0;
            }
            100% {
                opacity: 1;
            }
        }

        @keyframes fadeIn {
            0% {
                opacity: 0;
            }
            100% {
                opacity: 1;
            }
        }

        @-webkit-keyframes fadeOut {
            0% {
                opacity: 1;
            }
            100% {
                opacity: 0;
            }
        }

        @keyframes fadeOut {
            0% {
                opacity: 1;
            }
            100% {
                opacity: 0;
            }
        }

        p img {
            max-width: 100%;
            height: auto;
        }
        /* - -----------------------*/


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
<body ng-controller="breadDetail" ng-init="picUrl='${picUrl}';isLogin='${isLogin}';">
<div class="mui-content" >
    <div class="mui-row">
        <!-- Swiper -->
        <div class="swiper-container">
            <div class="swiper-wrapper">
                <div class="swiper-slide" ng-repeat="pd in product.productDetailsInfo" on-finish-render-filters>
                    <img src="{{picUrl}}{{pd.productDetailsPic}}" data-preview-src="" />
                </div>
            </div>
            <div class="swiper-pagination"></div>
            <div class="swiper-button-next" ng-show="product.productDetailsInfo.length > 0"></div>
            <div class="swiper-button-prev" ng-show="product.productDetailsInfo.length > 0"></div>
        </div>
    </div>

    <div class="mui-row bread-row">
        <div class="mui-col-xs-6">
            <h4>{{product.productKind}} &nbsp;{{product.productName}}</h4>
        </div>
        <div class="mui-col-xs-6 mui-text-right">
            <a ng-click="share();"><img src="img/icon/icon-share.png" class="bread-detail-title-icon" /></a>
            <a ng-click="addGallery();"><img src="img/icon/icon-favorite.png" class="bread-detail-title-icon" /></a>
            <a ng-click="addShoppingCart();"><img src="img/icon/icon-shoppingcart.png" class="bread-detail-title-icon" /></a>
        </div>
    </div>

    <div class="mui-row bread-row " style="margin: 0px 20px;">
        <div class="bread-line"></div>
    </div>

    <div class="mui-row bread-row bread-detail-desc">
        <div class="mui-col-xs-4 mui-col-sm-3" style="border-right: 1px solid #e6e6e6; ">
            <p>美味指数 - {{product.deliciousIndex}}</p>
            <p>营养指数 - {{product.nutritionIndex}}</p>
            <p>健康指数 - {{product.healthIndex}}</p>
        </div>

        <div class="mui-col-xs-8 mui-col-sm-6" style="padding-left: 5%;">
            <p>成分</p>
            <p>{{product.component}}</p>
        </div>
    </div>

    <div class="mui-row bread-row " style="margin: 0px 20px;">
        <div class="bread-line"></div>
    </div>
    <div class="mui-row bread-row" style="margin-top: 0px !important; margin-bottom: 5px;">

        <div class="mui-col-xs-7">
            数量:
            <div class="sp-quantity-control">

                <span ng-click="addProductNum();" class="mui-icon mui-icon-plus mui-pull-left cup-left-plus"></span>
                <span>{{numberOfBuy}}</span>
                <span ng-click="decreaseProductNum();" class="mui-icon mui-icon-minus mui-pull-right cup-right-minus"></span>
            </div>
        </div>

        <div class="mui-col-xs-5" style="height:40px; line-height: 40px;">
            <span class="mui-pull-right">价格：{{product.productPrice * numberOfBuy | currency :"￥"}}</span>
        </div>
    </div>

    <div class="mui-row bread-row " style="margin: 0px 20px;">
        <div class="bread-line"></div>
    </div>

    <div class="mui-row bread-row">
        <a ng-click="buy();" style="margin-top: 20px;" class="bread-btn bread-btn-black">直接购买</a>
    </div>

</div>

<%@ include file="footer.jsp" %>

</body>
</html>
