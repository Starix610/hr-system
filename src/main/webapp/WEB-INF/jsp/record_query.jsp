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
</head>
<body>
<div style="width: auto;">
    <div>
        <h3>档案查询</h3>
    </div>
    <form class="form-panel" id="queryForm" action="javascript:void(0)">
        <ul class="flex_ul" >
            <li class="flex_li">
                <span class="form_text">Ⅰ级机构</span>
                <select class="form-control" id="org_I" name="organization1Id" onchange="showII()">
                    <c:forEach items="${comboBox.organizationList}" var="organization">
                        <option value="${organization.organizationId}">${organization.organizationName}</option>
                    </c:forEach>
                </select>
            </li>
            <li class="flex_li">
                <span class="form_text">Ⅱ级机构</span>
                <select class="form-control" id="org_II" name="organization2Id" onchange="showIII()">
                    <%--<option value=""></option>--%>
                </select>
            </li>
            <li class="flex_li">
                <span class="form_text">Ⅲ级机构</span>
                <select class="form-control" id="org_III" name="organization3Id">
                    <%--<option value=""></option>--%>
                </select>
            </li>
            <li class="flex_li">
                <span class="form_text">职位分类</span>
                <select class="form-control" id="positionCategory" onchange="showPosition()" name="positionCategoryId">
                    <c:forEach items="${comboBox.positionCategoryList}" var="positionCategory">
                        <option value="${positionCategory.positionCategoryId}">${positionCategory.positionCategoryName}</option>
                    </c:forEach>
                </select>
            </li>
            <li class="flex_li">
                <span class="form_text">职位名称</span>
                <select class="form-control" id="position" name="positionId">
                    <%--<option value=""></option>--%>
                </select>
            </li>
            <li class="flex_li">
                <span class="form_text">建档时间</span>
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
                    <table style="display: none" class="table table-hover">
                        <thead>
                        <tr>
                            <th>档案编号</th>
                            <th>姓名</th>
                            <th>性别</th>
                            <th>一级机构</th>
                            <th>二级机构</th>
                            <th>三级机构</th>
                            <th>职位名称</th>
                            <th>查询</th>
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
                            <%--<td><a href="${pageContext.request.contextPath}/staffs/recheck/${record.recordId}" class="btn btn-info">查看明细</a></td>--%>
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
        showII();  //页面加载后执行该函数，以获取级联的下拉框数据
        showPosition();
        $("#queryForm").submit(function () {
            $.ajax({
                type: "GET",
                contentType: "application/x-www-form-urlencoded",
                url: "${pageContext.request.contextPath}/staffs",
                data: $("#queryForm").serialize(),
                dataType: "json",
                success: function(data){
                    if (data.length>0){
                        $("table").show();
                    }
                    $("tbody").empty();
                    $("#total").html("&nbsp;&nbsp;符合条件的人力资源档案总数：<span style='color: red'>"+data.length+"</span>例");
                    for (var i = 0;i<data.length;i++){
                        var recordId = data[i].recordId;
                        $("tbody").append("<tr id="+recordId+" class='active'></tr>");
                        $("#"+recordId).append("<td>"+data[i].recordId+"</td>");
                        $("#"+recordId).append("<td>"+data[i].staffName+"</td>");
                        $("#"+recordId).append("<td>"+data[i].sex+"</td>");
                        $("#"+recordId).append("<td>"+data[i].organization1Name+"</td>");
                        $("#"+recordId).append("<td>"+data[i].organization2Name+"</td>");
                        $("#"+recordId).append("<td>"+data[i].organization3Name+"</td>");
                        $("#"+recordId).append("<td>"+data[i].positionName+"</td>");
                        $("#"+recordId).append("<td><a href='${pageContext.request.contextPath}/staffs/"+recordId+"?page=record_query_detail' class='btn btn-info'>查看明细</a></td>");
                    }
                }
            });
        });

    })
</script>
</html>
