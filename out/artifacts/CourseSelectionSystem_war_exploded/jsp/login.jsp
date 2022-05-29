<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>个性化智能选课系统</title>
    <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
    <link href="${pageContext.request.contextPath}/bootstrap-5.1.3-dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/css/loginpage.css" rel="stylesheet"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap-5.1.3-dist/js/bootstrap.min.js"></script>
</head>
<body class="text-center">
<main class="form-signin">
    <form action="http://localhost:8080/CourseSelectionSystem_war_exploded/LoginServlet" method="post">
        <img src="https://img.icons8.com/color/50/000000/scaler-academy.png" class="picture"/>
        <h1 class="title">个性化智能选课系统</h1>

        <div class="select">
            <div class="form-check">
                <input id="student" value="student" name="identify" type="radio" class="form-check-input" checked="" required="">
                <label class="form-check-label" for="student">学生</label>
            </div>
            <div class="form-check">
                <input id="administrator" value="administrator" name="identify" type="radio" class="form-check-input" required="">
                <label class="form-check-label" for="administrator">管理员</label>
            </div>
        </div>

        <div class="form-floating">
            <input type="text" class="form-control" id="floatingInput" name="id" placeholder="请输入账号">
            <label for="floatingInput">账号</label>
        </div>
        <div class="form-floating">
            <input type="password" class="form-control" id="floatingPassword" name="password" placeholder="请输入密码">
            <label for="floatingPassword">密码</label>
        </div>

        <div class="alert alert-danger" id="warn" style="margin:20px 50px;">
            ${requestScope.note}
        </div>
        <script>
            <!--不存在值的时候不显示div-->
            var warn = "" + <%=request.getAttribute("note")%>;
            if(warn.value==null) {
                document.getElementById('warn').style.display="none";
            } else {
                document.getElementById("warn").style.display="block";
            }
        </script>

        <div class="submit">
            <button id="btn1" type="submit" class="btn btn-primary btn-lg px-4 gap-3">登录</button>
            <button type="button" class="btn btn-outline-secondary btn-lg px-4" onclick="reg()">注册</button>
        </div>

    </form>
</main>
</body>
<script>
    function reg() {
        //window.location.href="http://localhost:8080/CourseSelectionSystem_war_exploded/jsp/student/stu_reg.jsp";
    }
</script>
</html>