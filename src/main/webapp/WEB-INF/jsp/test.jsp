<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Test</title>
    <script src="/js/jquery-1.11.3.min.js" type="text/javascript"></script>

    <script>
        $(function () {
            showII();  //页面加载后执行一下函数，以获取级联的下拉框数据
            showPosition();
        });
        function showII() {
            var options = "";
            $("#org_II").empty();  //先清空原来II及机构的下拉列表再更新
            var currentId = $("#org_I").val();
            $.post(
                "${pageContext.request.contextPath}/staffs/options/organization/"+currentId,    //url
                function (data) {    //请求成功回调
                    for (var i = 0;i<data.length;i++){
                       options +="<option value="+data[i].organizationId+">"+data[i].organizationName+"</option>";
                    }
                    $("#org_II").append(options);
                    showIII();  //第三级机构联动
                },
                "json"     //返回的数据格式
            );
        }
        function showIII() {
            var options = "";
            $("#org_III").empty();  //先清空原来III及机构的下拉列表再更新
            var currentId = $("#org_II").val();
            $.post(
                "${pageContext.request.contextPath}/staffs/options/organization/"+currentId,    //url
                function (data) {    //请求成功回调
                    for (var i = 0;i<data.length;i++){
                        options +="<option value="+data[i].organizationId+">"+data[i].organizationName+"</option>";
                    }
                    $("#org_III").append(options);
                },
                "json"     //返回的数据格式
            );
        }
        function showPosition() {
            var options = "";
            $("#position").empty();  //先清空原来II及机构的下拉列表再更新
            var cid = $("#positionCategory").val();
            $.post(
                "${pageContext.request.contextPath}/staffs/options/position/"+cid,    //url
                function (data) {    //请求成功回调
                    for (var i = 0;i<data.length;i++){
                        options +="<option value="+data[i].positionId+">"+data[i].positionName+"</option>";
                    }
                    $("#position").append(options);
                },
                "json"     //返回的数据格式
            );
        }
    </script>

</head>
<body>
<form action="/staffs">
    <div>
        国籍
        <select>
            <c:forEach items="${comboBox.nationalityList}" var="nationality">
                <option value="${nationality.nationalityId}">${nationality.nationalityName}</option>
            </c:forEach>
        </select>
        民族
        <select>
            <c:forEach items="${comboBox.nationList}" var="nation">
                <option value="${nation.nationalId}">${nation.nationalName}</option>
            </c:forEach>
        </select>
        专业
        <select>
            <c:forEach items="${comboBox.majorList}" var="major">
                <option value="${major.majorId}">${major.majorName}</option>
            </c:forEach>
        </select>
    </div>
    <div>
        Ⅰ级机构
        <select id="org_I" onchange="showII()">
            <c:forEach items="${comboBox.organizationList}" var="organization">
                <option value="${organization.organizationId}">${organization.organizationName}</option>
            </c:forEach>
        </select>
        Ⅱ级机构
        <select id="org_II" onchange="showIII()">
            <%--<option value=""></option>--%>
        </select>
        Ⅲ级机构
        <select id="org_III">
            <%--<option value=""></option>--%>
        </select>
    </div>
    <div>
        职位分类
        <select id="positionCategory" onchange="showPosition()">
            <c:forEach items="${comboBox.positionCategoryList}" var="positionCategory">
                <option value="${positionCategory.positionCategoryId}">${positionCategory.positionCategoryName}</option>
            </c:forEach>
        </select>
        职位名称
        <select id="position">
            <%--<option value=""></option>--%>
        </select>
    </div>
</form>

</body>
</html>
