<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>客户管理</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Access-Control-Allow-Origin" content="*">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="${applicationScope.baseUrl}/static/ui/layuimini/lib/layui-v2.6.3/css/layui.css" media="all">
    <style>
        .hiddenComponent {
            display: none;
        }
    </style>
</head>
<body style="padding: 8px">
<div>
    <blockquote class="layui-elem-quote">
        <form class="layui-form">
            <div class="layui-form-item">
                <div class="layui-inline hiddenComponent">
                    <label class="layui-form-label">业务员</label>
                    <div class="layui-input-inline">
                        <select name="userId" id="userIdSelect">
                            <option value="">请选择业务员</option>
                        </select>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">客户姓名</label>
                    <div class="layui-input-inline">
                        <input class="layui-input" type="text" name="name">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">客户电话</label>
                    <div class="layui-input-inline">
                        <input class="layui-input" type="tel" name="phone">
                    </div>
                </div>
                <div class="layui-inline">
                    <div class="layui-input-inline">
                        <button class="layui-btn" lay-submit lay-filter="onSearch">查询</button>
                        <button type="reset" class="layui-btn layui-btn-danger">重置</button>
                    </div>
                </div>
            </div>
        </form>
    </blockquote>
</div>

<div>
    <table class="layui-hide" id="customerTable" lay-filter="customerTable"></table>
    <script type="text/html" id="customerTableToolBar" >
        <div class="layui-btn-container">
            <button class="layui-btn layui-btn-sm" lay-event="addCustomer">添加</button>
            <button class="layui-btn layui-btn-sm layui-btn-warm hiddenComponent" lay-event="transformCustomers">转移客户</button>
        </div>
    </script>

    <script type="text/html" id="customerTableRowBar">
        <a class="layui-btn layui-btn-xs" lay-event="editCustomer">修改</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="rmCustomer">删除</a>
        <a class="layui-btn layui-btn-warm layui-btn-xs" lay-event="viewVisitLog">查看拜访记录</a>
    </script>

    <script type="text/html" id="addOrUpdateCustomerTmp">
        <div style="padding: 30px 50px 30px 0">
            <form class="layui-form" lay-filter="addOrUpdateForm">
                <input type="hidden" name="id"/>
                <div class="layui-form-item">
                    <lable class="layui-form-label">客户姓名</lable>
                    <div class="layui-input-inline">
                        <input class="layui-input" type="text" name="name"/>
                    </div>
                </div>
                <div class="layui-form-item">
                    <lable class="layui-form-label">客户电话</lable>
                    <div class="layui-input-inline">
                        <input class="layui-input" type="tel" name="phone"/>
                    </div>
                </div>
                <div class="layui-form-item">
                    <lable class="layui-form-label">客户公司</lable>
                    <div class="layui-input-inline">
                        <input class="layui-input" type="text" name="company"/>
                    </div>
                </div>
                <div class="layui-form-item">
                    <lable class="layui-form-label">性别</lable>
                    <div class="layui-input-inline">
                        <input type="radio" name="sex" value="1" title="男" checked/>
                        <input type="radio" name="sex" value="0" title="女"/>
                    </div>
                </div>
                <div class="layui-form-item" style="text-align: right">
                    <button class="layui-btn" lay-submit lay-filter="onSubmit">提交</button>
                    <button id="doReset" type="reset" class="layui-btn layui-btn-danger">重置</button>
                </div>
            </form>
        </div>
    </script>

    <script type="text/html" id="transformCustomersTmp">
        <div style="padding: 30px 50px 30px 0">
            <form class="layui-form" lay-filter="transformCustomersForm">
                <div class="layui-form-item">
                    <lable class="layui-form-label">选择业务员</lable>
                    <div class="layui-input-inline" id="transformCustomersTo">
                    </div>
                </div>
                <div class="layui-form-item" style="text-align: right">
                    <button class="layui-btn" lay-submit lay-filter="onTransformCustomersSubmit">提交</button>
                </div>
            </form>
        </div>
    </script>

    <script type="text/html" id="viewVisitLogTmp">
        <div style="padding: 30px">
            <form class="layui-form  layui-form-pane" id="viewVisitLogForm" lay-filter="viewVisitLogForm">
                <input type="hidden" name="customerId">
                <input type="hidden" name="name">
                <div class="layui-form-item">
                    <lable class="layui-form-label">拜访时间</lable>
                    <div class="layui-input-block">
                        <input class="layui-input" type="text" id="visitTime" name="visitTime" lay-verify="required" readonly/>
                    </div>
                </div>
                <div class="layui-form-item">
                    <lable class="layui-form-label layui-panel">拜访内容</lable>
                    <div class="layui-input-block">
                        <textarea placeholder="请输入拜访内容" class="layui-textarea" name="descp" lay-verify="required"></textarea>
                    </div>
                </div>
                <div class="layui-form-item" style="text-align: center">
                    <button class="layui-btn" lay-submit="" lay-filter="onVisitLogSubmit">保存</button>
                </div>
            </form>
            <div>
                <table class="layui-hide" id="visitLogTable" lay-filter="visitLogTable"></table>
            </div>
        </div>
    </script>
