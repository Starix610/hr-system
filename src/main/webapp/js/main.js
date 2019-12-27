$(function () {

    //图片上传预览
    $("#picture").change(function () {
       var current_pic = this.files[0];
       preview_picture(current_pic);  //自定义预览图片函数
    });

});

function preview_picture(pic) {
    var r = new FileReader();
    r.readAsDataURL(pic);
    r.onload = function (e) {
        // alert(this.result)
        $(".img_div>img").attr("src",this.result);
    }
}

function showTime() {
    var dateObj = new Date();
    var datetime = dateObj.getFullYear()+'-'+(dateObj.getMonth()+1)+'-'+dateObj.getDate()+' '+dateObj.getHours()+':'+dateObj.getMinutes()+':'+dateObj.getSeconds();
    // alert(dateObj.toLocaleString());
    $("#registerTime").val(datetime);
    $("#recheckTime").val(datetime);
    $("#updateTime").val(datetime);
}

setInterval("showTime()",1000);  //定时器执行showTime函数，显示时间


function showII() {
    var options = "";
    $("#org_II").empty();  //先清空原来II及机构的下拉列表再更新
    var currentId = $("#org_I").val();
    $.post(
        "/options/organization/"+currentId,    //url
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
    $.get(
        "/options/organization/"+currentId,    //url
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
    $.get(
        "/options/position/"+cid,    //url
        function (data) {    //请求成功回调
            for (var i = 0;i<data.length;i++){
                options +="<option value="+data[i].positionId+">"+data[i].positionName+"</option>";
            }
            $("#position").append(options);
        },
        "json"     //返回的数据格式
    );
}
