<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!DOCTYPE html>
<html ng-app="cupcake">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <title></title>
    <link href="css/mui.min.css" rel="stylesheet"/>
    <link href="css/mui.picker.min.css" rel="stylesheet"/>
    <link href="css/bread.css" rel="stylesheet"/>
    <style type="text/css">
        .mui-table-view {
            line-height: 27px;
        }

        .mui-navigate-right:after,
        .mui-push-right:after {
            color: #d72551;
            font-weight: bold;
        }

        .mui-table-view-cell.mui-collapse>.mui-navigate-right:after,
        .mui-table-view-cell.mui-collapse>.mui-push-right:after {
            content: '\e583';
        }

        .mui-table-view-cell.mui-collapse.mui-active>.mui-navigate-right:after,
        .mui-table-view-cell.mui-collapse.mui-active>.mui-push-right:after {
            content: '\e581';
        }

        .mui-btn-blue,
        .mui-btn-primary,
        input[type=submit] {
            border: 1px solid #E51B54;
            background-color: #E51B54;
        }

        .mui-table-view-cell.mui-active {
            background-color: #FFFFFF;
        ;
        }

        .mui-content {
            background-color: #FFFFFF;
            height: 100%;
        }

        .sp-row {
            background-color: #FFFFFF;
            height: 100px;
        }

        .confirm-odr-list-content {
            padding: 0;
            font-size: 14px;
        }

        .confirm-odr-list-content img {
            width: 25px;
            margin-right: 20px;
            vertical-align: middle;
        }

        .confirm-odr-list-content span {
            color: #7A7A7A;
        }

        .right-text {
            padding-right: 25px;
        }

        .confirm-count-content {
            background-color: #FFFFFF;
            min-height: 108px;
            padding-top: 10px;
            margin-bottom: 30px;
        }

        .confirm-count-content img {
            width: 40px;
            vertical-align: middle;
        }

        .confirm-count-content p {
            font-size: 13px;
            line-height: 13px;
        }

        .cup-page-header {
            background-color: #efeff4;
        }

        .mui-collapse-content {
            color: #7A7A7A;
            padding: 0;
            font-size: 14px;
        }
    </style>

    <script type="text/javascript" src="js/mui.min.js"></script>
    <script type="text/javascript" src="js/jquery-2.1.0.js"></script>
    <script type="text/javascript" src="js/swiper.min.js"></script>
    <script type="text/javascript" src="js/jquery-2.1.0.js"></script>
    <script type="text/javascript" src="js/angular1.3.0.min.js"></script>
    <script type="text/javascript" src="js/localforage.min.js"></script>
    <script type="text/javascript" src="js/angular-localForage.min.js"></script>
    <script type="text/javascript" src="js/mui.picker.min.js"  charset="utf-8"></script>
    <script type="text/javascript" src="js/mui.view.js" charset="utf-8"></script>
    <script type="text/javascript" src="js/commons.js"></script>
    <script type="text/javascript" src="js/cupcake.js"></script>
