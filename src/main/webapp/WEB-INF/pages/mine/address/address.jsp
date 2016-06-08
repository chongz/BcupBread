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
        .mui-navigate-right:after,
        .mui-push-right:after {
            color: #d72551;
            font-weight: bold;
            padding-right: 3%;
        }

        .mui-table-view-cell:after {
            background-color: #efeff4;
            left: 1px;
            height: 10px;
        }

        .mui-table-view-cell>.mui-slider-left,
        .mui-table-view-cell>.mui-slider-right {
            height: 97%;
        }

        .selectadd {
            height: 40px;
            line-height: 20px;
            margin-top: 20px;
            margin-bottom: 20px;
        }

        .to-left-scroll {
            background-color: #e51b54;
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
<div class="mui-content" ng-controller="address" ng-init="isFromMine='${isFromMine}';">
    <div class="mui-row cup-page-header">
        <span>地址管理</span>
    </div>

    <div class="mui-row " style="margin-top: 2%;" ng-click="addAddress();">
        <ul class="mui-table-view bg-self-adaption" style="background-image: url(img/mine/bg-add-address.png); line-height: 50px;">
            <li class="mui-table-view-cell">
                <a class="mui-navigate-right">
                    <div class="mypage-list-content">
                        <img src="img/mine/icon-add-addr.png" style="width: 17px;" /><span style="color:#e51b54 ;">添加地址</span>
                    </div>
                </a>
            </li>
        </ul>
    </div>

    <div class="mui-row" style="margin-top: 2%;" ng-repeat="e in addresses">
        <ul class="mui-table-view">
            <li class="mui-table-view-cell">
                <div class="mui-slider-right mui-disabled">
                    <a class="mui-btn to-left-scroll" ng-click="editAddress(e.id);">
                        <img src="img/mine/icon-edit-list.png" style="width: 25px;"></a>
                    <a class="mui-btn  to-left-scroll" ng-click="removeAddress(e.addressID);" style="border-left: 1px solid #FFFFFF;">
                        <img src="img/mine/icon-del-list.png" style="width: 25px;"></a>
                </div>

                <div class="mui-slider-handle">
                    <div class="mui-row">
                        <div class="mui-col-xs-2 mui-text-center mui-radio selectadd" style="line-height: 80px;">
                            <input type="radio" name="checkAddr" ng-model="checkAddr" ng-click="selectOne($index);" value="" style="position:initial" />
                        </div>
                        <div class="mui-col-xs-10" style="line-height: 80px; ">
                            <div style="height: 40px; line-height: 20px; margin-top: 20px; margin-bottom: 20px; ;">
                                <p class="p-addr" style="font-size:12px;">{{e.name}}</p>
                                <p class="p-addr" style="font-size:12px;">{{e.detail}}</p>
                            </div>
                        </div>
                    </div>
                </div>
            </li>
        </ul>
    </div>

    <div class="mui-row mui-text-center" ng-show="isFromMine == '0'">
        <a ng-click="selectAddress();" class="cup-btn cup-btn-red" style="margin-top:5%;">确定</a>
    </div>
</div>
<%@ include file="../../footer.jsp" %>
<script>
    $("input[name=checkAddr]").click(function() {
        radioChecked(this);
    });

    function radioChecked(obj) {
        $(".p-addr").css("color", "none");
        obj.parentElement.nextElementSibling.childNodes[1].childNodes[1].style.color = "#e51b54";
        obj.parentElement.nextElementSibling.childNodes[1].childNodes[3].style.color = "#e51b54";
    }
</script>
</body>
</html>