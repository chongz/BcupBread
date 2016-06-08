/*
 * Created by zhangchong on 5/30/2016.
 * Copyright (c) 2016 com.infohold.BcupBread. All rights reserved.
 */

localforage.config({
    driver      : localforage.WEBSQL,
    name        : 'bcupbread',
    version     : 1.0,
    size        : 4980736,
    storeName   : 'bcupbread',
    description : '不靠谱面包'
});

var cupcake = angular.module('cupcake',['LocalForageModule']);

function  log(value) {
    console.log(value);
}

cupcake.directive('onFinishRenderFilters', function ($timeout) {
    return {
        restrict: 'A',
        link: function(scope, element, attr) {
            if (scope.$last === true) {
                $timeout(function() {
                    scope.$emit('ngRepeatFinished');
                });
            }
        }
    };
});

var NotificationService = cupcake.factory('NotificationService',function ($rootScope) {
    var service = {};
    service.shoppingCartNum = 0;

    service.cupcake = {};

    service.updateShoppingCartNum = function (value) {
        this.shoppingCartNum = value;
        $rootScope.$broadcast("dataUpdate");
    }

    return service;
});


//index
cupcake.controller('index',function ($scope,$rootScope,$http,$location,$localForage,$window,NotificationService) {
    $scope.init = function () {

        $localForage.setItem('currentCtl','0');

        $http.post('getNoticeList',{
        }).success(function (value) {
            console.log("通知内容");
            console.log(value);

            if ('0000' == value.repCode) {
                var repData = JSON.parse(value.repData);
                $scope.noticeList = [];

                if (repData && repData.length > 0) {
                    repData.forEach(function (ele) {
                        $scope.noticeList.push(ele);
                    });
                }
            }else{
                mui.toast(value.repMSG);
            }
        }).error(function (data,status,headers,config) {

        });

        $http.post('getCommend',{
            productMachine:'1',
            productGroom:'1'
        }).success(function (value) {
            console.log(value);

            if ('0000' == value.repCode) {
                var repData = JSON.parse(value.repData);
                $scope.list = [];
                for (var i=0; i<repData.length; i++) {
                    var ele = repData[i];
                    // console.log(ele);

                    for (var j=0; j<ele.productInfo.length; j++) {
                        var info = ele.productInfo[j];
                        console.log(info);
                        $scope.list.push(info);
                    }
                }
            }else{
                mui.toast(value.repMSG);
            }
        }).error(function (data,status,headers,config) {

        });

        $scope.swiper = new Swiper('#swiper-container1', {
            pagination: '.swiper-pagination',
            paginationClickable: true,
            loop: true,
            autoplay: 4000,
        });
    }

    $scope.goToBreadInfo = function (pid) {
        $localForage.setItem('noticeID',pid).then(function () {
            window.location.href = "breadInfo";
        });
    }

    $scope.breadGallery = function() {
        window.location.href = "breadGallery";
    }

    $scope.goToBreadDetail = function (pid) {
        console.log("pid:" + pid);
        $localForage.setItem('pid',pid);
        window.location.href = "breadDetail";
    }

    $scope.$on('ngRepeatFinished', function (ngRepeatFinishedEvent) {

        $scope.swiper = new Swiper('#swiper-container1', {
            pagination: '.swiper-pagination',
            paginationClickable: true,
            loop: true,
            autoplay: 4000,
        });
    });

    $scope.init();
});

//公告内容
cupcake.controller('breadInfo',function ($scope,$rootScope,$http,$location,$localForage,$window,NotificationService) {

    // $scope.addShoppingCart = function () {
    //     if ($scope.isLogin == '0') {
    //         window.location.href = "loginRegisterSelector";
    //     }else{
    //
    //         $localForage.getItem('userInfo').then(function (data) {
    //             $scope.userInfo = data;
    //             $localForage.getItem('pid').then(function (data) {
    //                 $scope.pid = data;
    //                 $http.post('addShoppingCartData',{
    //                     memberPhone: $scope.userInfo.memberPhone,
    //                     productID:$scope.pid,
    //                     num:'1'
    //                 }).success(function (value) {
    //
    //                     console.log(value);
    //                     var repMSG = value.repMSG;
    //                     if ('0000' == value.repCode) {
    //                         mui.toast(repMSG);
    //                     }else{
    //                         mui.toast(repMSG);
    //                     }
    //                 }).error(function (data,status,headers,config) {
    //
    //                 });
    //             });
    //         })
    //
    //     }
    // }
    //
    // $scope.addGallery = function() {
    //     if ($scope.isLogin == '0') {
    //         window.location.href = "loginRegisterSelector";
    //     }else{
    //
    //         $localForage.getItem('userInfo').then(function (data) {
    //             $scope.userInfo = data;
    //             $localForage.getItem('pid').then(function (data) {
    //                 $scope.pid = data;
    //                 $http.post('addGalleryData',{
    //                     memberPhone: $scope.userInfo.memberPhone,
    //                     customName:'',
    //                     productID:$scope.pid
    //                 }).success(function (value) {
    //
    //                     log(value);
    //                     var repMSG = value.repMSG;
    //                     if ('0000' == value.repCode) {
    //                         mui.toast(repMSG);
    //                     }else{
    //                         mui.toast(repMSG);
    //                     }
    //                 }).error(function (data,status,headers,config) {
    //
    //                 });
    //             });
    //         })
    //
    //     }
    // }
    //
    // $scope.share = function () {
    //     mui.toast("to do 分享");
    // }

    $scope.init = function() {
        $localForage.getItem('noticeID').then(function (data) {
            $scope.noticeID = data;
            $http.post('getNoticeList', {
                noticeID: $scope.noticeID
            }).success(function (value) {
                console.log(value);
                if ('0000' == value.repCode) {
                    var repData = JSON.parse(value.repData);

                    if (repData != undefined && repData.length > 0) {
                        $scope.notice = repData[0];
                        // $scope.notice.updateDate = Date($scope.notice.updateDate.time);
                        log($scope.notice);
                    }

                    //read time
                    $http.post('addProTime', {
                        noticeID: $scope.notice.noticeID
                    }).success(function (value) {
                        log(value);
                    }).error(function (data, status, headers, config) {

                    });

                } else {
                    mui.toast(value.repMSG);
                }
            }).error(function (data, status, headers, config) {

            });


        });
    }

    $scope.init();
});

cupcake.controller('breadGallery',function ($scope,$rootScope,$http,$compile,$location,$localForage,$window,NotificationService) {

    $scope.init = function () {
        $http.post('getProduct', {
            productMachine: '1'
        }).success(function (value) {
            console.log(value);
            if ('0000' == value.repCode) {
                var repData = JSON.parse(value.repData);

                $scope.list = [];


                for (var i=0; i<repData.length; i++) {
                    var ele = repData[i];
                    console.log(ele);

                    if (i == 0) {
                        $scope.firstPid = ele.kindsID;
                        console.log($scope.firstPid);
                    }
                    $scope.list.push(ele);
                }

                var html = '' +
                        '<div class="mui-row category-row category-body" id="{{p.kindsID}}" ng-repeat="p in list" on-finish-render-filters>' +
                            '<div class="mui-row category-body-item" ng-repeat="i in p.productInfo">' +
                                 '<a ng-click="goToBreadDetail(i.productID);"><img src="{{picUrl}}{{i.overPic}}" ></a>' +
                                '<p><span>{{i.updateTime}} &nbsp; {{i.productName}}</span><span class="mui-pull-right">{{p.kindsName}}</span></p>' +
                            '</div>' +
                        '</div>';

                var dataContent = document.querySelector(".breadGallery");
                var htmlNode = $compile(angular.element(html))($scope);
                angular.element(dataContent).append(htmlNode);

            } else {
                mui.toast(value.repMSG);
            }
        }).error(function (data, status, headers, config) {

        });
    }

    $scope.init();

    $scope.$on('ngRepeatFinished', function (ngRepeatFinishedEvent) {
        $("#" + $scope.firstPid).show();
        var categoryNavSwiper = new Swiper('#category-nav-swiper', {
            slidesPerView: 1
        });
    });


    $scope.goToBreadDetail = function (pid) {
        $localForage.setItem('pid',pid);
        window.location.href = "breadDetail";
    }

    $scope.selectOne = function (me,pid) {
        // var index = $(".category-nav-item").index($(this));
        // e.preventDefault();

        $('.category-nav-item').removeClass('active');
        $(me.target).addClass('active');
        // console.log(angular.element(this));
        $(".category-body").hide(500);
        $("#" + pid).show(500);
    }


});

