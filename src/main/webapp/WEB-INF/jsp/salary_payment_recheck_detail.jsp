<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
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
        <h3>薪酬发放复核明细</h3>
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
            <span class="form_text" style="width: 140px;">复核人：</span>
            <div><security:authentication property="principal.username"></security:authentication></div>
        </li>

        <li class="flex_li">
            <div style="position: absolute;top: 42%;left: 79%;">
                <input id="submit1" type="button" value="复核通过" class="btn btn-success">
            </div>
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
                                <td>${detail.travelAllowance}</td>
                                <td>${detail.lunchAllowance}</td>
                                <td>${detail.communicationAllowance}</td>
                                <td>${detail.endowmentInsurance}</td>
                                <td>${detail.unemploymentInsurance}</td>
                                <td>${detail.medicalInsurance}</td>
                                <td>${detail.housingFund}</td>
                                <td><input type="text" onkeyup="calculateTotal()" class="form-control" value="${detail.bonus}"
                                           style="width: 100px;" name="inputNumAdd" id="${detail.recordId}Add"></td>
                                <td><input type="text" onkeyup="calculateTotal()" class="form-control" value="${detail.deductionBonus}"
                                           style="width: 100px;" name="inputNumSub" id="${detail.recordId}Sub"></td>
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

<script>
    $(function () {
        $("#submit1").click(function () {

            //分别获取三级机构id
            var array = new Array();
            <c:forEach items="${detailMap.get('paymentQueryResult').organizations}" var="org" varStatus="vs">
                array[${vs.index}]="${org.key}";
            </c:forEach>

            //json数据
            var jsonData = {
                "salaryPayment":{
                    "salaryPaymentId":"${detailMap.get("paymentQueryResult").salaryPaymentId}",
                    "organization1Id":array[0],
                    "organization2Id":array[1],
                    "organization3Id":array[2],
                    "numberOfStaff":${detailMap.get("paymentQueryResult").numberOfStaff},
                    "totalBaseSalary":${detailMap.get("paymentQueryResult").totalBaseSalary},
                    "recheckName":"<security:authentication property='principal.username'></security:authentication>",
                    "realPay":$("#realPay").html()
                },
                "salaryPaymentDetailList":[
                    <c:forEach items="${detailMap.detailList}" var="detail">
                    {
                    "salaryPaymentDetailId":"${detail.salaryPaymentDetailId}",
                    "recordId":"${detail.recordId}",
                    "staffName":"${detail.staffName}",
                    "baseSalary":${detail.baseSalary},
                    "travelAllowance":${detail.travelAllowance},
                    "lunchAllowance":${detail.lunchAllowance},
                    "communicationAllowance":${detail.communicationAllowance},
                    "endowmentInsurance":${detail.endowmentInsurance},
                    "unemploymentInsurance":${detail.unemploymentInsurance},
                    "medicalInsurance":${detail.medicalInsurance},
                    "housingFund":${detail.housingFund},
                    "bonus":$("#${detail.recordId}Add").val(),
                    "deductionBonus":$("#${detail.recordId}Sub").val(),
                    "salaryPaymentId":"${detailMap.get("paymentQueryResult").salaryPaymentId}"
                    },
                    </c:forEach>
                ]
            }
            // console.log(JSON.stringify(jsonData))
            $.ajax({
                type: "POST",
                contentType: "application/json;charset=UTF-8",
                url: "${pageContext.request.contextPath}/salary/payment/recheck",
                data: JSON.stringify(jsonData),
                dataType: "json",
                success: function(data){
                    var message = "薪酬发放单复核成功！";
                    var back = "${pageContext.request.contextPath}/salary/payment/recheck/list";//信息提示页面的返回url
                    window.location.href="${pageContext.request.contextPath}/info/success?message="+message+"&back="+back;
                    $("span[name='payment_recheck_count']",window.parent.document).html(data.count==0?"":data.count);
                },
                error: function (data) {
                    var message = "薪酬发放单复核失败，请稍后重试！";
                    var back = "${pageContext.request.contextPath}/salary/payment/recheck/list";
                    window.location.href="${pageContext.request.contextPath}/info/fail?message="+message+"&back="+back;
                }
            });
        });
    })



    //动态计算实际发放总额
    function calculateTotal() {
        // var rowsCount = $("#tbodyId").find("tr").length;
        var addTotal = 0;
        $("input[name='inputNumAdd']").each(function(j,item){
            var value = item.value;
            value = value==""?"0":value;
            if (!isNaN(value)){
                addTotal += parseFloat(value);
            }else {
                addTotal=NaN;
                return false;
            }
        });
        var subTotal = 0;
        $("input[name='inputNumSub']").each(function(j,item){
            var value = item.value;
            value = value==""?"0":value;
            if (!isNaN(value)){
                subTotal += parseFloat(value);
            }else {
                subTotal=NaN;
                return false;
            }
        });
        // alert(addTotal-subTotal);
        var baseTotal = parseFloat($("#baseTotal").html());
        var realPay = (baseTotal+addTotal-subTotal).toFixed(2); //银行家舍入保留两位小数
        $("#realPay").html(realPay);

    }
</script>
</html>
