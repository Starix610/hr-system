<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>

    <meta name="viewport" content="width=device-width, initial-scale=1" charset="UTF-8">
    <title>Toggle Owl carousel between tabs</title>

    <link href="http://cdn.bootcss.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/houtai.css" rel="stylesheet"></link>
    <script src="http://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.bootcss.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

</head>
<body>
<div class="col-md-10">

    <div>
        <h3>档案复核</h3>
    </div>
    <div class="demo-content" style="padding-top: 15px">
        <div class="row">
            <div class="span12 offset3 doc-content">
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th>档案编号</th>
                        <th>姓名</th>
                        <th>性别</th>
                        <th>一级机构</th>
                        <th>二级机构</th>
                        <th>三级机构</th>
                        <th>职位名称</th>
                        <th>复核</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${recheckList}" var="record">
                        <tr class="active">
                            <td>${record.recordId}</td>
                            <td>${record.staffName}</td>
                            <td>${record.sex}</td>
                            <td>${record.organization1Name}</td>
                            <td>${record.organization2Name}</td>
                            <td>${record.organization3Name}</td>
                            <td>${record.positionName}</td>
                            <td><a href="${pageContext.request.contextPath}/staffs/${record.recordId}?page=record_recheck_detail" class="btn btn-info">复核</a></td>
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
</html>