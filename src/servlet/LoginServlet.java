package servlet;

import dao.UserDao;
import dao.UserDaoImpl;
import dao.DaoException;
import bean.*;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "LoginServlet", value = "/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ServletContext context = this.getServletContext();

        String identify = request.getParameter("identify");
        String id_str = request.getParameter("id");
        String password = request.getParameter("password");
        String note = null;
        if(id_str.length() == 0 || password.length() == 0) {
            note = "账号密码不能为空";
        } else {
            int id = Integer.parseInt(id_str);

            if (identify.equals("administrator")) {

                UserDao dao = new UserDaoImpl();
                try {
                    Administrator administrator = dao.login_adm(id, password);
                    if (administrator != null) {
                        System.out.println("登陆成功");
                        int adm_id = administrator.getId();
                        System.out.println("账号："+adm_id);
                        context.setAttribute("myself",administrator);
                        request.setAttribute("myself",administrator);

                        // 跳转管理员主页面
//                        RequestDispatcher rd = request.getRequestDispatcher("/jsp/administrator/adm_homepage.jsp");
//                        rd.forward(request, response);
                    } else {
                        note = "账号不存在或密码错误，请重新登录";
                    }
                } catch (DaoException e) {
                    note = "数据库查询错误";
                    System.out.println("e" + e);
                }

            } else if (identify.equals("student")) { // 身份为学生
                UserDao dao = new UserDaoImpl();

                try {
                    Student student = dao.login_stu(id,password);
                    if (student != null) {
                        System.out.println(student.toString());

                        context.setAttribute("myself",student);
                        request.setAttribute("myself",student);

                        // 跳转学生主页面
//                        RequestDispatcher rd = request.getRequestDispatcher("/jsp/student/stu_homepage.jsp");
//                        rd.forward(request, response);
                    } else {
                        note = "账号不存在或密码错误，请重新登录";
                    }
                } catch (DaoException e) {
                    note = "数据库查询错误";
                    System.out.println("e" + e);
                }
            }
        }

        request.setAttribute("note",note);
        RequestDispatcher rd = request.getRequestDispatcher("/jsp/login.jsp");
        rd.forward(request, response);
    }
}
