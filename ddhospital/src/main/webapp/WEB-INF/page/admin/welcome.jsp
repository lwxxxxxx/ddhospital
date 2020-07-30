<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>欢迎</title>
    <meta charset="UTF-8" />
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css"  media="all">
</head>
<script src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery/jquery-2.1.0.min.js"></script>
<body></body>


<style type="text/css">
    /*.login_box {*/
    /*    position: absolute;*/
    /*    width: 100%;*/
    /*    height: 100%;*/
    /*    background: url("/static/images/login.jpg")*/
    /*}*/


    body{
        /* 加载背景图片 */
        <%--background-image: url('${pageContext.request.contextPath}/static/images/cover4.jpg');--%>
        background-color:rgba(254,249,219,0.5);
        /* 背景图垂直、水平均居中 */
        background-position: center center;
        /* 背景图不平铺 */
        background-repeat: no-repeat;
        /* 当内容高度大于图片高度时，背景图像的位置相对于viewport固定 */
        background-attachment: fixed;  /*此条属性必须设置否则可能无效*/
        /* 让背景图基于容器大小伸缩 */
        background-size: cover;
    }
</style>


</body>
</html>