</head>
<body ng-controller="orderConfirm" ng-init="picUrl='${picUrl}';where='${where}';">
<div class="mui-content" >

    <div class="mui-row cup-page-header">
        确认订单
    </div>

    <div class="mui-row sp-row" ng-repeat="o in ordersCart" ng-show="where == 'shoppingCart'">

        <div class="mui-col-xs-3 mui-text-center" style="top:22px;">
            <img src="{{picUrl}}{{o.pic}}" />
        </div>

        <div class="mui-col-xs-9" style="line-height: 50px; padding: 0 5% 0 5%;">
            <div class="mui-row">
                <span>{{o.name}}</span>
                <span class="mui-pull-right" style="color: #E51B54;">￥{{o.productPrice}}</span>
            </div>
            <div class="mui-row">
                <div class="mui-col-xs-12">
                    <p class="mui-pull-right">数量：&times;{{o.num}}</p>
                </div>
            </div>
        </div>
    </div>

    <div class="mui-row sp-row" ng-repeat="o in orders" ng-show="where != 'shoppingCart'">

        <div class="mui-col-xs-3 mui-text-center" style="top:22px;">
            <img src="{{picUrl}}{{o.pi.overPic}}" />
        </div>

        <div class="mui-col-xs-9" style="line-height: 50px; padding: 0 5% 0 5%;">
            <div class="mui-row">
                <span>{{o.pi.productName}}</span>
                <span class="mui-pull-right" style="color: #E51B54;">￥{{o.pi.productPrice}}</span>
            </div>
            <div class="mui-row">
                <div class="mui-col-xs-12">
                    <p class="mui-pull-right">数量：&times;{{o.num}}</p>
                </div>
            </div>
        </div>
    </div>
    <!-- /.product row -->

    <div class="cup-line-height-5"></div>
    <!--配送方式 -->
    <div class="mui-row">

        <ul class="mui-table-view">
            <li class="mui-table-view-cell mui-collapse" id="deliveryWayLi">
                <a class="mui-navigate-right" href="#">
                    <div class="confirm-odr-list-content">
                        <img src="img/icon/icon-_51.png" /><span>配送方式</span>
                        <span class="mui-pull-right right-text">{{deliveryWay}}</span>
                    </div>

                </a>
                <div class="mui-collapse-content">
                    <ul class="mui-table-view" style="margin-top: 0px;background-color: #efeff4;" id="deliveryWay">
                        <%--<li class="mui-table-view-cell mui-radio mui-left">--%>
                            <%--<input name="radio-delivery" type="radio">&nbsp;&nbsp;商家配送（{{}}元起,免费配送）--%>
                        <%--</li>--%>
                        <%--<li class="mui-table-view-cell mui-radio mui-left">--%>
                            <%--<input name="radio-delivery" type="radio">&nbsp;&nbsp;店内自提--%>
                        <%--</li>--%>
                    </ul>
                </div>
            </li>

        </ul>

    </div>
    <!--/.配送方式 -->
    <div class="cup-line-height-5"></div>

    <div class="mui-row ">
        <ul class="mui-table-view bg-self-adaption" style="background-image: url(img/mine/bg-add-address.png); line-height: 48px;">
            <div class="mui-table-view-cell" ng-click="selectAddress();">
                <p class="mui-navigate-right">
                    <p class="confirm-odr-list-content">
                        <img src="img/icon/icon-_07.png" />
                        <span ng-show="deliveryWayFlg == '1' && orderUserAddress == undefined" class="mui-pull-right right-text">添加地址</span>

                        <p class="mui-row " ng-show="deliveryWayFlg == '1'">
                            {{orderUserAddress.name}}
                        </p>
                        <p ng-show="deliveryWayFlg == '1'">
                           {{orderUserAddress.detail}}
                        </p>

                        <span ng-show="deliveryWayFlg == '2' && pickStore == undefined" class="mui-pull-right right-text">选择提货店</span>

                        <p class="mui-row " ng-show="deliveryWayFlg == '2'">
                            {{pickStore.storeName}} &nbsp;&nbsp;{{pickStore.storePhone}}
                        </p>
                        <p ng-show="deliveryWayFlg == '2'">
                            {{pickStore.storeAddress}}
                        </p>
                    </p>
                </p>
            </div>
        </ul>
    </div>


    <div class="cup-line-height-5"></div>
    <!--送货日期 -->
    <div class="mui-row">

        <ul class="mui-table-view">
            <li class="mui-table-view-cell">
                <a class="mui-navigate-right mui-dtPicker" ng-click="selectDate();">
                    <div class="confirm-odr-list-content">
                        <img src="img/icon/icon-_37.png" /><span>送货日期</span><span class="mui-pull-right right-text">{{deliveryDate}}</span>
                    </div>

                </a>
            </li>

        </ul>

    </div>
    <!--/.送货日期 -->

    <div class="cup-line-height-5"></div>
    <!--送货时间 -->
    <div class="mui-row">

        <ul class="mui-table-view">
            <li class="mui-table-view-cell">
                <a class="mui-navigate-right mui-dtPicker"  ng-click="selectTime();">
                    <div class="confirm-odr-list-content">
                        <img src="img/icon/icon-_37.png" /><span>送货时间</span><span class="mui-pull-right right-text" >{{deliveryTime}}</span>
                    </div>

                </a>
            </li>

        </ul>

    </div>
    <!--/.送货时间 -->

    <div class="cup-line-height-5"></div>

    <div class="cup-line-height-5"></div>
    <!--留言 -->
    <div class="mui-row">
        <ul class="mui-table-view">
            <li class="mui-table-view-cell mui-collapse" id="msg">
                <a class="mui-navigate-right" >
                    <div class="confirm-odr-list-content">
                        <img src="img/icon/icon-_38.png" /><span>留言 </span>
                        <span class="mui-pull-right right-text">{{msg.substr(0,16)}}</span>
                    </div>

                </a>
                <div class="mui-collapse-content">
                    <textarea name="" rows="5" cols="" placeholder="请输入留言" ng-model="msg"></textarea>
                </div>
            </li>

        </ul>

    </div>
    <!--/.留言  -->

    <div class="cup-line-height-5"></div>
    <!--支付方式-->
    <div class="mui-row">

        <ul class="mui-table-view">
            <li class="mui-table-view-cell mui-collapse" id="payTypeLi">
                <a class="mui-navigate-right" >
                    <div class="confirm-odr-list-content">
                        <img src="img/icon/icon-_39.png" /><span>支付方式 </span>
                        <span class="mui-pull-right right-text">{{payTypeText}}</span>
                    </div>

                </a>
                <div class="mui-collapse-content">
                    <ul class="mui-table-view" style="margin-top: 0px; background-color: #efeff4;">
                        <li class="mui-table-view-cell mui-radio mui-left" ng-click="selectPayType(1);">
                            <input name="radio-payment" type="radio">&nbsp;&nbsp;货到付款(POS机刷卡)
                        </li>
                        <li class="mui-table-view-cell mui-radio mui-left" ng-click="selectPayType(2);">
                            <input name="radio-payment" type="radio">&nbsp;&nbsp;货到付款(现金)
                        </li>
                        <%--<li class="mui-table-view-cell mui-radio mui-left">--%>
                            <%--<input name="radio-payment" type="radio">&nbsp;&nbsp;自提扫码付款--%>
                        <%--</li>--%>
                    </ul>
                </div>
            </li>

        </ul>

    </div>
    <!--/.支付方式  -->

    <div class="cup-line-height-5"></div>
    <!--合计运费-->
    <div class="mui-row confirm-count-content">
        <div class="mui-col-xs-2 mui-text-center" style="margin-bottom: 100px;">
            <img src="img/icon/icon-_36.png" />
        </div>

        <div class="mui-col-xs-10">
            <p>商品金额（单价&times;数量）：￥{{productsPrice}}</p>
            <p>运费：￥{{deliveryChargeText}}</p>
        </div>
    </div>
    <!--/.合计运费-->

    <div class="mui-row cup-footer">
        <div class="mui-col-xs-5 mui-text-center">
            <span style="color: #e51b54;">总计：￥{{totalPrice}}</span>
        </div>
        <div class="mui-col-xs-7 mui-text-right" style="top:12px;">
            <a ng-click="addOrder();" class="bread-btn cup-btn-red" style="width: 100px; height: 35px; line-height: 35px; margin-right: 20px;">确认</a>
        </div>
    </div>