cupcake.controller('breadDetail',function ($scope,$rootScope,$http,$location,$localForage,$window,NotificationService) {

    $scope.numberOfBuy = 1;

    $scope.addProductNum = function () {
        $scope.numberOfBuy++;
    }

    $scope.decreaseProductNum = function () {
        $scope.numberOfBuy--;
        if ($scope.numberOfBuy <= 0) {
            $scope.numberOfBuy = 1;
        }
        
    }

    $scope.addShoppingCart = function () {

        if ($scope.isLogin == '0') {
            window.location.href = "loginRegisterSelector";
        }else{
            $localForage.getItem('userInfo').then(function (data) {
                $scope.userInfo = data;

                $http.post('addShoppingCartData',{
                    memberPhone: $scope.userInfo.memberPhone,
                    productID:$scope.product.productID,
                    num:'1'
                }).success(function (value) {
                    console.log(value);
                    var repMSG = value.repMSG;
                    if ('0000' == value.repCode) {
                        mui.toast(repMSG);
                    }else{
                        mui.toast(repMSG);
                    }
                }).error(function (data,status,headers,config) {

                });
            });
        }
    }


    $scope.addGallery = function() {
        if ($scope.isLogin == '0') {
            window.location.href = "loginRegisterSelector";
        }else{

            $localForage.getItem('userInfo').then(function (data) {
                $scope.userInfo = data;
                $http.post('addGalleryData',{
                    memberPhone: $scope.userInfo.memberPhone,
                    customName:$scope.product.productName,
                    productID:$scope.product.productID
                }).success(function (value) {

                    log(value);
                    var repMSG = value.repMSG;
                    if ('0000' == value.repCode) {
                        mui.toast(repMSG);
                    }else{
                        mui.toast(repMSG);
                    }
                }).error(function (data,status,headers,config) {

                });
            });

        }
    }
    
    $scope.share = function () {
        mui.toast("to do share");
    }
    
    $scope.buy = function () {

        $scope.orders = [];
        $scope.orders.push({'pi':$scope.product,'num':$scope.numberOfBuy});

        $localForage.setItem('orders',$scope.orders).then(function () {
            window.location.href = "orderConfirm?where=breadDetail";
        });
    }

    $scope.initBreadDetailPage = function() {
        $localForage.getItem('pid').then(function (data) {
           $scope.pid = data;

            $http.post('getProduct',{
                productMachine:'1',
                productID:$scope.pid
            }).success(function (value) {
                console.log(value);
                if ('0000' == value.repCode) {
                    log(value);
                    var repData = JSON.parse(value.repData);

                    if (repData != undefined && repData.length > 0) {
                        $scope.product = repData[0];
                    }



                }else{
                    mui.toast(value.repMSG);
                }
            }).error(function (data,status,headers,config) {

            });

        });
    }

    $scope.initBreadDetailPage();

    $scope.$on('ngRepeatFinished', function (ngRepeatFinishedEvent) {

        mui.previewImage();
        var swiper = new Swiper('.swiper-container', {
            pagination: '.swiper-pagination',
            nextButton: '.swiper-button-next',
            prevButton: '.swiper-button-prev',
            slidesPerView: 1,
            paginationClickable: true,
            spaceBetween: 30,
            loop: true
        });
    });


});

//我的
cupcake.controller('mine',function ($scope,$rootScope,$http,$location,$localForage,$window,NotificationService) {

    $localForage.getItem('city').then(function (data) {
        var cities = data;
        if (cities != undefined && cities.length > 0) {
            $scope.currentCity = cities[0];
        }

    });


    $scope.login = function () {
        if ($scope.isLogin == '0') {
            window.location.href = "loginRegisterSelector";
        }else{
            $scope.personInfo();
        }
    }

    $scope.logout = function () {
        var btnArray = ['否', '是'];
        mui.confirm('确认退出？', '退出', btnArray, function(e) {
            if (e.index == 1) {
                $http.post("logout",{

                }).success(function (value) {
                    console.log(value);
                    window.location.reload();
                    NotificationService.updateShoppingCartNum(0);

                    $localForage.setItem('userInfo',{});
                }).error(function (data,status,headers,config) {

                });
            }
        });
    }

    $scope.message = function () {
        if ($scope.isLogin == '0') {
            window.location.href = "loginRegisterSelector";
        }else {
            window.location.href = "message";
        }
    }

    $scope.personInfo = function () {
        if ($scope.isLogin == '0') {
            window.location.href = "loginRegisterSelector";
        }else{
            window.location.href = "personalInfo";
        }
    }

    $scope.order = function () {
        if ($scope.isLogin == '0') {
            window.location.href = "loginRegisterSelector";
        }else {
            window.location.href = "orders";
        }
    }

    $scope.gallery = function () {
        if ($scope.isLogin == '0') {
            window.location.href = "loginRegisterSelector";
        }else {
            window.location.href = "gallery";
        }
    }

    $scope.address = function () {
        if ($scope.isLogin == '0') {
            window.location.href = "loginRegisterSelector";
        }else {
            window.location.href = "address?isFromMine=1";
        }
    }

    $scope.location = function () {
        window.location.href = "location";
    }

    $scope.aboutus = function () {
        window.location.href = "about";
    }

    $scope.$watch('shoppingCartNum',function () {
        NotificationService.updateShoppingCartNum($scope.shoppingCartNum);
    });

    $scope.$on('dateUpdate',function () {
        $scope.shoppingCartNum = NotificationService.shoppingCartNum;
    });


    //订单数量
    $scope.orderNum = 0;
    //收藏夹数量
    $scope.galleryNum = 0;
    //购物车数量
    $scope.shoppingCartNum = 0;
    //消息数量
    $scope.messageNum = 0;


    $scope.initMainPage = function () {

        $localForage.setItem('currentCtl','3');

        $http.post("getStore",{

        }).success(function (value) {
            console.log(value);
            if ('0000' === value.repCode) {
                var repData = JSON.parse(value.repData);
                var data = [];
                for (var i = 0; i<repData.length; i++) {
                    var ele = repData[i];
                    data.push({
                       'cityID':ele.cityID,
                        'cityName':ele.cityName
                    });
                }

                if (data.length > 0) {
                    $localForage.setItem("city",data);
                }

            }

        }).error(function (data, status, headers, config) {

        });



        $localForage.getItem("userInfo").then(function (data) {
            var userInfo = data;

            if (userInfo) {
                if (userInfo.type == '1') {
                    $scope.memberID = userInfo.memberPhone;
                }else if (userInfo.type == '2') {

                }

                $http.post("getOrderNum", {
                    memberID: $scope.memberID,
                }).success(function (value) {
                    console.log(value);
                    if ('0000' == value.repCode) {
                        $scope.orderNum = value.totalNum;
                    }
                }).error(function (data, status, headers, config) {

                });

                //购物车数量
                $http.post('searchShoppingCartData', {
                    'memberPhone': $scope.memberID,
                    'pageNo': '1',
                    'pageSize': '10'
                }).success(function (value) {
                    console.log(value);

                    if ('0000' == value.repCode) {
                        var repData = JSON.parse(value.repData);
                        if (repData && repData.length > 0) {
                            var element = repData[0];
                            $scope.shoppingCartNum = element.totalNum;
                            $localForage.setItem("shoppingCartNum",$scope.shoppingCartNum).then(function () {
                            });
                        }
                    }
                }).error(function (data, status, headers, config) {

                });

                $http.post('searchGalleryData',{
                    memberPhone:$scope.memberID,
                    pageNo:'1',
                    pageSize:'10'
                }).success(function (value) {
                    console.log(value);
                    if ('0000' == value.repCode) {
                        $scope.galleryNum = JSON.parse(value.repData)[0].totalNum;
                    }
                    
                }).error(function (data,status,headers,config) {

                });
            }


        });
    }

    $scope.initMainPage();

});

//登录注册选择页面
cupcake.controller('loginRegisterSelector',function ($scope,$http,$window) {
    $scope.back = function () {
        history.go(-1);
    }

    $scope.login = function () {
        // window.location.href = "loginSelector";
        window.location.href = "phoneLogin";
    }

    $scope.register = function () {
        // window.location.href = "registerSelector";
        window.location.href = "phoneRegister";
    }

});

//注册选择
cupcake.controller('registerSelector',function ($scope,$http,$window) {
    $scope.back = function () {
        history.go(-1);
    }

    $scope.backToMine = function () {
        window.location.href = "mine"
    }

    $scope.phoneReg = function () {
        window.location.href = "phoneRegister"
    }

    $scope.announcement = function () {
        window.location.href = "announcement";
    }
});

//登录选择
cupcake.controller('loginSelector',function ($scope,$http,$window) {
    $scope.back = function () {
        history.go(-1);
    }

    $scope.backToMine = function () {
        window.location.href = "mine"
    }

    $scope.phoneLogin = function () {
        window.location.href = "phoneLogin"
    }

    $scope.announcement = function () {
        window.location.href = "announcement";
    }
});

