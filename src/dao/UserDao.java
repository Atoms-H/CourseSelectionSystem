package dao;

import bean.Administrator;
import bean.Question;
import bean.Student;

import java.sql.SQLException;
import java.util.List;

/**
 * 接口：扩展Dao接口，声明需要执行的数据库操作方法
 */
public interface UserDao extends Dao{
    // 管理员登录
    public Administrator login_adm (int id, String psw) throws DaoException;

    // 学生登录
    public Student login_stu (int id, String psw) throws DaoException;

    //检索智能教务沟通数据库
    public List<Question> selectAll() throws DaoException, SQLException;
}
