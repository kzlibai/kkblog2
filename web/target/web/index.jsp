<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctx" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Home</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen"
          href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="css/style.css">
</head>

<body>


<header>
    <nav class="navbar navbar-default" id="navbar">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                        data-target="#header-navbar" aria-expanded="false">
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
                <%--根据文章标题进行搜索--%>
                <form class="navbar-form visible-xs" action="findBlog" method="POST">
                    <div class="input-group">
                        <input type="text" name="keyword" class="form-control" placeholder="请输入关键字" maxlength="20"
                               autocomplete="off">
                        <span class="input-group-btn">
                                <button type="submit" class="btn btn-default btn-search">搜索</button>
                            </span>
                    </div>
                </form>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="index.jsp">首页</a></li>
                    <%--如果登录了，就具有写博客的功能--%>
                    <c:if test="${not empty admin}">
                        <li><a href="${ctx}/write">写博客</a></li>
                        <li><a href="${ctx}/loginOut">退出</a></li>
                    </c:if>
                    <c:if test="${empty admin}">
                        <li><a href="login.jsp">登录</a></li>
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
            <div class="introBanner">
                <h3>Kzewen</h3>
                <p>好好学习，万事胜意！</p>
            </div>
            <!--<div class="content-wrap">-->
            <div class="content">
                <div class="title">
                    <h3>最新发布</h3>
                    <div class="more">
                        <a href="#">javaSE</a>
                        <a href="#">框架</a>
                        <a href="#">中间件</a>
                        <a href="#">开发工具</a>
                        <a href="#">异常记录</a>
                        <a href="#">生活笔记</a>
                    </div>
                </div>
                <!-----------------↓↓↓↓↓↓↓↓↓文章↓↓↓-------------------------------->
                <div id="articleDiv">
                    <%--pageBean.list的意思是pageBean的属性list--%>
                    <c:forEach var="cont" items="${pageBean.list}" varStatus="i">
                        <div class="excerpt">
                            <header id="title_header">
                                <a id="title_cat" class="cat" href="#">${cont.category}<i></i></a>
                                <h2><a id="title_con" href="${ctx}/article?title=${cont.title}">${cont.title}</a></h2>
                            </header>
                                <%--博客内容 文字内容超过三行以后就用省略号代替--%>
                            <p id="article"
                               style="overflow: hidden;text-overflow: ellipsis;display: -webkit-box;-webkit-line-clamp: 3;-webkit-box-orient: vertical;">
                                    ${cont.content}</p>
                            <p class="meta">
                                <a class="category" href="#"><i
                                        class="glyphicon glyphicon-folder-open"></i> ${cont.category}</a>
                                <a class="time" href="#"><i class="glyphicon glyphicon-time"></i> 2019-4-20</a>
                                <a class="views" href="#"><i class="glyphicon glyphicon-eye-open"></i> 88</a>
                                <a class="comment" href="#"><i class="glyphicon glyphicon-comment"></i> 10</a>
                            </p>
                        </div>
                    </c:forEach>
                </div>
                <!----------------↑↑↑↑↑↑文章↑↑↑↑↑↑------------------------------>


                <nav aria-label="Page navigation">
                    <ul class="pagination">
                        <c:if test="${pageBean.currentPage <= 1}">
                            <li><a href="#" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a></li>
                        </c:if>
                        <c:if test="${pageBean.currentPage > 1}">
                            <li><a href="${ctx}/findAllByPage?pageNum=${pageBean.currentPage-1}&pageSize=5"
                                   aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a></li>
                        </c:if>
                        <c:forEach begin="1" end="${pageBean.totalPage}" var="pn">
                            <c:if test="${pageBean.currentPage == pn}">
                                <li><a href="#" id>${pn}</a></li>
                            </c:if>
                            <c:if test="${pageBean.currentPage != pn}">
                                <li><a href="${ctx}/findAllByPage?pageNum=${pn}&pageSize=5" id>${pn}</a></li>
                            </c:if>
                        </c:forEach>
                        <c:if test="${pageBean.currentPage >= pageBean.totalPage}">
                            <li>
                                <a href="#" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </c:if>
                        <c:if test="${pageBean.currentPage < pageBean.totalPage}">
                            <li>
                                <a href="${ctx}/findAllByPage?pageNum=${pageBean.currentPage + 1}&pageSize=5"
                                   aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </c:if>
                    </ul>
                </nav>
            </div>
            <!--</div> 对应conten_wrap-->
        </div>
    </div>
</div>

<div class="footer">
    <div class="container">
        <p>Copyright &copy; 2019.Kzewen</p>
    </div>
</div>

<!--<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>-->
<script src="js/jquery-3.0.0.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script>
    $(document).ready(function () {

        /* $("#title_cat").append("<h1>测试一下</h1>")*/
        /*获取article数据*/
        /*  $.ajax({
                  type:'POST',
                  /!*contentType:'application/json;charset=UTF-8',*!/
                  url:'/findAllByPage',
                  data:({"pageNum":"1","pageSize":"5"}),
                  datatype:'json',
                  success:function (res) {


                      var list = res.list;
                      console.log(list);
                     $.each(list,function(key,value){

                         $("#articleDiv").append("  <div class='excerpt'><header id='title_header'><a id='title_cat' class='cat' href='#'>"
                         +value["category"]+"<i></i></a><h2><a id='title_con' href='#'>"
                         +value["title"]+"</a></h2></header><p id='article'>"
                         +value["content"]+"</p><p class='meta'><a class='category' href='#'><i class='glyphicon glyphicon-folder-open'></i> "
                         +value["category"]+"</a><a class='time' href='#'><i class='glyphicon glyphicon-time'></i> "
                         +"2020-3-4"+"</a><a class='views' href='#'><i class='glyphicon glyphicon-eye-open'></i> "
                         +"1"+"</a><a class='comment' href='#'><i class='glyphicon glyphicon-comment'></i> "
                         +"2"+"</a> </p> </div>");
                     })

                  }
              }
          )*/

    });
</script>

</body>

</html>