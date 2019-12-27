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
    <link href="http://g.alicdn.com/bui/bui/1.1.21/css/bs3/dpl.css" rel="stylesheet">
    <link href="/css/houtai.css" rel="stylesheet"></link>
    <script src="http://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.bootcss.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script src="/js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="/js/main.js" type="text/javascript"></script>

</head>
<body>
<div class="col-md-10 mian_cont" style="width: 100%">
    <form class="form-panel" id="updateForm" style="background-color: #f0f0f6" action="javascript:void(0)" >
        <div>
            <h1 style="margin-left: 30px;margin-top: 10px">档案变更</h1>
        </div>
        <div class="flex_li">
            <div class="form_text">档案编号</div>
            <div style="font-size: 13px">${staffRecord.recordId}</div>
        </div>
        <div class="flex_ul">
            <div class="flex_li">
                <div class="form_text">Ⅰ级机构</div>
                <div>
                    <select id="org_I" name="organization1Id" onchange="showII()" disabled="disabled">
                        <c:forEach items="${comboBox.organizationList}" var="organization">
                            <c:if test="${organization.organizationId==staffRecord.organization1Id}">
                                <option selected="selected" value="${organization.organizationId}">${organization.organizationName}</option>
                            </c:if>
                            <c:if test="${organization.organizationId!=staffRecord.organization1Id}">
                                <option value="${organization.organizationId}">${organization.organizationName}</option>
                            </c:if>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="flex_li">
                <div class="form_text">Ⅱ级机构</div>
                <div>
                    <select id="org_II" name="organization2Id" onchange="showIII()" disabled="disabled">
                        <%--<option value=""></option>--%>
                    </select>
                </div>
            </div>
            <div class="flex_li">
                <div class="form_text">Ⅲ级机构</div>
                <div>
                    <select id="org_III" name="organization3Id" disabled="disabled">
                        <%--<option value=""></option>--%>
                    </select>
                </div>
            </div>
            <br>
            <div class="flex_li">
                <div class="img_div">
                    <img src="${pageContext.request.contextPath}/${staffRecord.photoUrl}">
                </div>
                <div>
                    <%--用于代替文件上传按钮，可以修改样式--%>
                    <input type="button" value="选择图片" id="file-input" class="btn btn-primary" onclick="$('#picture').click()" style="top: 19%;">
                    <input type="text" style="display: none" name="photoUrl" value="${staffRecord.photoUrl}">
                    <input type="file" style="display: none" id="picture" name="pictureFile" style="display: none" >
                </div>
            </div>
            <div class="flex_li">
                <div class="form_text">职位分类</div>
                <div>
                    <select id="positionCategory" onchange="showPosition()" name="positionCategoryId" disabled="disabled">
                        <c:forEach items="${comboBox.positionCategoryList}" var="positionCategory">
                            <c:if test="${positionCategory.positionCategoryId!=staffRecord.positionCategoryId}">
                                <option value="${positionCategory.positionCategoryId}">${positionCategory.positionCategoryName}</option>
                            </c:if>
                            <c:if test="${positionCategory.positionCategoryId==staffRecord.positionCategoryId}">
                                <option selected="selected" value="${positionCategory.positionCategoryId}">${positionCategory.positionCategoryName}</option>
                            </c:if>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="flex_li">
                <div class="form_text">职位名称</div>
                <div>
                    <select id="position" name="positionId" disabled="disabled">
                        <%--<option value=""></option>--%>
                    </select>
                </div>
            </div>
            <div class="flex_li">
                <div class="form_text">职称</div>
                <div>
                    <input type="text" name="professionalTitle" id="professional_title" list="professional_titles" value="${staffRecord.professionalTitle}" />
                    <datalist id="professional_titles">
                        <c:forEach items="${comboBox.professionalTitleList}" var="professionalTitle">
                            <option value="${professionalTitle.professionalTitleName}">参考选项</option>
                        </c:forEach>
                    </datalist>
                </div>
            </div>
            <div class="flex_li">
                <div class="form_text">姓名</div>
                <div>
                    <input type="text" required="true" name="staffName" value="${staffRecord.staffName}">
                </div>
            </div>
            <div class="flex_li">
                <div class="form_text">性别</div>
                <select id="sex" name="sex">
                    <option value="男">男</option>
                    <option value="女">女</option>
                </select>
            </div>
            <div class="flex_li">
                <div class="form_text">Email</div>
                <div>
                    <input type="text" name="email" value="${staffRecord.email}">
                </div>
            </div>
            <div class="flex_li">
                <div class="form_text">电话</div>
                <div>
                    <input type="text" name="phone" value="${staffRecord.phone}">
                </div>
            </div>
            <div class="flex_li">
                <div class="form_text">QQ</div>
                <div>
                    <input type="text" name="qq" value="${staffRecord.qq}">
                </div>
            </div>
            <div class="flex_li">
                <div class="form_text">手机</div>
                <div>
                    <input type="text" name="mobilephone" value="${staffRecord.mobilephone}">
                </div>
            </div>
            <div class="flex_li">
                <div class="form_text">住址</div>
                <div>
                    <input type="text" name="address" style="width: 420px;" value="${staffRecord.address}">
                </div>
            </div>
            <div class="flex_li">
                <div class="form_text">邮编</div>
                <div>
                    <input type="text" name="zip" value="${staffRecord.zip}">
                </div>
            </div>
            <div class="flex_li">
                <div class="form_text">国籍</div>
                <div>
                    <select name="nationalityId">
                        <c:forEach items="${comboBox.nationalityList}" var="nationality">
                            <c:if test="${nationality.nationalityId==staffRecord.nationalityId}">
                                <option selected="selected" value="${nationality.nationalityId}">${nationality.nationalityName}</option>
                            </c:if>
                            <c:if test="${nationality.nationalityId!=staffRecord.nationalityId}">
                                <option value="${nationality.nationalityId}">${nationality.nationalityName}</option>
                            </c:if>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="flex_li">
                <div class="form_text">出生地</div>
                <div>
                    <input type="text" name="birthplace" value="${staffRecord.birthplace}">
                </div>
            </div>
            <div class="flex_li">
                <div class="form_text">生日</div>
                <div>
                    <input type="date" name="birthday" class="form-control"
                           value="<fmt:formatDate value='${staffRecord.birthday}' pattern='yyyy-MM-dd'/>">
                </div>
            </div>
            <div class="flex_li">
                <div class="form_text">民族</div>
                <div>
                    <select name="nationId">
                        <c:forEach items="${comboBox.nationList}" var="nation">
                            <c:if test="${nation.nationId==staffRecord.nationId}">
                                <option selected="selected" value="${nation.nationId}">${nation.nationName}</option>
                            </c:if>
                            <c:if test="${nation.nationId!=staffRecord.nationId}">
                                <option value="${nation.nationId}">${nation.nationName}</option>
                            </c:if>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="flex_li">
                <div class="form_text">宗教信仰</div>
                <div>
                    <select name="faith">
                        <option value="基督教">基督教</option>
                        <option value="伊斯兰教">伊斯兰教</option>
                        <option value="佛教">佛教</option>
                        <option value="其他" selected="selected">其他</option>
                    </select>
                </div>
            </div>
            <div class="flex_li">
                <div class="form_text">政治面貌</div>
                <div>
                    <select name="politicsStatus">
                        <option value="群众">群众</option>
                        <option value="中共党员">中共党员</option>
                        <option value="共青团员">共青团员</option>
                        <option value="群众">中共党员</option>
                        <option value="民主党派成员">民主党派成员</option>
                    </select>
                </div>
            </div>
            <div class="flex_li">
                <div class="form_text">身份证号码</div>
                <div>
                    <input type="text" name="idCard" value="${staffRecord.idCard}">
                </div>
            </div>
            <div class="flex_li">
                <div class="form_text">社会保障号码</div>
                <div>
                    <input type="text" name="socialSecurityId" value="${staffRecord.socialSecurityId}">
                </div>
            </div>
            <div class="flex_li">
                <div class="form_text">年龄</div>
                <div>
                    <input type="text" name="age" value="${staffRecord.age}">
                </div>
            </div>
            <div class="flex_li">
                <div class="form_text">学历</div>
                <div>
                    <select name="education">
                        <option value="小学">小学</option>
                        <option value="初中">初中</option>
                        <option value="高中">高中</option>
                        <option value="大专">大专</option>
                        <option value="本科">本科</option>
                        <option value="硕士研究生">硕士研究生</option>
                        <option value="博士研究生">博士研究生</option>
                    </select>
                </div>
            </div>
            <div class="flex_li">
                <div class="form_text">学历专业</div>
                <div>
                    <select name="majorId">
                        <c:forEach items="${comboBox.majorList}" var="major">
                            <c:if test="${major.majorId==staffRecord.majorId}">
                                <option selected="selected" value="${major.majorId}">${major.majorName}</option>
                            </c:if>
                            <c:if test="${major.majorId!=staffRecord.majorId}">
                                <option value="${major.majorId}">${major.majorName}</option>
                            </c:if>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="flex_li">
                <div class="form_text">薪酬标准</div>
                <div>
                    <select name="salaryStandardId">
                        <c:forEach items="${comboBox.salaryStandardList}" var="salaryStandard">
                            <c:if test="${salaryStandard.salaryStandardId==staffRecord.salaryStandardId}">
                                <option selected="selected" value="${salaryStandard.salaryStandardId}">${salaryStandard.salaryStandardName}/${salaryStandard.totalSalary}</option>
                            </c:if>
                            <c:if test="${salaryStandard.salaryStandardId!=staffRecord.salaryStandardId}">
                                <option value="${salaryStandard.salaryStandardId}">${salaryStandard.salaryStandardName}/${salaryStandard.totalSalary}</option>
                            </c:if>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="flex_li">
                <div class="form_text">开户行</div>
                <div>
                    <input type="text" name="bank" value="${staffRecord.bank}">
                </div>
            </div>
            <div class="flex_li">
                <div class="form_text">账号</div>
                <div>
                    <input type="text" name="creditCard" value="${staffRecord.creditCard}">
                </div>
            </div>
            <div class="flex_li">
                <div class="form_text">变更人</div>
                <div>
                    <input type="text" name="updateName" value="<security:authentication property="principal.username"></security:authentication>">
                </div>
            </div>
            <div class="flex_li">
                <div class="form_text">变更时间</div>
                <div>
                    <input type="text"disabled="true" id="updateTime" name="updateTime"/>
                </div>
            </div>
            <div class="flex_li">
                <div class="form_text">特长</div>
                <div>
                    <input type="text" name="speciality" id="speciality" list="specialities" value="${staffRecord.speciality}"/>
                    <datalist id="specialities">
                        <option value="数据库">参考选项</option>
                        <option value="后端开发">参考选项</option>
                        <option value="前端开发">参考选项</option>
                        <option value="算法">参考选项</option>
                        <option value="安卓/IOS开发">参考选项</option>
                        <option value="运维">参考选项</option>
                    </datalist>
                </div>
            </div>
            <div class="flex_li">
                <div class="form_text">爱好</div>
                <div>
                    <input type="text" name="hobby" id="hobby" list="hobbies" value="${staffRecord.hobby}"/>
                    <datalist name="爱好" id="hobbies">
                        <option value="篮球">参考选项</option>
                        <option value="足球">参考选项</option>
                        <option value="电影">参考选项</option>
                        <option value="音乐">参考选项</option>
                        <option value="旅行">参考选项</option>
                        <option value="敲代码">参考选项</option>
                        <option value="健身">参考选项</option>
                    </datalist>
                </div>
            </div>
            <br>
            <div class="flex_li">
                <div class="form_text">个人履历</div>
                <div>
                    <textarea col="20" rows="40" name="personalResume">${staffRecord.personalResume}</textarea>
                    <%--<textarea col="20" rows="40"></textarea>--%>
                </div>
            </div>
            <div class="flex_li">
                <div class="form_text">家庭关系信息</div>
                <div>
                    <textarea col="20" rows="40" name="familyRelationshipInformation">${staffRecord.familyRelationshipInformation}</textarea>
                </div>
            </div>
            <div class="flex_li">
                <div class="form_text">备注</div>
                <div>
                    <textarea col="20" rows="40" name="remark">${staffRecord.remark}</textarea>
                </div>
            </div>
        </div>
        <br>
        <div style="text-align: center;margin-right: 500px;">
            <input type="submit" value="提交" class="btn btn-success">
            <input type="reset" value="清除(还原)" class="btn btn-info">
        </div>
        <br>
    </form>