</div>

<script src="${applicationScope.baseUrl}/static/ui/layuimini/lib/layui-v2.6.3/layui.js" charset="utf-8"></script>
<script>
    layui.use(['form', 'layer', 'table', 'jquery'], function () {
        const form = layui.form;
        const layer = layui.layer;
        const table = layui.table;
        const $ = layui.jquery;
        const laydate = layui.laydate;

        // 渲染数据表格
        const tb = table.render({
            elem: '#customerTable'
            ,url:'../customer/getCustomerList'
            ,toolbar: '#customerTableToolBar' //开启头部工具栏，并为其绑定左侧模板
            ,defaultToolbar: ['filter', 'exports', 'print']
            ,title: '用户数据表'
            ,cols: [[
                {type: 'checkbox', fixed: 'left'}
                ,{field:'id', title:'ID', width:80, fixed: 'left', unresize: true, sort: true}
                ,{field:'name', title:'客户姓名'}
                ,{field:'phone', title:'手机号'}
                ,{field:'userName', title:'业务员'}
                ,{field:'company', title:'客户公司'}
                ,{field:'sex', title:'性别', templet: row => ['女', '男'][row.sex] ?? '未知'}
                ,{field:'deleted', title:'客户状态', templet: row => ['有效', '无效'][row.deleted-1] ?? '未知状态'}
                ,{field:'createTime', title:'创建时间'}
                ,{field:'updateTime', title:'更新时间'}
                ,{field:'deletedTime', title:'离职时间'}
                ,{fixed: 'right', title:'操作', toolbar: '#customerTableRowBar', width:260}
            ]]
            ,page: true
            ,height: 'full-110',
            parseData(res) {
                const d = {
                    code: res.code === 200 ? 0 : res.code,
                    msg: res.msg,
                    data: res.data && res.data.hasOwnProperty('list') ? res.data.list : [],
                }
                return {
                    ...d,
                    count: res.data && res.data.hasOwnProperty('total') ? res.data.total : d.data.length
                }
            }
        });

        // 渲染【业务员】下拉框
        // warming: 这是一个很烂的权限逻辑
        if ('${sessionScope.user.role}' === '1') {
            $.get('${applicationScope.baseUrl}/user/getAvailableUserList', function (res) {
                if (res.code !== 200) {
                    layer.msg(res.msg)
                } else {
                    const div = $('#userIdSelect')

                    const html = res.data.reduce((s, c) => s
                        + '<option value = "' + c.id + '">'
                        + c.realname + '</option>', div.html()
                    )

                    div.html(html)
                    form.render('select')
                }
            })

            $('.hiddenComponent').removeClass('hiddenComponent')
            const sc = $('#customerTableToolBar')
            sc.html(sc.html().replace('hiddenComponent', ''));
        }

        // 监听表格筛选事件
        form.on('submit(onSearch)', function (data) {
           tb.reload({
               where: data.field,
               page: { curr: 1 }
           })
            return false;
        })

        //头工具栏事件
        table.on('toolbar(customerTable)', function(obj){
            switch(obj.event){
                case 'addCustomer':
                    openAddCustomerLayer()
                    break;
                case 'transformCustomers':
                    openTransformCustomersLayer()
                    break;
            }
        });
        //监听行工具事件
        table.on('tool(customerTable)', function(obj){
            if(obj.event === 'editCustomer'){
                openUpdateCustomerLayer(obj.data)
            } else if(obj.event === 'viewVisitLog'){
                openViewVisitLogLayer(obj.data)
            } else if(obj.event === 'rmCustomer'){
                layer.confirm('确定要删除客户【' + obj.data.name + '】吗?', function(index){
                    $.get('${applicationScope.baseUrl}/customer/rmCustomer?id='+obj.data.id, function (res) {
                        layer.msg(res.data || res.msg)
                        if (res.code === 200) {
                            obj.del()
                        }
                    })
                });
        }
        });

        let layerIdx = 0;
        function openAddCustomerLayer() {
            layerIdx = layer.open({
                type: 1,
                content: $('#addOrUpdateCustomerTmp').html(),
                title: '添加客户',
                success(div) {
                    form.render('radio')
                    $('form', $(div)).prop('action', '${applicationScope.baseUrl}/customer/addCustomer')
                }
            })
        }
        function openUpdateCustomerLayer(data) {
            layerIdx = layer.open({
                type: 1,
                content: $('#addOrUpdateCustomerTmp').html(),
                title: '修改【' + data.name + '】客户',
                success(div) {
                    form.val('addOrUpdateForm', data)
                    $('form', $(div)).prop('action', '${applicationScope.baseUrl}/customer/editCustomer')
                }
            })
        }


        // todo: ff
        function openTransformCustomersLayer() {
            const checks = table.checkStatus('customerTable').data;
            if (checks.length === 0){
                layer.msg('请选选中要转移的客户')
                return;
            }
            layerIdx = layer.open({
                type: 1,
                title: '客户转移',
                content: $('#transformCustomersTmp').html(),
                success(div) {
                    $('form', $(div)).prop('action', '${applicationScope.baseUrl}/customer/transformCustoms')

                    $.get('${applicationScope.baseUrl}/user/getAvailableUserList', function (res) {
                        if (res.code !== 200) {
                            layer.msg(res.msg)
                            return;
                        }

                        const html = res.data.reduce((s, c) => s
                            + '<input type="radio" name = "userId" value = "' + c.id
                            + '" title = "'+c.realname+'"/>', ''
                        )
                        $('#transformCustomersTo').html(html)
                        form.render('radio')
                    })
                }
            })

        }
        function openViewVisitLogLayer(data) {
            layer.open({
                type: 1,
                title: '查看客户【' + data.name + '】拜访信息',
                content: $('#viewVisitLogTmp').html(),
                area: ['900px', '500px'],
                success(div) {
                    $('form', $(div)).prop('action', '${applicationScope.baseUrl}/visitLog/addVisitLog')
                    form.val('viewVisitLogForm', {
                        customerId: data.id,
                        name: data.name
                    })

                    laydate.render({ elem: '#visitTime', type: 'datetime' })
                    table.render({
                        elem: '#visitLogTable',
                        url: '../visitLog/getVisitLog',
                        where: { customerId: data.id },
                        toolbar: true,
                        title: '【'+data.name+'】拜访记录',
                        cols: [[
                            {type:'numbers', title:'ID', width:80, fixed: 'left', unresize: true, sort: true}
                            ,{field:'realname', title:'业务员'}
                            ,{field:'descp', title:'拜访内容'}
                            ,{field:'visitTime', title:'拜访时间'}
                            ,{field:'createTime', title:'创建时间'}
                        ]],
                        page: true,
                        parseData(res) {
                            const d = {
                                code: res.code === 200 ? 0 : res.code,
                                msg: res.msg,
                                data: res.data && res.data.hasOwnProperty('list') ? res.data.list : [],
                            }
                            return {
                                ...d,
                                count: res.data && res.data.hasOwnProperty('total') ? res.data.total : d.data.length
                            }
                        }
                    })
                }
            })
        }

        form.on('submit(onTransformCustomersSubmit)', function (obj) {
            const url = obj.form.action
            const data = obj.field
            if (!data.userId) {
                layer.msg('请选择要转移的目标业务员');
                return false;
            }

            layer.confirm('确定要转移这些客户吗?', function () {
                const checks = table.checkStatus('customerTable').data;
                const customerIds = checks.map(item => item.id);

                $.post(url, { customerIds, userId: data.userId }, function (res) {
                    layer.msg(res.data || res.msg)
                    if (res.code === 200) {
                        layer.close(layerIdx)
                        table.reload('customerTable')
                    }
                })

            })

            return false;
        })

        //监听添加拜访记录
        form.on('submit(onVisitLogSubmit)', function (data) {
            const url = data.form.action
            $.post(url, data.field, function (res) {
                layer.msg(res.data || res.msg)
                if (res.code === 200) {
                    table.reload('visitLogTable')
                    $('#viewVisitLogForm')[0].reset()
                }
            })

            return false;
        })

        form.on('submit(onSubmit)', function (data) {
            const url = data.form.action
            $.post(url, data.field, function (res) {
                if (res.code === 200) {
                    tb.reload()
                    layer.close(layerIdx)
                    layer.msg(res.data)
                } else {
                    layer.msg(res.msg)
                }
            })

            return false;
        })
    })
</script>
</body>
</html>