</div>
<%@ include file="../../footer.jsp" %>
    <%--<script>--%>
    <%--(function($) {--%>
        <%--$.init();--%>
        <%--var btns = $('.mui-dtPicker');--%>
        <%--btns.each(function(i, btn) {--%>
            <%--btn.addEventListener('tap', function() {--%>
                <%--var optionsJson = this.getAttribute('data-options') || '{}';--%>
                <%--var options = JSON.parse(optionsJson);--%>
                <%--var id = this.getAttribute('id');--%>
                <%--var result;--%>
                <%--if ('choiseDate' == id) {--%>
                    <%--result = document.getElementById("dateResult");--%>
                <%--} else {--%>
                    <%--result = document.getElementById("timeResult");--%>
                <%--}--%>
                <%--/*--%>
                 <%--* 首次显示时实例化组件--%>
                 <%--* 示例为了简洁，将 options 放在了按钮的 dom 上--%>
                 <%--* 也可以直接通过代码声明 optinos 用于实例化 DtPicker--%>
                 <%--*/--%>
                <%--var picker = new $.DtPicker(options);--%>
                <%--picker.show(function(rs) {--%>
                    <%--/*--%>
                     <%--* rs.value 拼合后的 value--%>
                     <%--* rs.text 拼合后的 text--%>
                     <%--* rs.y 年，可以通过 rs.y.vaue 和 rs.y.text 获取值和文本--%>
                     <%--* rs.m 月，用法同年--%>
                     <%--* rs.d 日，用法同年--%>
                     <%--* rs.h 时，用法同年--%>
                     <%--* rs.i 分（minutes 的第二个字母），用法同年--%>
                     <%--*/--%>
                    <%--result.innerText = rs.text;--%>
                    <%--/*--%>
                     <%--* 返回 false 可以阻止选择框的关闭--%>
                     <%--* return false;--%>
                     <%--*/--%>
                    <%--/*--%>
                     <%--* 释放组件资源，释放后将将不能再操作组件--%>
                     <%--* 通常情况下，不需要示放组件，new DtPicker(options) 后，可以一直使用。--%>
                     <%--* 当前示例，因为内容较多，如不进行资原释放，在某些设备上会较慢。--%>
                     <%--* 所以每次用完便立即调用 dispose 进行释放，下次用时再创建新实例。--%>
                     <%--*/--%>
                    <%--picker.dispose();--%>
                <%--});--%>
            <%--}, false);--%>
        <%--});--%>
    <%--})(mui);--%>
<%--</script>--%>
</body>
</html>