package bean;

public class Student {
    private int id; //账号
    private String password; //密码
    private String name; //学生姓名
    private String institute; //学院
    private String major; //专业
    private String grade; //年级（大一/大二/大三/大四）
    private String semester;  //在读学期

    public Student(int id, String password, String name, String institute, String major, String grade, String semester) {
        this.id = id;
        this.password = password;
        this.name = name;
        this.institute = institute;
        this.major = major;
        this.grade = grade;
        this.semester=semester;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getInstitute() {
        return institute;
    }

    public void setInstitute(String institute) {
        this.institute = institute;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    @Override
    public String toString() {
        return "Student{" +
                "id=" + id +
                ", password='" + password + '\'' +
                ", name='" + name + '\'' +
                ", institute='" + institute + '\'' +
                ", major='" + major + '\'' +
                ", grade='" + grade + '\'' +
                '}';
    }

    public String getSemester() {
        return semester;
    }

    public void setSemester(String semester) {
        this.semester = semester;
    }
}
