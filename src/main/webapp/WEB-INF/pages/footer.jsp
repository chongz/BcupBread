<%--
  ~ Created by zhangchong on 5/30/2016.
  ~ Copyright (c) 2016 com.infohold.BcupBread. All rights reserved.
  --%>
<div class="bread-nav mui-bar mui-bar-footer" ng-controller="footer">
    <ul>
        <li>
            <div ng-click="home();">
                <img src="img/icon/nav-home.png" ng-show="currentCtrl != '0'">
                <img src="img/icon/nav-home-click.png" ng-show="currentCtrl == '0'">
            </div>
        </li>
        <li>
            <div ng-click="shoppingCart();">
                <img src="img/icon/nav-shoppingcart.png" ng-show="currentCtrl != '2'">
                <img src="img/icon/nav-shoppingcart-click.png" ng-show="currentCtrl == '2'">
                <span class="mui-badge mui-badge-danger" ng-show="shoppingCartNum > 0">{{shoppingCartNum}}</span>
            </div>
        </li>
        <li>
            <div ng-click="mine();">
                <img src="img/icon/nav-mine.png" ng-show="currentCtrl != '3'">
                <img src="img/icon/nav-mine-click.png" ng-show="currentCtrl == '3'">
            </div>
        </li>
    </ul>

</div>
