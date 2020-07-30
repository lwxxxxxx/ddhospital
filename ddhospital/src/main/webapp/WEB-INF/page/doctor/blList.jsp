<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>病例列表</title>
    <meta charset="UTF-8" />
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css" media="all">
</head>
<body>
<blockquote class="layui-elem-quote layui-text">
    病例列表
</blockquote>

<%--搜索条件的表单--%>
<form class="layui-form"  action="" lay-filter="search">

    <label class="layui-form-label">搜索</label>
    <div class="layui-input-inline">
        <input type="text"  id="condition"  placeholder="请输入患者的id" autocomplete="off" class="layui-input">
    </div>
    <div class="layui-input-inline" style="margin-left:20px">
        <button type="submit" class="layui-btn" lay-submit=""  lay-filter="query">查询</button>
    </div>
</form>


<table  class="layui-hide" id="test" lay-filter="test"></table>

<div id="barDemo" style="display: none;">
    <button type="button" class="layui-btn layui-btn-xs layui-btn-normal" lay-event="query">查看</button>
    <button type="button" class="layui-btn layui-btn-xs" lay-event="edit">编辑</button>
    <button type="button" class="layui-btn layui-btn-xs layui-btn-danger" lay-event="del">删除</button>
</div>


<%--显示医生详细详细信息的表单--%>
<div id="docInfo" style="display: none">
    <form class="layui-form" action="" lay-filter="docInfo" >
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
            <label class="layui-form-label">科室</label>
            <div class="layui-input-inline">
                <input type="text"  readonly name="ks"   placeholder="请输入" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">职称</label>
            <div class="layui-input-inline">
                <input type="text"  readonly name="zc" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
            </div>
        </div>
    </form>
</div>



<%--显示患者详细详细信息的表单--%>
<div id="patInfo" style="display: none">
    <form class="layui-form" action="" lay-filter="patInfo" >
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
</div>
<script src="${pageContext.request.contextPath}/static/layui/layui.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery/jquery-2.1.0.min.js"></script>

<script>

    layui.use(['table','form'], function () {
        var table = layui.table
            ,form=layui.form
            ,layer=layui.layer;
        table.render({
            elem: '#test'
            , url: '${pageContext.request.contextPath}/bl_list'
            , title: '病例信息列表'
            , cols: [[
                {field: 'id', title: '编号' ,width:70}
                , {field: 'pid', title: '患者编号',event:"pname" }
                , {field: 'did', title: '医生编号',event:"dname"}
                , {field: 'zdsj', title: '诊断时间'}
                , {field: 'zdnr', title: '诊断内容'}
                , {field: 'zdjg', title: '诊断结果'}
                ,{fixed: 'right',title:'操作', width:200, align:'center', toolbar: '#barDemo'}
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

        //监听提交
        form.on('submit(query)', function(data){
            table.reload('test', {
                where: { //设定异步数据接口的额外参数，任意设
                    type: $("#ctype").val()
                    //…
                }
                ,page: {
                    curr: 1 //重新从第 1 页开始
                }
                ,method:"post"
            }); //只重载数据

            return false;
        })
        //监听工具条
        table.on('tool(test)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var tr = obj.tr; //获得当前行 tr 的 DOM 对象（如果有的话）
            if (layEvent==='pname'){
                //do something
                $.get("${pageContext.request.contextPath}/pat_get",{"id":data.pid},function (res) {
                    if(res.code!==200){
                        return layer.alert(res.message, {
                            title: '提示信息'
                        })
                    }
                    //给表单赋值
                    form.val("teacherInfo", { //formTest 即 class="layui-form" 所在元素属性 lay-filter="" 对应的值
                        "id": res.data.id // "name": "value"
                        ,"name":res.data.name
                        ,"sex": res.data.sex
                        ,"age":res.data.age
                        ,"lxfs":res.data.lxfs
                        ,"sfz": res.data.sfz
                    });
                },"json");
                layer.open({
                    type:1,
                    area:['400px','350px'],
                    title: '患者详细信息'
                    ,content: $("#patInfo"),
                    shade: 0,
                    cancel: function(layero,index){
                        layer.closeAll();
                    }

                });

            }
          if (layEvent==='dname'){
                //do something
                $.get("${pageContext.request.contextPath}/doc_get",{"id":data.did},function (res) {
                    if(res.code!==200){
                        return layer.alert(res.message, {
                            title: '提示信息'
                        })
                    }
                    //给表单赋值
                    form.val("docInfo", { //formTest 即 class="layui-form" 所在元素属性 lay-filter="" 对应的值
                        "id": res.data.id // "name": "value"
                        ,"name":res.data.name
                        ,"ks": res.data.ks.name
                        ,"zc":res.data.zc
                    });
                },"json");
                layer.open({
                    type:1,
                    area:['400px','350px'],
                    title: '医生详细信息'
                    ,content: $("#docInfo"),
                    shade: 0,
                    cancel: function(layero,index){
                        layer.closeAll();
                    }

                });

            }
            else if(layEvent === 'LAYTABLE_TIPS'){
                layer.alert('Hi，头部工具栏扩展的右侧图标。');
            }
        });

    });


</script>


</body>
</html>
