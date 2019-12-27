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
        .form-control{
            width: 150px;
        }
        .submitBtn{
            position: absolute;
            top: 11%;
            left: 71.7%;
        }
    </style>
</head>
<body>
<div style="width: auto;">
    <div>
        <h3>薪酬标准复核</h3>
    </div>
    <form class="form-panel" id="registerForm" action="javascript:void(0)">
        <ul class="flex_ul" >
            <li class="flex_li">
                <span class="form_text">薪酬标准编号</span>
                <input disabled="true" class="form-control" value="${salaryStandard.salaryStandardId}" type="text" name="salaryStandardId">
            </li>
            <li class="flex_li">
                <span class="form_text">薪酬标准名称</span>
                <input class="form-control"value="${salaryStandard.salaryStandardName}" type="text" name="salaryStandardName">
            </li>
            <li class="flex_li">
                <span class="form_text">薪酬总额</span>
                <input disabled="true" class="form-control" value="${salaryStandard.totalSalary}" type="text" name="totalSalary">
            </li>
            <li class="flex_li">
                <span class="form_text">制定人</span>
                <input class="form-control" value="${salaryStandard.creator}" type="text" name="creator">
            </li>
            <li class="flex_li">
                <span class="form_text">登记人</span>
                <input class="form-control" value="${salaryStandard.registrant}" type="text" name="registrant">
            </li>
            <li class="flex_li">
                <span class="form_text">登记时间</span>
                <input type="text" disabled="true" class="form-control"
                       value="<fmt:formatDate value='${salaryStandard.registerTime}' pattern='yyyy-MM-dd HH:mm:ss'/>" name="registerTime" >
            </li>
            <li class="flex_li">
                <div class="submitBtn">
                    <input type="submit" value="复核通过" class="btn btn-success">
                </div>
            </li>
            <li class="flex_li">
                <div class="form_text">复核意见</div>
                <div>
                    <textarea class="form-control" style="width: 690px;height: 100px" name="auditOpinion"></textarea>
                </div>
            </li>
        </ul>

        <div class="col-md-10">
            <div class="">
                <div class="row">
                    <div class="span12 offset3 doc-content">
                        <table class="table table-hover table-bordered">
                            <thead>
                            <tr>
                                <th>序号</th>
                                <th>项目名称</th>
                                <th>金额</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr class="active">
                                <td>1</td>
                                <td>基本工资</td>
                                <td><input onkeyup="calculateInsurance(this)" class="form-control" value="${salaryStandard.baseSalary}" type="text" name="baseSalary"></td>
                            </tr>
                            <tr class="active">
                                <td>2</td>
                                <td>交通补助</td>
                                <td><input onkeyup="calculateTotal(this)" class="form-control" value="${salaryStandard.travelAllowance}" type="text" name="travelAllowance"></td>
                            </tr>
                            <tr class="active">
                                <td>3</td>
                                <td>午餐补助</td>
                                <td><input onkeyup="calculateTotal(this)" class="form-control" value="${salaryStandard.lunchAllowance}" type="text" name="lunchAllowance"></td>
                            </tr>
                            <tr class="active">
                                <td>4</td>
                                <td>通信补助</td>
                                <td><input onkeyup="calculateTotal(this)" class="form-control" value="${salaryStandard.communicationAllowance}" type="text" name="communicationAllowance"></td>
                            </tr>
                            <tr class="active">
                                <td>5</td>
                                <td>养老保险</td>
                                <td><input class="form-control" disabled="true" value="${salaryStandard.endowmentInsurance}" type="text" name="endowmentInsurance" value="0.00"></td>
                            </tr>
                            <tr class="active">
                                <td>6</td>
                                <td>失业保险</td>
                                <td><input class="form-control" disabled="true" value="${salaryStandard.unemploymentInsurance}" type="text" name="unemploymentInsurance" value="0.00"></td>
                            </tr>
                            <tr class="active">
                                <td>7</td>
                                <td>医疗保险</td>
                                <td><input class="form-control" disabled="true" value="${salaryStandard.medicalInsurance}" type="text" name="medicalInsurance" value="0.00"></td>
                            </tr>
                            <tr class="active">
                                <td>8</td>
                                <td>住房公积金</td>
                                <td><input class="form-control" disabled="true" value="${salaryStandard.housingFund}" type="text" name="housingFund" value="0.00"></td>
                            </tr>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
