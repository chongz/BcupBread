<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

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
    <script type="text/javascript" src="js/mui.min.js"></script>
    <script type="text/javascript" src="js/jquery-2.1.0.js"></script>
    <script type="text/javascript" src="js/swiper.min.js"></script>
    <script type="text/javascript" src="js/jquery-2.1.0.js"></script>
    <script type="text/javascript" src="js/angular1.3.0.min.js"></script>
    <script type="text/javascript" src="js/localforage.min.js"></script>
    <script type="text/javascript" src="js/angular-localForage.min.js"></script>
    <script type="text/javascript" src="js/commons.js"></script>
    <script type="text/javascript" src="js/cupcake.js"></script>

</head>
<body>
<div class="mui-content login-content" ng-controller="loginSelector">

    <div class="mui-row login-top-bar">

        <div class="mui-col-xs-6">
            <img src="img/mine/btn-back.png" ng-click="back();"/>
        </div>

        <div class="mui-col-xs-6 mui-text-right" >
            <img src="img/mine/btn-close.png" ng-click="backToMine();"/>
        </div>

    </div>

    <div class="row login-text-desc" >
        <span>通过以下网站快速登录：</span>
    </div>

    <div class="mui-row bread-row" style="margin-top: 6%;">
        <a href="#" class="cup-btn cup-btn-white-quick-reg">
            <span>微信</span>
        </a>
    </div>

    <div class="mui-row bread-row" style="margin-top: 6%;">
        <a href="#" class="cup-btn cup-btn-white-quick-reg">
            <span>新浪微博</span>
        </a>
    </div>

    <div class="mui-row bread-row" style="margin-top: 6%;">
        <a href="#" class="cup-btn cup-btn-white-quick-reg">
            <span>QQ</span>
        </a>
    </div>

    <div class="row login-text-desc" >
        <span >或用手机号登录：</span>
    </div>

    <div class="mui-row bread-row" style="margin-top: 6%;" ng-click="phoneLogin();">
          <span class="cup-btn cup-btn-white-loginreg">手机号</span>
    </div>

    <div class="login-protocol-text">
        <span>注册即表示我同意BCUP的<a ng-click="announcement();">《用户注册协议》</a></span>
    </div>
</div>
<!-- /.mui-content -->
</body>
</html>