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
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">

    <title></title>
    <link href="css/mui.min.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="css/mui.picker.min.css"/>
    <link rel="stylesheet" type="text/css" href="css/mui.poppicker.css"/>
    <link href="css/swiper.min.css" rel="stylesheet"/>
    <link href="css/bread.css" rel="stylesheet"/>

    <script type="text/javascript" src="js/mui.min.js"></script>
    <script type="text/javascript" src="js/mui.picker.min.js" charset="utf-8"></script>
    <script type="text/javascript" src="js/mui.poppicker.js" charset="utf-8"></script>
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
<div class="mui-content login-content" ng-controller="personalInfo" ng-init="memberID='${memberID}';nickName='${nickName}';sex='${sex}';birthday='${birthday}';memberPhone='${memberPhone}';grade='${grade}';type='${type}';memberPic='${memberPic}';picUrl='${picUrl}'">

    <div class="mui-row login-top-bar">

        <div class="mui-col-xs-6" >
        </div>

        <div class="mui-col-xs-6 mui-text-right" ng-click="backToMine();">
            <a><img src="img/mine/btn-close.png"/></a>
        </div>

    </div>

    <div class="row cup-page-header">
        <span style="color: #FFFFFF;">个人信息</span>
    </div>

    <div class="row mui-text-center" style="margin-top: 5%;">
        <img ng-if="memberPic == ''" src="img/mine/no-avatar.png" style="width: 20%;position: relative; left: 11%;" ng-click="uploadAvatar();"/>
        <img ng-if="memberPic != ''" src="{{picUrl}}{{memberPic}}" style="width: 20%;position: relative; left: 11%;" ng-click="uploadAvatar();"/>
        <img src="img/mine/avatat-circle.png" style="width: 20%;position: relative; left: -10%;" ng-click="uploadAvatar();">
    </div>
    <div class="row" style="margin-top: 7%;" >
        <div class="login-bubble">
            <input type="text" placeholder="昵称" ng-model="nickName" />
            <input type="text" readonly placeholder="性别" ng-model="sex" ng-click="pickSex();"/>
            <input type="text" readonly placeholder="生日" ng-model="birthday" ng-click="birthDayPick();"/>
            <input type="text" placeholder="手机" ng-model="phoneNo" ng-show="type != 1"/>
            <input type="text" disabled placeholder="会员级别" ng-model="grade" />
        </div>
    </div>


    <div class="mui-row bread-row" style="margin-top: 6%;">
        <a ng-click="save();" class="bread-btn bread-btn-black">
            <span>确定</span>
        </a>
    </div>

    <div id="photo" class="mui-popover mui-popover-action mui-popover-bottom">
        <ul class="mui-table-view">
            <li class="mui-table-view-cell">
                <a ng-click="selectPhoto();">从相册选择</a>
            </li>
            <li class="mui-table-view-cell">
                <a ng-click="takePhoto();"><span style="color: #e51b54">拍照</span></a>
            </li>
        </ul>
        <ul class="mui-table-view">
            <li class="mui-table-view-cell">
                <a ng-click="cancel();"><b>取消</b></a>
            </li>
        </ul>
    </div>
</div>
<%@ include file="../footer.jsp" %>

</body>
</html>