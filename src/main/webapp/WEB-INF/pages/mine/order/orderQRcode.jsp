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
        body,
        .mui-content {
            background-color: #e51b54;
        }

        .bqrcode-bg {
            position: relative;
            background-color: #FFF;
            min-height: 100px;
            box-sizing: border-box;
            margin: 25px 25px;
            padding: 15px;
            line-height: 30px;
            border-radius: 6px;
        }

        .circle {
            position: absolute;
            top: 75px;
            width: 16px;
            height: 16px;
            background: #e51b54;
            border-radius: 50%;
        }

        .circle-left {
            left: -8px;
        }

        .circle-right {
            right: -8px;
        }

        canvas {
            width: 100%;
        }

        h2,
        h3 {
            color: #e51b54;
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
    <script type="text/javascript" src="js/jquery.qrcode.js"></script>
    <script type="text/javascript" src="js/qrcode.js"></script>
</head>
<body>
<!-- mui-content -->
<div class="mui-content" style="padding-top: 15px;">

    <div class="mui-row">

        <div class="bqrcode-bg">

            <!-- title -->
            <div class="mui-row mui-text-center" style=" padding-top: 10px;">
                <h3>提货二维码</h3>
            </div>
            <!-- /.title -->

            <!-- left right circle -->
            <div class="circle circle-left"></div>
            <div class="circle circle-right"></div>
            <!-- /.left right circle -->

            <!-- line -->
            <div class="mui-row" style="color: #e51b54; padding-top: 22px; padding-left: 20px; padding-right: 20px;">
                <div style="height: 1px; border: 1px dashed #e51b54; "></div>
            </div>
            <!-- /.line -->

            <div class="mui-row">
                <div id="qrcode" style="margin: 20px 20px;"></div>
            </div>

            <div class="mui-row mui-text-center">
                <h2>7933-4398-183</h2>
            </div>

            <div class="mui-row mui-text-center" style="margin-top: 15px;">
                <h3>请向店员出示</h3>
            </div>

        </div>

    </div>

</div>
<!-- /.mui-content -->
<%@ include file="../../footer.jsp" %>
<script>

    // 二维码生成代码
    jQuery(function() {
        jQuery('#qrcode').qrcode({
            text: toUtf8("龙哥测试专用,7933-4398-183") //任意内容,如无需中文则不用转码
        });
    })
</script>
</body>
</html>