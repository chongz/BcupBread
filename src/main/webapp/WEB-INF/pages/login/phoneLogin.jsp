<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--
  ~ Created by zhangchong on 5/30/2016.
  ~ Copyright (c) 2016 com.infohold.BcupBread. All rights reserved.
  --%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
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
<!-- mui-content -->
<div class="mui-content login-content" ng-controller="phoneLogin" ng-init="basePath='${basePath}';">

    <div class="mui-row login-top-bar">

        <div class="mui-col-xs-6" ng-click="back();">
            <img src="img/mine/btn-back.png" />
        </div>

        <div class="mui-col-xs-6 mui-text-right" ng-click="backToMine();">
            <img src="img/mine/btn-close.png" />
        </div>

    </div>

    <div class="row" style="margin-top: 7%;" >
        <div class="login-bubble">
            <input type="text"  ng-model="phoneNo" placeholder="手机号" required/>
            <input type="password" ng-model="password" placeholder="密码" required/>
        </div>
    </div>


    <div class="mui-row bread-row" style="margin-top: 6%;" ng-click="login();">
        <span class="cup-btn cup-btn-white-loginreg">登录</span>
    </div>

    <div class="row mui-text-center" style="margin-top: 3%;" ng-click="forgotPassword();">
        <span style="color: #FFFFFF;">忘记密码？</span>
    </div>

    <div class="login-protocol-text">
        <span>注册即表示我同意BCUP的<a ng-click="announcement();">《用户注册协议》</a></span>
    </div>
</div>
</body>
</html>