//手机注册
cupcake.controller('phoneRegister',function ($scope,$http,$window,$timeout,$localForage) {
    $scope.back = function () {
        history.go(-1);
    }

    $scope.backToMine = function () {
        window.location.href = "mine"
    }

    $scope.sendSMSFlag = 0;
    $scope.configTime = 10;
    $scope.lastTime = $scope.configTime;
    $scope.resendText = $scope.lastTime + "秒后重新发送";

    $scope.register = function () {
        if (!$scope.phoneNo) {
            mui.toast("手机号为空");
            return;
        }

        if($scope.phoneNo.length != 11) {
            mui.toast("手机号码不正确,请重新输入");
            return;
        }

        if (!$scope.validcode) {
            mui.toast("验证码为空");
            return;
        }

        if ($scope.validcode != $scope.smsReg) {
            mui.toast("验证码错误");
            return;
        }

        if (!$scope.password) {
            mui.toast("新密码为空");
            return;
        }

        $http.post("registerUser",{
            memberPhone: $scope.phoneNo,
            memberPassword: $scope.password
        }).success(function (value) {

            if (value) {
                var repCode = value['repCode'];
                if (repCode === "0000") {
                    $localForage.setItem('smsReg',"").then(function() {

                    });

                    mui.toast(value['repMSG']);

                    setTimeout(function () {
                        window.location.href = "mine";
                    }, 1000);

                }else{
                    mui.toast(value['repMSG']);
                }
            }
        }).error(function (data,status,headers,config) {
            mui.toast("获取密码失败");
        });
    }

    $scope.sendRegSMS = function(){
        if (!$scope.phoneNo) {
            mui.toast("手机号为空");
            return;
        }

        if($scope.phoneNo.length != 11) {
            mui.toast("手机号码不正确,请重新输入");
            return;
        }

        var btnArray = ['取消', '好'];
        mui.confirm('我们将发送验证码短信到这个号码:' + $scope.phoneNo, '确认手机号码', btnArray, function(e) {
            if (e.index == 1) {
                $scope.sendSMSFlag = 1;
                $scope.$apply();

                var loop = setInterval(function () {
                    $scope.lastTime -= 1;
                    $scope.resendText = $scope.lastTime + "秒后重新发送";

                    if ($scope.lastTime == 0) {
                        $scope.resendText = "重新发送";
                        $scope.lastTime = $scope.configTime;
                        clearInterval(loop);

                        var randomStr = random();
                        $scope.sending($scope.phoneNo, "0",randomStr);
                    }

                    $scope.$apply();
                },1000);
            }
        });
    }

    $scope.sending = function (mobile,type,code) {

        var data = {
            "0":"【Bcup不靠谱】您的注册验证码：",
            "1":"【Bcup不靠谱】您的重置密码验证码：",
            "2":"【Bcup不靠谱】您订单 #$# 的提货验证码："
        };

        var url = "http://apis.baidu.com/kingtto_media/106sms/106sms";
        var apiKey = "9e09c2533e53ef4eeddb8c041b2c2cef";
        var content = "mobile=" + mobile + "&content=" + data[type] + code;
        $http.post("sendSMS",{
            httpUrl:url,
            content:content,
            apiKey:apiKey
        }).success(function (value) {
            console.log(value);
        });

        $localForage.setItem('smsReg',code).then(function() {
            $localForage.getItem('smsReg').then(function(data) {
                $scope.smsReg = data;
            });
        });
    };

    $scope.resendRegSMS = function () {
        if ($scope.lastTime != $scope.configTime) {
            console.log("未到时间");
            return;
        }

        console.log("resendSMS");

        if (!$scope.phoneNo) {
            mui.toast("手机号为空");
            return;
        }

        if($scope.phoneNo.length != 11) {
            mui.toast("手机号码不正确,请重新输入");
            return;
        }

        var btnArray = ['取消', '好'];
        mui.confirm('我们将发送验证码短信到这个号码:' + $scope.phoneNo, '确认手机号码', btnArray, function(e) {
            if (e.index == 1) {
                $scope.lastTime = $scope.configTime;

                var loop = setInterval(function () {
                    $scope.lastTime -= 1;
                    $scope.resendText = $scope.lastTime + "秒后重新发送";

                    if ($scope.lastTime == 0) {
                        $scope.resendText = "重新发送";
                        $scope.lastTime = $scope.configTime;
                        clearInterval(loop);

                        var randomStr = random();
                        $scope.sending($scope.phoneNo, "0",randomStr);
                    }

                    $scope.$apply();
                },1000);
            }
        });
    }

    $scope.announcement = function () {
        window.location.href = "announcement";
    }
});

//手机登录
cupcake.controller('phoneLogin',function ($scope,$http,$window,$localForage) {
    $scope.back = function () {
        history.go(-1);
    }

    $scope.backToMine = function () {
        window.location.href = "mine"
    }

    $scope.login = function () {

        if (!$scope.phoneNo) {
            mui.toast("手机号为空");
            return;
        }

        if (!$scope.password) {
            mui.toast("密码为空");
            return;
        }


        $http.post("login",{
            memberPhone: $scope.phoneNo,
            memberPassword: $scope.password
        }).success(function (value) {

            if (value) {
                if ('0000' === value.repCode) {
                    mui.toast(value.repMSG);

                    var repData = JSON.parse(value.repData);
                    var userInfo = repData[0];
                    userInfo.type = '1';

                    $localForage.setItem('userInfo',userInfo).then(function() {

                    });


                    setTimeout(function () {
                        window.location.href = "mine";
                    }, 1000);
                }else{
                    mui.toast(value.repMSG);
                }
            }
        }).error(function (data,status,headers,config) {
            mui.toast("登录失败");
        });
    }

    $scope.forgotPassword = function () {
        $window.location.href = "retrievePhonePassword";
    }

    $scope.announcement = function () {
        window.location.href = "announcement";
    }
});

//忘记密码
cupcake.controller('retrievePhonePassword',function ($scope,$rootScope,$http,$localForage,$window,$timeout) {
    $scope.back = function () {
        history.go(-1);
    }

    $scope.sendSMSFlag = 0;
    $scope.configTime = 10;
    $scope.lastTime = $scope.configTime;
    $scope.resendText = $scope.lastTime + "秒后重新发送";

    $scope.sendSMS = function(){
        if (!$scope.phoneNo) {
            mui.toast("手机号为空");
            return;
        }

        if($scope.phoneNo.length != 11) {
            mui.toast("手机号码不正确,请重新输入");
            return;
        }

        var btnArray = ['取消', '好'];
        mui.confirm('我们将发送验证码短信到这个号码:' + $scope.phoneNo, '确认手机号码', btnArray, function(e) {
            if (e.index == 1) {
                $scope.sendSMSFlag = 1;
                $scope.$apply();

                var loop = setInterval(function () {
                    $scope.lastTime -= 1;
                    $scope.resendText = $scope.lastTime + "秒后重新发送";

                    if ($scope.lastTime == 0) {
                        $scope.resendText = "重新发送";
                        $scope.lastTime = $scope.configTime;
                        clearInterval(loop);

                        var randomStr = random();
                        $scope.sending($scope.phoneNo, "0",randomStr);
                    }

                    $scope.$apply();
                },1000);
            }
        });
    }

    $scope.sending = function (mobile,type,code) {

        var data = {
            "0":"【Bcup不靠谱】您的注册验证码：",
            "1":"【Bcup不靠谱】您的重置密码验证码：",
            "2":"【Bcup不靠谱】您订单 #$# 的提货验证码："
        };

        var url = "http://apis.baidu.com/kingtto_media/106sms/106sms";
        var apiKey = "9e09c2533e53ef4eeddb8c041b2c2cef";
        var content = "mobile=" + mobile + "&content=" + data[type] + code;
        $http.post("sendSMS",{
            httpUrl:url,
            content:content,
            apiKey:apiKey
        }).success(function (value) {
            console.log(value);
        });

        $localForage.setItem('smsForget',code).then(function() {
            $localForage.getItem('smsForget').then(function(data) {
                $scope.smsForget = data;
            });
        });
    };

    $scope.resendSMS = function () {
        if ($scope.lastTime != $scope.configTime) {
            console.log("未到时间");
            return;
        }

        console.log("resendSMS");

        if (!$scope.phoneNo) {
            mui.toast("手机号为空");
            return;
        }

        if($scope.phoneNo.length != 11) {
            mui.toast("手机号码不正确,请重新输入");
            return;
        }

        var btnArray = ['取消', '好'];
        mui.confirm('我们将发送验证码短信到这个号码:' + $scope.phoneNo, '确认手机号码', btnArray, function(e) {
            if (e.index == 1) {
                $scope.lastTime = $scope.configTime;

                var loop = setInterval(function () {
                    $scope.lastTime -= 1;
                    $scope.resendText = $scope.lastTime + "秒后重新发送";

                    if ($scope.lastTime == 0) {
                        $scope.resendText = "重新发送";
                        $scope.lastTime = $scope.configTime;
                        clearInterval(loop);

                        var randomStr = random();
                        $scope.sending($scope.phoneNo, "0",randomStr);
                    }

                    $scope.$apply();
                },1000);
            }
        });
    }

    $scope.backToMine = function () {
        window.location.href = "mine"
    }

    $scope.announcement = function () {
        window.location.href = "announcement";
    }

    $scope.forgotPassword = function () {
        if (!$scope.phoneNo) {
            mui.toast("手机号为空");
            return;
        }

        if($scope.phoneNo.length != 11) {
            mui.toast("手机号码不正确,请重新输入");
            return;
        }

        if (!$scope.validcode) {
            mui.toast("验证码为空");
            return;
        }

        if ($scope.validcode != $scope.smsForget) {
            mui.toast("验证码错误");
            return;
        }

        if (!$scope.password) {
            mui.toast("新密码为空");
            return;
        }

        $http.post("retrievePhonePasswordData",{
            memberPhone: $scope.phoneNo,
            memberPassword: $scope.password
        }).success(function (value) {

            if (value) {
                var repCode = value['repCode'];
                if (repCode === "0000") {
                    $localForage.setItem('smsReg',"").then(function() {

                    });

                    mui.toast(value['repMSG']);

                    setTimeout(function () {
                        history.go(-1);
                    }, 1000);

                }else{
                    mui.toast(value['repMSG']);
                }
            }
        }).error(function (data,status,headers,config) {
            mui.toast("获取密码失败");
        });
    }
});

