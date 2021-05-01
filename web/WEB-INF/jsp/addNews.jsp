<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>addNews</title>
    <!-- 引入 Bootstrap -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">

    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>新增新闻</small>
                </h1>
            </div>
        </div>
    </div>
    <form action="${pageContext.request.contextPath}/news/addNews" method="post">
        新闻标题：<input type="text" name="head" required><br><br><br>
        新闻内容：<input type="text" name="body" required><br><br><br>
        新闻时间：<input type="text" name="date" placeholder="格式yyyy-mm-xx" required><br><br><br>
        新闻总结：<input type="text" name="summary" required><br><br><br>
        新闻作者：<input type="text" name="author" required><br><br><br>
        <input type="submit" value="添加">
    </form>

</div>
</body>
</html>
