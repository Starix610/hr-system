<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <form class="form-panel" id="registerForm" style="background-color: #f0f0f6" action="javascript:void(0)" enctype = "multipart/form-data" >
        <div>
            <h1 style="margin-left: 30px;margin-top: 10px">档案登记</h1>
        </div>
        <div class="flex_ul">
            <div class="flex_li">
                <div class="form_text">Ⅰ级机构</div>
                <div>
                    <select id="org_I" name="organization1Id" onchange="showII()">
                        <c:forEach items="${comboBox.organizationList}" var="organization">
                            <option value="${organization.organizationId}">${organization.organizationName}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="flex_li">
                <div class="form_text">Ⅱ级机构</div>
                <div>
                    <select id="org_II" name="organization2Id" onchange="showIII()">
                        <%--<option value=""></option>--%>
                    </select>
                </div>
            </div>
            <div class="flex_li">
                <div class="form_text">Ⅲ级机构</div>
                <div>
                    <select id="org_III" name="organization3Id">
                        <%--<option value=""></option>--%>
                    </select>
                </div>
            </div>
            <br>
            <div class="flex_li">
                <div class="img_div">
                    <img src="${pageContext.request.contextPath}/img/head.png">
                </div>
                <div>
                    <%--用于代替文件上传按钮，可以修改样式--%>
                    <input type="button" value="选择图片" id="file-input" class="btn btn-primary" onclick="$('#picture').click()">
                    <input type="file" id="picture" name="pictureFile" style="display: none" >
                </div>
            </div>
            <div class="flex_li">
                <div class="form_text">职位分类</div>
                <div>
                    <select id="positionCategory" onchange="showPosition()" name="positionCategoryId">
                        <c:forEach items="${comboBox.positionCategoryList}" var="positionCategory">
                            <option value="${positionCategory.positionCategoryId}">${positionCategory.positionCategoryName}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="flex_li">
                <div class="form_text">职位名称</div>
                <div>
                    <select id="position" name="positionId">
                        <%--<option value=""></option>--%>
                    </select>
                </div>
            </div>
            <div class="flex_li">
                <div class="form_text">职称</div>
                <div>
                    <input type="text" name="professionalTitle" id="professional_title" list="professional_titles" />
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
                    <input required="true" type="text" name="staffName">
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
                    <input type="text" name="email">
                </div>
            </div>
            <div class="flex_li">
                <div class="form_text">电话</div>
                <div>
                    <input type="text" name="phone">
                </div>
            </div>
            <div class="flex_li">
                <div class="form_text">QQ</div>
                <div>
                    <input type="text" name="qq">
                </div>
            </div>
            <div class="flex_li">
                <div class="form_text">手机</div>
                <div>
                    <input type="text" name="mobilephone">
                </div>
            </div>
            <div class="flex_li">
                <div class="form_text">住址</div>
                <div>
                    <input type="text" name="address" style="width: 420px;">
                </div>
            </div>
            <div class="flex_li">
                <div class="form_text">邮编</div>
                <div>
                    <input type="text" name="zip">
                </div>
            </div>
            <div class="flex_li">
                <div class="form_text">国籍</div>
                <div>
                    <select name="nationalityId">
                        <c:forEach items="${comboBox.nationalityList}" var="nationality">
                            <option value="${nationality.nationalityId}">${nationality.nationalityName}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="flex_li">
                <div class="form_text">出生地</div>
                <div>
                    <input type="text" name="birthplace">
                </div>
            </div>
            <div class="flex_li">
                <div class="form_text">生日</div>
                <div>
                    <%--<input type="text" name="birthday">--%>
                    <input type="date" class="form-control"  name="birthday">
                </div>
            </div>
            <div class="flex_li">
                <div class="form_text">民族</div>
                <div>
                    <select name="nationId">
                        <c:forEach items="${comboBox.nationList}" var="nation">
                            <option value="${nation.nationId}">${nation.nationName}</option>
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
                    <input type="text" name="idCard">
                </div>
            </div>
            <div class="flex_li">
                <div class="form_text">社会保障号码</div>
                <div>
                    <input type="text" name="socialSecurityId">
                </div>
            </div>
            <div class="flex_li">
                <div class="form_text">年龄</div>
                <div>
                    <input type="text" name="age">
                </div>
            </div>
            <div class="flex_li">
                <div class="form_text">学历</div>
                <div>
                    <select name="education" >
                        <option value="小学">小学</option>
                        <option value="初中">初中</option>
                        <option value="高中">高中</option>
                        <option value="大专">大专</option>
                        <option selected="true" value="本科">本科</option>
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
                            <option value="${major.majorId}">${major.majorName}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="flex_li">
                <div class="form_text">薪酬标准</div>
                <div>
                    <select name="salaryStandardId">
                        <c:forEach items="${comboBox.salaryStandardList}" var="salaryStandard">
                            <option value="${salaryStandard.salaryStandardId}">${salaryStandard.salaryStandardName}/${salaryStandard.totalSalary}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="flex_li">
                <div class="form_text">开户行</div>
                <div>
                    <input type="text" name="bank">
                </div>
            </div>
            <div class="flex_li">
                <div class="form_text">账号</div>
                <div>
                    <input type="text" name="creditCard">
                </div>
            </div>
            <div class="flex_li">
                <div class="form_text">登记人</div>
                <div>
                    <input type="text" name="registrant" value="<security:authentication property="principal.username"></security:authentication>">
                </div>
            </div>
            <div class="flex_li">
                <div class="form_text">建档时间</div>
                <div>
                    <input type="text" id="registerTime" disabled="true" name="registerTime">
                </div>
            </div>
            <div class="flex_li">
                <div class="form_text">特长</div>
                <div>
                    <input type="text" name="speciality" id="speciality" list="specialities" />
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
                    <input type="text" name="hobby" id="hobby" list="hobbies" />
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
                    <textarea col="20" rows="40" name="personalResume" ></textarea>
                    <%--<textarea col="20" rows="40"></textarea>--%>
                </div>
            </div>
            <div class="flex_li">
                <div class="form_text">家庭关系信息</div>
                <div>
                    <textarea col="20" rows="40" name="familyRelationshipInformation"></textarea>
                </div>
            </div>
            <div class="flex_li">
                <div class="form_text">备注</div>
                <div>
                    <textarea col="20" rows="40" name="remark"></textarea>
                </div>
            </div>
        </div>
        <br>
        <div style="text-align: center;margin-right: 500px;">
            <input type="submit" class="btn btn-success">
            <input type="reset" value="清除" class="btn btn-info">
        </div>
        <br>
    </form>
