<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link
            href="http://apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap.min.css"
            rel="stylesheet">

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script
            src="http://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js">

    </script>
    <title>新闻详情</title>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-10">
            <h3 class="text-muted page-header">This is content</h3>
            <form action="${pageContext.request.contextPath}/news/newsList" method="get" class="form-horizontal">
                <div class="container">
                    <p>	<h3>标题：${contentNews.head}</h3></P>
                    <p><h4>时间：${contentNews.date}</h4></p>
                    <p>内容：</P>
                    <p>${contentNews.body}</P>
                </div>
                <div class="col-md-offset-2 col-md-10 " style="text-align: right">
                    <button type="submit" class="btn btn-default" id="submit0">返回首页</button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
