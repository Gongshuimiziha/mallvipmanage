<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="zh-CN">
<head>
    <title>樱诺商城-管理页面</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/static/images/favicon.png">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/libs/bootstrap-4.3.1-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/libs/font-awesome-4.7.0/css/font-awesome.min.css" >
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.4.1.js"></script>

    <style>
        *{
            margin: 0;
            padding: 0;
        }
        .clear{
            clear: both;
        }
        a,a:hover{
            text-decoration: none;
        }
        .text-bold{
            font-weight: bold;
        }
        .color-blue{
            color: #13DAFE;
        }
        .text-purple {
            color: #6164c1;
        }
        .active{
            background-color: #13DAFE !important;
            color: white !important;
        }
        body{
            background-color: #EAECF2;
        }

        .nav-top {
            padding: 0 16px 0 0;
            background-color: white;
            box-shadow:0 15px 10px -15px #ccc;
        }
        .nav-top .top-left-part{
            width: 220px;
            float: left;
            line-height: 56px;
            background: #3a3f51;
            padding-left: 16px;
        }
        .top-left-part .logo{
            color: white;
            font-size: 16px;
        }
        .nav-top .navbar-nav{
            position: absolute;
            right: 0;
            padding-right: 25px;
        }
        .navbar-nav .admin-btn:hover{
            background-color: #E5E5E5;
            border-radius: 50px;
        }
        .nav-top .navbar-nav img{
            border-radius: 50%;
            width: 36px;
            height: 36px;
            margin-top: 3px;
        }
        .nav-top .navbar-nav a{
            color: black;
            font-weight: bold;
        }

        .nav-left {
            width: 220px;
            height: 100vh;
            background-color: #3A3F51;
            color: #575B6A;
            position: fixed;
            left: 0;
            top: 56px;
        }
        .nav-left .nav-left-ul{

        }
        .nav-left-ul .nav-left-item{
            color: rgba(255, 255, 255, .4);
            height: 56px;
            padding-left: 16px;
        }
        .nav-left-ul .nav-left-item:hover{
            background-color: #3A3F51;
        }
        .nav-left-ul .nav-left-item a{
            line-height: 56px;
            color: rgba(255, 255, 255, .4);
        }

        .tip-head{
            position: absolute;
            top: 90px;
            left: 235px;
            padding-left: 20px;
        }
        .tip-head h5{
            font-weight: bold;
        }
        .tip-head .breadcrumb{
            padding-top: 0;
            padding-left: 0;

        }
        .main-bg {
            background-color: #F1F2F7;
            width: 1683px;
            height: 1080px;
            position: absolute;
            top: 168px;
            left: 220px;
            padding: 15px;
        }
        .table_show{
            background-color: white;
            margin: 0;
            width: 100%;
            padding-bottom: 75px;
            border-radius: 5px;
            margin-bottom: 15px;
        }
        .table_show .show-data-item{
            height: 100px;
            border-right: #ba8b00 solid 1px;
            padding: 10px;
            margin-top: 75px;
            text-align: center;
        }
        .show-data-item h5{
            font-size: 14px;
        }
        .show-data-item h3{
            font-size: 48px;
            font-weight: 100;
        }
        .table_show .show-data-item:last-child{
            border-right: none;
        }
        .dosomething{
            margin: 0;
        }
        .dosomething .do-left{
            padding-left: 0;
            padding-right: 7px;
        }
        .dosomething .do-right{
            padding-right: 0;
            padding-left: 7px;
        }
        .do-left-in{
            background-color: white;
            border-radius: 5px;
            height: 100%;
            padding: 15px;
        }
        .do-right-in{
            background-color: white;
            border-radius: 5px;
            height: 100%;
            padding: 15px;
        }
        .new-order-list{
            list-style: none;
        }
        .new-order-list .new-order{
            border-bottom: 1px solid rgba(120, 130, 140, .13);;
        }
        .new-order-list .new-order:last-child{
            border-bottom: none;
        }
        .new-order-list .new-order img{
            width: 40px;
            height: 40px;
            border-radius: 50%;
        }
        .new-order .text-area{
            margin-left: 10px;
        }
        .new-order-list .new-order .text-area p{
            margin-bottom: 0;
        }
    </style>
    <script>
        //窗口大小改变时，执行
        $(window).resize(function () {
            //执行代码块
            editMainBg();
        });
        function editMainBg() {
            let now_width = $(document.body).width()-220-30;
            $(".main-bg").width(now_width);
            console.log("动态更改 main-bg 的宽度" + now_width);
        }
    </script>
