package dao;

import bean.Student;
import com.alibaba.fastjson.JSONObject;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class StuDaoImpl implements StuDao{

    //获取个性化课程列表
    public ArrayList<JSONObject> getRecCourseList(Student student) throws DaoException {
        ArrayList<JSONObject> jsonArray=new ArrayList<>();
        Map<String,String> selectedMap=new HashMap<>();
        String sqlStr="select * from student_course join student on student_id="+student.getId()+" and semester='"+student.getSemester()+"' and student_id=student.id join course on course_id=course.id and student.semester=course.semester";
        try {
            Connection conn = getConnection();
            PreparedStatement stmt = conn.prepareStatement(sqlStr);
            ResultSet rs=stmt.executeQuery(sqlStr);
            while(rs.next()) {
                int id = rs.getInt("course.id");
                String courseId = Integer.toString(id);
                String courseType = rs.getString("type");
                String[] types = courseType.split("-");
                if (types[0].equals("必修")) {
                    selectedMap.put(courseId, "selected");
                } else if (types[0].equals("选修")) {
                    selectedMap.put(types[3], courseId);
                }
            }
            sqlStr="select * from course where semester='"+student.getSemester()+"' and type like '%"+student.getMajor()+"%' order by type";
            stmt = conn.prepareStatement(sqlStr);
            rs=stmt.executeQuery(sqlStr);
            while(rs.next()){
                boolean flag=false;
                JSONObject json=new JSONObject();
                int courseid=rs.getInt("course.id");
                String courseID=Integer.toString(courseid);
                String courseName=rs.getString("name");
                String courseType=rs.getString("type");
                String[] types = courseType.split("-"); //切分字符串
                if(types[0].equals("必修")){
                    if(selectedMap.containsKey(courseID))
                       flag=true;
                }
                else if(types[0].equals("选修")){
                    if(selectedMap.containsKey(types[3]))
                        flag=true;
                }
                if(!flag){
                    ArrayList<ArrayList<String>> classSet=new ArrayList<>();
                    int credit=rs.getInt("credit");
                    int capacity=rs.getInt("capacity");
                    String sqlTmp="select * from course_teacher join teacher where course_id="+courseid+" and teacher_id=id";
                    PreparedStatement tmpStmt = conn.prepareStatement(sqlTmp);
                    ResultSet tmpRs=tmpStmt.executeQuery(sqlTmp);
                    while(tmpRs.next()){
                        ArrayList<String> classInfo=new ArrayList<>();
                        String teacherName=tmpRs.getString("name");
                        String location=tmpRs.getString("location");
                        String time=tmpRs.getString("time");
                        String selected=Integer.toString(tmpRs.getInt("selected"));
                        classInfo.add(teacherName);
                        classInfo.add(location);
                        classInfo.add(time);
                        classInfo.add(selected);
                        classSet.add(classInfo);
                    }
                    if(types[0].equals("选修"))
                        courseName="选修"+types[3]+"-"+courseName;
                    json.put("courseID",courseID);
                    json.put("courseName",courseName);
                    json.put("courseType",types[0]);
                    json.put("credit",credit);
                    json.put("capacity",capacity);
                    json.put("classSet",classSet);
                    jsonArray.add(json);
                }
            }
            conn.close();
        }catch(SQLException e) {e.printStackTrace();}
        return jsonArray;
    }

    @Override
    public ArrayList<JSONObject> getSelectedList(Student student) throws DaoException {
        ArrayList<JSONObject> jsonArray=new ArrayList<>();
        String sqlStr="select * from student_course join course on course_id=course.id and semester='"+student.getSemester()+"' join course_teacher on course_teacher.teacher_id=student_course.teacher_id and course_teacher.course_id=student_course.course_id join teacher on student_course.teacher_id=teacher.id";
        try {
            Connection conn = getConnection();
            PreparedStatement stmt = conn.prepareStatement(sqlStr);
            ResultSet rs=stmt.executeQuery(sqlStr);
            while(rs.next()) {
                JSONObject json=new JSONObject();
                int id = rs.getInt("course.id");
                String courseId = Integer.toString(id);
                String courseType = rs.getString("type");
                String[] types = courseType.split("-");
                int credit=rs.getInt("course.credit");
                String courseName=rs.getString("course.name");
                String teacherName=rs.getString("teacher.name");
                String time=rs.getString("time");
                String location=rs.getString("course_teacher.location");
                json.put("courseID",courseId);
                json.put("courseName",courseName);
                json.put("credit",credit);
                json.put("courseType",types[0]);
                json.put("teacher",teacherName);
                json.put("time",time);
                json.put("location",location);
                jsonArray.add(json);
            }
            conn.close();
        }catch(SQLException e) {e.printStackTrace();}
        return jsonArray;
    }

    @Override
    public ArrayList<JSONObject> getAllCourseList(Student student) throws DaoException {
        ArrayList<JSONObject> jsonArray=new ArrayList<>();
        String sqlStr="select * from course where semester='"+student.getSemester()+"' order by type";
        try {
            Connection conn = getConnection();
            PreparedStatement stmt = conn.prepareStatement(sqlStr);
            ResultSet rs=stmt.executeQuery(sqlStr);
            while(rs.next()) {
                ArrayList<ArrayList<String>> classSet=new ArrayList<>();
                JSONObject json=new JSONObject();
                int id = rs.getInt("course.id");
                String courseId = Integer.toString(id);
                String courseType = rs.getString("type");
                String[] types = courseType.split("-");
                int credit=rs.getInt("course.credit");
                String courseName=rs.getString("course.name");
                String capacity=Integer.toString(rs.getInt("capacity"));
                String sqlTmp="select * from course_teacher join teacher where course_id="+courseId+" and teacher_id=id";
                PreparedStatement tmpStmt = conn.prepareStatement(sqlTmp);
                ResultSet tmpRs=tmpStmt.executeQuery(sqlTmp);
                while(tmpRs.next()){
                    ArrayList<String> classInfo=new ArrayList<>();
                    String teacherName=tmpRs.getString("name");
                    String location=tmpRs.getString("location");
                    String time=tmpRs.getString("time");
                    String selected=Integer.toString(tmpRs.getInt("selected"));
                    classInfo.add(teacherName);
                    classInfo.add(location);
                    classInfo.add(time);
                    classInfo.add(selected);
                    classSet.add(classInfo);
                }
                json.put("courseID",courseId);
                json.put("courseName",courseName);
                json.put("courseType",types[0]);
                json.put("credit",credit);
                json.put("capacity",capacity);
                json.put("classSet",classSet);
                jsonArray.add(json);
            }
            conn.close();
        }catch(SQLException e) {e.printStackTrace();}
        return jsonArray;
    }
}
