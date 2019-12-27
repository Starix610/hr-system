<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" charset="UTF-8">
    <title>人力资源管理系统</title>

    <link href="http://cdn.bootcss.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
    <%--<link href="http://g.alicdn.com/bui/bui/1.1.21/css/bs3/dpl.css" rel="stylesheet">--%>
    <link href="/css/houtai.css" rel="stylesheet">
    <script src="http://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.bootcss.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script src="/js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="/js/main.js" type="text/javascript"></script>
    <style>

    </style>
</head>
<body>
<div style="width: auto;">
    <div>
        <h3>薪酬发放查询</h3>
    </div>
    <form class="form-panel" id="queryForm" action="javascript:void(0)">
        <ul class="flex_ul" >
            <li class="flex_li">
                <span class="form_text" style="width: 140px;">请输入薪酬发放单号</span>
                <input type="text" class="form-control" name="salaryPaymentId">
            </li>
            <li class="flex_li">
                <span class="form_text" style="width: 140px;">请输入关键字</span>
                <input type="text" class="form-control" name="keyword">
            </li>
            <li class="flex_li">
                <span class="form_text" style="width: 140px;">请输入发放时间</span>
                <input type="date" class="form-control" name="startTime" style="width: 166px;">
                &nbsp;&nbsp;至&nbsp;&nbsp;
                <input type="date" class="form-control"  name="endTime" style="width: 166px;">
                （YYYY-MM-DD）
            </li>
            <li class="flex_li">
                <div style="margin-left: 50px;">
                    <input type="submit" value="查询" class="btn btn-primary">
                </div>
            </li>
        </ul>
    </form>
    <hr style="height: 5px" >
    <br>
    <div id="total"></div>
    <div class="col-md-10" style="padding-top: 30px;height: auto">
        <div class="">
            <div class="row">
                <div class="span12 offset3 doc-content">
                    <table  class="table table-hover">
                        <thead>
                        <tr>
                            <th>薪酬发放单编号</th>
                            <th>一级机构</th>
                            <th>二级机构</th>
                            <th>三级机构</th>
                            <th>人数</th>
                            <th>登记人</th>
                            <th>复核人</th>
                            <th>时间</th>
                            <th>基本薪酬总额</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                            <tr class="active">
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    $(function () {
        $("#queryForm").submit(function () {
            $.ajax({
                type: "POST",
                contentType: "application/x-www-form-urlencoded",
                url: "${pageContext.request.contextPath}/salary/payment",
                data: $("#queryForm").serialize(),
                dataType: "json",
                success: function(data){
                    $("tbody").empty();
                    $("#total").html("&nbsp;&nbsp;符合条件的薪酬发放单总数：<span style='color: red'>"+data.length+"</span>例");
                    for (var i = 0;i<data.length;i++){
                        var salaryPaymentId = data[i].salaryPaymentId;
                        $("tbody").append("<tr id="+salaryPaymentId+" class='active'></tr>");
                        $("#"+salaryPaymentId).append("<td>"+data[i].salaryPaymentId+"</td>");
                        for(var key in data[i].organizations){
                            // console.log("键："+key+"，值："+data[i].organizations[key]);
                            $("#"+salaryPaymentId).append("<td>"+data[i].organizations[key]+"</td>");
                        }
                        $("#"+salaryPaymentId).append("<td>"+data[i].numberOfStaff+"</td>");
                        $("#"+salaryPaymentId).append("<td>"+data[i].registrant+"</td>");
                        $("#"+salaryPaymentId).append("<td>"+data[i].recheckName+"</td>");
                        $("#"+salaryPaymentId).append("<td>"+data[i].recheckTime+"</td>");
                        $("#"+salaryPaymentId).append("<td>"+data[i].totalBaseSalary.toFixed(2)+"</td>");
                        $("#"+salaryPaymentId).append("<td><a href='${pageContext.request.contextPath}/salary/payment/detail/"+data[i].salaryPaymentId+"?page=salary_payment_query_detail' class='btn btn-info'>查看明细</a></td>");

                    }
                }
            });
        });

    })
</script>
</html>
