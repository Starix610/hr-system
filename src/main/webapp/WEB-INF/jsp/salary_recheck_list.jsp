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

</head>
<body>
<div class="col-md-10">

    <div>
        <h3>薪酬标准复核</h3>
    </div>
    <div class="demo-content" style="padding-top: 15px">
        <div class="row">
            <div class="span12 offset3 doc-content">
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th>薪酬标准编号</th>
                        <th>薪酬标准姓名</th>
                        <th>制定人</th>
                        <th>登记人</th>
                        <th>薪酬总额</th>
                        <th>登记时间</th>
                        <th>复核</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${SalaryStandardList}" var="salaryStandarad">
                        <tr class="active">
                            <td>${salaryStandarad.salaryStandardId}</td>
                            <td>${salaryStandarad.salaryStandardName}</td>
                            <td>${salaryStandarad.creator}</td>
                            <td>${salaryStandarad.registrant}</td>
                            <td>${salaryStandarad.totalSalary}</td>
                            <td><fmt:formatDate value='${salaryStandarad.registerTime}' pattern='yyyy-MM-dd HH:mm:ss'/></td>
                            <td><a href="${pageContext.request.contextPath}/salary/standard/${salaryStandarad.salaryStandardId}?page=salary_recheck_detail" class="btn btn-info">复核</a></td>
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