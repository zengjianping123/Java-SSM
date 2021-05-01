<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>allNews</title>
    <!-- 引入 Bootstrap -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>新闻列表 —— 显示所有新闻</small>
                </h1>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-4 column">
            <a class="btn btn-primary" href="${pageContext.request.contextPath}/news/login">退出登录</a>
            <a class="btn btn-primary" href="${pageContext.request.contextPath}/news/newsList">显示全部新闻</a>
        </div>
        <div class="col-md-4 column"></div>
        <div class="col-md-8 column">
            <form action="${pageContext.request.contextPath}/news/userQueryNews" method="post" class="form-inline" style="float:right">
                <span style="color: red;font-weight: bold;font-size: 20px">${error}</span>
                <input type="text" name="queryNewsHead" class="form-control" placeholder="输入查询新闻标题">
                <input type="submit" value="查询新闻" class="btn btn-primary">
            </form>
        </div>
    </div>

    <div class="row clearfix">
        <div class="col-md-12 column">
            <table class="table table-hover table-striped">
                <thead>
                <tr>
                    <th>新闻编号</th>
                    <th>新闻标题</th>
                    <th>新闻时间</th>
                    <th>新闻总结</th>
                    <th>新闻作者</th>
                </tr>
                </thead>

                <tbody>
                <c:forEach var="news" items="${requestScope.get('list')}">
                    <tr>
                        <td>${news.getId()}</td>
                        <td><a href="${pageContext.request.contextPath}/news/toUserContentNews?id=${news.getId()}">${news.getHead()}</a></td>
                        <td>${news.getDate()}</td>
                        <td>${news.getSummary()}</td>
                        <td>${news.getAuthor()}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

</body>
</html>