</div>
</body>
<script>

    $(function () {
        showII();  //页面加载后执行该函数，以获取级联的下拉框数据
        showPosition();

        //设置一些下拉框的选中
        $("select[name='sex']").val("${staffRecord.sex}");
        $("select[name='faith']").val("${staffRecord.faith}");
        $("select[name='politicsStatus']").val("${staffRecord.politicsStatus}");
        $("select[name='education']").val("${staffRecord.education}");

        //ajax提交表单
        $("#updateForm").submit(function () {
            $("input[name='updateTime']").removeAttr("disabled");//关闭禁用，否则该项无法提交
            $.ajax({
                type: "POST",
                contentType: "application/x-www-form-urlencoded",
                url: "${pageContext.request.contextPath}/staffs/${staffRecord.recordId}",
                processData:false,
                contentType:false,
                data: new FormData(document.getElementById("updateForm")),
                dataType: "json",
                success: function(data){
                    //成功之后的操作，页面跳转
                    // alert(data.data);
                    var message = "员工档案变更成功！等待人事经理审核。";
                    var back = "${pageContext.request.contextPath}/staffs/querypage/record_update";
                    window.location.href="${pageContext.request.contextPath}/info/success?message="+message+"&back="+back;
                    $("span[name='record_recheck_count']",window.parent.document).html(data.count);
                },
                error: function (data) {
                    var message = "员工档案变更失败，请稍后重试！";
                    var back = "${pageContext.request.contextPath}/staffs/querypage/record_update";
                    window.location.href="${pageContext.request.contextPath}/info/fail?message="+message+"&back="+back;
                    $("span[name='record_recheck_count']",window.parent.document).html(data.count==0?"":data.count);
                }
            });
            $("input[name='updateTime']").attr("disabled",true);
        });
    });
</script>
</html>
