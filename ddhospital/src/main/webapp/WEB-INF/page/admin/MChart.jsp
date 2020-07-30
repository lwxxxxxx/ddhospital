<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <meta charset="utf-8">
    <title>库存不足统计</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css"  media="all">
    <script src="${pageContext.request.contextPath}/static/js/echarts/echarts.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/jquery/jquery-2.1.0.min.js"></script>
</head>
<body>

<blockquote class="layui-elem-quote layui-text">
    药品数量
</blockquote>

<div id="main" style="width: 800px;height:400px;margin-left: 100px;margin-top: 60px"></div>
<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'));
    // 显示标题，图例和空的坐标轴
    myChart.setOption({
        title: {
            text: '不足的药物信息'
        },
        tooltip: {},
        legend: {
            data:['数量']
        },
        xAxis: {
            data: []
        },
        yAxis: {},
        series: [{
            name: '数量',
            type: 'bar',
            data: []
        }]
    });

    // 异步加载数据
    $.get("${pageContext.request.contextPath}/med_count").done(function (res) {
        // 后端传来的数据不满足要求，要用js对数据进行一下处理
        var names=[];
        var counts=[];
        for (var i=0;i<res.data.length;i++){
            names.push(res.data[i].name)
            counts.push(res.data[i].count)
        }
        myChart.setOption({
            xAxis: {
                data: names
            },
            series: [{
                // 根据名字对应到相应的系列
                name: '药名',
                data: counts
            }]
        });
    });
</script>
</body>
</html>