</body>
<script>
    $(function () {
        $("#registerForm").submit(function () {
            $("input[name='salaryStandardId']").removeAttr("disabled");
            $("input[name='totalSalary']").removeAttr("disabled");
            $("input[name='registerTime']").removeAttr("disabled");
            $("input[name='endowmentInsurance']").removeAttr("disabled");
            $("input[name='unemploymentInsurance']").removeAttr("disabled");
            $("input[name='medicalInsurance']").removeAttr("disabled");
            $("input[name='housingFund']").removeAttr("disabled");
            $.ajax({
                type: "POST",
                contentType: "application/x-www-form-urlencoded",
                url: "${pageContext.request.contextPath}/salary/standard/recheck",
                data: $("#registerForm").serialize(),
                dataType: "json",
                success: function(data){
                    var message = "薪酬标准复核成功！";
                    var back = "${pageContext.request.contextPath}/salary/standard/recheck/list";//信息提示页面的返回url
                    window.location.href="${pageContext.request.contextPath}/info/success?message="+message+"&back="+back;
                    $("span[name='salary_recheck_count']",window.parent.document).html(data.count==0?"":data.count);
                },
                error: function (data) {
                    var message = "薪酬标准复核失败，请稍后重试！";
                    var back = "${pageContext.request.contextPath}/salary/standard/recheck/list";
                    window.location.href="${pageContext.request.contextPath}/info/fail?message="+message+"&back="+back;
                }
            });

            $("input[name='salaryStandardId']").attr("disabled",true);
            $("input[name='totalSalary']").attr("disabled",true);
            $("input[name='registerTime']").attr("disabled",true);
            $("input[name='endowmentInsurance']").attr("disabled",true);
            $("input[name='unemploymentInsurance']").attr("disabled",true);
            $("input[name='medicalInsurance']").attr("disabled",true);
            $("input[name='housingFund']").attr("disabled",true);
        });
    })

    //计算三险一金
    function calculateInsurance(obj){
        var num = obj.value;
        // alert(isNaN(num));
        if (!isNaN(num) && num!=""){
            $("input[name='endowmentInsurance']").val((num*0.08).toFixed(2));  //保留两位小数,toFixed 银行家舍入法？
            $("input[name='unemploymentInsurance']").val((num*0.005).toFixed(2));
            $("input[name='medicalInsurance']").val((num*0.02+3).toFixed(2));
            $("input[name='housingFund']").val((num*0.08).toFixed(2));
        }else {
            $("input[name='totalSalary']").val("0.00");
            $("input[name='endowmentInsurance']").val("0.00");
            $("input[name='unemploymentInsurance']").val("0.00");
            $("input[name='medicalInsurance']").val("0.00");
            $("input[name='housingFund']").val("0.00");
        }
        calculateTotal();  //计算总额
    }

    //计算薪酬总额
    function calculateTotal() {

        var totalObj =$("input[name='totalSalary']");
        var baseObj = $("input[name='baseSalary']");
        var travelObj = $("input[name='travelAllowance']");
        var lunchObj = $("input[name='lunchAllowance']");
        var communicationObj = $("input[name='communicationAllowance']");
        var endowmentObj = $("input[name='endowmentInsurance']");
        var unemploymentObj = $("input[name='unemploymentInsurance']");
        var medicalObj = $("input[name='medicalInsurance']");
        var housingObj = $("input[name='housingFund']");

        var totalNum =totalObj.val();
        var baseNum = baseObj.val()==""?"0":baseObj.val();
        var travelNum = travelObj.val()==""?"0":travelObj.val();
        var lunchNum = lunchObj.val()==""?"0":lunchObj.val();
        var communicationNum = communicationObj.val()==""?"0":communicationObj.val();
        var endowmentNum = endowmentObj.val();
        var unemploymentNum = unemploymentObj.val();
        var medicalNum = medicalObj.val();
        var housingNum = housingObj.val();

        if (!isNaN(baseNum) && !isNaN(travelNum) && !isNaN(lunchNum) && !isNaN(communicationNum)){
            totalNum = (parseFloat(baseNum) + parseFloat(travelNum) + parseFloat(lunchNum) + parseFloat(communicationNum) -
                parseFloat(endowmentNum) - parseFloat(unemploymentNum) - parseFloat(medicalNum) - parseFloat(housingNum)).toFixed(2);
            // alert(totalNum);
            totalObj.val(totalNum);
        }else {
            // alert(totalObj.val());
            totalObj.val("0.00");
        }

    }
</script>
</html>