//地址管理
cupcake.controller('address',function ($scope,$rootScope,$http,$localForage,$window,$timeout) {

    $scope.isFromMine = 1;

    $scope.selectedAddressData = {};
    $scope.checkAddr = {};

    $scope.selectOne = function (index) {
        $scope.checkAddr = $scope.addresses[index];
        console.log($scope.checkAddr);
        
        $localForage.setItem('orderUserAddress',$scope.checkAddr).then(function () {

        });
    }

    $scope.selectAddress = function () {

        $localForage.getItem('orderUserAddress').then(function (data) {
            if (data == undefined){
                mui.toast("请选择一个收货地址");
            }else{
                window.location.href = 'orderConfirm?where=address';
            }
        })
    }

    $scope.addAddress = function () {
        window.location.href = "addAddress";
    }


    $scope.editAddress = function (id) {
        for (var i=0 ; i<$scope.repData.length; i++) {
            var ele = $scope.repData[i];
            if (id === ele.addressID) {
                $scope.selectedAddressData = ele;
                break;
            }
        }

        $localForage.setItem('editAddressData',$scope.selectedAddressData).then(function() {
            window.location.href = "editAddress";
        });

    }


    $scope.removeAddress = function(addressId) {

        console.log("addressId:" + addressId);

        mui.confirm('确定要删除该地址吗？', "蛋糕不靠谱", [ '否','是'], function(e) {
            if (e.index == 1) {
                $http.post("delAddressData",{
                    'addressID':addressId
                }).success(function (value) {
                    console.log(value);

                    if (value.repCode === '0000') {
                        mui.toast(value.repMSG);
                        setTimeout(function () {
                            window.location.href = "address";
                        }, 500);
                    }else{
                        mui.toast(value.repMSG);
                    }

                }).error(function (data,status,headers,config) {
                    console.log(data);
                });;
            }
        });
    }


    $scope.init = function() {
        $localForage.getItem('userInfo').then(function(data) {
            var userInfo = data;
            if (userInfo.type == '1') {
                $scope.memberPhone = userInfo.memberPhone;
            }else if (userInfo.type == '2') {

            }


            $http.post("searchAddressData",{
                memberPhone:$scope.memberPhone
            }).success(function (value) {
                console.log(value);
                if ("0000" === value.repCode) {
                    $scope.repData = JSON.parse(value.repData);
                    $scope.addresses = [];

                    for (var i =0 ;i<$scope.repData.length;i++) {
                        var ele = $scope.repData[i];
                        var name = ele.addressName;

                        if (ele.addressSex == '1') {
                            name += " 先生";
                        }else if(ele.addressSex == '2') {
                            name += " 女士";
                        }

                        name += " " + ele.addressPhone;

                        var detail = ele.addressCity  + ele.addressDistrict  + ele.addressDetailed;
                        ele.name = name;
                        ele.detail = detail;

                        $scope.addresses.push(ele);
                    }
                }
            }).error(function (data,status,headers,config) {
                console.log(data);
            });
        });
    }

    $scope.init();

});

//地址新增
cupcake.controller('addAddress',function ($scope,$rootScope,$http,$localForage,$window,$timeout) {

    $scope.pickSex = function () {
        var sexPicker = new mui.PopPicker();
        sexPicker.setData(
            [{
                value:'1',
                text:'先生'
            },{
                value:'2',
                text:'女士'
            }
            ]
        );

        var result = sexPicker.show(function (items) {
            $scope.sex = items[0].value;
            $scope.sexText = items[0].text;
            $scope.$apply();
        });

    }

    $scope.isInCity = function (e,ds) {
        for (var i=0;i<ds.length;i++){
            if (ds[i] == e) {
                return true;
            }
        }

        return false;
    }


    $scope.pickArea = function () {
        var cityPicker = new mui.PopPicker({
            layer:2
        });

        $localForage.getItem("city").then(function (data) {
            var cityDataFromDB = data;
            var cities = [];
            for (var i=0; i<cityDataFromDB.length; i++) {
                var ele = cityDataFromDB[i];
                cities.push(ele.cityID);
            }

            var cityData = [];
            for (var i=0 ; i<city.length; i++) {
                var ele = city[i];

                var value = ele.CityID;
                var text = ele.name;

                if (!$scope.isInCity(value,cities)) {
                    break;
                }


                var children = [];

                for (var j=0; j<area.length; j++) {
                    var areaEle = area[j];

                    if (areaEle.CityID == ele.CityID) {
                        children.push({'value' : areaEle.Id,'text':areaEle.DisName});
                    }
                }

                cityData.push({'value': value, 'text': text, "children": children});
            }


            cityPicker.setData(cityData);
            var result = cityPicker.show(function (items) {
                $scope.city = (items[0] || {}).text;
                $scope.cityID = (items[0] || {}).value;
                $scope.district = (items[1] || {}).text;
                $scope.areaText = (items[0] || {}).text + " " + (items[1] || {}).text;
                $scope.$apply();
            });
        });
    }

    $scope.save = function () {
        if (!$scope.name) {
            mui.toast("收件人名称为空");
            return;
        }

        if (!$scope.phone) {
            mui.toast("联系电话为空");
            return;
        }

        if ($scope.phone.length != 11) {
            mui.toast("联系电话不是有效的");
            return;
        }

        if (!$scope.sexText) {
            mui.toast("收件人性别为空");
            return;
        }

        if (!$scope.areaText) {
            mui.toast("收货地址为空");
            return;
        }

        if (!$scope.detail) {
            mui.toast("收货详细地址为空");
            return;
        }

        $localForage.getItem('userInfo').then(function(data) {

            var userInfo = data;
            if (userInfo.type == '1') {
                $scope.memberPhone = userInfo.memberPhone;
            }else if (userInfo.type == '2') {

            }

            $http.post("addAddressData",{
                "memberPhone":$scope.memberPhone,
                "addressName":$scope.name,
                "addressPhone":$scope.phone,
                "addressDetailed":$scope.detail,
                "addressCity":$scope.city,
                "addressCityID":"" + $scope.cityID,
                "addressDistrict":$scope.district,
                "addressCode":"",
                "addressSex":$scope.sex
            }).success(function (value) {
                console.log(value);
                if ("0000" === value.repCode) {

                    mui.toast(value.repMSG);
                    setTimeout(function () {
                        window.location.href = "address";
                    },500)
                }
            }).error(function (data,status,headers,config) {
                console.log(data);
            });

        });
    }
});

//地址编辑
cupcake.controller('editAddress',function ($scope,$http,$window,$localForage) {
    $localForage.getItem('editAddressData').then(function(data) {
        $scope.addressData = data;
        console.log( $scope.addressData);

        $scope.name = $scope.addressData.addressName;
        $scope.phone =  $scope.addressData.addressPhone;

        if ($scope.addressData.addressSex == "1") {
            $scope.sexText = '先生';
        }else if($scope.addressData.addressSex == "2"){
            $scope.sexText = '女士';
        }


        $scope.detail = $scope.addressData.addressDetailed;
        $scope.city = $scope.addressData.addressCity;
        $scope.cityID = $scope.addressData.addressCityID;
        $scope.district = $scope.addressData.addressDistrict;
        $scope.addressID = $scope.addressData.addressID;

        $scope.areaText = $scope.city + " " + $scope.district;
    });

    $scope.pickSex = function () {
        var sexPicker = new mui.PopPicker();
        sexPicker.setData(
            [{
                value:'1',
                text:'先生'
            },{
                value:'2',
                text:'女士'
            }
            ]
        );

        var result = sexPicker.show(function (items) {
            $scope.sex = items[0].value;
            $scope.sexText = items[0].text;
            $scope.$apply();
        });

    }

    $scope.isInCity = function (e,ds) {
        for (var i=0;i<ds.length;i++){
            if (ds[i] == e) {
                return true;
            }
        }

        return false;
    }

    $scope.pickArea = function () {
        var cityPicker = new mui.PopPicker({
            layer:2
        });

        $localForage.getItem("city").then(function (data) {
            var cityDataFromDB = data;
            var cities = [];
            for (var i = 0; i < cityDataFromDB.length; i++) {
                var ele = cityDataFromDB[i];
                cities.push(ele.cityID);
            }

            var cityData = [];
            for (var i=0 ; i<city.length; i++) {
                var ele = city[i];

                var value = ele.CityID;
                var text = ele.name;

                if (!$scope.isInCity(value,cities)) {
                    break;
                }




                var children = [];

                for (var j=0; j<area.length; j++) {
                    var areaEle = area[j];
                    if (areaEle.CityID == ele.CityID) {
                        children.push({'value' : areaEle.Id,'text':areaEle.DisName});
                    }
                }

                cityData.push({'value': value, 'text': text, "children": children});
            }


            cityPicker.setData(cityData);
            var result = cityPicker.show(function (items) {
                $scope.city = (items[0] || {}).text;
                $scope.district = (items[1] || {}).text;
                $scope.areaText = (items[0] || {}).text + " " + (items[1] || {}).text;
                $scope.$apply();
            });
        });


    }

    //修改地址
    $scope.save = function () {
        if (!$scope.name) {
            mui.toast("收件人名称为空");
            return;
        }

        if (!$scope.phone) {
            mui.toast("联系电话为空");
            return;
        }

        if ($scope.phone.length != 11) {
            mui.toast("联系电话不是有效的");
            return;
        }

        if (!$scope.sexText) {
            mui.toast("收件人性别为空");
            return;
        }

        if (!$scope.areaText) {
            mui.toast("收货地址为空");
            return;
        }

        if (!$scope.detail) {
            mui.toast("收货详细地址为空");
            return;
        }

        $localForage.getItem('userInfo').then(function(data) {

            var userInfo = data;
            if (userInfo.type == '1') {
                $scope.memberPhone = userInfo.memberPhone;
            }else if (userInfo.type == '2') {
            }

            $http.post("editAddressData",{
                "memberPhone":$scope.memberPhone,
                "addressName":$scope.name,
                "addressPhone":$scope.phone,
                "addressDetailed":$scope.detail,
                "addressCity":$scope.city,
                "addressCityID":$scope.cityID,
                "addressDistrict":$scope.district,
                "addressCode":"",
                "addressSex":$scope.sex,
                "addressID":$scope.addressID
            }).success(function (value) {
                if ("0000" === value.repCode) {
                    mui.toast(value.repMSG);
                    setTimeout(function () {
                        window.location.href = "address";
                    },500)
                }
            }).error(function (data,status,headers,config) {
                console.log(data);
            });
        });
    }
});

