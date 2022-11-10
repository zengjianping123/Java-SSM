<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <title>上传头像</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${applicationScope.baseUrl}/static/ui/layuimini/lib/layui-v2.6.3/css/layui.css" media="all">
</head>
<body>
<div class="layuimini-container">
    <div style="padding: 20px">
        <div class="layui-upload">
                <button type="button" class="layui-btn" id="uploadImg">上传图片</button>
                <div class="layui-upload-list">
                    <img class="layui-upload-img" id="userImg" width="180" height="180">
                    <p id="tipText"></p>
                </div>
            </div>
    </div>
</div>
<script src="${applicationScope.baseUrl}/static/ui/layuimini/lib/layui-v2.6.3/layui.js" charset="utf-8"></script>

<script>
    layui.use(['upload', 'element', 'layer'], function() {
        var $ = layui.jquery
            , upload = layui.upload
            , element = layui.element
            , layer = layui.layer;

        //常规使用 - 普通图片上传
        var uploadInst = upload.render({
            elem: '#uploadImg',
            accept: 'images',
            acceptMime: 'image/*',
            field: 'mf'
            , url: '../file/uploadImg' //此处用的是第三方的 http 请求演示，实际使用时改成您自己的上传接口即可。
            , before: function (obj) {
                //预读本地文件示例，不支持ie8
                obj.preview(function (index, file, result) {
                    $('#userImg').attr('src', result); //图片链接（base64）
                });

                element.progress('uploadProgress', '0%'); //进度条复位
                layer.msg('上传中', {icon: 16, time: 0});
            }
            , done: function (res) {
                //如果上传失败
                if (res.code !== 200) {
                    return layer.msg('上传失败');
                }
                //上传成功的一些操作
                //……
                layer.msg('头像上传完毕, 重新登录后生效', {icon: 1});
            }
            , error: function () {
                //演示失败状态，并实现重传
                var tipText = $('#tipText');
                tipText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs upload-reload">重试</a>');
                tipText.find('.upload-reload').on('click', function () {
                    uploadInst.upload();
                });
            }
        });
    });
</script>
</body>
</html>