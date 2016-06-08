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
<body >
<div class="mui-content login-content" ng-controller="loginRegisterSelector">

    <div class="mui-row login-top-bar">

        <div class="mui-col-xs-6"  >
        </div>

        <div class="mui-col-xs-6 mui-text-right" >
            <img src="img/mine/icon-del-list.png" ng-click="back();"/>
        </div>

    </div>

    <div class="row mui-text-center" style="margin-top: 30%;" >
        <img src="img/mine/logo.png" width="87%" />
    </div>

    <div class="mui-row bread-row" style="margin-top: 38%;" ng-click="register();">
        <a class="cup-btn cup-btn-white" >
            <span>注册</span>
        </a>
    </div>

    <div class="mui-row bread-row" style="margin-top: 3%;" ng-click="login();">
        <a class="cup-btn cup-btn-white">
            <span>登录</span>
        </a>
    </div>
</div>
<!-- /.mui-content -->


<%@ include file="../footer.jsp" %>
</body>
</html>