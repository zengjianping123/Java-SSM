<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <title>客户数量统计</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${applicationScope.baseUrl}/static/ui/layuimini/lib/layui-v2.6.3/css/layui.css" media="all">
</head>
<body>
<div class="layuimini-container">
    <div style="padding: 20px">
        <div id="main" style="width: 100%;height:400px;"></div>
    </div>
</div>

<script src="${applicationScope.baseUrl}/static/lib/echarts.min.js"></script>
<script src="${applicationScope.baseUrl}/static/ui/layuimini/lib/layui-v2.6.3/layui.js" charset="utf-8"></script>
<script>
    const chartDom = document.getElementById('main');
    const myChart = echarts.init(chartDom);

    layui.use(['jquery', 'layer'], function () {
        const $ = layui.jquery
        const layer = layui.layer


        $.get('../user/userCustomerCount', function (res) {
            if (res.code !== 200) {
                layer.msg(res.msg)
                return;
            }

            const option = {
                tooltip: {
                    trigger: 'axis',
                    axisPointer: {
                        type: 'shadow'
                    }
                },
                grid: {
                    left: '3%',
                    right: '4%',
                    bottom: '3%',
                    containLabel: true
                },
                xAxis: [
                    {
                        type: 'category',
                        data: res.data.map(e => e.realname),
                        axisTick: {
                            alignWithLabel: true
                        }
                    }
                ],
                yAxis: [
                    {
                        type: 'value'
                    }
                ],
                series: [
                    {
                        name: '客户数量',
                        type: 'bar',
                        barWidth: '60%',
                        data: res.data.map(e => e.customerCount)
                    }
                ]
            };

            myChart.setOption(option);
        })
    })
</script>
</body>
</html>