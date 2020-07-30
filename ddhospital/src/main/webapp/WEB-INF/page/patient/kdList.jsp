<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<html>
<head>
    <title>挂号列表</title>
    <meta charset="UTF-8" />
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css"  media="all">
</head>
<body>

<blockquote class="layui-elem-quote layui-text">
    全部信息列表
</blockquote>

<table class="layui-hide" id="test" lay-filter="test"></table>


<div id="barDemo" style="display: none">
    <button type="button" class="layui-btn layui-btn-xs" lay-event="gh">挂号</button>
</div>

<script src="${pageContext.request.contextPath}/static/layui/layui.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery/jquery-2.1.0.min.js"></script>

<script>
    layui.use(['table'], function () {
        var table = layui.table

        table.render({
            elem: '#test'
            , url: '${pageContext.request.contextPath}/doc_list'
            , cols: [[
                {field: 'name', title: '科室',templet:function (d) {
                        return d.ks.name
                    }
                }
                , {field: 'id', title: '编号'}
                , {field: 'name', title: '姓名'}
                , {field: 'zc', title: '职称'}
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

        table.on('tool(test)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var tr = obj.tr; //获得当前行 tr 的 DOM 对象（如果有的话）
            if(layEvent === 'gh'){ //删除
                layer.confirm('确定挂号吗', function(index){
                    //向服务端发送挂号指令
                    $.get("${pageContext.request.contextPath}/bl_gh", {"id": data.id}, function (res) {
                        if (res.code === 200) {
                            layer.alert(res.message, {
                                title: '提示信息'
                            })
                            obj.del();
                            layer.close(index);
                        }
                    })
                });
            }else if(layEvent === 'LAYTABLE_TIPS'){
                layer.alert('Hi，头部工具栏扩展的右侧图标。');
            }
        });

    });


</script>


</body>
</html>
