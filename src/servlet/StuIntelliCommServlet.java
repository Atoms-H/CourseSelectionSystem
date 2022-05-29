package servlet;

import bean.Question;
import dao.DaoException;
import dao.UserDaoImpl;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name="StuIntelliCommServlet" , value = "/StuIntelliCommServlet")
public class StuIntelliCommServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ServletContext context = this.getServletContext();
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        UserDaoImpl userDaoImpl=new UserDaoImpl();
        List<Question> plist = null;
        try {
            plist = userDaoImpl.selectAll();
        } catch (DaoException | SQLException e) {
            e.printStackTrace();
        }
        request.setAttribute("plist", plist);
        //跳转回列表页面
        request.getRequestDispatcher("/jsp/StuIntelliComm.jsp").forward(request, response);
    }
}
