<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%--
  ~ Created by zhangchong on 5/30/2016.
  ~ Copyright (c) 2016 com.infohold.BcupBread. All rights reserved.
  --%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="cupcake">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <title></title>
    <link href="css/mui.min.css" rel="stylesheet"/>
    <link href="css/bread.css" rel="stylesheet"/>

    <style type="text/css">
        .mui-navigate-right:after,
        .mui-push-right:after {
            font-weight: bold;
            padding-right: 3%;
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

<body>
<div class="mui-content" ng-controller="mine" ng-init="type='${type}';nickName='${nickName}';sex='${sex}';birthday='${birthday}';memberID='${memberID}';isLogin='${isLogin}';memberPhone='${memberPhone}';memberPic='${memberPic}';memberCity='${memberCity}';sex='${sex}';picUrl='${picUrl}';grade='${grade}';thmemberAccount='${thmemberAccount}';">

    <div class="mypage-userinfo">
        <div class="row mui-text-right" >
            <%--<span class="mui-badge mui-badge-danger messagespan" ng-show="isLogin == '1' " ng-click="message();">{{messageNum}}</span>--%>
            <%--<img src="img/mine/icon-mshbox.png" ng-click="message();"/>--%>
        </div>
        <div class="row mui-text-center" ng-click="personInfo();">
            <img ng-if="memberPic == ''" src="img/mine/no-avatar.png" style="position: relative; left: 11%;"/>
            <img ng-if="memberPic != ''" src="{{picUrl}}{{memberPic}}" style="position: relative; left: 11%;"/>
            <img src="img/mine/avatat-circle.png" style="position: relative; left: -10%;">
        </div>

        <div ng-show="isLogin == '0' ">
            <div class="row mui-text-center" ng-click="personInfo();" >
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;登录/注册
            </div>
            <div class="row mui-text-center">

            </div>
        </div>

        <div class="row mui-text-center" ng-show="isLogin == '1' ">
            <div class="row mui-text-center" ng-click="personInfo();">
                <span>{{memberPhone}}<img src="img/mine/edit-username.png"/></span>&nbsp;
            </div>
            <div class="row mui-text-center" ng-click="personInfo();">
                <img src="img/mine/icon-address1.png"/>&nbsp;<span>{{currentCity.cityName}}</span>
            </div>
        </div>
    </div>


    <div class="row">
        <ul class="mui-table-view" style="line-height: 30px;" ng-click="order();">

            <li class="mui-table-view-cell">
                <a class="mui-navigate-right">
                    <span class="mui-badge mui-badge-danger" style="margin-right: 20px;" ng-show="isLogin == '1' ">{{orderNum}}</span>
                    <div class="mypage-list-content">
                        <img src="img/icon/icon-_03.png"/><span>我的订单</span>
                    </div>
                </a>
            </li>

        </ul>

        <ul class="mui-table-view" style="line-height: 30px; margin-top: 2%;" ng-click="gallery();">
            <li class="mui-table-view-cell">
                <a class="mui-navigate-right">
                    <span class="mui-badge mui-badge-danger" style="margin-right: 20px;" ng-show="isLogin == '1' ">{{galleryNum}}</span>
                    <div class="mypage-list-content">
                        <img src="img/icon/icon-favorite.png"/><span>收藏夹</span>
                    </div>
                </a>
            </li>
        </ul>

        <ul class="mui-table-view" style="line-height: 30px; margin-top: 2%;" ng-click="address();">
            <li class="mui-table-view-cell">
                <a class="mui-navigate-right">
                    <div class="mypage-list-content">
                        <img src="img/icon/icon-_07.png"/><span>地址管理</span>
                    </div>
                </a>
            </li>
        </ul>

        <ul class="mui-table-view" style="line-height: 30px; margin-top: 2%;" ng-click="location();">
            <li class="mui-table-view-cell">
                <a class="mui-navigate-right">
                    <div class="mypage-list-content">
                        <img src="img/icon/icon-_05.png"/><span>店铺信息</span>
                    </div>
                </a>
            </li>
        </ul>

        <ul class="mui-table-view" style="line-height: 30px;margin-top: 2%;" ng-click="aboutus();">
            <li class="mui-table-view-cell">
                <a class="mui-navigate-right">
                    <div class="mypage-list-content">
                        <img src="img/icon/icon-_09.png"/><span>关于我们</span>
                    </div>
                </a>
            </li>
        </ul>

        <ul class="mui-table-view" style="line-height: 30px;margin-top: 2%;" ng-click="logout();" ng-show="isLogin == '1' ">
            <li class="mui-table-view-cell mui-text-center">
                <a>
                    <div class="mypage-loginout">
                        <img src="img/mine/icon-loginout.png"><span>退出登录</span>
                    </div>
                </a>
            </li>
        </ul>
    </div>

</div>
<%@include file="../footer.jsp" %>
</body>
</html>