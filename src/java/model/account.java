package model;

public class account {
    private int userid;
    private String fullname;
    private String username;
    private String password;
    private String role;
    private String email;
    private String phone;

    public account(int userid, String username, String password, String role) {
        this.userid = userid;
        this.username = username;
        this.password = password;
        this.role = role;
    }

    public account(int userid, String username, String password, String role, String email, String phone) {
        this.userid = userid;
        this.username = username;
        this.password = password;
        this.role = role;
        this.email = email;
        this.phone = phone;
    }

    public account(int userid, String fullname, String username, String password, String role, String email, String phone) {
        this.userid = userid;
        this.fullname = fullname;
        this.username = username;
        this.password = password;
        this.role = role;
        this.email = email;
        this.phone = phone;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public account(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public int getUserid() {
        return userid;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public String getRole() {
        return role;
    }

    public String getEmail() {
        return email;
    }

    public String getPhone() {
        return phone;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Override
    public String toString() {
        return "account{" + "userid=" + userid + ", username=" + username + ", password=" + password + ", role=" + role + ", email=" + email + ", phone=" + phone + '}';
    }
    
}
