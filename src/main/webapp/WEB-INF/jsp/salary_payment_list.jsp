<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html lang="en">
<head>

    <meta name="viewport" content="width=device-width, initial-scale=1" charset="UTF-8">
    <title>Toggle Owl carousel between tabs</title>

    <link href="http://cdn.bootcss.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/houtai.css" rel="stylesheet"></link>
    <script src="http://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.bootcss.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script src="/js/jquery-1.11.3.min.js" type="text/javascript"></script>

</head>
<body>
<div class="col-md-10">

    <div>
        <h3>薪酬发放登记</h3>
    </div>
    <div class="demo-content" style="padding-top: 15px">
        <div class="row">
            <div class="span12 offset3 doc-content">
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th>薪酬发放单编号</th>
                        <th>一级机构</th>
                        <th>二级机构</th>
                        <th>三级机构</th>
                        <th>人数</th>
                        <th>基本薪酬总额</th>
                        <th>登记</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${salaryPaymentList}" var="salaryPayment">
                        <tr class="active">
                            <td>自动生成</td>
                            <%--遍历获得Map中的三级机构--%>
                            <c:forEach items="${salaryPayment.organizations}" var="org">
                                <td id="${org.key}">${org.value}</td>
                            </c:forEach>
                            <td>${salaryPayment.numberOfStaff}</td>
                            <td>${salaryPayment.totalBaseSalary}</td>
                            <td><a onclick="getDetail($(this))" href="javascript:void(0)" class="btn btn-info">登记</a></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- script endTime -->
    </div>

</div>
</body>
<script>
    function getDetail(obj) {
        //获取传递的参数(三级机构的id),通过三级机构id查找到发放单
        var orgId1 = obj.parent().parent().find("td:eq(1)").attr("id");
        var orgId2 = obj.parent().parent().find("td:eq(2)").attr("id");
        var orgId3 = obj.parent().parent().find("td:eq(3)").attr("id");
        var param = "?orgId1="+orgId1+"&orgId2="+orgId2+"&orgId3="+orgId3;

        window.location.href="${pageContext.request.contextPath}/salary/payment/register/detail"+param;

        <%--$.ajax({--%>
            <%--type: "GET",--%>
            <%--contentType: "application/x-www-form-urlencoded",--%>
            <%--url: "${pageContext.request.contextPath}/salary/payment/register/detail",--%>
            <%--data: param,--%>
            <%--dataType: "json",--%>
            <%--success: function(data) {--%>
                <%----%>
            <%--}--%>
        <%--});--%>
    }
</script>
</html>