//我的信息页
cupcake.controller('personalInfo',function ($scope,$http,$window) {
    $scope.back = function () {
        history.go(-1);
    }

    $scope.backToMine = function () {
        window.location.href = "mine"
    }

    $scope.pickSex = function () {
        var sexPicker = new mui.PopPicker();
        sexPicker.setData(
            [{
                value:'0',
                text:'先生'
            },{
                value:'1',
                text:'女士'
            }
            ]
        );

        var result = sexPicker.show(function (items) {
            $scope.sex = items[0].text;
            $scope.$apply();
        });

    }


    $scope.birthDayPick = function () {

        var date = new Date();

        var picker = new mui.DtPicker({"value":$scope.birthday,"type":"date","beginYear":date.getFullYear()-80,"endYear":date.getFullYear()-1});
        picker.show(function(rs) {
            $scope.birthday = rs.text;
            $scope.$apply();
        });

    }

    //保存个人信息
    $scope.save = function() {

        if (!$scope.nickName) {
            mui.toast("昵称不能为空");
            return
        }

        var postData = {
            'memberID' : $scope.memberID,
            'memberPhone':$scope.memberPhone,
            'memberNickname':$scope.nickName,
            'memberSex':$scope.sex,
            'memberBirth':$scope.birthday
        };

        $http.post("savePersonalInfo",postData).success(function (value) {
            if ("0000" === value.repCode) {
                mui.toast(value.repMSG);
                setTimeout(function () {
                    window.location.href = "mine";
                },500)
            }else{
                mui.toast(value.repMSG);
            }
        }).error(function (data,status,headers,config) {
            console.log(data);
        });

    }


    $scope.selectPhoto = function () {
        console.log("selectPhoto");
        mui('#photo').popover('toggle');
        mui.toast("need HBuilder to do this.");

    }

    $scope.takePhoto = function () {
        console.log("takePhoto");
        mui('#photo').popover('toggle');
        mui.toast("need HBuilder to do this.");
    }

    $scope.cancel = function () {
        mui('#photo').popover('toggle');
    }

    $scope.uploadAvatar = function () {
        //手机用户
        // if ($scope.type == "1") {
        //     mui('#photo').popover('toggle');
        // }
    }
});

