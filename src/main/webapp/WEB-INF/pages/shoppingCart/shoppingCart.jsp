<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%--
  ~ Created by zhangchong on 5/30/2016.
  ~ Copyright (c) 2016 com.infohold.BcupBread. All rights reserved.
  --%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="cupcake">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <title></title>
    <link rel="stylesheet" type="text/css" href="css/mui.min.css" />
    <link rel="stylesheet" type="text/css" href="css/bread.css"/>

    <style type="text/css">
        .mui-content-nologin {
            background-image: url(img/shopping/bg-sp-nocontent.png);
        }

        .mui-content-login-no-content {
            background-image: url(img/shopping/bg-sp-nocontent.png);
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
<body ng-controller="shoppingCart" ng-init="isLogin='${isLogin}';isEmpty='${isEmpty}';picUrl='${picUrl}';where='${where}';">
<div class="mui-content-nologin bg-self-adaption" ng-show="isLogin == '0' ">
    <div class="mui-row bg-nologin-nocontent ">
        <span>未登录</span>
        <p>购买您喜欢的</p>
        <a class="bread-btn bread-btn-black" style="width: 87%;" ng-click="goToLoginRegister();">现在去登录或注册</a>
    </div>
</div>

<div class="mui-content-login-no-content bg-self-adaption" ng-show="isLogin == '1' && isEmpty == '1' ">
    <div class="mui-row bg-nologin-nocontent">
        <span>购物车内无商品</span>
        <!--<a class="bread-btn bread-btn-black" style="width: 87%;" ng-click="goToCustom();">去定制您喜欢的</a>-->
        <a class="bread-btn bread-btn-black" style="width: 87%;" ng-click="goToIndex();">看看推荐</a>
    </div>
</div>

<div class="mui-content" ng-show="isLogin == '1' && isEmpty == '0' ">
    <div class="mui-row cup-page-header" style="background-color: #efeff4;">
        <div id="sp-title-cart">
            <span style="padding-left: 15%;">购物车</span>
            <div id="shopListEdit" class="mui-pull-right cup-page-header-right ">编辑<span
                    class="icon-chevron-right"></span></div>
        </div>

        <div id="sp-title-edit" style="display: none;">
            <span style="padding-left: 15%;">编辑</span>
            <div id="return-cart" class="mui-pull-right cup-page-header-right ">返回<span
                    class="icon-chevron-right"></span></div>
        </div>
    </div>
</div>
<div id="pullrefresh" class="mui-content mui-scroll-wrapper" ng-show="isLogin == '1' && isEmpty == '0' " style="top: 8%;height: 82%;">
    <div class="mui-scroll">
        <ul class="mui-table-view mui-table-view-chevron">
        </ul>
    </div>
</div>
<div class="mui-row cup-footer" style="z-index: 3" ng-show="isLogin == '1' && isEmpty == '0' ">

    <div class="mui-col-xs-3 mui-checkbox mui-text-center">
        <input type="checkbox" name=""  value="" ng-click="selectAll();"/>&nbsp;全选
    </div>

    <div class="mui-col-xs-5 ">
        <div id="sp-count" class="mui-text-center">
            总计：<span style="color: #E51B54;">￥{{totalPrice}}</span>
        </div>
        <div id="sp-fav" class="mui-text-right" style="display: none;">
            <a id="sp-link-fav" class="cup-btn cup-btn-red sp-btn-group" ng-click="addGallery()" style="width: 90px; ">移入收藏</a>
        </div>
    </div>

    <div class="mui-col-xs-4 mui-text-right" style="padding-right: 20px;" ng-show="isLogin == '1' && isEmpty == '0' ">
        <div id="sp-checkout">
            <a ng-click="buyShoppingCart();" id="sp-link-checkout" class="cup-btn cup-btn-red sp-btn-group" style="width: 90px; ">去结账</a>
        </div>

        <div id="sp-del" style="display: none;">
            <a ng-click="deleteShoppingCart();" id="sp-link-del" class="cup-btn cup-btn-red sp-btn-group" style="width: 90px; ">删除</a>
        </div>
    </div>
</div>

</div>
<!-- /.mui-content -->
<script type="text/javascript">
    $(document).ready(function() {
//        // 数量间隔
//        var number_space = 6;
//        // + 处理
//        $(".cup-left-plus").click(function(e) {
//            $(this).next().text(parseInt($(this).next().text()) + number_space);
//        });
//        // - 处理
//        $(".cup-right-minus").click(function(e) {
//            var currentVal = parseInt($(this).prev().text());
//            if (currentVal != 6) {
//                $(this).prev().text(parseInt($(this).prev().text()) - number_space);
//            }
//        });
        // 点击 右上角编辑
        $("#shopListEdit").click(function(e) {
            $("#sp-count").hide();
            $("#sp-checkout").hide();
            $("#sp-title-cart").hide();
            $("#sp-fav").show();
            $("#sp-del").show();
            $("#sp-title-edit").show();
        });
        // 点击 右上角返回
        $("#return-cart").click(function(e) {
            $("#sp-count").show();
            $("#sp-checkout").show();
            $("#sp-title-cart").show();
            $("#sp-fav").hide();
            $("#sp-del").hide();
            $("#sp-title-edit").hide();
        });
        // 全选
//        $("#checkAll").click(function(e) {
//            $(':checkbox').prop("checked", this.checked);
//        });

//        // checkbox选中事件监听
//        $(":checkbox").bind("change", function() {
//            // 选中
//            if ($("input[type='checkbox']").is(':checked')) {
//                $(".sp-btn-group").addClass("cup-btn-red").removeClass("cup-btn-disabled");
//            }
//            // 未选中
//            else {
//                $(".sp-btn-group").addClass("cup-btn-disabled").removeClass("cup-btn-red");
//            }
//        });
        <%--// 删除按钮事件--%>
        <%--$("#sp-link-del").click(function(e) {--%>
            <%--if ($(this).hasClass("cup-btn-red")) {--%>
                <%--mui.confirm('确定要删除吗？', "${cupcakeName}", ['是', '否'], function(e) {--%>
                    <%--if (e.index == 1) {--%>
                        <%--// 确定--%>
                    <%--} else {--%>
                        <%--// 取消--%>
                    <%--}--%>
                <%--});--%>
            <%--}--%>
        <%--});--%>
        <%--// 移入收藏按钮事件--%>
        <%--$("#sp-link-fav").click(function(e) {--%>
            <%--if ($(this).hasClass("cup-btn-red")) {--%>
                <%--mui.alert('已加入收藏', '${cupcakeName}', function() {--%>
                    <%--// 确定后事件--%>
                <%--});--%>
            <%--}--%>
        <%--});--%>
        <%--// 去结账事件--%>
        <%--$("#sp-link-checkout").click(function(e) {--%>
            <%--if ($(this).hasClass("cup-btn-red")) {--%>
                <%--location.href = "confirm-order.html";--%>
            <%--}--%>
        <%--});--%>
    });
</script>
<%@ include file="../footer.jsp" %>

</body>
</html>