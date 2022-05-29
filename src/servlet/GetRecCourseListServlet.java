package servlet;

import bean.Student;
import com.alibaba.fastjson.JSONObject;
import dao.DaoException;
import dao.StuDao;
import dao.StuDaoImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet(name = "GetRecCourseListServlet", value = "/GetRecCourseListServlet")
public class GetRecCourseListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/json");
        response.setCharacterEncoding("utf-8");
        PrintWriter out=response.getWriter();
        HttpSession session=request.getSession();
        Student student= (Student) session.getAttribute("student");
        StuDao stuDao=new StuDaoImpl();
        ArrayList<JSONObject> json= null;
        try {
            json = stuDao.getRecCourseList(student);
        } catch (DaoException e) {
            e.printStackTrace();
        }
        List<JSONObject> list = json.stream().distinct().collect(Collectors.toList());
        //System.out.print(list);
        out.print(list);
        out.flush();
        out.close();
    }
}
