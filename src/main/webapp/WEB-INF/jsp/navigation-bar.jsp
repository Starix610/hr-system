<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<html lang="en">

<head>

    <meta name="viewport" content="width=device-width, initial-scale=1" charset="UTF-8">
    <title>人力资源管理系统</title>
    <link href="http://cdn.bootcss.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
    <link href="http://g.alicdn.com/bui/bui/1.1.21/css/bs3/dpl.css" rel="stylesheet">
    <link href="/css/houtai.css" rel="stylesheet"></link>
    <script src="http://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.bootcss.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>


    <script>

    </script>
</head>
<body>
<div class="navbar navbar-duomi navbar-static-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#" id="logo" style="font-size: 23px">人力资源管理系统</a>
        </div>
        <div class="userid" style="float: right;margin-right: 35px;">欢迎您，${authority}  <em style="color:#52b0e9;"><security:authentication property="principal.username"></security:authentication></em>
            <span>丨<a href="/logout" style="color: white;">退出</a></span>
        </div>

    </div>
</div>
<div class="container-fluid">
    <div class="row" style="margin-right: -10px;margin-left: -15px;">
        <div class="col-md-2">
            <ul id="main-nav" class="nav nav-tabs nav-stacked">
                <li class="active">
                    <a href="#">
                        <i class="glyphicon glyphicon-th-large"></i>
                        首页
                    </a>
                </li>
                <li>
                    <a href="#danganSetting" class="nav-header collapsed" data-toggle="collapse">
                        <i class="glyphicon glyphicon-cog"></i>
                        档案管理
                        <span name="record_recheck_count" class="label label-warning pull-right" > </span>
                        <span class="pull-right glyphicon glyphicon-chevron-down" style='margin-right: 5px;'></span>
                    </a>
                    <ul id="danganSetting" class="nav nav-list collapse secondmenu" style="height: 0px;">

                        <li onclick="$('#iframe').attr('src','/options/record_register')">
                            <a href="javascript:void(0)"><i class="glyphicon glyphicon-th-list"></i>档案登记</a>
                        </li>
                        <li onclick="$('#iframe').attr('src','/staffs/recheck/list')">
                            <a href="javascript:void(0)"><i class="glyphicon glyphicon-asterisk"></i>档案复核
                                <span name="record_recheck_count" class="label label-warning pull-right" style="margin-left: 3px"> </span>
                            </a>
                        </li>
                        <li onclick="$('#iframe').attr('src','/staffs/querypage/record_query')">
                            <a href="javascript:void(0)"><i class="glyphicon glyphicon-edit"></i>档案查询</a>
                        </li>
                        <li onclick="$('#iframe').attr('src','/staffs/querypage/record_update')">
                            <a href="javascript:void(0)"><i class="glyphicon glyphicon-eye-open"></i>档案变更</a>
                        </li>
                        <li onclick="$('#iframe').attr('src','/staffs/querypage/record_delete')">
                            <a href="javascript:void(0)"><i class="glyphicon glyphicon-eye-open"></i>档案删除</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#xinchouSetting1" class="nav-header collapsed" data-toggle="collapse">
                        <i class="glyphicon glyphicon-cog"></i>
                        薪酬标准管理
                        <span name="salary_recheck_count" class="label label-warning pull-right"> </span>
                        <span class="pull-right glyphicon glyphicon-chevron-down" style='margin-right: 5px;'></span>
                    </a>
                    <ul id="xinchouSetting1" class="nav nav-list collapse secondmenu" style="height: 0px;">
                        <li onclick="$('#iframe').attr('src','/salary/standard/register/salary_register')">
                            <a href="javascript:void(0)"><i class="glyphicon glyphicon-th-list"></i>薪酬标准登记</a>
                        </li>
                        <li onclick="$('#iframe').attr('src','/salary/standard/recheck/list')">
                            <a href="javascript:void(0)"><i class="glyphicon glyphicon-asterisk"></i>薪酬标准复核
                                <span name="salary_recheck_count" class="label label-warning pull-right" style="margin-left: 3px"> </span>
                            </a>
                        </li>
                        <li onclick="$('#iframe').attr('src','/salary/standard/querypage/salary_query')">
                            <a href="javascript:void(0)"><i class="glyphicon glyphicon-edit"></i>薪酬标准查询</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#xinchouSetting" class="nav-header collapsed" data-toggle="collapse">
                        <i class="glyphicon glyphicon-cog"></i>
                        薪酬发放
                        <span name="payment_recheck_count" class="label label-warning pull-right"> </span>
                        <span class="pull-right glyphicon glyphicon-chevron-down" style='margin-right: 5px;'></span>
                    </a>
                    <ul id="xinchouSetting" class="nav nav-list collapse secondmenu" style="height: 0px;">
                        <li onclick="$('#iframe').attr('src','/salary/payment/register/list')">
                            <a href="javascript:void(0)"><i class="glyphicon glyphicon-th-list"></i>薪酬发放登记</a>
                        </li>
                        <li onclick="$('#iframe').attr('src','/salary/payment/recheck/list')">
                            <a href="javascript:void(0)"><i class="glyphicon glyphicon-asterisk"></i>薪酬发放复核
                                <span name="payment_recheck_count"  class="label label-warning pull-right" style="margin-left: 3px"> </span>
                            </a>
                        </li>
                        <li onclick="$('#iframe').attr('src','/salary/payment/querypage/salary_payment_query')">
                            <a href="javascript:void(0)"><i class="glyphicon glyphicon-edit"></i>档案查询</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#">
                        <i class="glyphicon glyphicon-fire"></i>
                        关于系统
                    </a>
                </li>
            </ul>
        </div>
        <iframe id="iframe" src="" style="background-color: #f0f0f6;width: 1270px;min-height: 690px" frameborder="0"></iframe>
    </div>
</div>
</body>

<script>
    $(function () {
        //ajax获取未审核数量
        $.ajax({
            type: "GET",
            contentType: "application/x-www-form-urlencoded",
            url: "${pageContext.request.contextPath}/count",
            data: $("#registerForm").serialize(),
            dataType: "json",
            success: function(data){
                $("span[name='record_recheck_count']").html(data.staffs==0?"":data.staffs);
                $("span[name='salary_recheck_count']").html(data.salaryStandard==0?"":data.salaryStandard);
                $("span[name='payment_recheck_count']").html(data.recheckPaymentCount==0?"":data.recheckPaymentCount);
            }
        });
    });
</script>

</html>