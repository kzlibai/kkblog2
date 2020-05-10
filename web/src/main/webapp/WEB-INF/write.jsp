<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctx" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Home</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen"
          href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="../css/style.css">
    <%--layui--%>
    <link rel="stylesheet" href="../layui/css/layui.css">
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
                <form class="navbar-form visible-xs" action="#" method="POST">
                    <div class="input-group">
                        <input type="text" name="keyword" class="form-control" placeholder="请输入关键字" maxlength="20"
                               autocomplete="off">
                        <span class="input-group-btn">
                                <button type="submit" class="btn btn-default btn-search">搜索</button>
                            </span>
                    </div>
                </form>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="../index.jsp">首页</a></li>
                    <c:if test="${not empty admin}">
                        <li><a href="${ctx}/loginOut">退出登录</a></li>
                    </c:if>

                    <li><a href="../404.jsp">关于</a></li>
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
                    <div class="col-md-10 col-md-offset-5">
                    <div style="height: 50px"><h2>书写博客</h2></div>
                    </div>
                    <%--开始书写博客--%>
                    <form id="myForm" method="post" class="layui-form white-bg radius" action="doWriteBlog">
                        <div class="layui-form-item"><label class="layui-form-label">标题</label>
                            <div class="layui-input-block">
                                <%--id隐藏,不输入则自动增长--%>

                                <input type="text" class="layui-input" name="title" placeholder="请输入标题" >


                            </div>
                        </div>

                        <div class="layui-form-item">
                            <label class="layui-form-label">类型选择</label>
                            <div class="layui-input-block">
                                <select name="category" lay-verify="required">
                                    <option value=""></option>
                                    <option value="javaSE">javaSE</option>
                                    <option value="框架">框架</option>
                                    <option value="中间件">中间件</option>
                                    <option value="开发工具">开发工具</option>
                                    <option value="异常记录">异常记录</option>
                                    <option value="生活笔记">生活笔记</option>
                                </select>
                            </div>
                        </div>

                        <div class="layui-form-item"><label class="layui-form-label">内容</label>
                            <div class="layui-input-block"><textarea id="lay_edit" lay-verify="content"
                                                                     name="content" placeholder="请输入内容"></textarea></div>
                        </div>


                        <div class="layui-form-item">
                            <div class="layui-input-block">
                                <button id="sub_blog" type="submit" lay-submit="" class="layui-btn layui-btn-radius layui-btn-normal layui-bg-green"
                                        style="width: 150px" lay-filter="formSubmit">发布
                                </button>
                            </div>
                        </div>
                    </form>


                    <%--=======================================博客书写结束======================--%>


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


<script src="../js/jquery-3.0.0.min.js"></script>
<script src="../js/bootstrap.min.js "></script>
<%--layui--%>
<script src="../layui/layui.js"></script>

<script>
    layui.use(['layedit', 'form'], function () {
        var form = layui.form;
        var layedit = layui.layedit;
        layedit.set({	//设置图片接口
            uploadImage: {
                url: '${ctx}/imageUpload', //接口url
                type: 'post'
            }
        });
        //创建一个编辑器
        var index = layedit.build('lay_edit', {height: 400});
        //提交时把值同步到文本域中
        form.verify({            //content富文本域中的lay-verify值
            content: function (value) {
                return layedit.sync(index);
            }
        });
        //表单提交
        form.on("submit(formSubmit)", function (data) {
            console.log(data.field);
        })
    });

</script>
</body>

</html>