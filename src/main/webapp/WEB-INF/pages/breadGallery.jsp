<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html ng-app="cupcake">
<head>
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <link rel="stylesheet" href="css/mui.min.css" />
    <link rel="stylesheet" href="css/swiper.min.css" />
    <link rel="stylesheet" href="css/bread.css" />

    <style type="text/css">
        body,
        .mui-content,
        .mui-row {
            background-color: #FFFFFF;
        }

        .swiper-container {
            width: 100%;
            height: 100%;
        }

        .swiper-slide {
            text-align: center;
            font-size: 16px;
            background: #fff;
            /* Center slide text vertically */
            display: -webkit-box;
            display: -ms-flexbox;
            display: -webkit-flex;
            display: flex;
            -webkit-box-pack: center;
            -ms-flex-pack: center;
            -webkit-justify-content: center;
            justify-content: center;
            -webkit-box-align: center;
            -ms-flex-align: center;
            -webkit-align-items: center;
            align-items: center;
        }
        /* ---------------------------------------------------- */



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
<body ng-controller="breadGallery" ng-init="picUrl='${picUrl}';">
<!-- mui-content -->
<div class="mui-content breadGallery">

    <div class="mui-row mui-text-center category-title">
        <span>
                &bull;&nbsp;SPELT&nbsp;&bull;
        </span>
    </div>

    <!-- top nav -->
    <div class="mui-row category-row " style="margin-bottom: 20px !important;" >

        <!-- Swiper -->
        <div class="swiper-container" id="category-nav-swiper">
            <div class="swiper-wrapper category-nav">
                <div class="swiper-slide">
                    <ul>
                        <li ng-click="selectOne($event,p.kindsID);" ng-class="($index == 0 ) ? 'category-nav-item active' : 'category-nav-item'" ng-repeat="p in list">{{p.kindsName}}</li>
                    </ul>
                </div>
                <%--<div class="swiper-slide">--%>
                    <%--<ul>--%>
                        <%--<li class="category-nav-item">巴西</li>--%>
                    <%--</ul>--%>
                <%--</div>--%>
            </div>
        </div>
        <!-- /.Swiper -->
    </div>
    <!-- /.top nav -->



</div>

<%@include file="footer.jsp"%>

</body>
</html>
