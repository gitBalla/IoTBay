package isd.iotbay.controller;

import java.io.Serializable;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.http.HttpSession;

/**
 *
 * @author johnballa
 */

public class Validator implements Serializable{ 

    private String emailPattern = "([a-zA-Z0-9]+)(([._-])([a-zA-Z0-9]+))*(@)([a-z]+)(.)([a-z]{3})((([.])[a-z]{0,2})*)";      
    private String passwordPattern = "^(?=.*[A-Za-z])(?=.*[0-9]).{5,}$";

    public Validator(){    }       

    public boolean validate(String pattern, String input){       
       Pattern regEx = Pattern.compile(pattern);       
       Matcher match = regEx.matcher(input);       
       return match.matches(); 
    }       

    public boolean checkEmpty(String email, String password){       
       return  email.isEmpty() || password.isEmpty();   
    }

    public boolean validateEmail(String email){                       
       return validate(emailPattern,email);   
    }

    public boolean validatePassword(String password){
       return validate(passwordPattern,password); 
    }          
    
    public void clear(HttpSession session) {
        session.setAttribute("emailErr", "");
        session.setAttribute("passErr", "");
        session.setAttribute("existErr", "");
        session.setAttribute("nameErr", "");
        session.setAttribute("tosErr", "");
    }
}