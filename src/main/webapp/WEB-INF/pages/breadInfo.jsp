<%--
  Created by IntelliJ IDEA.
  User: zhangchong
  Date: 6/2/16
  Time: 1:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html ng-app="cupcake">
<head>
    <meta charset="utf-8">
    <title>面包不靠谱</title>
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <link rel="stylesheet" href="css/mui.min.css"/>
    <link rel="stylesheet" href="css/bread.css"/>

    <style type="text/css">
        body,
        .mui-content,
        .mui-row {
            background-color: #FFFFFF;
        }

        .bread-row {
            margin: 15px 20px 15px 20px;
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
<body ng-controller="breadInfo" ng-init="picUrl='${picUrl}';isLogin='${isLogin}';">
<div class="mui-content">

    <div class="mui-row bread-row announce-box" ng-show="notice.secPic != '' ">
        <img src="{{picUrl}}{{notice.secPic}}"/>
    </div>

    <div class="mui-row bread-row announce-box" ng-show="notice.thrPic != '' ">
        <img src="{{picUrl}}{{notice.thrPic}}"/>
    </div>

    <div class="mui-row bread-row-novertical" style="line-height: 25px;">
        <p style="margin-bottom: 0px;">{{notice.updateTime}} </p>
    </div>

    <div class="mui-row bread-row-novertical">
        <h4>{{notice.noticeName}}</h4>
        <p style="margin-bottom: 0px;">{{notice.noticeDec}}</p>
    </div>

    <div class="mui-row bread-row"
         style="border-top: 1px solid #e6e6e6;border-bottom: 1px solid #e6e6e6; height:30px; line-height: 30px;">
        <p style="margin-bottom: 0px;">阅读 {{notice.readTime}}
            <%--<span class="mui-pull-right">--%>
                <%--<a ng-click="share();"><img src="img/icon/icon-share.png" class="announce-icon"/></a>--%>
                <%--<a ng-click="addGallery();"><img src="img/icon/icon-favorite.png" class="announce-icon"/></a>--%>
                <%--<a ng-click="addShoppingCart();"><img src="img/icon/icon-shoppingcart.png" class="announce-icon"/></a>--%>
            <%--</span>--%>
        </p>
    </div>

</div>

<%@include file="footer.jsp" %>

</body>
</html>
