<%--
  Created by IntelliJ IDEA.
  User: 11329
  Date: 2020/12/17
  Time: 20:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>updateNews</title>
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
    <form action="${pageContext.request.contextPath}/news/updateNews" method="post">
        <input type="hidden" name="id" value="${updateNews.id}">
        新闻标题：<input type="text" name="head" value="${updateNews.head}" required><br><br><br>
        新闻内容：<input type="text" name="body" value="${updateNews.body}" required><br><br><br>
        新闻时间：<input type="text" name="date" value="${updateNews.date}" required><br><br><br>
        新闻总结：<input type="text" name="summary" value="${updateNews.summary}" required><br><br><br>
        新闻作者：<input type="text" name="author" value="${updateNews.author}" required><br><br><br>
        <input type="submit" value="修改">
    </form>

</div>
</body>
</html>
