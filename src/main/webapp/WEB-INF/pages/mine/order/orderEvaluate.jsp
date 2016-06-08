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
        .mui-content {
            margin-bottom: 50px;
        }
        .evaluate-bg {
            position: relative;
            background-color: #FFF;
            min-height: 100px;
            box-sizing: border-box;
            margin: 15px 15px;
            padding: 10px 5% 0px 5%;
            line-height: 30px;
            border-radius: 6px;
        }

        .circle {
            position: absolute;
            top: 55px;
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
        .mui-checkbox input[type=checkbox], .mui-radio input[type=radio] {
            position: initial;
        }

        .mui-checkbox input[type=checkbox]:before, .mui-radio input[type=radio]:before {
            background-color: #B5B5B6;
            color: #FFFFFF;
        }

        .mui-checkbox input[type=checkbox]:checked:before, .mui-radio input[type=radio]:checked:before {
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
</head>
<body>
<!-- mui-content -->
<div class="mui-content">

    <div class="mui-row">

        <div class="evaluate-bg">

            <!-- title -->
            <div class="mui-row cup-page-header">
                评价
            </div>
            <!-- /.title -->

            <!-- left right circle -->
            <div class="circle circle-left"></div>
            <div class="circle circle-right"></div>
            <!-- /.left right circle -->

            <!-- line -->
            <div class="mui-row mui-text-center">
                <div class="cup-line" style="margin-top: 12px;"></div>
            </div>
            <!-- /.line -->

            <div class="mui-row" style="margin-top: 10px;">
                <div class="mui-col-xs-3 mui-col-sm-2">
                    <img src="img/demoimg/cake.png" width="70px" />
                </div>

                <div class="mui-col-xs-9  mui-col-sm-10" style="padding-left: 9%;padding-top: 5px; line-height: 12px;">
                    <p style="font-size: 13px;">蛋糕 | 原味</p>
                    <p style="font-size: 13px;">奶油 | 香草<span class="mui-pull-right" style="font-size: 16px; font-weight: bold; color: #E51B54;">￥6.00</span></p>
                    <p style="font-size: 13px;">装饰 | 提拉米苏</p>
                    <p style="font-size: 13px;">内陷 | 芒果内馅<span class="mui-pull-right">&times;6</span></p>
                </div>
            </div>

            <!-- line -->
            <div class="mui-row mui-text-center">
                <div class="cup-line" style="margin-top: 12px; "></div>
            </div>
            <!-- /.line -->

            <div class="mui-row" style="padding-top: 15px;">
                <div class="mui-col-xs-3 mui-col-sm-2">
                    <input id="imgFile" type="file" accept="image/*" id="image-1" hidden="hidden">
                    <a href="#" id="imgFileLink">
                        <div style="border: #B5B5B6 solid 1px; width: 70px; height: 70px; text-align: center; line-height: 63px;">
                            <img src="img/mine/icon-camera.png" style="width: 30px; vertical-align: middle;" />
                        </div>
                    </a>
                </div>

                <div class="mui-col-xs-9 mui-col-sm-10" style="padding-left: 9%;">
                    <textarea id="textarea" class="mui-input-clear"data-input-clear="5" rows="5" placeholder="请写下对蛋糕的感受吧！" style="height: 70px; border: 1px dotted #B5B5B6;font-family: '微软雅黑'; font-size: 14px;"></textarea>
                </div>
            </div>

            <!-- line -->
            <div class="mui-row mui-text-center">
                <div class="cup-line" ></div>
            </div>
            <!-- /.line -->

            <div class="mui-row mui-text-center" style="color: #B5B5B6; font-size: 14px; padding-top: 10px; padding-bottom: 10px;">

                <div class="mui-col-xs-4">
                    <img src="img/mine/icon-fine-select.png"/ style="width: 25px; vertical-align: middle;">&nbsp;非常满意
                </div>

                <div class="mui-col-xs-4">
                    <img src="img/mine/icon-ok.png"/ style="width: 25px; vertical-align: middle;">&nbsp;满意
                </div>

                <div class="mui-col-xs-4">
                    <img src="img/mine/icon-dissatisfied.png"/ style="width: 25px; vertical-align: middle;">&nbsp;不满意
                </div>

            </div>

            <!-- line -->
            <div class="mui-row mui-text-center">
                <div class="cup-line" ></div>
            </div>
            <!-- /.line -->

            <div class="mui-row" style="font-size: 14px; color: #B5B5B6; margin-bottom: 15px;">

                <div class="mui-col-xs-12">

                    <div class="mui-row" style="margin-top: 12px;">
                        <div class="mui-col-xs-3">
                            蛋糕质量
                        </div>

                        <div class="mui-col-xs-9 mui-text-right">
                            <img src="img/mine/icon-start-select.png" style="width: 25px; vertical-align: middle;"/>&nbsp;&nbsp;
                            <img src="img/mine/icon-start-select.png" style="width: 25px; vertical-align: middle;"/>&nbsp;&nbsp;
                            <img src="img/mine/icon-start-select.png" style="width: 25px; vertical-align: middle;"/>&nbsp;&nbsp;
                            <img src="img/mine/icon-start-select.png" style="width: 25px; vertical-align: middle;"/>&nbsp;&nbsp;
                            <img src="img/mine/icon-start-select.png" style="width: 25px; vertical-align: middle;"/>
                        </div>
                    </div>

                    <div class="mui-row" style="margin-top: 12px;">
                        <div class="mui-col-xs-3">
                            物流服务
                        </div>

                        <div class="mui-col-xs-9 mui-text-right">
                            <img src="img/mine/icon-start-select.png" style="width: 25px; vertical-align: middle;"/>&nbsp;&nbsp;
                            <img src="img/mine/icon-start-select.png" style="width: 25px; vertical-align: middle;"/>&nbsp;&nbsp;
                            <img src="img/mine/icon-start-select.png" style="width: 25px; vertical-align: middle;"/>&nbsp;&nbsp;
                            <img src="img/mine/icon-star.png" style="width: 25px; vertical-align: middle;"/>&nbsp;&nbsp;
                            <img src="img/mine/icon-star.png" style="width: 25px; vertical-align: middle;"/>
                        </div>
                    </div>

                    <div class="mui-row" style="margin-top: 12px;">
                        <div class="mui-col-xs-3">
                            服务态度
                        </div>

                        <div class="mui-col-xs-9 mui-text-right">
                            <img src="img/mine/icon-start-select.png" style="width: 25px; vertical-align: middle;"/>&nbsp;&nbsp;
                            <img src="img/mine/icon-star.png" style="width: 25px; vertical-align: middle;"/>&nbsp;&nbsp;
                            <img src="img/mine/icon-star.png" style="width: 25px; vertical-align: middle;"/>&nbsp;&nbsp;
                            <img src="img/mine/icon-star.png" style="width: 25px; vertical-align: middle;"/>&nbsp;&nbsp;
                            <img src="img/mine/icon-star.png" style="width: 25px; vertical-align: middle;"/>
                        </div>
                    </div>

                </div>

            </div>

            <!-- line -->
            <div class="mui-row mui-text-center" style="padding-bottom: 55px;">
                <div class="cup-line" ></div>
            </div>
            <!-- /.line -->


        </div>

    </div>

    <div class="mui-row cup-footer cup-footer-dark">

        <div class="mui-col-xs-6 mui-checkbox" style="padding-left: 20px; color: #FFFFFF;">
            <input type="checkbox" name="" id="" value="" />&nbsp;匿名评价
        </div>

        <div class="mui-col-xs-6 mui-text-right" style="padding-right: 20px;">
            <a href="#" class="cup-btn cup-btn-red" style="width: 120px;">发表评价</a>
        </div>

    </div>

</div>
<!-- /.mui-content -->
<%@ include file="../../footer.jsp" %>
<script>
    $(document).ready(function() {
        $("#imgFileLink").click(function() {
            $("#imgFile").click();
        });
    });
</script>
</body>
</html>