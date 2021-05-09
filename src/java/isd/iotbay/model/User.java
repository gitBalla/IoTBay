package isd.iotbay.model;

/**
 *
 * @author johnballa
 */

public class User implements java.io.Serializable{
    //declarations
    
    private String email;
    private String firstName;
    private String lastName;
    private String password;
    private String addressLine1;
    private String addressLine2;
    private String city;
    private String state;
    private String postCode;
    private String phoneNum;
    private boolean isStaff;
    private boolean isAdmin;
    
    //constructors

    public User() {
    }
    //"secure" constructor that leaves out isStaff and isAdmin
    public User(String email, String firstName, String lastName, String password, 
            String addressLine1, String addressLine2, String city, String state, 
            String postCode, String phoneNum) {
        this.email = email;
        this.firstName = firstName;
        this.lastName = lastName;
        this.password = password;
        this.addressLine1 = addressLine1;
        this.addressLine2 = addressLine2;
        this.city = city;
        this.state = state;
        this.postCode = postCode;
        this.phoneNum = phoneNum;
    }
    //unsecure constructor for initialization, must be used with isStaff=false, isAdmin=false
    public User(String email, String firstName, String lastName, String password, 
            String addressLine1, String addressLine2, String city, String state, 
            String postCode, String phoneNum, boolean isStaff, boolean isAdmin) {
        this.email = email;
        this.firstName = firstName;
        this.lastName = lastName;
        this.password = password;
        this.addressLine1 = addressLine1;
        this.addressLine2 = addressLine2;
        this.city = city;
        this.state = state;
        this.postCode = postCode;
        this.phoneNum = phoneNum;
        this.isStaff = isStaff;
        this.isAdmin = isAdmin;
    }
    
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAddressLine1() {
        return addressLine1;
    }

    public void setAddressLine1(String addressLine1) {
        this.addressLine1 = addressLine1;
    }

    public String getAddressLine2() {
        return addressLine2;
    }

    public void setAddressLine2(String addressLine2) {
        this.addressLine2 = addressLine2;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getPostCode() {
        return postCode;
    }

    public void setPostCode(String postCode) {
        this.postCode = postCode;
    }
    
    public String getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }

    public boolean isStaff() {
        return isStaff;
    }

    public void setIsStaff(boolean isStaff) {
        this.isStaff = isStaff;
    }

    public boolean isAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(boolean isAdmin) {
        this.isAdmin = isAdmin;
    }
    
    
    
}
