<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<html>
<head>
    <title>药物列表</title>
    <meta charset="UTF-8" />
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css"  media="all">
</head>
<body>

<blockquote class="layui-elem-quote layui-text">
    全部药物信息列表
</blockquote>

<table class="layui-hide" id="test" lay-filter="test"></table>

<div id="barDemo" style="display: none">
    <button type="button" class="layui-btn layui-btn-xs" lay-event="edit">修改</button>
    <button type="button" class="layui-btn layui-btn-xs layui-btn-danger" lay-event="del">删除</button>
</div>
<!--修改药物信息的表单-->
<form class="layui-form" id="editMedicine" action="" lay-filter="medicineInfo" style="display:none" >
    <div class="layui-form-item">
        <label class="layui-form-label">编号</label>
        <div class="layui-input-inline">
            <input type="text"  name="id" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">药名</label>
        <div class="layui-input-inline">
            <input type="text" name="name" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">数量</label>
        <div class="layui-input-inline">
            <input type="text" name="sl" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">类别</label>
        <div class="layui-input-inline">
            <select name="lb" lay-filter="lb" lay-verify="required" >
                <option value=""></option>
                <option value="中药">中药</option>
                <option value="西药">西药</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">价格</label>
        <div class="layui-input-inline">
            <input type="text" name="jg" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button type="submit" class="layui-btn" lay-submit="" lay-filter="update" >更新</button>
        </div>
    </div>
</form>
<script src="${pageContext.request.contextPath}/static/layui/layui.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery/jquery-2.1.0.min.js"></script>

<script>
    layui.use(['table','form'], function () {
        var table = layui.table
            ,form=layui.form;
        table.render({
            elem: '#test'
            , url: '${pageContext.request.contextPath}/med_list'
            , cols: [[
                {field: 'id', title: '药物编号' }
                , {field: 'name', title: '姓名' }
                , {field: 'sl', title: '数量'}
                , {field: 'lb', title: '类别'}
                , {field: 'jg', title: '价格'}
                ,{fixed: 'right',title:'操作', width:150, align:'center', toolbar: '#barDemo'}
            ]]
            , page: {limits:[5,10,15,20]}
            , response: {
                statusCode: 200 //重新规定成功的状态码为 200，table 组件默认为 0
            }
            , parseData: function (res) { //将原始数据解析成 table 组件所规定的数据
                return {
                    "code": res.code, //解析接口状态
                    "msg": res.message, //解析提示文本
                    "count": res.data.total, //解析数据长度
                    "data": res.data.list //解析数据列表
                };
            }
        });


        //监听工具条
        table.on('tool(test)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var tr = obj.tr; //获得当前行 tr 的 DOM 对象（如果有的话）
            if(layEvent === 'del'){ //删除
                layer.confirm('真的删除行么', function(index){
                    //向服务端发送删除指令
                    $.get("${pageContext.request.contextPath}/med_delete", {"id": data.id}, function (res) {
                        if (res.code === 200) {
                            layer.alert(res.message, {
                                title: '提示信息'
                            })
                            obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
                            layer.close(index);
                        }})
                });
            } else if(layEvent === 'edit'){ //编辑
                //do something
                $.get("${pageContext.request.contextPath}/med_get",{"id":data.id},function (res) {
                    if(res.code!==200){
                        return layer.alert(res.message, {
                            title: '提示信息'
                        })
                    }
                    var data=res.data

                   /* $.get("${pageContext.request.contextPath}/allMedicine",function (res) {
                        if (res.code!==200){
                            return layer.alert(res.message, {
                                title: '提示信息'
                            })
                        }*/
                        //每次加载前先清空下之前下拉框中的  值
                       /* $("#major").empty();
                        for (var i = 0; i < res.data.length; i++) {
                            $("#ks").append("<option value='" + res.data[i].id + "'>" + res.data[i].name + "</option>")
                        }
                        form.render('select');*/
                        //给表单赋值
                        form.val("medicineInfo", { //formTest 即 class="layui-form" 所在元素属性 lay-filter="" 对应的值
                            "id": data.id // "name": "value"
                            ,"name":data.name
                            ,"sl": data.sl
                            ,"jg":data.jg
                        });



                    layer.open({
                        type:1,
                        area:['420px','350px'],
                        title: '修改药物信息'
                        ,content: $("#editMedicine"),
                        shade: 0,
                        cancel: function(layero,index){
                            layer.closeAll();
                        }

                    });
                },"json")

                // //同步更新缓存对应的值
                // obj.update({
                //     username: '123'
                //     ,title: 'xxx'
                // });
            } else if(layEvent === 'LAYTABLE_TIPS'){
                layer.alert('Hi，头部工具栏扩展的右侧图标。');
            }
        });
        //监听更新提交
        form.on('submit(update)', function(data){
            var data = form.val("medicineInfo");
            $.post("${pageContext.request.contextPath}/med_update",data,function(res) {
                if (res.code!=200){
                    return  layer.alert(res.message, {
                        title: '提示信息'
                    })
                }
                location.href="${pageContext.request.contextPath}/page_admin/medicineList"
                layer.msg(res.message)
            },"json")
            return false;
        })
    });
</script>


</body>
</html>