</div>
</body>
<script>

    $(function () {

        showII();  //页面加载后执行该函数，以获取级联的下拉框数据
        showPosition();
        //ajax提交表单
        $("#registerForm").submit(function () {
            $("input[name='registerTime']").removeAttr("disabled");
            // alert($("#registerForm").serialize());
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/staffs",
                processData:false,
                contentType:false,
                data: new FormData(document.getElementById("registerForm")),  //封装formData对象作为mutipart表单的参数,可以上传文件(应该通过原生js对象获得)
                dataType: "json",
                success: function(data){
                    //成功之后的操作，页面跳转
                    var message = "员工档案提交成功！等待人事经理复核。";
                    var back = "${pageContext.request.contextPath}/options/record_register";//信息提示页面的返回url
                    $("span[name='record_recheck_count']",window.parent.document).html(data.count==''?"":data.count);
                    window.location.href="${pageContext.request.contextPath}/info/success?message="+message+"&back="+back;
                },
                error: function (data) {
                    var message = "档案添加失败，请稍后重试！";
                    var back = "${pageContext.request.contextPath}/options/record_register";//信息提示页面的返回url
                    window.location.href="${pageContext.request.contextPath}/info/fail?message="+message+"&back="+back;
                }
            }   );
            $("input[name='registerTime']").attr("disabled",true);
        });
    });

</script>
</html>
