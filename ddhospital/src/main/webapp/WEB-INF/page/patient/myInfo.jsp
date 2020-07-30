<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人信息</title>
    <meta charset="UTF-8" />
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css"  media="all">
</head>
<body>
<blockquote class="layui-elem-quote layui-text">
    我的信息
</blockquote>

<!--显示学生信息的表单-->
<form style="margin-left: 500px;margin-top: 60px" class="layui-form"  action="" lay-filter="studentInfo"  >
    <div class="layui-form-item">
        <label class="layui-form-label">编号</label>
        <div class="layui-input-inline">
            <input type="text" readonly name="id" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">姓名</label>
        <div class="layui-input-inline">
            <input type="text"  readonly name="name" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">性别</label>
        <div class="layui-input-inline">
            <input type="text" readonly name="sex"  lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">年龄</label>
        <div class="layui-input-inline">
            <input type="text"  readonly name="age"   placeholder="请输入" autocomplete="off" class="layui-input">
        </div>
    </div>


    <div class="layui-form-item">
        <label class="layui-form-label">联系方式</label>
        <div class="layui-input-inline">
            <input type="text"  readonly name="lxfs" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">身份证</label>
        <div class="layui-input-inline">
            <input type="text" readonly name="sfz"  lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
        </div>
    </div>

</form>
<script src="${pageContext.request.contextPath}/static/layui/layui.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery/jquery-2.1.0.min.js"></script>

<script>
    layui.use(['table','form'], function () {
        var table = layui.table
            ,form=layui.form;
        $.get("${pageContext.request.contextPath}/pat_myinfo",function (res) {
            if (res.code!==200){
                return layer.alert(res.message, {
                    title: '提示信息'
                })
            }
            //给表单赋值
            form.val("studentInfo", { //formTest 即 class="layui-form" 所在元素属性 lay-filter="" 对应的值
                "id": res.data.id // "name": "value"
                ,"name":res.data.name
                ,"sex": res.data.sex
                ,"age":res.data.age
                ,"lxfs":res.data.lxfs
                ,"sfz": res.data.sfz
            });
        },"json")
    });
</script>
<style type="text/css">
    body{
        /* 加载背景图片 */
        background-image: url(${pageContext.request.contextPath}/static/images/stuInfo.jpg);
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
