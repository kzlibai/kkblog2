<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctx" value="${pageContext.request.contextPath }"/>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>登录页面</title>
    <!--引入LayUI样式-->
    <link href="${ctx}/layui/css/layui.css" rel="stylesheet">
    <style>
        body {
            background: url("/images/backgroud.jpg") no-repeat center fixed;
        }
    </style>
</head>
<body>

<%--HTML代码--%>


<div id="box" class="layui-row grid-demo layui-container">
    <div class="layui-col-md4 layui-col-md-offset4 layui-bg-cyan" style="border-radius:20px">
        <div style="height: 15px"></div><%--输入框上面那点高度 style="border: red 1px solid"--%>
        <form class="layui-form" action="">
            <div class="layui-form-item">
                <label class="layui-form-label">用户名：</label>
                <div class="layui-input-inline">
                    <input type="text" name="account" required lay-verify="required" placeholder="请输入账号"
                           autocomplete="off" class="layui-input" style="border-radius: 10px">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">密码：</label>
                <div class="layui-input-inline">
                    <input type="password" name="password" required lay-verify="required" placeholder="请输入密码"
                           autocomplete="off" class="layui-input" style="border-radius: 10px">
                </div>
            </div>
            <div class="layui-input-block layui-form-item layui-col-md3">
                <button class="layui-btn layui-btn-radius layui-btn-primary layui-btn layui-btn-lg" lay-submit
                        lay-filter="formDemo">登录
                </button>
            </div>
        </form>
    </div>
</div>


<%--引入layui的js--%>
<script src="${ctx}/layui/layui.js"></script>
<script>
    /*使总体垂直居中*/
    window.onload = function () {
        function box() {
            var oBox = document.getElementById('box');
            var h1 = oBox.offsetHeight;
            var top = (document.documentElement.clientHeight - h1) / 2;
            oBox.style.top = top + 'px';
        }
        box();
        window.onresize = function (ev) {
            box();
        }
    }

    layui.use('form', function () {
        var form = layui.form;
        var $ = layui.$;//使用layui自带的jquery
        //监听提交
        form.on('submit(formDemo)', function (data) {
            console.log(data.field);//data.field是一个对象
            //layer.msg(JSON.stringify(data.field));
            $.ajax({
                type:'POST',
                contentType:'application/json;charset=UTF-8',
                data:JSON.stringify(data.field),
                url:'/login',
                datatype:'json',
                success:function (res) {
                    if(res=='ok'){
                        window.location="index.jsp";
                    }
                    /*console.log(res);*/
                }
            })

            return false;
        });
    });
</script>
</body>
</html>