//购物车
cupcake.controller('shoppingCart',function ($scope,$http,$compile,$localForage,$timeout,$window,NotificationService) {

    $scope.totalPrice = 0;
    $scope.selectedShoppingCart = {};
    $scope.list = [];
    $scope.selected = [];
    $scope.totalNum = 0;
    $scope.isTotal = false;
    $scope.currentPage = 1;
    $scope.pageSize = 10;
    $scope.shoppingCartNoContent = 0;

    $scope.findShoppingCart = function (scid) {
        for (var i = 0 ; i < $scope.list.length ; i++) {
            var ele = $scope.list[i];
            if (ele.shoppingCartID == scid) {
                return ele;
            }
        }
    }
    
    $scope.selectOne = function(me,id) {
        var checkBox = me.target;
        if (checkBox.checked) {
            if ($scope.selected.indexOf(id) == -1) {
                $scope.selected.push(id);
            }
        }else{
            if($scope.selected.indexOf(id) != -1) {
                var idx = $scope.selected.indexOf(id);
                $scope.selected.splice(idx,1);
            }
        }

        $scope.updatePrice();
    }

    $scope.isSelected = function (id) {
        return $scope.selected.indexOf(id) >= 0;
    }

    $scope.addShoppingCartNum = function (index) {
        console.log(index);

        var cart = $scope.list[index];
        cart.num = 1 + parseInt(cart.num);

        $localForage.getItem('userInfo').then(function (data) {
            $scope.userInfo = data;
            $http.post('editShoppingCartData',{
                memberPhone:''+$scope.userInfo.memberPhone,
                shoppingCartID:''+cart.shoppingCartID,
                num:''+cart.num
            }).success(function(value){
                console.log(value);
            });
        });

        $scope.updatePrice();
    }

    $scope.reduceShoppingCartNum = function (index) {
        var cart = $scope.list[index];
        cart.num = parseInt(cart.num) - 1;
        if (cart.num <= 0) {
            cart.num = 1;
        }

        $localForage.getItem('userInfo').then(function (data) {
            $scope.userInfo = data;
            $http.post('editShoppingCartData',{
                memberPhone:''+$scope.userInfo.memberPhone,
                shoppingCartID:''+cart.shoppingCartID,
                num:''+cart.num
            }).success(function(value){
                console.log(value);
            });
        });

        $scope.updatePrice();
    }

    $scope.updatePrice = function () {
        $scope.totalPrice = 0;
        for (var i=0;i < $scope.selected.length;i++) {
            var ele = $scope.selected[i];

            var shoppingCart = $scope.findShoppingCart(ele)
            if (shoppingCart) {
                $scope.totalPrice += parseFloat(shoppingCart.productPrice) * parseInt(shoppingCart.num);
            }

        }
    }

    $scope.checkAll = false;

    $scope.selectAll = function () {

        if (!$scope.checkAll) {
            $(':checkbox').prop("checked", true);
            $scope.checkAll = true;

            $scope.selected = [];
            $scope.list.forEach(function (ele) {
                $scope.selected.push(ele.shoppingCartID);
            });

        }else{
            $(':checkbox').prop("checked", false);
            $scope.checkAll = false;
            $scope.selected = [];
        }

        $scope.updatePrice();
    }

    $scope.deleteShoppingCart = function() {
        if ($scope.selected.length == 0) {
            mui.toast("选择一个");
            return;
        }

        for(var i=0;i<$scope.selected.length;i++) {
            var scid = $scope.selected[i];
            for(var j=0;j<$scope.list.length;j++) {
                var ele = $scope.list[j];
                if (ele.shoppingCartID == scid) {
                    $scope.list.splice(ele,1);
                }
            }
        }

        var ids = '';
        for(var i=0;i<$scope.selected.length;i++) {
            var scid = $scope.selected[i];
            ids += scid;
            if (i != $scope.selected.length - 1) {
                ids += ',';
            }
        }

        $scope.selected = [];
        $scope.deleteShoppingCartImpl(ids);
    }

    $scope.deleteShoppingCartImpl = function (ids) {
        $http.post('deleteShoppingCarts',{
            shoppingCartID:ids
        }).success(function (value) {
            console.log(value);
        }).error(function (data,status,headers,config) {

        });
    }

    $scope.addGallery = function() {
        if ($scope.selected.length == 0) {
            mui.toast("选择一个");
            return;
        }

        $localForage.getItem('userInfo').then(function (data) {
            $scope.userInfo = data;
            $scope.selected.forEach(function (id) {
                $http.post('addGalleryData',{
                    memberPhone:$scope.userInfo.memberPhone,
                    customName:$scope.findShoppingCart(id).name,
                    productID:$scope.findShoppingCart(id).productID,
                    num:'1'
                }).success(function (value) {
                    console.log(value);
                    if (value) {
                        mui.toast(value.repMSG);
                    }
                });
            })
        })

    }

    $scope.buyShoppingCart = function() {
        console.log("buyShoppingCart");
        if ($scope.selected.length == 0) {
            mui.toast("选择一个");
            return;
        }

        var orders = [];
        for (var i=0;i<$scope.selected.length;i++) {
            var id = $scope.selected[i];
            for (var j=0;j<$scope.list.length;j++) {
                var d = $scope.list[j];
                if (d.shoppingCartID == id) {
                    orders.push(d);
                }
            }
        }

        $localForage.setItem('shoppingCartOrder',orders).then(function () {
            window.location.href = 'orderConfirm?where=shoppingCart';
        });

    }

    $scope.back = function () {
        history.go(-1);
    }

    $scope.backToMine = function () {
        window.location.href = "mine"
    }

    $scope.goToLoginRegister = function () {
        window.location.href = "loginRegisterSelector";
    }


    $scope.goToIndex = function () {
        window.location.href = "index";
    };

    $scope.init = function () {

        $localForage.setItem('currentCtl','2');

        $localForage.getItem("userInfo").then(function (data) {
            var userInfo = data;

            if (userInfo) {
                $scope.memberID = userInfo.memberPhone;

                //购物车数量
                $http.post('searchShoppingCartData', {
                    'memberPhone': $scope.memberID,
                    'pageNo': '1',
                    'pageSize': '10'
                }).success(function (value) {
                    console.log(value);

                    if ('0000' == value.repCode) {
                        var repData = JSON.parse(value.repData);
                        if (repData && repData.length > 0) {
                            var element = repData[0];
                            $scope.shoppingCartNum = element.totalNum;
                            NotificationService.updateShoppingCartNum($scope.shoppingCartNum);
                            $localForage.setItem("shoppingCartNum",$scope.shoppingCartNum).then(function () {
                            });
                        }
                    }
                }).error(function (data, status, headers, config) {

                });


            }


        });
    }

    mui.init({
        pullRefresh: {
            container: '#pullrefresh',
            down: {
                callback: pulldownRefresh
            },
            up: {
                contentrefresh: '正在加载...',
                callback: pullupRefresh
            }
        }
    });

    if (mui.os.plus) {
        mui.plusReady(function() {
            mui('#pullrefresh').pullRefresh().pullupLoading();
        });
    } else {
        mui.ready(function() {
            mui('#pullrefresh').pullRefresh().pullupLoading();
        });
    }

    function pulldownRefresh() {

        console.log(" pull down ");

        var table = document.body.querySelector('.mui-table-view');
        table.innerHTML = '<ul class="mui-table-view mui-table-view-chevron"></ul>';
        $scope.list = [];

        $localForage.getItem("userInfo").then(function (data) {
            var userInfo = data;

            if (userInfo) {

                $scope.memberPhone = userInfo.memberPhone;

                $http.post('searchShoppingCartData', {
                    'memberPhone': $scope.memberPhone,
                    'pageNo': $scope.currentPage,
                    'pageSize': $scope.pageSize
                }).success(function (value) {
                    console.log(value);

                    if ('0000' == value.repCode) {
                        var repData = JSON.parse(value.repData);
                        if (repData && repData.length > 0) {
                            var element = repData[0];
                            $scope.totalNum = element.totalNum;
                            var products = element.products;

                            console.log("请求数量:" + $scope.currentPage);
                            console.log("服务端总数:" + $scope.totalNum);

                            for (var i=0; i<products.length; i++) {
                                var bread = products[i];
                                if (!bread.num) {
                                    bread.num = '1';
                                }
                                $scope.list.push(bread);
                            }
                            var html =
                                '<div class="mui-row sp-row" ng-repeat="p in list">' +
                                '<div class="mui-col-xs-2 mui-checkbox mui-text-center" >' +
                                '<input type="checkbox" name="" id="p.shoppingCartID"  style="padding-top:30px;" ng-checked="isSelected(p.shoppingCartID)" ng-click="selectOne($event,p.shoppingCartID);"/>' +
                                '</div>' +

                                '<div class="mui-col-xs-3" style="padding-top:30px;">' +
                                '<img src="{{picUrl}}{{p.pic}}" />' +
                                '</div>' +

                                '<div class="mui-col-xs-7" style="line-height: 50px;">' +
                                '<div class="mui-row">' +
                                '<span>{{p.name}}</span>' +
                                '</div>' +
                                '<div class="mui-row">' +

                                '<div class="mui-col-xs-5">' +
                                '<span style="color: #E51B54;">¥ {{p.productPrice }}</span>' +
                                '</div>' +

                                '<div class="mui-col-xs-7">' +
                                '<div class="sp-quantity-control">' +
                                '<span ng-click="addShoppingCartNum($index);" class="mui-icon mui-icon-plus mui-pull-left cup-left-plus"></span>' +
                                '<span>{{p.num }}</span>' +
                                '<span ng-click="reduceShoppingCartNum($index)" class="mui-icon mui-icon-minus mui-pull-right cup-right-minus"></span>' +
                                '</div>' +
                                '</div>' +
                                '</div>' +
                                '</div>' +
                                '</div>' +
                                '<div class="cup-line cup-line-height-5"></div>';

                            $timeout(function () {
                                var div = $compile(angular.element(html))($scope);
                                angular.element(table).append(div);
                            }, 500);
                        }

                        mui('#pullrefresh').pullRefresh().endPulldownToRefresh();
                    }
                }).error(function (data, status, headers, config) {

                });
            }


        });
    }



    function pullupRefresh() {

        console.log(" pull up ");
        // mui('#pullrefresh').pullRefresh().endPullupToRefresh((++count > 2)); //参数为true代表没有更多数据了。
        var table = document.body.querySelector('.mui-table-view');
        $localForage.getItem("userInfo").then(function (data) {
            var userInfo = data;

            if (userInfo) {
                if (userInfo.type == '1') {
                    $scope.memberPhone = userInfo.memberPhone;
                }else if (userInfo.type == '2') {

                }


                $http.post('searchShoppingCartData', {
                    'memberPhone': $scope.memberPhone,
                    'pageNo': $scope.currentPage,
                    'pageSize': $scope.pageSize
                }).success(function (value) {
                    console.log(value);

                    if ('0000' == value.repCode) {
                        var repData = JSON.parse(value.repData);
                        if (repData && repData.length > 0) {
                            var element = repData[0];
                            $scope.totalNum = element.totalNum;

                            console.log("请求数量:" + $scope.currentPage * $scope.pageSize);
                            console.log("服务端总数:" + $scope.totalNum);
                            if ($scope.currentPage * $scope.pageSize >= $scope.totalNum) {
                                mui('#pullrefresh').pullRefresh().endPullupToRefresh(true);
                            }else{
                                mui('#pullrefresh').pullRefresh().endPullupToRefresh(false);
                            }

                            $scope.currentPage += 1;

                            var products = element.products;
                            for (var i=0; i<products.length; i++) {
                                var bread = products[i];
                                if (!bread.num) {
                                    bread.num = '1';
                                }

                                $scope.list.push(bread);
                            }

                            var html =
                                '<div class="mui-row sp-row" ng-repeat="p in list">' +
                                '<div class="mui-col-xs-2 mui-checkbox mui-text-center" >' +
                                '<input type="checkbox" name="" id="p.shoppingCartID"  style="padding-top:30px;" ng-checked="isSelected(p.shoppingCartID)" ng-click="selectOne($event,p.shoppingCartID);"/>' +
                                '</div>' +

                                '<div class="mui-col-xs-3" style="padding-top:30px;">' +
                                '<img src="{{picUrl}}{{p.pic}}" />' +
                                '</div>' +

                                '<div class="mui-col-xs-7" style="line-height: 50px;">' +
                                '<div class="mui-row">' +
                                '<span>{{p.name}}</span>' +
                                '</div>' +
                                '<div class="mui-row">' +

                                '<div class="mui-col-xs-5">' +
                                '<span style="color: #E51B54;">¥ {{p.productPrice }}</span>' +
                                '</div>' +

                                '<div class="mui-col-xs-7">' +
                                '<div class="sp-quantity-control">' +
                                '<span ng-click="addShoppingCartNum($index);" class="mui-icon mui-icon-plus mui-pull-left cup-left-plus"></span>' +
                                '<span>{{p.num }}</span>' +
                                '<span ng-click="reduceShoppingCartNum($index)" class="mui-icon mui-icon-minus mui-pull-right cup-right-minus"></span>' +
                                '</div>' +
                                '</div>' +
                                '</div>' +
                                '</div>' +
                                '</div>' +
                                '<div class="cup-line cup-line-height-5"></div>';

                            $timeout(function () {
                                var div = $compile(angular.element(html))($scope);
                                angular.element(table).append(div);
                            }, 500);
                        }
                    }
                }).error(function (data, status, headers, config) {

                });
            }
        });
    }




    $scope.init();

});

