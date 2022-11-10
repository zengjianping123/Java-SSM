<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <title>修改密码</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${applicationScope.baseUrl}/static/ui/layuimini/lib/layui-v2.6.3/css/layui.css" media="all">
    <link rel="stylesheet" href="${applicationScope.baseUrl}/static/ui/layuimini/js/lay-module/step-lay/step.css" media="all">
</head>
<body>
<div class="layuimini-container">
    <div style="padding: 20px">
        <div class="layui-carousel" id="stepForm" lay-filter="stepForm" style="margin: 0 auto;padding-top: 60px">
            <div carousel-item>
                <div>
                    <form class="layui-form" style="margin: 0 auto;max-width: 460px;padding-top: 40px;">
                        <div class="layui-form-item">
                            <label class="layui-form-label">当前密码</label>
                            <div class="layui-input-block">
                                <input type="password" name="curPwd" placeholder="请填写账户当前密码" class="layui-input" lay-verify="required" />

                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-input-block">
                                <button class="layui-btn" lay-submit lay-filter="formStep">
                                    &emsp;下一步&emsp;
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
                <div>
                    <form class="layui-form" style="margin: 0 auto;max-width: 460px;padding-top: 40px;">
                        <div class="layui-form-item">
                            <label class="layui-form-label">新密码</label>
                            <div class="layui-input-block">
                                <input type="password" name="newPwd" placeholder="请填写账号新密码" class="layui-input" lay-verify="required" />

                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">确认密码</label>
                            <div class="layui-input-block">
                                <input type="password" name="againPwd" placeholder="请确认账号新密码" class="layui-input" lay-verify="required" />

                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-input-block">
                                <button class="layui-btn" lay-submit lay-filter="formStep2">
                                    &emsp;确定修改&emsp;
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
                <div>
                    <div style="text-align: center;margin-top: 90px;">
                        <i class="layui-icon layui-circle"
                           style="color: white;font-size:30px;font-weight:bold;background: #52C41A;padding: 20px;line-height: 80px;">&#xe605;</i>
                        <div style="font-size: 24px;color: #333;font-weight: 500;margin-top: 30px;">
                            密码修改
                        </div>
                        <div style="font-size: 14px;color: #666;margin-top: 20px;">请重新登录</div>
                    </div>
                    <div style="text-align: center;margin-top: 50px;">
                        <a href="${applicationScope.baseUrl}/page/toLogin" class="layui-btn">前去登录</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="${applicationScope.baseUrl}/static/ui/layuimini/lib/layui-v2.6.3/layui.js" charset="utf-8"></script>
<script src="${applicationScope.baseUrl}/static/ui/layuimini/js/lay-config.js?v=1.0.4" charset="utf-8"></script>
<script>
    layui.use([ 'form', 'step'], function () {
        var $ = layui.$,
            form = layui.form,
            step = layui.step;

        step.render({
            elem: '#stepForm',
            filter: 'stepForm',
            width: '100%', //设置容器宽度
            stepItems: [{
                title: '验证当前密码'
            }, {
                title: '输入新密码'
            }, {
                title: '修改结果'
            }]
        });


        const pwdData = {}
        form.on('submit(formStep)', function (data) {
            $.post('../user/rePwd', {curPwd: data.field.curPwd}, function (res) {
                if (res.code === 200) {
                    pwdData.curPwd = data.field.curPwd
                    step.next('#stepForm');
                } else {
                    layer.msg(res.msg)
                }
            })

            return false;
        });

        form.on('submit(formStep2)', function (data) {
            if (!data.field.newPwd || data.field.newPwd !== data.field.againPwd) {
                layer.msg('两次输入的密码不一致!');
                return false;
            }
            pwdData.newPwd = data.field.newPwd;
            $.post('../user/rePwd', pwdData, function (res) {
                if (res.code === 200) {
                    step.next('#stepForm');
                } else {
                    layer.msg(res.msg)
                }
            })

            return false;
        });
    })
</script>
</body>
</html>