</head>
<body onload="editMainBg()">
<nav class="fixed-top fixed-top navbar navbar-expand-sm nav-top">
    <div class="top-left-part">
        <a class="logo" href="#"><i class="fa fa-fire color-blue"></i>&nbsp;
            <span class="hidden-xs">MY ADMIN</span>
        </a>
    </div>
    <ul class="navbar-nav">
        <li class="nav-item admin-btn">
            <img src="${pageContext.request.contextPath}/static/images/admin/admin-head.png" alt="" class="nav-img float-left">
            <a class="nav-link float-left" href="#">${sessionScope.admin.admin_name}</a>
            <a class="nav-link float-left text-danger" href="${pageContext.request.contextPath}/adminLogout">，注销</a>
            <div class="clear"></div>
        </li>
    </ul>
    <div class="clear"></div>
</nav>
<nav class="nav-left">
    <ul class="nav-left-ul">
        <li class="nav-left-item active">
            <a class="link active" href="${pageContext.request.contextPath}/admin">控制台</a>
        </li>
        <li class="nav-left-item">
            <a class="link" href="${pageContext.request.contextPath}/admin/manageAnnounce">商城公告管理</a>
        </li>
        <li class="nav-left-item">
            <a class="link" href="${pageContext.request.contextPath}/admin/manageUser">用户管理</a>
        </li>
        <li class="nav-left-item">
            <a class="link" href="${pageContext.request.contextPath}/admin/manageOrder">订单管理</a>
        </li>
        <li class="nav-left-item">
            <a class="link" href="${pageContext.request.contextPath}/admin/manageVipRule">会员体系管理</a>
        </li>
        <li class="nav-left-item">
            <a class="link" href="${pageContext.request.contextPath}/admin/manageAdmin">管理员管理</a>
        </li>
    </ul>
</nav>
<div class="tip-head">
    <h5>欢迎来到商城管理中心</h5>
    <ol class="breadcrumb">
        <li class="breadcrumb-item">控制台</li>
    </ol>
</div>
<div class="main-bg">
    <div class="table_show row">
        <div class="show-data-item col-md-3">
            <h5 class="text-danger">订单量</h5>
            <h3>${countOrder}</h3>
        </div>
        <div class="show-data-item col-md-3">
            <h5 class="text-warning">会员数</h5>
            <h3>${countUser}</h3>
        </div>
        <div class="show-data-item col-md-3">
            <h5 class="text-purple">成交额</h5>
            <h3>${allPayAmount}</h3>
        </div>
        <div class="show-data-item col-md-3">
            <h5 class="color-blue">会员池积分</h5>
            <h3>${allPoint}</h3>
        </div>
    </div>
    <div class="dosomething row">
        <div class="do-left col-md-6">
            <div class="do-left-in">
                <h6 class="text-bold">商城事务</h6>
                <ul class="list-task list-group" data-role="tasklist">
                    <li class="list-group-item" data-role="task">
                        <div class="checkbox checkbox-info">
                            <input type="checkbox" id="inputSchedule" name="inputCheckboxesSchedule">
                            <label for="inputSchedule"> <span>对商城功能进行功能设计</span> </label>
                        </div>
                    </li>
                    <li class="list-group-item" data-role="task">
                        <div class="checkbox checkbox-info">
                            <input type="checkbox" id="inputCall" name="inputCheckboxesCall">
                            <label for="inputCall"> <span>完成数据库的设计与编写</span></label>
                        </div>
                    </li>
                    <li class="list-group-item" data-role="task">
                        <div class="checkbox checkbox-info">
                            <input type="checkbox" id="inputBook" name="inputCheckboxesBook">
                            <label for="inputBook"> <span>完成商城前端页面设计与开发</span> </label>
                        </div>
                    </li>
                    <li class="list-group-item" data-role="task">
                        <div class="checkbox checkbox-info">
                            <input type="checkbox" id="inputForward" name="inputCheckboxesForward">
                            <label for="inputForward"> <span>完成商城后端的开发</span></label>
                        </div>
                    </li>
                    <li class="list-group-item" data-role="task">
                        <div class="checkbox checkbox-info">
                            <input type="checkbox" id="inputRecieve" name="inputCheckboxesRecieve">
                            <label for="inputRecieve"> <span>项目测试</span> </label>
                        </div>
                    </li>
                    <li class="list-group-item" data-role="task">
                        <div class="checkbox checkbox-info">
                            <input type="checkbox" id="inputForward2" name="inputCheckboxesd">
                            <label for="inputForward2"> <span>项目论文编写</span></label>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        <div class="do-right col-md-6">
            <div class="do-right-in">
                <h6 class="text-bold">最新订单</h6>
                <ul class="new-order-list">
                    <c:forEach var="newOrder" items="${newFiveOrderList}">
                        <li class="new-order">
                            <img class="float-left" src="${pageContext.request.contextPath}/static/images/user-head.png" alt="">
                            <div class="text-area float-left">
                                <p>用户手机号：${newOrder.user_phone}</p>
                                <p>支付金额：${newOrder.pay_amount}</p>
                                <p>时间：${newOrder.create_date}</p>
                            </div>
                            <div class="clear"></div>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/static/js/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/static/libs/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>
</body>
</html>