//
cupcake.controller('orderConfirm',function ($scope,$http,$localForage,$timeout,$window,$compile) {

    $scope.orderInfo = {};

    $localForage.getItem('deliveryWay').then(function (data) {
        //配送方式
        $scope.deliveryWay = data;
        $localForage.getItem('deliveryWayFlg').then(function (data) {
            //配送方式flg
            $scope.deliveryWayFlg = data;

            //根据配送方式送货地址
            //商家配送
            $localForage.getItem('orderUserAddress').then(function (data) {
                $scope.orderUserAddress = data;
            })

            //店内自提
            $localForage.getItem('pickStore').then(function (data) {
                $scope.pickStore = data;
                console.log($scope.pickStore);
            })
            //送货日期
            $localForage.getItem('deliveryDate').then(function (data) {
                $scope.deliveryDate = data
            });
            //送货时间
            $localForage.getItem('deliveryTime').then(function (data) {
                $scope.deliveryTime = data
            });

            //留言
            $localForage.getItem('msg').then(function (data) {
                $scope.msg = data;
            });
            //支付方式
            $localForage.getItem('payType').then(function (data) {
                $scope.payType = data;
                $localForage.getItem('payTypeText').then(function (data) {
                    $scope.payTypeText = data;
                });
            });


            console.log($scope.where);


            if ($scope.where == 'shoppingCart'){
                $localForage.getItem("shoppingCartOrder").then(function (data) {
                    $scope.ordersCart = data;
                    $scope.productsPrice = 0;
                    console.log('购物车订单');
                    log($scope.orders);

                    for (var i=0;i<$scope.ordersCart.length;i++) {
                        var ele = $scope.ordersCart[i];
                        $scope.productsPrice += parseFloat(ele.productPrice) * parseFloat(ele.num);
                    }
                    log($scope.productsPrice);
                    //运费
                    $localForage.getItem('deliveryChargeText').then(function (data) {
                        $scope.deliveryChargeText = data;
                    });


                    $localForage.getItem('freeDeliveryCharge').then(function (data) {
                        $scope.freeDeliveryCharge = data;
                        $localForage.getItem('freight').then(function (data) {
                            $scope.freight = data;
                            //总价
                            if ($scope.deliveryWayFlg == 1) {

                                if ($scope.productsPrice >= $scope.freeDeliveryCharge) {
                                    $scope.deliveryChargeText = 0;
                                } else {
                                    $scope.deliveryChargeText = $scope.freight;
                                }

                            } else {
                                $scope.deliveryChargeText = 0;
                            }

                            $scope.totalPrice = $scope.deliveryChargeText + $scope.productsPrice;
                        });
                    })

                });
            }else{
                //商品价格
                $localForage.getItem("orders").then(function (data) {

                    $scope.orders = data;
                    $scope.productsPrice = 0;
                    console.log('订单');
                    log($scope.orders);

                    for (var i=0;i<$scope.orders.length;i++) {
                        var ele = $scope.orders[i];
                        $scope.productsPrice += parseFloat(ele.pi.productPrice) * parseFloat(ele.num);
                    }
                    log($scope.productsPrice);
                    //运费
                    $localForage.getItem('deliveryChargeText').then(function (data) {
                        $scope.deliveryChargeText = data;
                    });


                    $localForage.getItem('freeDeliveryCharge').then(function (data) {
                        $scope.freeDeliveryCharge = data;
                        $localForage.getItem('freight').then(function (data) {
                            $scope.freight = data;
                            //总价
                            if ($scope.deliveryWayFlg == 1) {

                                if ($scope.productsPrice >= $scope.freeDeliveryCharge) {
                                    $scope.deliveryChargeText = 0;
                                } else {
                                    $scope.deliveryChargeText = $scope.freight;
                                }

                            } else {
                                $scope.deliveryChargeText = 0;
                            }

                            $scope.totalPrice = $scope.deliveryChargeText + $scope.productsPrice;
                        });
                    })

                });
            }
        });

        $scope.initOrderConfirmPage();

    });


    $scope.goToLoginRegister = function () {
        window.location.href = "loginRegisterSelector";
    }

    $scope.initOrderConfirmPage = function () {
        $localForage.getItem("userInfo").then(function (data) {
            var userInfo = data;

            if (userInfo == undefined) {
                $scope.goToLoginRegister();
                return;
            }

            $localForage.getItem("orders").then(function (data) {

                $scope.orders = data;

                $http.post('getConfig',{

                }).success(function (value) {
                    log(value);
                    if ('0000' == value.repCode) {
                        var repData = JSON.parse(value.repData);
                        for (var i=0; i<repData.length;i++) {
                            var ele = repData[i];
                            if (ele.argumentKey === 'freeDeliveryCharge') {
                                $scope.freeDeliveryCharge = parseFloat(ele.argumentValue);
                                $localForage.setItem('freeDeliveryCharge', $scope.freeDeliveryCharge);
                            }else if (ele.argumentKey === 'freight') {
                                $scope.freight = parseFloat(ele.argumentValue);
                                $localForage.setItem('freight', $scope.freight);
                            }else if (ele.argumentKey === 'WorkTime') {
                                $scope.workTime = ele.argumentValue;
                            }
                        }


                        var deliveryWayHtml =
                        '<li class="mui-table-view-cell mui-radio mui-left" ng-click="selectDeliveryWay($evt,1);">' +
                                '<input name="radio-delivery" type="radio">&nbsp;&nbsp;' + '商家配送（{{freeDeliveryCharge }} 元起,免费配送）' +
                        '</li>' +
                        '<li class="mui-table-view-cell mui-radio mui-left" ng-click="selectDeliveryWay($evt,2);">' +
                            '<input name="radio-delivery" type="radio">&nbsp;&nbsp;店内自提' +
                        '</li>';


                        var deliveryWayUl = document.querySelector('#deliveryWay');
                        var node = $compile(deliveryWayHtml)($scope);
                        angular.element(deliveryWayUl).append(node);



                    }else{
                        mui.toast("页面载入错误");
                    }

                }).error(function (data,status,headers,config) {

                });
            });

        });
    }



    $scope.selectDeliveryWay = function (me,value) {
        if (value == 1) {
            $scope.deliveryWay = '商家配送（' + $scope.freeDeliveryCharge + '元起,免费配送）';
            $scope.deliveryWayFlg = value;

        }else{
            $scope.deliveryWay = '店内自提';
            $scope.deliveryWayFlg = value;
        }

        $scope.updateDeliverCharge();
        $('#deliveryWayLi').removeClass('mui-active');

        $localForage.setItem('deliveryWay',$scope.deliveryWay).then(function () {
            $localForage.setItem('deliveryWayFlg',$scope.deliveryWayFlg).then(function () {

            });
        });
    }

    $scope.updateDeliverCharge = function () {
        if ($scope.deliveryWayFlg == 1) {

            if ($scope.productsPrice >=  $scope.freeDeliveryCharge) {
                $scope.deliveryChargeText = 0;
            }else{
                $scope.deliveryChargeText = $scope.freight;
            }

        }else{
            $scope.deliveryChargeText = 0;
        }

        $scope.totalPrice = $scope.deliveryChargeText + $scope.productsPrice;


        $localForage.setItem('totalPrice',$scope.totalPrice).then(function () {
            $localForage.setItem('deliveryChargeText',$scope.deliveryChargeText).then(function () {
                $localForage.setItem('deliveryChargeText',$scope.deliveryChargeText).then(function () {
                    // $localForage.setItem('totalPrice',$scope.totalPrice).then(function () {
                        $localForage.setItem('deliveryChargeText',$scope.deliveryChargeText).then(function () {

                        });
                    // });
                });
            });
        });
    }

    $scope.saveData = function (url) {
        $localForage.setItem('orderInfo',$scope.orderInfo).then(function () {
            window.location.href = url;
        });
    }
    
    $scope.selectAddress = function () {

        if (!$scope.deliveryWayFlg) {
            mui.toast("请选择配送方式");
            return;
        }

        $localForage.setItem('msg',$scope.msg);

        if ($scope.deliveryWayFlg == 1) {

            //选择用户收货地址
            $scope.saveData('address?isFromMine=0');

        }else if ($scope.deliveryWayFlg == 2){
            //选择店铺地址
            $scope.saveData('store');
        }
    }


    $scope.selectPayType = function (value) {
        $scope.payType = value;
        if (value == 1) {
            $scope.payTypeText = '货到付款(POS机刷卡)';
        }else{
            $scope.payTypeText = '货到付款(现金)';
        }

        $('#payTypeLi').removeClass('mui-active');

        $localForage.setItem('payTypeText',$scope.payTypeText).then(function () {
            $localForage.setItem('payType',$scope.payType).then(function () {

            })
        })

    }

    $scope.selectTime = function () {
        //deliveryTime

        var wt = $scope.workTime.split('-');


        var start = parseInt(wt[0].split(':')[0]);
        var end = parseInt(wt[1].split(':')[0]);

        var data = [];
        for (var i=start;i<end;i+=2) {
            var t = i+":00 - " + (i+1) + ":00";
            data.push({
                value:t,
                text:t
            });
        }


        var timeLabelPicker = new mui.PopPicker();
        timeLabelPicker.setData(
            data
        );

        var result = timeLabelPicker.show(function (items) {
            $scope.deliveryTime = items[0].text;
            $localForage.setItem('deliveryTime',$scope.deliveryTime);
            $scope.$apply();
        });

    }
    
    $scope.selectDate = function () {
        var date = new Date();

        var picker = new mui.DtPicker(
            {
            "value":$scope.birthday,
            "type":"date","beginYear":date.getFullYear(),
            "endYear":date.getFullYear()+1}
        );
        picker.show(function(rs) {
            $scope.deliveryDate = rs.text;
            $localForage.setItem('deliveryDate',$scope.deliveryDate);
            $scope.$apply();
        });


    }
    
    $scope.addOrder = function () {
        if ($scope.deliveryWayFlg != 1 && $scope.deliveryWayFlg != 2) {
            mui.toast("请选择配送方式");
            return;
        }


        if (!$scope.deliveryDate) {
            mui.toast("请选择送货日期");
            return;
        }

        if (!$scope.deliveryTime) {
            mui.toast("请选择送货时间");
            return;
        }

        if ($scope.payType != 1 && $scope.payType !=2 ) {
            mui.toast("请选择支付方式");
            return;
        }


        $localForage.getItem('userInfo').then(function (data) {
            $scope.userInfo = data;

            var orderDeliveryMethod = '';

            if ($scope.deliveryWayFlg == 1) {
                orderDeliveryMethod = '商家配送（' + $scope.freeDeliveryCharge +' 元起,免费配送）';
            }else if ($scope.deliveryWayFlg == 2) {
                orderDeliveryMethod = '店内自提';
            }


            var orderPay = '1';
            if ($scope.payType == 1) {
                orderPay = '4';
            }else if ($scope.payType == 2) {
                orderPay = '1';
            }


            var pinCode = random();
            var orderStore,orderBuyer,orderAddress,orderCity,orderDistrict,orderPhone,orderPin,orderKind,timeDelivery;

            $scope.smsPhone = '';
            if ($scope.deliveryWayFlg == 1){
                //商家送货
                orderStore = '';
                orderBuyer = $scope.orderUserAddress.addressPhone;
                orderAddress = $scope.orderUserAddress.detail;
                orderCity = $scope.orderUserAddress.addressCityID;
                orderDistrict = $scope.orderUserAddress.addressDistrict;
                orderPin = '';
                orderKind = '2';
                orderPhone = $scope.orderUserAddress.addressPhone

            }else if($scope.deliveryWayFlg == 2){
                //自提
                orderKind = '1';
                orderStore = $scope.pickStore.storeID;
                orderBuyer = $scope.userInfo.memberPhone;
                orderAddress = '';
                orderCity = $scope.pickStore.storeCity;
                orderDistrict = '';
                orderPin = ''+pinCode;
                orderPhone = $scope.userInfo.memberPhone;
            }

            timeDelivery = $scope.deliveryDate + ' ' + $scope.deliveryTime;

            var details = [];
            for (var i=0;i<$scope.orders.length;i++) {
                var ele = $scope.orders[i];
                var d = {
                    orderType:'0',
                    productID:''+ele.pi.productID,
                    orderNumber:''+ele.num,
                    cake:'',
                    icing:'',
                    stuffing:'',
                    topping:'',
                    coating:''
                };
                details.push(d);
            }

            var postData = {
                memberID:$scope.userInfo.memberPhone,
                orderState:'2',
                orderSource:'3',
                orderPrice:''+$scope.productsPrice,
                orderPay:orderPay,
                orderDeliveryMethod:orderDeliveryMethod,
                orderDeliveryFee:''+$scope.deliveryChargeText,
                orderKind:orderKind,
                orderStore:orderStore,
                orderBuyer:orderBuyer,
                orderAddress:orderAddress,
                orderCity:orderCity,
                orderDistrict:orderDistrict,
                orderPhone:orderPhone,
                orderPin:orderPin,
                timeDelivery:timeDelivery,
                postCardID:'',
                postCardContent:'',
                details:details

            };

            console.log(postData);

            $http.post('addOrder',postData).success(function (value) {
                console.log(value);
                if (value.repCode == '0000') {
                    if ($scope.deliveryWayFlg == 2) {

                        var data = {
                            "0":"【Bcup不靠谱】您的注册验证码：",
                            "1":"【Bcup不靠谱】您的重置密码验证码：",
                            "2":"【Bcup不靠谱】您订单#$#的提货验证码："
                        };

                        var url = "http://apis.baidu.com/kingtto_media/106sms/106sms";
                        var apiKey = "9e09c2533e53ef4eeddb8c041b2c2cef";
                        var content = "mobile=" + orderPhone + "&content=" + data[2].replace('#$#',value.orderID) + orderPin;
                        console.log(content);
                        $http.post("sendSMS",{
                            httpUrl:url,
                            content:content,
                            apiKey:apiKey
                        }).success(function (ret) {
                            alert('提交订单成功! 订单编号:' + value.orderID + ',提货需要您提供提货二维码和验证码(已发送到收货手机)');
                            window.location.href = "mine";
                        });
                    }else{
                        alert('提交订单成功! 订单编号:' + value.orderID);
                        window.location.href = "mine";
                    }
                }else{
                    mui.toast('提交订单失败');
                }


            }).error(function(data,status,headers,config){

            });
        });

    }

});

