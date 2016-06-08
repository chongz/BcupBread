<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%--
  ~ Created by zhangchong on 5/30/2016.
  ~ Copyright (c) 2016 com.infohold.BcupBread. All rights reserved.
  --%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="cupcake">
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <title></title>
    <link href="css/mui.min.css" rel="stylesheet"/>
    <link href="css/bread.css" rel="stylesheet"/>
    <style type="text/css">
        html body {
            background-color: #FFFFFF;
        }

        .mui-content {
            background-color: #FFFFFF;
        }
    </style>
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
<div ng-controller="store" ng-init="basePath='${basePath}';picUrl='${picUrl}';">
    <div class="mui-content" ng-show="success == ok" ng-repeat="city in citys">

        <div class="mui-row bg-self-adaption mui-text-center" style="padding-top: 20%;padding-bottom: 20%; color:#FFFFFF; font-size:22px;
                background-image: url({{picUrl}}{{city.cityPic}});">
            <span ng-bind="city.cityName"></span>
        </div>

        <div class="mui-row" ng-repeat="store in city.storeInfo" >
            <div class="mui-col-xs-12" style="padding-top: 2%;">
                <img src="img/mine/store-line.png" width="90%" style="width:90%;margin: 0 5% 0px 5%;" />
            </div>

            <div class="mui-col-xs-12" style="padding: 2% 9% 2px 9%; font-size: 14px;" ng-click="selectOne($index);">

                <div class="mui-row">
                    <span ng-bind="store.storeName"></span>
                </div>
                <div class="mui-row">
                    <span ng-bind="store.storeAddress"></span>
                </div>

            </div>

        </div>


    </div>
    <div class="mui-content" ng-show="success != ok">
        <span>出错了</span>
    </div>
</div>
<!-- /.mui-content -->
<%@ include file="../footer.jsp" %>
</body>
</html>