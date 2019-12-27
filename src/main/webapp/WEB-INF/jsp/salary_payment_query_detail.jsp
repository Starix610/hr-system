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
        th{
            width: 120px;
        }
    </style>
</head>
<body>
<div style="width: auto;">
    <div>
        <h3>薪酬发放明细</h3>
    </div>
    <ul>
        <li class="flex_li">
            <span class="form_text" style="width: 140px;">薪酬发放单编号：</span>
            <div>${detailMap.get("paymentQueryResult").salaryPaymentId}</div>
        </li>
        <li class="flex_li">
            <span class="form_text" style="width: 140px;">机构：</span>
            <div>
                <c:forEach items="${detailMap.get('paymentQueryResult').organizations}" var="org">
                    ${org.value}&nbsp;&nbsp;
                </c:forEach>
            </div>
        </li>
        <li class="flex_li">
            <span class="form_text" style="width: 140px;">总人数：</span>
            <div>${detailMap.get("paymentQueryResult").numberOfStaff}</div>
        </li>
        <li class="flex_li">
            <span class="form_text" style="width: 140px;">基本薪资总额：</span>
            <div id="baseTotal">${detailMap.get("paymentQueryResult").totalBaseSalary}</div>
        </li>
        <li class="flex_li">
            <span class="form_text" style="width: 140px;">实发总额：</span>
            <div id="realPay">${detailMap.get("paymentQueryResult").realPay}</div>
        </li>
        <li class="flex_li">
            <span class="form_text" style="width: 140px;">登记人：</span>
            <div>${detailMap.get("paymentQueryResult").registrant}</div>
        </li>
        <li class="flex_li">
            <span class="form_text" style="width: 140px;">复核人：</span>
            <div>${detailMap.get("paymentQueryResult").recheckName}</div>
        </li>
        <li class="flex_li">
            <span class="form_text" style="width: 140px;">登记时间：</span>
            <div><fmt:formatDate value="${detailMap.get('paymentQueryResult').registerTime}" pattern="yyyy-MM-dd HH:mm:ss"/></div>
        </li>
        <li class="flex_li">
            <span class="form_text" style="width: 140px;">复核时间：</span>
            <div><fmt:formatDate value="${detailMap.get('paymentQueryResult').recheckTime}" pattern="yyyy-MM-dd HH:mm:ss"/></div>
        </li>
    </ul>

    <div class="col-md-10" style="padding-top: 30px;height: auto;width: 90%;">
        <div class="">
            <div class="row">
                <div class="span12 offset3 doc-content">
                    <table  class="table table-hover">
                        <thead>
                        <tr>
                            <th>档案编号</th>
                            <th>姓名</th>
                            <th>基本工资</th>
                            <th>交通补助</th>
                            <th>午餐补助</th>
                            <th>通信补助</th>
                            <th>养老保险</th>
                            <th>失业保险</th>
                            <th>医疗保险</th>
                            <th>住房公积金</th>
                            <th>奖励奖金</th>
                            <th>应扣奖金</th>
                        </tr>
                        </thead>
                        <tbody id="tbodyId">
                        <c:forEach items="${detailMap.detailList}" var="detail">
                            <tr class="active">
                                <td>${detail.recordId}</td>
                                <td>${detail.staffName}</td>
                                <td>${detail.baseSalary}</td>
                                <td>${detail.travelAllowance==null?"0":detail.travelAllowance}</td>
                                <td>${detail.lunchAllowance==null?"0":detail.lunchAllowance}</td>
                                <td>${detail.communicationAllowance==null?"0":detail.communicationAllowance}</td>
                                <td>${detail.endowmentInsurance}</td>
                                <td>${detail.unemploymentInsurance}</td>
                                <td>${detail.medicalInsurance}</td>
                                <td>${detail.housingFund}</td>
                                <td>${detail.bonus==null?"0":detail.bonus}</td>
                                <td>${detail.deductionBonus==null?"0":detail.deductionBonus}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
