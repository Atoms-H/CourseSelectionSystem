package dao;

import bean.Administrator;
import bean.Question;
import bean.Student;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * 实现Dao接口，实现数据库操作方法
 */
public class UserDaoImpl implements UserDao{

    // 管理员登录
    @Override
    public Administrator login_adm(int id, String psw) throws DaoException {
        String sql = "select * from administrator where id = ? and password = ?";
        try(
                Connection conn = getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1,id);
            stmt.setString(2,psw);
            try(ResultSet rs = stmt.executeQuery()) {
                if(rs.next()) {
                    System.out.println("管理员账号密码正确");
                    return new Administrator(rs.getInt("id"),rs.getString("password"), rs.getString("permission")) ;
                }
            }
        } catch (SQLException se) {
            System.out.println("se"+se);
        }
        System.out.println("管理员账号不存在或密码错误");
        return null;
    }

    // 学生登录
    @Override
    public Student login_stu(int id, String psw) throws DaoException {
        String sql = "select * from student where id = ? and password = ?";
        try(
                Connection conn = getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1,id);
            stmt.setString(2,psw);
            try(ResultSet rs = stmt.executeQuery()) {
                if(rs.next()) {
                    System.out.println("学生账号密码正确");
                    return new Student(rs.getInt("id"),rs.getString("password"),rs.getString("name"),
                            rs.getString("institute"), rs.getString("major"),rs.getString("grade"));

                }
            }
        } catch (SQLException se) {
            System.out.println("se"+se);
        }
        System.out.println("学生账号不存在或密码错误");
        return null;
    }

    //检索智能教务沟通数据库
    @Override
    public List<Question> selectAll() throws DaoException, SQLException {
        List<Question> list = new ArrayList<Question>();
        String sql = "select * from question";
        try (
                Connection conn = getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    int id = rs.getInt(1);
                    String content = rs.getString(2);
                    String answer = rs.getString(3);
                    Question question = new Question(id, content, answer);
                    //System.out.println("1");
                    list.add(question);
                }
            } catch (SQLException se) {
                System.out.println("se" + se);
            }
            return list;
        }
    }
}
