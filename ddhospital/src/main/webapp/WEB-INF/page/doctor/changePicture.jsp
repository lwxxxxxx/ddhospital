<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>用户头像库</title>
    <meta name="keywords" content="">
    <meta name="description" content="技术">

<%--    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet">--%>
    <link href="${pageContext.request.contextPath}/static/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/js/plugins/fancybox/jquery.fancybox.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/animate.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/style.min.css?v=4.0.0" rel="stylesheet"><base target="_blank">

</head>

<body class="gray-bg">
<div class="wrapper wrapper-content">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>Fancybox <small>http://fancybox.net/</small></h5>
                    <div class="ibox-tools">
                        <a class="collapse-link">
                            <i class="fa fa-chevron-up"></i>
                        </a>
                        <a class="dropdown-toggle" data-toggle="dropdown" href="basic_gallery.html#">
                            <i class="fa fa-wrench"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-user">
                            <li><a href="#">选项1</a>
                            </li>
                            <li><a href="#">选项2</a>
                            </li>
                        </ul>
                        <a class="close-link">
                            <i class="fa fa-times"></i>
                        </a>
                    </div>
                </div>

                <div class="ibox-content J_menuItem">
                  <%--  <form hidden action="${pageContext.request.contextPath}/user/updateUserPicture" id="MyForm123" method="get"  class="J_menuItem">
                        <input hidden type="text" value="${pageContext.session.getAttribute("username")}" name="username">
                        <input hidden type="text" value="${pageContext.session.getAttribute("position")}" name="position">
                        <input hidden type="text" value="${pageContext.session.getAttribute("userId")}" name="id">
                        <input hidden type="text" value="" name="upicture" id="upicture">
                    </form>--%>
                <c:forEach items="${pictureList}" var="pl" varStatus="c">
                    <a  class="fancybox J_menuItem"  onclick="pppp('${pl.absolute}');" title="${pl.title}" >
                        <img id="${pl.id}" alt="image" style="width: 100px;height: 100px" src="${pageContext.request.contextPath}/static/images/picture/${pl.src}" />
                    </a>
                </c:forEach>

                </div>
            </div>
        </div>

    </div>
    <form  method="post" enctype="multipart/form-data" id="mytouxiangform">
       <label style="font-size: 20px" >上传自己的头像(尺寸必须为64*64)</label>
        <input type="file" class="btn btn-default" name="upload"  id="upload" accept="image/*"><br>
        <a class="btn btn-primary" onclick="fileUpload();" role="button">文件上传</a>
    </form>
</div>

<script src="${pageContext.request.contextPath}/static/js/jquery/jquery-2.1.0.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js?v=3.3.5"></script>
<script src="${pageContext.request.contextPath}/static/js/plugins/peity/jquery.peity.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/content.min.js?v=1.0.0"></script>
<script src="${pageContext.request.contextPath}/static/js/plugins/fancybox/jquery.fancybox.js"></script>
<script>
    $(".gohome").html("");
    $(document).ready(function(){$(".fancybox").fancybox({openEffect:"none",closeEffect:"none"})});

</script>
<script>
    function pppp(upicture) {
        var flag = confirm("确认修改吗？");
        if (flag){
            var url='${pageContext.request.contextPath}/picture/updateUserPicture';
            $.get(url,{id:'${sessionScope.doctor.id}',
                name:'${sessionScope.doctor.name}',
                password:'${sessionScope.doctor.password}',
                kid:'${sessionScope.doctor.kid}',
                zc:'${sessionScope.doctor.zc}',
                bz:upicture},function (result) {
                if (result===1){
                    alert("修改成功！");
                }else {
                    alert("修改失败，请联系管理员！")
                }
                top.location="${pageContext.request.contextPath}/page_doctor/index";
            });
        }
    }

        function upload() {
        $("#mytouxiangform").submit();
            setTimeout(function () {
                top.location="${pageContext.request.contextPath}/doctor/index.jsp";
            },1000)  ;

         }

    function fileUpload() {
        //点击按钮，不是提交表单
        //模拟一个表单对象
        var aa = document.getElementById("upload").value.toLowerCase().split('.'); //以“.”分隔上传文件字符串

        if($("#upload").val() === ""||$("#upload").val()==null ) {
            alert('请选择头像后再上传！');
        }else if (aa[aa.length - 1] === 'gif' || aa[aa.length - 1] === 'jpg' || aa[aa.length - 1] === 'bmp'||aa[aa.length - 1] === 'png' || aa[aa.length - 1] === 'jpeg')
        {
        var formData = new FormData();
        //向表单中新增一个文件上传框
        formData.append("file", document.getElementById("upload").files[0]);
        //异步提交上面模拟的表单
        $.ajax({
            url: "${pageContext.request.contextPath}/picture/fileupload2", //后台准备一个文件上传的控制器
            type: "post", //一定是post请求 文件上传是post
            data: formData, //要提交的数据
            contentType: false, //必须为false，文件上传的时候默认才会有正确 content-Type
            processData: false, //必须为false，异步对象XMLhttpRequest才会对文件上传表单正确处理
            success: function (result) {
                //alert(JSON.stringify(result));
                //页面回显上传成功的图片
                if (result=== 1) {
                    //回显图片
                    alert("上传成功!");
                    //alert(result.message)
                } else {
                    alert("图片上传失败，请联系运维....");
                }
              location.href="${pageContext.request.contextPath}/picture/findAllPicture"  ;
                <%--top.location="${pageContext.request.contextPath}/main/main.jsp";--%>
            }
        });}else {
            alert("请选择正确的图片格式!");
        }
    }










</script>
<%--$("#MyForm123").attr("action","${pageContext.request.contextPath}/user/updateUserPicture?"+new Date().getTime());--%>
<script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>

</body>

</html>