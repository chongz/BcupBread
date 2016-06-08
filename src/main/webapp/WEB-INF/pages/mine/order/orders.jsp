<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="cupcake">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <title></title>
    <link href="css/mui.min.css" rel="stylesheet"/>
    <link href="css/swiper.min.css" rel="stylesheet"/>
    <link href="css/bread.css" rel="stylesheet"/>
    <style type="text/css">
        <style type="text/css">
        .order_tab_bar {
            margin-top: 2%;
        }

        .order_tab_bar ul {
            padding: 0 0 0 0px;
            margin: 0 0 0 0px;
            float: left;
            width: 100%;
            height: 100%;
        }

        .order_tab_bar ul li {
            float: left;
            list-style: none;
            width: 20%;
            text-align: center;
        }

        .order_tab_bar ul li img {
            width: 100%;
        }

        .order_tab_bar ul li div:nth-child(1) {
            background-color: #DCDCDC;
            width: 100%;
            height: 2px;
        }

        .order_tab_bar ul li div:nth-child(2) {
            background-color: #FFFFFF;
            width: 100%;
            height: 40px;
            line-height: 40px;
        }

        .order_tab_bar ul li div:nth-child(3) {
            background-color: #DCDCDC;
            width: 100%;
            height: 2px;
        }

        .order-tab-active {
            background-color: #010101 !important;
        }

        .order_item {
            position: relative;
            background-color: #FFF;
            min-height: 100px;
            box-sizing: border-box;
            margin: 0 15px;
            padding: 15px;
            line-height: 30px;
            border-radius: 6px;
        }

        .circle {
            position: absolute;
            top: 45px;
            width: 16px;
            height: 16px;
            background: #efeff4;
            border-radius: 50%;
        }

        .circle-left {
            left: -8px;
        }

        .circle-right {
            right: -8px;
        }

        .bread-btn-black {
            width: 30%;
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
<div class="mui-content">

    <div class="row cup-page-header">
        <span>我的订单</span>
    </div>

    <div class="mui-row order_tab_bar">
        <ul>
            <li class="cup-order-tab">
                <div class="order-tab-active"></div>
                <div>全部</div>
                <div class="order-tab-active"><span></span></div>
            </li>
            <li class="cup-order-tab">
                <div></div>
                <div>待付款</div>
                <div><span></span></div>
            </li>
            <li class="cup-order-tab">
                <div></div>
                <div>待发货</div>
                <div><span></span></div>
            </li>
            <li class="cup-order-tab">
                <div></div>
                <div>待收货</div>
                <div><span></span></div>
            </li>
            <li class="cup-order-tab">
                <div></div>
                <div>已完成</div>
                <div><span></span></div>
            </li>
        </ul>
    </div>

    <div class="swiper-container" id="order-swiper-container" style="height: auto !important;">
        <div class="swiper-wrapper">

            <!-- 全部 -->
            <div class="swiper-slide" style="display: block; ">

                <div class="mui-row" style="margin-top: 3%;margin-bottom: 3%;">

                    <div class="order_item">

                        <div onclick="javascript:location.href='order-status.html'">
                            <div class="circle circle-left"></div>
                            <div class="circle circle-right"></div>
                            <span>订单编号：509617906</span><span class="mui-pull-right">待发货</span>
                            <div class="bread-line" style="margin-top: 10px;"></div>

                            <div class="mui-row" style="margin-top: 3%;">
                                <div class="mui-col-xs-4 mui-col-sm-3">
                                    <img src="img/demo/bread.png" width="85px" />
                                </div>

                                <div class="mui-col-xs-8  mui-col-sm-9" style="padding-left: 5%;padding-top: 5px; line-height: 15px; border-left: 1px solid #e6e6e6;">
                                    <p style="font-size: 12px;">定制款：名称</p>
                                    <p style="font-size: 12px;">原料：原料AAAAAA<span class="mui-pull-right" style="font-size: 16px; font-weight: bold; color: #E51B54;">￥6.00</span></p>
                                    <p style="font-size: 12px;">配料：配料AAAAAAA<span class="mui-pull-right">&times;6</span></p>
                                </div>

                            </div>

                            <div class="bread-line" style="margin-top: 10px;"></div>

                            <div class="mui-row" style="margin-top: 3%;">
                                <div class="mui-col-xs-4 mui-col-sm-3">
                                    <img src="img/demo/bread2.png" width="85px" />
                                </div>

                                <div class="mui-col-xs-8  mui-col-sm-9" style="padding-left: 5%;padding-top: 5px; line-height: 15px; border-left: 1px solid #e6e6e6;">
                                    <p style="font-size: 12px;">定制款：名称</p>
                                    <p style="font-size: 12px;">原料：原料AAAAAA<span class="mui-pull-right" style="font-size: 16px; font-weight: bold; color: #E51B54;">￥6.00</span></p>
                                    <p style="font-size: 12px;">配料：配料AAAAAAA<span class="mui-pull-right">&times;6</span></p>
                                </div>

                            </div>
                            <div class="bread-line" style="margin-top: 10px;"></div>
                            <div class="mui-row">
										<span class="mui-pull-right" style="font-size: 15px;">
											实付：<span style="color: #E51B54;">￥72.00<span>
										</span>
                            </div>

                        </div>
                        <div class="bread-line" style="margin-top: 10px;"></div>

                        <div class="mui-row mui-text-right" style="margin-top: 3%;">
                            <a href="order-qrcode.html" class="cup-btn bread-btn-black">店内自提</a>
                        </div>

                    </div>

                </div>

                <div class="mui-row" style="margin-top: 3%;margin-bottom: 3%;">

                    <div class="order_item">

                        <div onclick="javascript:location.href='order-status.html'">
                            <div class="circle circle-left"></div>
                            <div class="circle circle-right"></div>
                            <span>订单编号：509617906</span><span class="mui-pull-right">待收货</span>
                            <div class="bread-line" style="margin-top: 10px;"></div>

                            <div class="mui-row" style="margin-top: 3%;">
                                <div class="mui-col-xs-4 mui-col-sm-3">
                                    <img src="img/demo/bread.png" width="85px" />
                                </div>

                                <div class="mui-col-xs-8  mui-col-sm-9" style="padding-left: 5%;padding-top: 5px; line-height: 15px; border-left: 1px solid #e6e6e6;">
                                    <p style="font-size: 12px;">定制款：名称</p>
                                    <p style="font-size: 12px;">原料：原料AAAAAA<span class="mui-pull-right" style="font-size: 16px; font-weight: bold; color: #E51B54;">￥6.00</span></p>
                                    <p style="font-size: 12px;">配料：配料AAAAAAA<span class="mui-pull-right">&times;6</span></p>
                                </div>

                            </div>

                            <div class="bread-line" style="margin-top: 10px;"></div>

                            <div class="mui-row" style="margin-top: 3%;">
                                <div class="mui-col-xs-4 mui-col-sm-3">
                                    <img src="img/demo/bread2.png" width="85px" />
                                </div>

                                <div class="mui-col-xs-8  mui-col-sm-9" style="padding-left: 5%;padding-top: 5px; line-height: 15px; border-left: 1px solid #e6e6e6;">
                                    <p style="font-size: 12px;">定制款：名称</p>
                                    <p style="font-size: 12px;">原料：原料AAAAAA<span class="mui-pull-right" style="font-size: 16px; font-weight: bold; color: #E51B54;">￥6.00</span></p>
                                    <p style="font-size: 12px;">配料：配料AAAAAAA<span class="mui-pull-right">&times;6</span></p>
                                </div>

                            </div>
                            <div class="bread-line" style="margin-top: 10px;"></div>
                            <div class="mui-row">
										<span class="mui-pull-right" style="font-size: 15px;">
											实付：<span style="color: #E51B54;">￥72.00<span>
										</span>
                            </div>

                        </div>
                        <div class="bread-line" style="margin-top: 10px;"></div>

                        <div class="mui-row mui-text-right" style="margin-top: 3%;">
                            <a href="#" class="cup-btn bread-btn-black">确认收货</a>
                        </div>

                    </div>

                </div>

                <div class="mui-row" style="margin-top: 3%;margin-bottom: 3%;">

                    <div class="order_item">

                        <div onclick="javascript:location.href='order-status.html'">
                            <div class="circle circle-left"></div>
                            <div class="circle circle-right"></div>
                            <span>订单编号：509617906</span><span class="mui-pull-right">已完成</span>
                            <div class="bread-line" style="margin-top: 10px;"></div>

                            <div class="mui-row" style="margin-top: 3%;">
                                <div class="mui-col-xs-4 mui-col-sm-3">
                                    <img src="img/demo/bread.png" width="85px" />
                                </div>

                                <div class="mui-col-xs-8  mui-col-sm-9" style="padding-left: 5%;padding-top: 5px; line-height: 15px; border-left: 1px solid #e6e6e6;">
                                    <p style="font-size: 12px;">定制款：名称</p>
                                    <p style="font-size: 12px;">原料：原料AAAAAA<span class="mui-pull-right" style="font-size: 16px; font-weight: bold; color: #E51B54;">￥6.00</span></p>
                                    <p style="font-size: 12px;">配料：配料AAAAAAA<span class="mui-pull-right">&times;6</span></p>
                                </div>

                            </div>

                            <div class="bread-line" style="margin-top: 10px;"></div>

                            <div class="mui-row" style="margin-top: 3%;">
                                <div class="mui-col-xs-4 mui-col-sm-3">
                                    <img src="img/demo/bread2.png" width="85px" />
                                </div>

                                <div class="mui-col-xs-8  mui-col-sm-9" style="padding-left: 5%;padding-top: 5px; line-height: 15px; border-left: 1px solid #e6e6e6;">
                                    <p style="font-size: 12px;">定制款：名称</p>
                                    <p style="font-size: 12px;">原料：原料AAAAAA<span class="mui-pull-right" style="font-size: 16px; font-weight: bold; color: #E51B54;">￥6.00</span></p>
                                    <p style="font-size: 12px;">配料：配料AAAAAAA<span class="mui-pull-right">&times;6</span></p>
                                </div>

                            </div>
                            <div class="bread-line" style="margin-top: 10px;"></div>
                            <div class="mui-row">
										<span class="mui-pull-right" style="font-size: 15px;">
											实付：<span style="color: #E51B54;">￥72.00<span>
										</span>
                            </div>

                        </div>
                        <div class="bread-line" style="margin-top: 10px;"></div>

                        <div class="mui-row mui-text-right" style="margin-top: 3%;">
                            <a href="#" class="cup-btn bread-btn-black">去评价</a>
                        </div>

                    </div>

                </div>
            </div>
            <!--/.全部-->

            <!--待付款-->
            <div class="swiper-slide" style="display: block; ">

                <!--  暂无订单  -->
                <div class="mui-row mui-text-center" style="margin-top: 3%;margin-bottom: 3%; color: #7A7A7A;">
                    <br />
                    <br />
                    <span>您暂时没有订单 </span>
                    <br />
                    <span>随便看看 </span>
                </div>

                <div class="mui-row mui-text-center">
                    <img src="img/mine/no-order.png" style="width: 100%; margin-top: 5%;" />
                </div>
                <!--  /.暂无订单  -->

            </div>
            <!--/.待付款-->

            <!--待发货-->
            <div class="swiper-slide" style="display: block; ">

                <div class="mui-row" style="margin-top: 3%;margin-bottom: 3%;">

                    <div class="order_item">

                        <div onclick="javascript:location.href='order-status.html'">
                            <div class="circle circle-left"></div>
                            <div class="circle circle-right"></div>
                            <span>订单编号：509617906</span><span class="mui-pull-right">待发货</span>
                            <div class="bread-line" style="margin-top: 10px;"></div>

                            <div class="mui-row" style="margin-top: 3%;">
                                <div class="mui-col-xs-4 mui-col-sm-3">
                                    <img src="img/demo/bread.png" width="85px" />
                                </div>

                                <div class="mui-col-xs-8  mui-col-sm-9" style="padding-left: 5%;padding-top: 5px; line-height: 15px; border-left: 1px solid #e6e6e6;">
                                    <p style="font-size: 12px;">定制款：名称</p>
                                    <p style="font-size: 12px;">原料：原料AAAAAA<span class="mui-pull-right" style="font-size: 16px; font-weight: bold; color: #E51B54;">￥6.00</span></p>
                                    <p style="font-size: 12px;">配料：配料AAAAAAA<span class="mui-pull-right">&times;6</span></p>
                                </div>

                            </div>

                            <div class="bread-line" style="margin-top: 10px;"></div>

                            <div class="mui-row" style="margin-top: 3%;">
                                <div class="mui-col-xs-4 mui-col-sm-3">
                                    <img src="img/demo/bread2.png" width="85px" />
                                </div>

                                <div class="mui-col-xs-8  mui-col-sm-9" style="padding-left: 5%;padding-top: 5px; line-height: 15px; border-left: 1px solid #e6e6e6;">
                                    <p style="font-size: 12px;">定制款：名称</p>
                                    <p style="font-size: 12px;">原料：原料AAAAAA<span class="mui-pull-right" style="font-size: 16px; font-weight: bold; color: #E51B54;">￥6.00</span></p>
                                    <p style="font-size: 12px;">配料：配料AAAAAAA<span class="mui-pull-right">&times;6</span></p>
                                </div>

                            </div>
                            <div class="bread-line" style="margin-top: 10px;"></div>
                            <div class="mui-row">
										<span class="mui-pull-right" style="font-size: 15px;">
											实付：<span style="color: #E51B54;">￥72.00<span>
										</span>
                            </div>

                        </div>
                        <div class="bread-line" style="margin-top: 10px;"></div>

                        <div class="mui-row mui-text-right" style="margin-top: 3%;">
                            <a href="order-qrcode.html" class="cup-btn bread-btn-black">店内自提</a>
                        </div>

                    </div>

                </div>

            </div>
            <!--/.待发货-->

            <!--待收货-->
            <div class="swiper-slide" style="display: block; ">

                <div class="mui-row" style="margin-top: 3%;margin-bottom: 3%;">

                    <div class="order_item">

                        <div onclick="javascript:location.href='order-status.html'">
                            <div class="circle circle-left"></div>
                            <div class="circle circle-right"></div>
                            <span>订单编号：509617906</span><span class="mui-pull-right">待收货</span>
                            <div class="bread-line" style="margin-top: 10px;"></div>

                            <div class="mui-row" style="margin-top: 3%;">
                                <div class="mui-col-xs-4 mui-col-sm-3">
                                    <img src="img/demo/bread.png" width="85px" />
                                </div>

                                <div class="mui-col-xs-8  mui-col-sm-9" style="padding-left: 5%;padding-top: 5px; line-height: 15px; border-left: 1px solid #e6e6e6;">
                                    <p style="font-size: 12px;">定制款：名称</p>
                                    <p style="font-size: 12px;">原料：原料AAAAAA<span class="mui-pull-right" style="font-size: 16px; font-weight: bold; color: #E51B54;">￥6.00</span></p>
                                    <p style="font-size: 12px;">配料：配料AAAAAAA<span class="mui-pull-right">&times;6</span></p>
                                </div>

                            </div>

                            <div class="bread-line" style="margin-top: 10px;"></div>

                            <div class="mui-row" style="margin-top: 3%;">
                                <div class="mui-col-xs-4 mui-col-sm-3">
                                    <img src="img/demo/bread2.png" width="85px" />
                                </div>

                                <div class="mui-col-xs-8  mui-col-sm-9" style="padding-left: 5%;padding-top: 5px; line-height: 15px; border-left: 1px solid #e6e6e6;">
                                    <p style="font-size: 12px;">定制款：名称</p>
                                    <p style="font-size: 12px;">原料：原料AAAAAA<span class="mui-pull-right" style="font-size: 16px; font-weight: bold; color: #E51B54;">￥6.00</span></p>
                                    <p style="font-size: 12px;">配料：配料AAAAAAA<span class="mui-pull-right">&times;6</span></p>
                                </div>

                            </div>
                            <div class="bread-line" style="margin-top: 10px;"></div>
                            <div class="mui-row">
										<span class="mui-pull-right" style="font-size: 15px;">
											实付：<span style="color: #E51B54;">￥72.00<span>
										</span>
                            </div>

                        </div>
                        <div class="bread-line" style="margin-top: 10px;"></div>

                        <div class="mui-row mui-text-right" style="margin-top: 3%;">
                            <a href="#" class="cup-btn bread-btn-black">确认收货</a>
                        </div>

                    </div>

                </div>

            </div>
            <!--/.待收货-->

            <!--已完成-->
            <div class="swiper-slide" style="display: block; ">

                <div class="mui-row" style="margin-top: 3%;margin-bottom: 3%;">

                    <div class="order_item">

                        <div onclick="javascript:location.href='order-status.html'">
                            <div class="circle circle-left"></div>
                            <div class="circle circle-right"></div>
                            <span>订单编号：509617906</span><span class="mui-pull-right">已完成</span>
                            <div class="bread-line" style="margin-top: 10px;"></div>

                            <div class="mui-row" style="margin-top: 3%;">
                                <div class="mui-col-xs-4 mui-col-sm-3">
                                    <img src="img/demo/bread.png" width="85px" />
                                </div>

                                <div class="mui-col-xs-8  mui-col-sm-9" style="padding-left: 5%;padding-top: 5px; line-height: 15px; border-left: 1px solid #e6e6e6;">
                                    <p style="font-size: 12px;">定制款：名称</p>
                                    <p style="font-size: 12px;">原料：原料AAAAAA<span class="mui-pull-right" style="font-size: 16px; font-weight: bold; color: #E51B54;">￥6.00</span></p>
                                    <p style="font-size: 12px;">配料：配料AAAAAAA<span class="mui-pull-right">&times;6</span></p>
                                </div>

                            </div>

                            <div class="bread-line" style="margin-top: 10px;"></div>

                            <div class="mui-row" style="margin-top: 3%;">
                                <div class="mui-col-xs-4 mui-col-sm-3">
                                    <img src="img/demo/bread2.png" width="85px" />
                                </div>

                                <div class="mui-col-xs-8  mui-col-sm-9" style="padding-left: 5%;padding-top: 5px; line-height: 15px; border-left: 1px solid #e6e6e6;">
                                    <p style="font-size: 12px;">定制款：名称</p>
                                    <p style="font-size: 12px;">原料：原料AAAAAA<span class="mui-pull-right" style="font-size: 16px; font-weight: bold; color: #E51B54;">￥6.00</span></p>
                                    <p style="font-size: 12px;">配料：配料AAAAAAA<span class="mui-pull-right">&times;6</span></p>
                                </div>

                            </div>
                            <div class="bread-line" style="margin-top: 10px;"></div>
                            <div class="mui-row">
										<span class="mui-pull-right" style="font-size: 15px;">
											实付：<span style="color: #E51B54;">￥72.00<span>
										</span>
                            </div>

                        </div>
                        <div class="bread-line" style="margin-top: 10px;"></div>

                        <div class="mui-row mui-text-right" style="margin-top: 3%;">
                            <a href="order-evaluate.html" class="cup-btn bread-btn-black">去评价</a>
                        </div>

                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="../../footer.jsp" %>
<script>
    var swiper = new Swiper('#order-swiper-container', {
        pagination: '.swiper',
        autoHeight: true,
        loop: false,
        onSlideChangeStart: function(swiper) {
            $('.cup-order-tab')[swiper.activeIndex].click();
        },
    });
    // tab点击事件
    $(".cup-order-tab").click(function(e) {
        $('.cup-order-tab :nth-child(1)').removeClass('order-tab-active');
        $(this).find('div:nth-child(1)').addClass('order-tab-active');
        $('.cup-order-tab :nth-child(3)').removeClass('order-tab-active');
        $(this).find('div:nth-child(3)').addClass('order-tab-active');
        swiper.slideTo($(".cup-order-tab").index($(this)), 1000, false);
    });
</script>
</body>
</html>