//收藏
cupcake.controller('gallery',function ($scope,$http,$localForage,$timeout,$window,$compile) {
    $scope.pageNo = 1;
    $scope.pageSize = 10;
    $scope.list = [];

    $scope.goToLoginRegister = function () {
        window.location.href = "loginRegisterSelector";
    }

    $scope.goToIndex = function () {
        window.location.href = "index";
    };

    $scope.requestData = function () {

        $localForage.getItem('userInfo').then(function (data) {
            var userInfo =  data;

            $scope.memberID = userInfo.memberPhone;

            $http.post('searchGalleryData',{
                memberPhone:'' + $scope.memberID,
                pageNo:$scope.pageNo,
                pageSize:$scope.pageSize
            }).success(function (value) {
                console.log(value);
                if ('0000' == value.repCode) {
                    var repData = JSON.parse(value.repData);
                    if (repData == undefined || repData.length == 0) {
                        return;
                    }

                    var data = repData[0];
                    $scope.totalNum = parseInt(data.totalNum);
                    var products = data.products;
                    if (products == undefined) {
                        return;
                    }
                    products.forEach(function (e) {
                        $scope.list.push(e);
                    })
                    if ($scope.pageNo * $scope.pageSize >=  $scope.totalNum) {
                        return;
                    }else{
                        $scope.requestData();
                    }

                    $scope.pageNo += 1;

                }
            }).error(function (data,status,headers,config) {

            });

        });
    }

    $scope.initGalleryPage = function () {
        $scope.requestData();
    }

    $scope.removeGallery = function (index) {
        mui.confirm('确定要删除该定制蛋糕？', "蛋糕不靠谱", [ '否','是'], function(e) {
            if (e.index == 1) {
                var gallery = $scope.list[index];
                $scope.list.splice(index, 1);

                if ($scope.list.length == 0) {
                    $scope.isEmpty = 1;
                }

                $http.post('delGalleryData', {
                    customID: gallery.customID
                }).success(function (value) {
                    if (value.repCode == '0000') {
                        mui.toast(value.repMSG);
                    } else {
                        mui.toast(value.repMSG);
                    }
                });
            }
        });
    }
    
    $scope.viewDetail = function(pid) {
        $localForage.setItem("pid",pid).then(function () {
            window.location.href = 'breadDetail';
        });
    }

    $scope.initGalleryPage();

});

//位置
cupcake.controller('location',function ($scope,$http,$window) {
    $scope.back = function () {
        history.go(-1);
    }

    $scope.backToMine = function () {
        window.location.href = "mine"
    }


    $scope.citys = [];

    $http.post("locationData",{

    }).success(function (value) {
        if ("0000" === value.repCode) {
            $scope.citys = JSON.parse(value.repData);
        }
    }).error(function (data,status,headers,config) {
        console.log(data);
    });
});


//店内自提
cupcake.controller('store',function ($scope,$http,$localForage,$window) {

    $scope.citys = [];


    $scope.selectOne = function (index) {
        $scope.selectStore = $scope.citys[0].storeInfo[index];

        $localForage.setItem('pickStore',$scope.selectStore).then(function () {
            window.location.href = 'orderConfirm?where=store';
        });
    }


    $http.post("locationData",{

    }).success(function (value) {
        if ("0000" === value.repCode) {
            $scope.citys = JSON.parse(value.repData);
            console.log($scope.citys);
        }
    }).error(function (data,status,headers,config) {
        console.log(data);
    });
});

//footer
cupcake.controller('footer',function ($scope,$http,$localForage,$window,$timeout,NotificationService) {
    $scope.shoppingCartNum = 0;

    /**
     * index 0
     * create 1
     * shoppingCart 2
     * mine 3
     */
    $scope.currentCtrl = '0';

    $localForage.getItem('currentCtl').then(function (data) {
        $scope.currentCtrl = data;
    });

    $localForage.getItem('userInfo').then(function (data) {

        var userInfo = data;
        if (userInfo) {
            $localForage.getItem('shoppingCartNum').then(function (data) {
                $scope.shoppingCartNum = data;
            });
        }else{
            $scope.shoppingCartNum = 0;
        }
    });

    $scope.$on('dataUpdate',function () {
        $scope.shoppingCartNum = NotificationService.shoppingCartNum;
        $localForage.setItem('shoppingCartNum',$scope.shoppingCartNum).then(function () {

        });
    });

    $scope.home = function () {
        location.href = "index";
    };

    // $scope.create = function () {
    //     location.href = "create";
    // };

    $scope.shoppingCart = function () {
        location.href = "shoppingCart";
    };

    $scope.mine = function () {
        location.href = "mine";
    };
});

//about
cupcake.controller('about',function ($scope,$http,$localForage,$window,NotificationService) {
    $http.post('getConfig',{

    }).success(function (value) {
        console.log(value);

        if ('0000' == value.repCode) {
            var repData = JSON.parse(value.repData);
            for (var i=0; i<repData.length; i++) {
                var ele = repData[i];
                if (ele.argumentKey == 'WechatGZ') {
                    $scope.WechatGZ = ele.argumentValue;
                }else if (ele.argumentKey == 'WechatKF') {
                    $scope.WechatKF = ele.argumentValue;
                }else if (ele.argumentKey == 'KFPhone') {
                    $scope.KFPhone = ele.argumentValue;
                }
            }
        }
    }).error(function (data,status,headers,config) {
        
    })
});

//通知
cupcake.controller('notice',function($scope,$http,$localForage,NotificationService) {

});