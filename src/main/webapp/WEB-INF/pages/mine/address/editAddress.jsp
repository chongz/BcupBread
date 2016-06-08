<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
    <link rel="stylesheet" type="text/css" href="css/mui.picker.min.css"/>
    <link rel="stylesheet" type="text/css" href="css/mui.poppicker.css"/>
    <style type="text/css">
        .addr-content {
            background-image: url(img/mine/bg-mine.png);
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
    <script type="text/javascript" src="js/city.cupcake.js"  charset="utf-8"></script>
    <script type="text/javascript" src="js/area.cupcake.js"  charset="utf-8"></script>
    <script type="text/javascript" src="js/mui.picker.min.js" charset="utf-8"></script>
    <script type="text/javascript" src="js/mui.poppicker.js" charset="utf-8"></script>
</head>
<body>
<div class="mui-content addr-content bg-self-adaption" ng-controller="editAddress">
    <div class="mui-row cup-page-header">
        <span>编辑地址</span>
    </div>

    <div class="row" style="margin-top: 7%;">
        <div class="login-bubble">
            <input type="text" placeholder="收件人姓名" ng-model="name" />
            <input type="text" placeholder="联系电话" ng-model="phone" />
            <input type="text" placeholder="性别" ng-model="sexText" ng-click="pickSex();"/>
            <input type="text" placeholder="收货地址" ng-model="areaText" ng-click="pickArea();" class="mui-input-clear" readonly="readonly"  />
            <input type="text" placeholder="详细地址" ng-model="detail" />
        </div>
    </div>

    <div class="mui-row row bread-row" style="margin-top: 10%;">
        <a ng-click="save();" class="cup-btn bread-btn-black">
            <span>确定</span>
        </a>
    </div>
</div>

<%@ include file="../../footer.jsp" %>
</body>
</html>