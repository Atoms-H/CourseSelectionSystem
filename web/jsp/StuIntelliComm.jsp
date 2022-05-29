<%@ page import="bean.Question" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: 86177
  Date: 2022/5/27
  Time: 16:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>智能教务沟通</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="${pageContext.request.contextPath}js/jquery-3.3.1.min.js"></script>
    <link href="${pageContext.request.contextPath}/bootstrap-5.1.3-dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/css/stu_homepage.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/css/stu_intellicomm.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/css/star.css" rel="stylesheet"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap-5.1.3-dist/js/bootstrap.min.js"></script>
</head>
<header class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow" style="height: 60px">
    <a class="navbar-brand col-md-3 col-lg-2 me-0 px-3" href="#">智能教务沟通（学生）</a>
    <div class="navbar-nav">
        <div class="nav-item text-nowrap">
            <a class="nav-link px-3" href="${pageContext.request.contextPath}/jsp/login.jsp">退出登录</a>
        </div>
    </div>
    <%
        List<Question> list = (List<Question>)request.getAttribute("plist");
    %>
</header>
<script>
    function back() {
        window.location.href="http://localhost:8080/CourseSelectionSystem_war_exploded/jsp/StuSelectComm.jsp";
    }
</script>
<body>
<div class="bg">
    <div class="front-bg">
        <div class="container">
            <div class="item">
                <h5>常见问题</h5>
            </div>
            <div class="item">
                <input type="button" value="返回上一页" class="button-back" onclick="back()">
            </div>
        </div>
        <div>
            <div class="container mt-3">
                <div id="accordion" style="margin-left:40px; margin-right: 40px">
                    <%
                        if(list!=null){
                            for(Question question:list){
                    %>
                    <div class="card">
                        <div class="card-header">
                            <a class="btn" data-bs-toggle="collapse" href="#collapseOne">
                                <%=question.getId() %>.<%=question.getContent() %>
                            </a>
                        </div>
                        <div id="collapseOne" class="collapse show" data-bs-parent="#accordion">
                            <div class="card-body">
                                答：<%=question.getAnswer() %>
                            </div>
                            <div class="container">
                            <div class="item2" style="width: 40%">
                                <h6>你对该问题的解答满意吗？请给出你的满意度  </h6>
                            </div>
                            <div class="item2" style="padding-top: 10px; width: 60%">
                                <div class="star">
                                    <input type="radio" id="rate5" name="rating" value="5">
                                    <label for="rate5" title="Amazing"></label>

                                    <input type="radio" id="rate4" name="rating" value="4">
                                    <label for="rate4" title="Good"></label>

                                    <input type="radio" id="rate3" name="rating" value="3">
                                    <label for="rate3" title="Average"></label>

                                    <input type="radio" id="rate2" name="rating" value="2">
                                    <label for="rate2" title="Not good"></label>

                                    <input type="radio" id="rate1" name="rating" value="1">
                                    <label for="rate1" title="Terrible"></label>
                                </div>
                            </div>
                            </div>
                        </div>
                    </div>
                    <%}
                    }
                    %>
                </div>
            </div>

        </div>
    </div>

</div>
</body>
</html>
