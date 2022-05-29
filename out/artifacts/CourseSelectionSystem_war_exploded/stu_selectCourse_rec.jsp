<%--
  Created by IntelliJ IDEA.
  User: 花猪饲养员
  Date: 2022/5/19
  Time: 16:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>选课页面</title>
    <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
    <link href="${pageContext.request.contextPath}/bootstrap-5.1.3-dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/css/stu_homepage.css" rel="stylesheet"/>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap-5.1.3-dist/js/bootstrap.min.js"></script>
    <link href="${pageContext.request.contextPath}/css/stu_selectCourse.css" rel="stylesheet" type="text/css" />
</head>

<header class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow" style="height: 60px">
    <a class="navbar-brand col-md-3 col-lg-2 me-0 px-3" href="#">课程列表</a>
    <div class="navbar-nav">
        <div class="nav-item text-nowrap">
            <a class="nav-link px-3" href="${pageContext.request.contextPath}/jsp/login.jsp">退出登录</a>
        </div>
    </div>
    <!--
    <div class="top-bar">
        <div class="box-top" style="text-align: center">
            <div>
                还有xxx，xxx必修课未选！
            </div>
        </div>
    </div>
    -->
</header>

<body>
<div class="bg">
    <div class="front-bg">
        <div>
            <div><font face="宋体" size="20px">课程推荐</font></div>
            <div class="d-flex flex-column flex-root">
                <div class="tjxk_list" id="courseList">
                </div>
            </div>
        </div>
        <div id="choosedBox">
            <div class="outer" style="width: 40px;" id="side_menu">
                <div class="outer_left" onclick="showHideSide()">
                    <span class="bigger-150 glyphicon glyphicon-arrow-left btn-lg glyphicon-arrow-right icon-arrow-right"></span>

                    <a id="outer_xkxx" href="javascript:" class="outer_left_xkxx">
                        <h5 class="outer_tran">已选列表</h5>
                    </a>
                </div>
                <div class="outer_right" style="overflow: scroll">
                    <div class="outer_right_wrapper mCustomScrollbar _mCS_1 mCS_no_scrollbar" style="position: relative; overflow: visible;"><div id="mCSB_1" class="mCustomScrollBox mCS-light mCSB_vertical_horizontal mCSB_outside" tabindex="0"><div id="mCSB_1_container" class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y mCS_x_hidden mCS_no_scrollbar_x" style="position: relative; top: 0px; left: 0px; width: 740px;" dir="ltr">
                        <div class="w_680" id="sideList">
                            <br><br><br><br><br>
                            <!--
                            <div id="myCourseTableZzxk">
                                <style type="text/css">
                                    .tab-td-padding-5 td, .tab-td-padding-5 th {
                                        padding: 2px 5px !important;
                                    }
                                </style>
                                <table id="xskbtable" class="table table-bordered tab-bor-col-1 tab-td-padding-5" style="font-size:8pt;margin-top:8px">
                                    <tbody><tr><th style="text-align:center;width:20px">节次</th>
                                        <th style="width:12.5rem; text-align: center">星期一</th>
                                        <th style="width:12.5rem; text-align: center">星期二</th>
                                        <th style="width:12.5rem; text-align: center">星期三</th>
                                        <th style="width:12.5rem; text-align: center">星期四</th>
                                        <th style="width:12.5rem; text-align: center">星期五</th>
                                        <th style="width:12.5rem; text-align: center">星期六</th>
                                        <th style="width:12.5rem; text-align: center">星期日</th>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center">1</td>
                                        <td style="background-color: #5cb85c;" id="td_1-1"></td>
                                        <td style="background-color: #5cb85c;" id="td_2-1"></td>
                                        <td style="background-color: #5cb85c;" id="td_3-1"></td>
                                        <td style="background-color: #5cb85c;" id="td_4-1"></td>
                                        <td style="background-color: #5cb85c;" id="td_5-1"></td>
                                        <td style="background-color: #5cb85c;" id="td_6-1"></td>
                                        <td style="background-color: #5cb85c;" id="td_7-1"></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center">2</td>
                                        <td style="background-color: #5cb85c;" id="td_1-2"></td>
                                        <td style="background-color: #5cb85c;" id="td_2-2"></td>
                                        <td style="background-color: #5cb85c;" id="td_3-2"></td>
                                        <td style="background-color: #5cb85c;" id="td_4-2"></td>
                                        <td style="background-color: #5cb85c;" id="td_5-2"></td>
                                        <td style="background-color: #5cb85c;" id="td_6-2"></td>
                                        <td style="background-color: #5cb85c;" id="td_7-2"></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center">3</td>
                                        <td style="background-color: #5cb85c;" id="td_1-3"></td>
                                        <td style="background-color: #5cb85c;" id="td_2-3"></td>
                                        <td style="background-color: #5cb85c;" id="td_3-3"></td>
                                        <td style="background-color: #5cb85c;" id="td_4-3"></td>
                                        <td style="background-color: #5cb85c;" id="td_5-3"></td>
                                        <td style="background-color: #5cb85c;" id="td_6-3"></td>
                                        <td style="background-color: #5cb85c;" id="td_7-3"></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center">4</td>
                                        <td style="background-color: #5cb85c;" id="td_1-4"></td>
                                        <td style="background-color: #5cb85c;" id="td_2-4"></td>
                                        <td style="background-color: #5cb85c;" id="td_3-4"></td>
                                        <td style="background-color: #5cb85c;" id="td_4-4"></td>
                                        <td style="background-color: #5cb85c;" id="td_5-4"></td>
                                        <td style="background-color: #5cb85c;" id="td_6-4"></td>
                                        <td style="background-color: #5cb85c;" id="td_7-4"></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center">5</td>
                                        <td style="background-color: #5cb85c;" id="td_1-5"></td>
                                        <td style="background-color: #5cb85c;" id="td_2-5"></td>
                                        <td style="background-color: #5cb85c;" id="td_3-5"></td>
                                        <td style="background-color: #5cb85c;" id="td_4-5"></td>
                                        <td style="background-color: #5cb85c;" id="td_5-5"></td>
                                        <td style="background-color: #5cb85c;" id="td_6-5"></td>
                                        <td style="background-color: #5cb85c;" id="td_7-5"></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center">6</td>
                                        <td style="background-color: #5cb85c;" id="td_1-6"></td>
                                        <td style="background-color: #5cb85c;" id="td_2-6"></td>
                                        <td style="background-color: #5cb85c;" id="td_3-6"></td>
                                        <td style="background-color: #5cb85c;" id="td_4-6"></td>
                                        <td style="background-color: #5cb85c;" id="td_5-6"></td>
                                        <td style="background-color: #5cb85c;" id="td_6-6"></td>
                                        <td style="background-color: #5cb85c;" id="td_7-6"></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center">7</td>
                                        <td style="background-color: #5cb85c;" id="td_1-7"></td>
                                        <td style="background-color: #5cb85c;" id="td_2-7"></td>
                                        <td style="background-color: #5cb85c;" id="td_3-7"></td>
                                        <td style="background-color: #5cb85c;" id="td_4-7"></td>
                                        <td style="background-color: #5cb85c;" id="td_5-7"></td>
                                        <td style="background-color: #5cb85c;" id="td_6-7"></td>
                                        <td style="background-color: #5cb85c;" id="td_7-7"></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center">8</td>
                                        <td style="background-color: #5cb85c;" id="td_1-8"></td>
                                        <td style="background-color: #5cb85c;" id="td_2-8"></td>
                                        <td style="background-color: #5cb85c;" id="td_3-8"></td>
                                        <td style="background-color: #5cb85c;" id="td_4-8"></td>
                                        <td style="background-color: #5cb85c;" id="td_5-8"></td>
                                        <td style="background-color: #5cb85c;" id="td_6-8"></td>
                                        <td style="background-color: #5cb85c;" id="td_7-8"></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center">9</td>
                                        <td style="background-color: #5cb85c;" id="td_1-9"></td>
                                        <td style="background-color: #5cb85c;" id="td_2-9"></td>
                                        <td style="background-color: #5cb85c;" id="td_3-9"></td>
                                        <td style="background-color: #5cb85c;" id="td_4-9"></td>
                                        <td style="background-color: #5cb85c;" id="td_5-9"></td>
                                        <td style="background-color: #5cb85c;" id="td_6-9"></td>
                                        <td style="background-color: #5cb85c;" id="td_7-9"></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center">10</td>
                                        <td style="background-color: #5cb85c;" id="td_1-10"></td>
                                        <td style="background-color: #5cb85c;" id="td_2-10"></td>
                                        <td style="background-color: #5cb85c;" id="td_3-10"></td>
                                        <td style="background-color: #5cb85c;" id="td_4-10"></td>
                                        <td style="background-color: #5cb85c;" id="td_5-10"></td>
                                        <td style="background-color: #5cb85c;" id="td_6-10"></td>
                                        <td style="background-color: #5cb85c;" id="td_7-10"></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center">11</td>
                                        <td style="background-color: #5cb85c;" id="td_1-11"></td>
                                        <td style="background-color: #5cb85c;" id="td_2-11"></td>
                                        <td style="background-color: #5cb85c;" id="td_3-11"></td>
                                        <td style="background-color: #5cb85c;" id="td_4-11"></td>
                                        <td style="background-color: #5cb85c;" id="td_5-11"></td>
                                        <td style="background-color: #5cb85c;" id="td_6-11"></td>
                                        <td style="background-color: #5cb85c;" id="td_7-11"></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center">12</td>
                                        <td style="background-color: #5cb85c;" id="td_1-12"></td>
                                        <td style="background-color: #5cb85c;" id="td_2-12"></td>
                                        <td style="background-color: #5cb85c;" id="td_3-12"></td>
                                        <td style="background-color: #5cb85c;" id="td_4-12"></td>
                                        <td style="background-color: #5cb85c;" id="td_5-12"></td>
                                        <td style="background-color: #5cb85c;" id="td_6-12"></td>
                                        <td style="background-color: #5cb85c;" id="td_7-12"></td>
                                    </tr>
                                    <tr>
                                        <td colspan="8">
                                            <div class="col-md-12 col-sm-12">
                                                <div class="col-md-4 col-sm-4"><p style="margin-right:5px;float:left;background-color:#5cb85c;height:15px;width:30px;"></p>空余周数 =总周数</div>
                                                <div class="col-md-4 col-sm-4"><p style="margin-right:5px;float:left;background-color:#f0ad4e;height:15px;width:30px;"></p>空余周数 &gt;=(总周数/2)</div>
                                                <div class="col-md-4 col-sm-4"><p style="margin-right:5px;float:left;background-color:#d9534f;height:15px;width:30px;"></p>空余周数 &lt;(总周数/2)</div>
                                            </div>
                                        </td>
                                    </tr>
                                    </tbody></table>
                                <script type="text/javascript">
                                    $(function(){
                                    });
                                </script>
                            </div>
                            <div class="right_div">
                                <div id="right_12102940" class="outer_xkxx_list">
                                    <h6>(12102940)专业综合技能实习 - 10.0 学分
                                        <span class="pull-right"></span>
                                    </h6>
                                    <table class="right_table_head">
                                        <thead>
                                            <tr>
                                                <td class="h_num"></td>
                                                <td class="arraw-px" style="display: none;"></td>
                                                <td class="h_sxbj"></td>
                                                <td class="h_jxb"></td>
                                                <td class="h_teacher"></td>
                                                <td class="h_time"></td>
                                                <td class="h_addr"></td>
                                                <td class="h_zixf"></td>
                                                <td class="h_cz"></td>
                                            </tr>
                                        </thead>
                                    </table>
                                    <ul id="right_ul_12102940" class="list-group" data-listidx="0">
                                        <input type="hidden" name="right_kchid" value="12102940">
                                        <input type="hidden" id="right_xf_12102940" name="right_xf" value="10.0">
                                        <input type="hidden" name="right_kklxpx" value="5">
                                        <input type="hidden" name="right_cxbj" value="0">
                                        <li id="right_DBEB8353AF55BEEAE0530B0D010AD2BA" class="list-group-item" data-itemidx="0" style="cursor: pointer;">
                                            <div class="item" style="cursor: pointer;">
                                                <table width="100%">
                                                    <tbody>
                                                        <tr>
                                                            <td><p class="num">1</p></td>
                                                            <td class="arraw-px" style="display: none;"><a class="fa fa-arrow-up padding-lr10" href="javascript:void(0);"></a><br><a class="fa fa-arrow-down padding-lr10" href="javascript:void(0);"></a></td>
                                                            <td><p class="sxbj"><font color="red"><i>待筛选</i></font></p></td>
                                                            <td><p class="jxb" title="(2022-2023-1)-12102940-1">(20…</p></td>
                                                            <td><p class="teachers popover-demo" title="袁健(副教授)"><span>袁健</span>副教授</p></td>
                                                            <td><p class="time">--</p></td>
                                                            <td><p class="addr">--</p></td>
                                                            <td nowrap=""><p class="zixf">自选上</p></td>
                                                            <td><p class="but"><button class="btn btn-danger btn-sm" onclick="cancelCourseZzxk('rightpage','DBEB8353AF55BEEAE0530B0D010AD2BA','2c4087ace1bec147e6deb84f63674c2b3aea01f7ea322b08971d5fb03a0522e1ac9fc3ced7ad7676ed537c53207fbd34fc5d7746de9f712a631177ee8f38c12f00cc8ad10987afa0cbbf523028cbd256568f57345bc25ba6e06b5ad1b9f2cc4e1cb406f0de9982f989d796facf5c8ca6451f29a0735928b28546afb5064525a9','12102940','1','DEDE3F9524683332E0530B0D010A28CF')" type="button">退选</button></p></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <input type="hidden" name="right_sub_kchid" value="12102940">
                                            <input type="hidden" name="right_jxb_id" value="DBEB8353AF55BEEAE0530B0D010AD2BA">
                                            <input type="hidden" name="right_qz" value="0">
                                            <input type="hidden" name="right_jxbzls" value="1">
                                            <input type="hidden" name="right_kklxdm" value="01">
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            -->
                        </div>
                    </div></div><div id="mCSB_1_scrollbar_vertical" class="mCSB_scrollTools mCSB_1_scrollbar mCS-light mCSB_scrollTools_vertical" style="display: none;"><div class="mCSB_draggerContainer"><div id="mCSB_1_dragger_vertical" class="mCSB_dragger" style="position: absolute; min-height: 30px; height: 0px; top: 0px;" oncontextmenu="return false;"><div class="mCSB_dragger_bar" style="line-height: 30px;"></div></div><div class="mCSB_draggerRail"></div></div></div><div id="mCSB_1_scrollbar_horizontal" class="mCSB_scrollTools mCSB_1_scrollbar mCS-light mCSB_scrollTools_horizontal" style="display: none;"><div class="mCSB_draggerContainer"><div id="mCSB_1_dragger_horizontal" class="mCSB_dragger" style="position: absolute; min-width: 30px; display: block; width: 0px; max-width: 723px; left: 0px;" oncontextmenu="return false;"><div class="mCSB_dragger_bar"></div></div><div class="mCSB_draggerRail"></div></div></div></div>
                </div>
                <!-- 排序保存在这里可以检索服务器上的回传 -->
                <input name="list1SortOrder" type="hidden">
            </div>
            <div class="text-center">
                <a href="stu_selectCourse_all.jsp" class="link-primary fw-bolder" style="text-decoration: none">没有喜欢的课程？点此查看所有课程</a>
            </div>
        </div>
    </div>
</div>
<select name="select">
    <option></option>
</select>

<div class="modal fade" id="fullCapacity" style="display: none" data-keyboard="true" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
            </div>
            <div class="modal-body">
                当前教学班人数已满！请选择其他班级
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="modalFullHide()">Understood</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="timeConflict" style="display: none" data-keyboard="true" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
            </div>
            <div class="modal-body">
                当前教学班与已选课程时间冲突！请检查后选择其他班级
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="modalTimeHide()">Understood</button>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    function modalFullHide(){
        document.getElementById('fullCapacity').style.setProperty('display','none');
        $("#fullCapacity").removeClass('show');
    }

    function modalTimeHide(){
        document.getElementById('timeConflict').style.setProperty('display','none');
        $("#timeConflict").removeClass('show');
    }

    function showHideJxb(obj){
        if($(obj).children(".expand_close").attr("class").indexOf("expand1")>0){
            if($("#xkkczdsqkg").val()=="1"){
                //打开一门课程的教学班列表的同时，关闭其他课程下的教学班列表
                $(".tjxk_list .panel-heading .expand_close").each(function(index,item){
                    if($(item).attr("class").indexOf("close1")>0){
                        $(item).removeClass('close1').addClass('expand1');
                        $(item).parent().parent().find(".panel-body").slideUp();
                    }
                });
            }
            $(obj).children(".expand_close").removeClass('expand1').addClass('close1');
            $(obj).next(".panel-body").slideDown();
        }else{
            $(obj).children(".expand_close").removeClass('close1').addClass('expand1');
            $(obj).next(".panel-body").slideUp();
        }
    }
</script>

<script type="text/javascript">
    function showHideSide(){
        let oldStyle=document.getElementById("side_menu").style;
        let oldWidth=oldStyle.width;
        if(oldWidth=='40px'){
            oldStyle.setProperty('width','800px');
        }
        else
            oldStyle.setProperty('width','40px');
    }
</script>

<script type="text/javascript">
    function selectCourse(obj, courseID){
        if($(obj).children(".btn").attr("class").indexOf("btn-primary")>0) {
            var capStr=document.getElementById('capacity-'+courseID).textContent.split('/');
            if(capStr[0]==capStr[1]){
                document.getElementById('fullCapacity').style.setProperty('display','block');
                $("#fullCapacity").addClass('show');
            }
            else {
                var time = $(obj).parents("tr").children("td:nth-child(3)").text();
                var flag=true;
                $("input[name='course-time']").each(function (){
                    if($(this).val()==time){
                        document.getElementById('timeConflict').style.setProperty('display','block');
                        $("#timeConflict").addClass('show');
                        flag=false;
                        return;
                    }
                });
                if(!flag)
                    return;
                var teacherName = $(obj).parents("tr").children("td:nth-child(1)").text();
                var location = $(obj).parents("tr").children("td:nth-child(2)").text();
                var courseName = document.getElementById(courseID).textContent;
                var credit = document.getElementById('credit-' + courseID).textContent;
                var courseType = document.getElementById('type-' + courseID).value;
                //alert(teacherName + " " + time + " " + location + " " + courseName + " " + credit + " " + courseType);
                $(obj).children(".btn").removeClass("btn-primary").addClass("btn-danger");
                $(obj).children(".btn").text("Cancel");
                var newDiv = "<div class='right_div'>"
                    + "<div id='side-" + courseID + "' class='outer_xkxx_list'>"
                    + "<h6>(" + courseID + ")" + courseName + " - " + credit + " 学分<span class='pull-right'></span></h6>"
                    + "<ul class='list-group' data-listidx='0'>"
                    + "<li class='list-group-item' data-itemidx='0' style='cursor: pointer;'>"
                    + "<div class='item' style='cursor: pointer;'>"
                    + "<table width='100%'><tbody><tr>"
                    + "<td><p class='num'>" + courseType + "</p></td>"
                    + "<td class='arraw-px' style='display: none;'><a class='fa fa-arrow-up padding-lr10' href='javascript:void(0);'></a><br><a class='fa fa-arrow-down padding-lr10' href='javascript:void(0);'></a></td>"
                    + "<td><p class='teachers popover-demo' title='" + teacherName + "'><span>" + teacherName + "</span></p></td>"
                    + "<td><p class='time'>" + time + "</p></td>"
                    + "<input type='hidden' name='course-time' value='"+time+"'>"
                    + "<td><p class='addr'>" + location + "</p></td>"
                    + "<td><p class='but'><a href='#' onclick='selectCourse(this," + courseID + ")'><button class='btn btn-danger btn-sm' type='button'>Cancel</button></a></p></td></tr></tbody></table></div></li></ul></div></div>"
                    + "<div class='clearfix'></div>";
                $("#sideList").append(newDiv);
            }
        }
        else {
            var removeStr="#side-"+courseID;
            $(removeStr).remove();
            removeStr="#btn-"+courseID;
            $(removeStr).removeClass('btn-danger').addClass('btn-primary');
            $(removeStr).text("Get");
        }
    }
</script>

<script type="text/javascript">
    $(document).ready(function (){
        getRecCourseList();
        getSideList();
    });

    function getRecCourseList() {
        $.ajax({
            type: "POST",
            async: true,
            url: "GetRecCourseListServlet",
            data: {
            },
            dataType: "json",
            success: function (json) {
                var list = JSON.stringify(json)
                list = eval('(' + list + ')');
                $("#courseList").empty();
                var str = "<h4 class='tjxk_title'></h4>"
                for (var i = 0; i < list.length; i++) {
                    str+="<div class='panel panel-info' style='width: 95%;margin: 0 auto'>"
                        +"<div class='panel-heading kc_head' onclick='showHideJxb(this)' style='background-color: #77DDFF;border-radius: 5px'>"
                            +"<div class='panel-title'>"
                                +"<span class='kcmc' style='font-size: 1.5rem;text-align: match-parent;color: black'>("+list[i]['courseID']+")"
                                    +"<a href='javascript:void(0);' id='"+list[i]['courseID']+"' style='text-decoration: none' onclick='showCourseInfo(\" "+list[i]['courseID']+" \")'>"+list[i]['courseName']+"</a>-"
                                    +"<i id='credit-"+list[i]['courseID']+"'>"+list[i]['credit']+"</i> 学分</span></div>"
                            +"<a href='#' class='expand_close close1'>下拉</a></div>"
                        +"<div class='panel-body table-responsive' style='display: none;'>"
                            +"<table class='table table-hover'><thead><tr>"
                                    +"<th nowrap width='5%'>任课教师</th>"
                                    +"<th nowrap width='10%'>地点</th>"
                                    +"<th nowrap width='10%'>上课时间</th>"
                                    +"<th nowrap width='10%'>已选/容量</th>"
                                    +"<th nowrap width='10%'></th></tr></thead>"
                                +"<tbody>";
                    for(var j=0;j<list[i]['classSet'].length;j++){
                        str+="<tr class='body_tr'>"
                            +"<td class='kch_id'>"+list[i]['classSet'][j][0]+"</td>"
                            +"<td class='kch_id'>"+list[i]['classSet'][j][1]+"</td>"
                            +"<td class='kch_id'>"+list[i]['classSet'][j][2]+"</td>"
                            +"<td class='kch_id' id='capacity-"+list[i]['courseID']+"'>"+list[i]['classSet'][j][3]+"/"+list[i]['capacity']+"</td>"
                            +"<td class='kch_id'><a href='#' onclick='selectCourse(this,"+list[i]['courseID']+")'><button id='btn-"+list[i]['courseID']+"' class='btn btn-sm btn-primary'>Get</button></a></td></tr>";
                    }
                    str+="</tbody></table></div></div><br>";
                    str+="<input type='hidden' id='type-"+list[i]['courseID']+"' value='"+list[i]['courseType']+"'/>"
                }
                $("#courseList").append(str);
            },
            complete: function () {
            },
            error: function (xhr, textStatus, errorThrown) {
                alert("进入error---1");
                alert("状态码：" + xhr.status);
                alert("状态:" + xhr.readyState);//当前状态,0-未初始化，1-正在载入，2-已经载入，3-数据进行交互，4-完成。
                alert("错误信息:" + xhr.statusText);
                alert("返回响应信息：" + xhr.responseText);//详细信息
                alert("请求状态：" + textStatus);
                alert(errorThrown);
                alert("请求失败");
            }
        });
    }

    function getSideList() {
        $.ajax({
            type: "POST",
            async: true,
            url: "GetSideListServlet",
            data: {
            },
            dataType: "json",
            success: function (json) {
                var list = JSON.stringify(json)
                list = eval('(' + list + ')');
                for (var i = 0; i < list.length; i++) {
                    var str="<div class='right_div'>"
                        + "<div id='side-"+list[i]['courseID']+"' class='outer_xkxx_list'>"
                        + "<h6>(" + list[i]['courseID'] + ")" + list[i]['courseName'] + " - " + list[i]['credit'] + " 学分<span class='pull-right'></span></h6>"
                        + "<ul class='list-group' data-listidx='0'>"
                        + "<li class='list-group-item' data-itemidx='0' style='cursor: pointer;'>"
                        + "<div class='item' style='cursor: pointer;'>"
                        + "<table width='100%'><tbody><tr>"
                        + "<td><p class='num'>" + list[i]['courseType'] + "</p></td>"
                        + "<td class='arraw-px' style='display: none;'><a class='fa fa-arrow-up padding-lr10' href='javascript:void(0);'></a><br><a class='fa fa-arrow-down padding-lr10' href='javascript:void(0);'></a></td>"
                        + "<td><p class='teachers popover-demo' title='" + list[i]['teacher'] + "'><span>" + list[i]['teacher'] + "</span></p></td>"
                        + "<td><p class='time'>" + list[i]['time'] + "</p></td>"
                        + "<input type='hidden' name='course-time' value='"+list[i]['time']+"'>"
                        + "<td><p class='addr'>" + list[i]['location'] + "</p></td>"
                        + "<td><p class='but'><a href='#' onclick='selectCourse(this,"+list[i]['courseID']+")'><button class='btn btn-danger btn-sm' type='button'>Cancel</button></a></p></td></tr></tbody></table></div></li></ul></div></div>"
                        + "<div class='clearfix'></div>";
                    $("#sideList").append(str);
                }
            },
            complete: function () {
            },
            error: function (xhr, textStatus, errorThrown) {
                alert("进入error---1");
                alert("状态码：" + xhr.status);
                alert("状态:" + xhr.readyState);//当前状态,0-未初始化，1-正在载入，2-已经载入，3-数据进行交互，4-完成。
                alert("错误信息:" + xhr.statusText);
                alert("返回响应信息：" + xhr.responseText);//详细信息
                alert("请求状态：" + textStatus);
                alert(errorThrown);
                alert("请求失败");
            }
        });
    }
</script>
<script src="${pageContext.request.contextPath}/js/stu_selectCourse.js"></script>
<script src="${pageContext.request.contextPath}/js/stu_selectCourse_1.js"></script>
<script src="${pageContext.request.contextPath}/js/stu_selectCourse_2.js"></script>
<script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js"></script>
</body>


</html>

