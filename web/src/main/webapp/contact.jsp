<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctx" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Home</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <link rel="stylesheet" href="css/style.css">
    <style type="text/css">
        .panel {
            padding: 120px 20px 0px;
            min-height: 600px;
        }
        
        .text-center {
            margin: 0 auto;
            text-align: center;
            border-radius: 10px;
            max-width: 900px;
        }
        
        .padding-big {
            padding: 30px;
        }
        
        .padding-big span {
            margin: 10px;
        }
        
        .padding-big a {
            font-size: 14px;
            display: inline-block;
            padding: 4px 8px;
            border: 1px solid #009a61;
            background-color: #fff;
            color: #009a61;
            border-radius: 5px;
        }
        
        .padding-big a:hover {
            font-size: 14px;
            display: inline-block;
            padding: 4px 8px;
            border: 1px solid #009a61;
            background-color: #009a61;
            color: #fff;
            border-radius: 5px;
        }
    </style>
</head>

<body>
    <header>
        <nav class="navbar navbar-default" id="navbar">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#header-navbar" aria-expanded="false">
                        <span class="sr-only"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <h1 class="logo">
                        <a href="#">小孔的博客</a>
                    </h1>
                </div>
                <div class="collapse navbar-collapse" id="header-navbar">
                    <form class="navbar-form visible-xs" action="#" method="POST">
                        <div class="input-group">
                            <input type="text" name="keyword" class="form-control" placeholder="请输入关键字" maxlength="20" autocomplete="off">
                            <span class="input-group-btn">
                                <button type="submit" class="btn btn-default btn-search">搜索</button>
                            </span>
                        </div>
                    </form>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="index.jsp">首页</a></li>
                        <c:if test="${not empty admin}">
                            <li><a href="${ctx}/write">写博客</a></li>
                            <li><a href="${ctx}/loginOut">退出登录</a></li>
                        </c:if>
                        <li><a href="404.jsp">关于</a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>

    <div class="container">
        <div class="panel">
            <div class="text-center">
                <h3>
                    <stong><p>作者：小孔</p>
                    <p>联系电话：15972228122</p>
                        <p>前端模板作者：<a href="https://github.com/jiuri0624/reedo-blog-templates">https://github.com/jiuri0624/reedo-blog-templates</a></p>
                    <p>本项目地址：<a href="https://github.com/kzlibai/kkblog2">https://github.com/kzlibai/kkblog2</a></p></stong>
                </h3>
                <div class="padding-big">
                    <span><a href="index.jsp">返回首页</a></span>

                </div>
            </div>
        </div>
    </div>

    <div class="footer ">
        <div class="container ">
            <p>Copyright &copy; 2019.Kzewen</p>
        </div>
    </div>



    <script src="js/jquery-3.0.0.min.js"></script>
    <script src="js/bootstrap.min.js "></script>
</body>

</html>