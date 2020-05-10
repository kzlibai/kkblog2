<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctx" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>博客页面</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <link rel="stylesheet" href="css/style.css">
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
                            <li><a href="${ctx}/deleteBlog">删除</a></li>
                            <li><a href="${ctx}/updateBlog">修改</a></li>
                            <li><a href="${ctx}/loginOut">退出登录</a></li>
                        </c:if>

                        <li><a href="404.jsp">关于</a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>

    <div class="container">
        <div class="row">
            <div class="col-md-10 col-md-offset-3">
        <div class="content-wrap">
            <div class="content">
                <%--显示文章的内容--%>

                <header class="article-header">
                    <h1 class="article-title"><a href="#">${article.title}</a></h1>
                    <div class="article-meta ">
                        <span class="item category"><a href="# ">${article.category}</a></span>
                        <span class="item time ">${article.date}</span>
                       <%-- <span class="item tags">标签：<a href="#">架构</a><a href="#">架构</a><a href="#">架构</a></span>--%>
                        <span class="item views"><i class="glyphicon glyphicon-eye-open"></i> 88</span>
                    </div>
                </header>

                <article class="article-content">
                    ${article.content}
                </article>

  <%--=======================================文章显示结束======================--%>
                    <%--评论部分，暂未实现--%>
                    <%-- <div class="title">
                    <h3>评论</h3>
                </div>
                <div class="article-comment">
                    <form action="" method="POST">
                        <input type="text" class="form-control" placeholder="您的昵称（必填）">
                        <input type="text" class="form-control" placeholder="您的邮箱或联系电话（非必填）">
                        <textarea class="form-control" rows="3" placeholder="您的评论或留言（必填）"></textarea>
                        <button type="button" class="btn btn-default">发布评论</button>
                    </form>
                </div>

               <div class="postcomments">
                    <ol class="commentlist">
                        <li class="comment-content"><span class="comment-f">#2</span>
                            <div class="comment-main">
                                <p><a class="name" href="#" target="_blank">zx@reedo.cn</a><span class="time"> 2016/10/28 11:41:03</span><br>不错的网站主题，看着相当舒服</p>
                            </div>
                        </li>
                        <li class="comment-content"><span class="comment-f">#2</span>
                            <div class="comment-main">
                                <p><a class="name" href="#" target="_blank">九日</a><span class="time"> 2016/10/28 11:41:03</span><br>不错的网站主题，看着相当舒服</p>
                            </div>
                        </li>
                    </ol>
                </div>--%>
            </div>

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