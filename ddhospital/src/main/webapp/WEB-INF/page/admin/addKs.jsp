<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>添加科室</title>
    <meta charset="UTF-8" />
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css"  media="all">
</head>
<body>
<div style="text-align: center;margin-top: 50px">
    <h2>添加科室</h2>

    <!--添加医生信息的表单-->
        <form class="layui-form" id="addKs" action="" lay-filter="ksInfo">
            <div style="margin-top: 30px;margin-left: 500px;margin-bottom: 30px">
                <div class="layui-form-item" style="margin-top: 50px">
                    <label class="layui-form-label">编号</label>
                    <div class="layui-input-inline">
                        <input type="number"  name="id" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">名称</label>
                    <div class="layui-input-inline">
                        <input type="text" name="name" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
                    </div>
                </div>
        </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button type="submit" id="add" class="layui-btn" lay-submit="" lay-filter="add" >添加</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>
</div>
<script src="${pageContext.request.contextPath}/static/js/jquery/jquery-2.1.0.min.js"></script>
<script src="${pageContext.request.contextPath}/static/layui/layui.js" charset="utf-8"></script>
<script>
    var layer;
    layui.use(['form','layer'], function(){
        var form = layui.form
            ,layer=layui.layer;
        //监听表单的提交
        form.on('submit(add)', function(data){
            $.post("${pageContext.request.contextPath}/ks_add",data.field,function (res) {
                if (res.code!==200){
                    return layer.alert(res.message, {
                        title: '提示信息'
                    })
                }
                else {
                    layer.alert(res.message, {
                        title: '提示信息'
                    })
                    //新增成功，清空表单
                    document.getElementById("addKs").reset();
                }
            })
            //异步提交
            return false;
        });
    });
    function check() {
        $.get("${pageContext.request.contextPath}/ks_get",{id:$("#id").val()},function (res) {
            if (res.code!==201){
                layer.alert('该编号已经被占用，请更换一个', {
                    title: '提示信息'
                })
                $("#add").attr("class",'layui-btn layui-btn-disabled')
            }
            else {
                $("#add").attr("class",'layui-btn')
            }
        },"json")
    }
</script>

<style type="text/css">
    body{
        /* 加载背景图片 */
        /*background-image: url(/static/images/4.jpg);*/
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
