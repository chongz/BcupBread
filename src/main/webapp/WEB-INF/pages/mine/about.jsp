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

    <style type="text/css">
        .about-connect {
            margin-top: 80px;
            margin-left: 30px;
            margin-right: 30px;
        }

        .about-connect p {
            font-size: 12px;
            line-height: 15px;
            margin-bottom: 0px;
            color: #000000;
        }

        .about-connect div {
            border-left: 1px solid #e51b54;
            text-align: center;
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
<body ng-controller="about">

<div class="mui-content" style="background: -webkit-radial-gradient(300px, white, #efeff4);
	background: -o-radial-gradient(300px, white, #efeff4);
	background: -moz-radial-gradient(300px, white, #efeff4);
	background: radial-gradient(300px, white, #efeff4);">

    <div class="row mui-text-center">
        <img src="img/mine/logo_black.png" style="width: 43%; padding-top: 230px;" />
    </div>

    <div class="mui-row  about-connect mui-text-center">
        <div class="mui-col-xs-4">
            <p>客服微信号</p>
            <p>{{WechatKF}}</p>
        </div>

        <div class="mui-col-xs-4">
            <p>客服微信号</p>
            <p>{{WechatGZ}}</p>
        </div>

        <div class="mui-col-xs-4" style="border-right: 1px solid #e51b54;">
            <p>客服微信号</p>
            <p>{{KFPhone}}</p>
        </div>
    </div>

    <div class="mui-row mui-text-center" style="margin-top: 4%;">
        <p style="margin-top: 25px;">版权所有&copy;2015-2020 Bcup.com,Inc.</p>
    </div>
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>