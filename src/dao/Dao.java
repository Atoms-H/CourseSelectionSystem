package dao;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;

/**
 * 接口：查找并返回数据源对象
 */
public interface Dao {
    /*
    查找并返回数据源对象
     */
    public static DataSource getDataSource() {
        DataSource dataSource = null; // 数据源对象
        try{
            Context context = new InitialContext();
            dataSource = (DataSource) context.lookup("java:comp/env/jdbc/courseSelectionDS");
        } catch (NamingException ne) {
            System.out.println("ne"+ne);
        }
        return dataSource; // 返回数据源对象
    }

    /*
    返回连接对象方法
     */
    public default Connection getConnection() throws DaoException {
        DataSource dataSource = getDataSource();
        Connection conn = null;
        try {
            conn = dataSource.getConnection();
        } catch (SQLException throwables) {
            System.out.println("throwables"+throwables);
        }
        return conn;
    }
}