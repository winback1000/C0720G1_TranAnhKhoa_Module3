package models;

public class UserType {
    String userTypeName;
    String userTypePassword;

    public UserType() {
    }

    public UserType(String userTypeName, String userTypePassword) {
        this.userTypeName = userTypeName;
        this.userTypePassword = userTypePassword;
    }

    public String getUserTypeName() {
        return userTypeName;
    }

    public void setUserTypeName(String userTypeName) {
        this.userTypeName = userTypeName;
    }

    public String getUserTypePassword() {
        return userTypePassword;
    }

    public void setUserTypePassword(String userTypePassword) {
        this.userTypePassword = userTypePassword;
    }
}
