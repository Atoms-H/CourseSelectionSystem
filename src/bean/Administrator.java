package bean;

public class Administrator {
    private int id;
    private String password;
    private String permission;

    public Administrator(int id, String password, String permission) {
        this.id = id;
        this.password = password;
        this.permission = permission;
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

    public String getPermission() {
        return permission;
    }

    public void setPermission(String permission) {
        this.permission = permission;
    }

    @Override
    public String toString() {
        return "Administrator{" +
                "id=" + id +
                ", password='" + password + '\'' +
                ", permission='" + permission + '\'' +
                '}';
    }
}
