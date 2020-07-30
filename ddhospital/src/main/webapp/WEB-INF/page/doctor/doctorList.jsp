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



    });


</script>


</body>
</html>
