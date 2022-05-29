<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>选择教务沟通方式</title>
    <script src="${pageContext.request.contextPath}js/jquery-3.3.1.min.js"></script>
    <link href="${pageContext.request.contextPath}/bootstrap-5.1.3-dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/css/stu_homepage.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/css/stu_selectcomm.css" rel="stylesheet"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap-5.1.3-dist/js/bootstrap.min.js"></script>
</head>

<header class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow" style="height: 60px">
    <a class="navbar-brand col-md-3 col-lg-2 me-0 px-3" href="#">教务沟通（学生）</a>
    <div class="navbar-nav">
        <div class="nav-item text-nowrap">
            <a class="nav-link px-3" href="${pageContext.request.contextPath}/jsp/login.jsp">退出登录</a>
        </div>
    </div>
</header>

<body>
<div class="bg">
    <div class="front-bg">
        <div>
            <h3>欢迎来到教务沟通系统，请选择你需要的沟通方式</h3>
        </div>
        <div>
            <h5>建议先前往智能教务沟通查找你所需要的问题，如果问题得不到解决再尝试人工教务沟通，将由管理员回复你的问题，人工服务可能需要等待一段时间。</h5>
        </div>
        <div class="container">
            <div class="row clearfix">
                <div class="col-md-6 column" >
                    <input type="button" value="人工教务沟通" class="button-a">
                </div>
                <div class="col-md-6 column" >
                    <input type="button" value="智能教务沟通" class="button-b" onclick="intelli()">
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    function intelli() {
        window.location.href="http://localhost:8080/CourseSelectionSystem_war_exploded/StuIntelliCommServlet";
    }
</script>
</html>
