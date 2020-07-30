<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>登录</title>
    <meta charset="UTF-8" />
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css"  media="all">
</head>
<script src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery/jquery-2.1.0.min.js"></script>
<body>
<div class="login_box">
    <form class="layui-form loginForm" action="">
        <h2 class="login-title">医院门诊系统</h2>
        <div style="margin-top: 30px;margin-bottom: 40px">
            <div class="layui-form-item">
                <label class="layui-form-label">账号</label>
                <div class="layui-input-inline">
                    <input type="text" name="username" placeholder="请输入账号" lay-verify="username"  autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">密码</label>
                <div class="layui-input-inline">
                    <input type="password" name="password" placeholder="请输入密码" lay-verify="password" autocomplete="off"  class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">身份</label>
                <div class="layui-input-inline">
                    <select name="status" lay-filter="status" lay-verify="required" >
                        <option value=""></option>
                        <option value="0">患者</option>
                        <option value="1">医生</option>
                        <option value="2">管理员</option>
                    </select>
                </div>
            </div>

        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button type="submit" class="layui-btn" lay-submit="" lay-filter="login">登录</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>
<script type="text/javascript">
    layui.use('form', function(){
        var form = layui.form; //只有执行了这一步，部分表单元素才会自动修饰成功

        //自定义验证规则
        form.verify({
            username:[
                /^[\d]{1,8}$/
                ,'账号必须1到8位的数字，且不能出现空格'
            ]
            ,password: [
                /^[\S]{1,8}$/
                ,'密码必须1到8位，且不能出现空格'
            ]
        });
        //监听提交
        form.on('submit(login)', function(data){
            if (data.field.status==0){
                //用户选择的是患者身份登录
                $.post("${pageContext.request.contextPath}/pat_login",{"id":data.field.username,
                    "password":data.field.password},function (res) {
                    if (res.code===200){
                        layer.msg('登录成功');
                        location.href="${pageContext.request.contextPath}/page_patient/index"
                    }else {
                        layer.alert(res.message, {
                            title: '提示信息'
                        })
                    }
                },"json")
            }
            if (data.field.status==1){
                //用户选择的是医生身份登录
                $.post("${pageContext.request.contextPath}/doc_login",{"id":data.field.username,
                    "password":data.field.password},function (res) {
                    if (res.code===200){
                        location.href="${pageContext.request.contextPath}/page_doctor/index"
                    }else {
                        layer.alert(res.message, {
                            title: '提示信息'
                        })
                    }
                },"json")

            }
            if (data.field.status==2){
                //用户选择的是管理身份登录
                $.post("${pageContext.request.contextPath}/admin_login",{"id":data.field.username,
                    "password":data.field.password},function (res) {

                    if (res.code===200){
                        layer.msg('登录成功');
                        location.href="${pageContext.request.contextPath}/page_admin/index"
                    }else {
                        layer.alert(res.message, {
                            title: '提示信息'
                        })
                    }

                },"json")
            }
            return false;
        });
    });
</script>
<style type="text/css">
    /*.login_box {*/
    /*    position: absolute;*/
    /*    width: 100%;*/
    /*    height: 100%;*/
    /*    background: url("/static/images/login.jpg")*/
    /*}*/
    .loginForm {
        width: 350px;
        margin: 160px auto; /* 上下间距160px，左右自动居中*/
        background-color:rgba(24,145,94,0.3); /* 透明背景色 */
        padding: 30px;
        border-radius: 20px; /* 圆角 */
    }
    /* 标题 */
    .login-title {
        color: #303133;
        text-align: center;
    }
    body{
        /* 加载背景图片 */
        background-color:rgba(254,249,219,0.5);
        /*background-image: url('${pageContext.request.contextPath}/static/images/login.jpg');*/
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
