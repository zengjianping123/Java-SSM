<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>用户管理</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Access-Control-Allow-Origin" content="*">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="${applicationScope.baseUrl}/static/ui/layuimini/lib/layui-v2.6.3/css/layui.css" media="all">
</head>
<body style="padding: 8px">
<div>
    <blockquote class="layui-elem-quote">
        <form class="layui-form">
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">登录名</label>
                    <div class="layui-input-inline">
                        <input class="layui-input" type="text" name="username">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">真实姓名</label>
                    <div class="layui-input-inline">
                        <input class="layui-input" type="text" name="realname">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">在职状态</label>
                    <div class="layui-input-inline">
                        <input type="radio" name="deleted" value="1" title="在职">
                        <input type="radio" name="deleted" value="2" title="离职">
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
    <table class="layui-hide" id="userTable" lay-filter="userTable"></table>
    <script type="text/html" id="userTableToolBar" >
        <div class="layui-btn-container">
            <button class="layui-btn layui-btn-sm" lay-event="addUser">添加</button>
        </div>
    </script>

    <script type="text/html" id="userTableRowBar">
        <a class="layui-btn layui-btn-xs" lay-event="editUser">编辑</a>
        <a class="layui-btn layui-btn-warm layui-btn-xs" lay-event="rePwd">重置密码</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="leaveUser">离职</a>
    </script>

    <script type="text/html" id="addOrUpdateUserTmp">
        <div style="padding: 30px 50px 30px 0">
            <form class="layui-form" lay-filter="addOrUpdateForm">
                <input type="hidden" name="id"/>
                <div class="layui-form-item">
                    <lable class="layui-form-label">登录名</lable>
                    <div class="layui-input-inline">
                        <input class="layui-input" type="text" name="username"/>
                    </div>
                </div>
                <div class="layui-form-item">
                    <lable class="layui-form-label">姓名</lable>
                    <div class="layui-input-inline">
                        <input class="layui-input" type="text" name="realname"/>
                    </div>
                </div>
                <div class="layui-form-item">
                    <lable class="layui-form-label">角色</lable>
                    <div class="layui-input-inline">
                        <input type="radio" name="role" value="1" title="管理员">
                        <input type="radio" name="role" value="2" title="业务员" checked>
                    </div>
                </div>
                <div class="layui-form-item" style="text-align: right">
                    <button class="layui-btn" lay-submit lay-filter="onSubmit">提交</button>
                    <button id="doReset" type="reset" class="layui-btn layui-btn-danger">重置</button>
                </div>
            </form>
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

        const tb = table.render({
            elem: '#userTable'
            ,url:'../user/getUserList'
            ,toolbar: '#userTableToolBar' //开启头部工具栏，并为其绑定左侧模板
            ,defaultToolbar: ['filter', 'exports', 'print']
            ,title: '用户数据表'
            ,cols: [[
                {type: 'checkbox', fixed: 'left'}
                ,{field:'id', title:'ID', width:80, fixed: 'left', unresize: true, sort: true}
                ,{field:'username', title:'用户名'}
                ,{field:'realname', title:'姓名'}
                ,{field:'role', title:'角色', templet: row => {
                    const roles = ['管理员', '业务员', '其他'];
                    let idx = row.role;
                    if (!idx || idx > roles.length || idx < 1)
                        idx = roles.length;
                    return roles[idx - 1];
                }}
                ,{field:'deleted', title:'在职状态', templet: row => {
                    const status = ['在职', '离职', '未知'];
                    let idx = row.deleted;
                    if (!idx || idx > status.length || idx < 1)
                        idx = status.length;
                    return status[idx - 1];
                }}
                ,{field:'createTime', title:'创建时间'}
                ,{field:'updateTime', title:'更新时间'}
                ,{field:'deletedTime', title:'离职时间'}
                ,{fixed: 'right', title:'操作', toolbar: '#userTableRowBar', width:200}
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

        form.on('submit(onSearch)', function (data) {
           tb.reload({
               where: data.field,
               page: { curr: 1 }
           })
            return false;
        })

        //头工具栏事件
        table.on('toolbar(userTable)', function(obj){
            switch(obj.event){
                case 'addUser':
                    openAddUserLayer()
                    break;
            }
        });
        //监听行工具事件
        table.on('tool(userTable)', function(obj){
            if(obj.event === 'editUser'){
                openUpdateUserLayer(obj.data)
            } else if(obj.event === 'leaveUser'){
                layer.confirm('真的离职用户【' + obj.data.realname + '】吗?', function(index){
                    $.post('${applicationScope.baseUrl}/user/leaveUser', obj.data, function (res) {
                        if (res.code === 200) {
                            tb.reload();
                            layer.close(index);
                            layer.msg(res.data)
                        } else {
                            layer.msg(res.msg)
                        }
                    })
                });
            } else if(obj.event === 'rePwd'){
                layer.confirm('确定要重置用户【' + obj.data.realname + '】的密码吗?', function(index){
                    $.post('${applicationScope.baseUrl}/user/rePwd', obj.data, function (res) {
                        if (res.code === 200) {
                            layer.close(index);
                            layer.msg(res.data)
                        } else {
                            layer.msg(res.msg)
                        }
                    })
                });
        }
        });
        let layerIdx = 0;
        function openAddUserLayer() {
            layerIdx = layer.open({
                type: 1,
                content: $('#addOrUpdateUserTmp').html(),
                title: '添加用户',
                success(div) {
                    form.render('radio')
                    $('form', $(div)).prop('action', '${applicationScope.baseUrl}/user/addUser')
                }
            })
        }
        function openUpdateUserLayer(data) {
            layerIdx = layer.open({
                type: 1,
                content: $('#addOrUpdateUserTmp').html(),
                title: '修改【' + data.realname + '】用户',
                success(div) {
                    form.val('addOrUpdateForm', data)
                    $('form', $(div)).prop('action', '${applicationScope.baseUrl}/user/editUser')
                }
            })
        }

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