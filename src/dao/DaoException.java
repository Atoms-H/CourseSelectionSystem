package dao;

public class DaoException extends Exception{
    private static final long serialVersionUID = 1912L;
    private String message;
    public DaoException() {}
    public DaoException(String message) {//构造方法
        this.message = message;
    }
    public String getMessage() {
        return message;
    }
    public void setMessage(String message) {
        this.message = message;
    }
    public String toString() {
        return message;
    }
}