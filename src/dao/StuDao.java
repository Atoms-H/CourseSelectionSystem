package dao;

import bean.Student;
import com.alibaba.fastjson.JSONObject;

import java.util.ArrayList;

public interface StuDao extends Dao{
    ArrayList<JSONObject> getRecCourseList(Student student) throws DaoException;

    ArrayList<JSONObject> getSelectedList(Student student) throws DaoException;

    ArrayList<JSONObject> getAllCourseList(Student student) throws DaoException;
}
