<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>修改密码</title>
    <meta charset="UTF-8" />
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css"  media="all">
</head>
<script src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery/jquery-2.1.0.min.js"></script>
<body>
<blockquote class="layui-elem-quote layui-text">
    修改密码
</blockquote>
<div style="text-align: center;margin-top: 120px">
    <form class="layui-form" id="pwdForm" action="">
        <div style="margin-left: 500px;margin-top: 80px;margin-bottom: 50px">
            <div class="layui-form-item">
                <label class="layui-form-label">原密码</label>
                <div class="layui-input-inline">
                    <input type="password" name="oldPwd" placeholder="请输入密码" lay-verify="username"  autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">密码</label>
                <div class="layui-input-inline">
                    <input type="password" name="password" placeholder="请输入密码" lay-verify="password" autocomplete="off"  class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">确认密码</label>
                <div class="layui-input-inline">
                    <input type="password" name="newPwd" placeholder="请输入确认密码" lay-verify="required|confirmPass" autocomplete="off"  class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button type="submit" class="layui-btn" lay-submit="" lay-filter="update">修改</button>
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
            password: [
                /^[\S]{4,8}$/
                ,'新密码必须4到8位，且不能出现空格'
            ],
            //校验两次密码是否一致
            confirmPass:function(value){
                if($('input[name=password]').val() !== value)
                    return '两次密码输入不一致！';
            }
        });
        //监听提交
        form.on('submit(update)', function(data){
            $.post("${pageContext.request.contextPath}/pat_updatePwd",data.field,function (res) {
                layer.alert(res.message, {
                    title: '提示信息'
                })
                document.getElementById("pwdForm").reset();
            },"json")
            return false;
        });
    });
</script>
<style type="text/css">
    body{
        /* 加载背景图片 */
        background-image: url(${pageContext.request.contextPath}/static/images/5.jpg);
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
