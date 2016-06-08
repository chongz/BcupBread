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
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>
    <title></title>
    <link href="css/mui.min.css" rel="stylesheet"/>
    <link href="css/swiper.min.css" rel="stylesheet"/>
    <link href="css/bcup.css" rel="stylesheet"/>
    <style type="text/css">
        .status-div {
            width: 250px;
            height: 250px;
            margin: 0 auto;
            background-image:url(img/mine/order-status-dfk.png);
            padding: 20px;
            background-attachment: fixed center center no-repeat;
            background-size: cover;
        }

        .status-content {
            position: relative;
            width: 100%;
            height: 60%;
            padding-top: 40%;
            border-radius: 50%;
            text-align: center;
            box-sizing: content-box;
        }

        .status-content p {
            margin: 0;
            padding: 0;
            color: #e51b54;
        }

        .status-content p:nth-child(1) {
            font-size: 55px;
        }

        .status-content p:nth-child(2) {
            margin-top: 45px;
            font-size: 12px;
        }

        .status-content .big-word {
            font-size: 66px;
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
<div class="mui-content bg-gradient" >

    <!-- 订单状态图 - 待发货 -->
    <div class="mui-row mui-text-center" style="margin-top: 20%;">

        <div class="status-div">

            <div class="status-content">
                <p>待付款</p >
                <p>订单编号：509517905
            </div>
        </div>
    </div>

    <div class="mui-row mui-text-center" style="margin-top: 20%;">

        <div class="status-div" style="background-image: url(img/mine/order-status-df.png);">

            <div class="status-content">
                <p>待发货</p >
                <p>订单编号：509517905
            </div>
        </div>
    </div>

    <div class="mui-row mui-text-center" style="margin-top: 20%;">

        <div class="status-div" style="background-image: url(img/mine/order-status-dsh.png);">

            <div class="status-content">
                <p>待收货</p >
                <p>订单编号：509517905
            </div>
        </div>
    </div>

    <div class="mui-row mui-text-center" style="margin-top: 20%;">

        <div class="status-div" style="background-image: url(img/mine/order-status-finish.png);">

            <div class="status-content">
            </div>
        </div>
    </div>

    <!-- 灰色圆球 -->
    <div class="mui-row mui-text-center" style="margin-top: 40px;">
        <img src="img/mine/order-small-grey.png" style="width: 30px;"/>
    </div>
    <!-- /.订单状态图 - 待发货 -->

    <!-- 烘焙 -->
    <div class="mui-row mui-text-center" style="margin-top: 40px; ">
        <div class="mui-col-xs-3 mui-col-sm-4">

        </div>
        <div class="mui-col-xs-3 mui-col-sm-2 mui-text-center" ">
        <img src="img/mine/order-big-red.png" style="width: 40px;  "/>
    </div>

    <div class="mui-col-xs-3 mui-col-sm-2 mui-text-center" >
        <img src="img/mine/order-small-grey.png" style="width: 30px; margin-top: 5px;"/>
    </div>
    <div class="mui-col-xs-3 mui-col-sm-4">

    </div>

</div>

<div class="mui-row mui-text-center" style="margin-top: 15px; font-size: 14px;">
    <div class="mui-col-xs-3 mui-col-sm-4">

    </div>
    <div class="mui-col-xs-3 mui-col-sm-2 mui-text-center">
        烘焙
    </div>

    <div class="mui-col-xs-3 mui-col-sm-2 mui-text-center" >
        配送
    </div>
    <div class="mui-col-xs-3 mui-col-sm-4">

    </div>

</div>
<!-- /.烘焙 -->

<!-- 配送 -->
<div class="mui-row mui-text-center" style="margin-top: 40px; ">
    <div class="mui-col-xs-3 mui-col-sm-4">

    </div>
    <div class="mui-col-xs-3 mui-col-sm-2 mui-text-center" ">
    <img src="img/mine/order-small-grey.png" style="width: 30px; margin-top: 5px;"/>
</div>

<div class="mui-col-xs-3 mui-col-sm-2 mui-text-center" >
    <img src="img/mine/order-big-red.png" style="width: 40px;  "/>
</div>
<div class="mui-col-xs-3 mui-col-sm-4">

</div>

</div>

<div class="mui-row mui-text-center" style="margin-top: 15px; margin-bottom: 100px; font-size: 14px;">
    <div class="mui-col-xs-3 mui-col-sm-4">

    </div>
    <div class="mui-col-xs-3 mui-col-sm-2 mui-text-center">
        烘焙
    </div>

    <div class="mui-col-xs-3 mui-col-sm-2 mui-text-center" >
        配送
    </div>
    <div class="mui-col-xs-3 mui-col-sm-4">

    </div>

</div>
<!-- /.配送 -->

</div>
<!-- /.mui-content -->
<%@ include file="../../footer.jsp" %>

</body>
</html>