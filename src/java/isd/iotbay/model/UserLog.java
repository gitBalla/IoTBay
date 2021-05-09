package isd.iotbay.model;

/**
 *
 * @author johnballa
 */

public class UserLog implements java.io.Serializable{
    //declarations

    private String currentDate;
    private String currentTime;
    private String logEvent;


    //constructors
    
    public UserLog() {
    }

    public UserLog(String currentDate, String currentTime, String logEvent) {
        this.currentDate = currentDate;
        this.currentTime = currentTime;
        this.logEvent = logEvent;
    }

    public String getCurrentDate() {
        return currentDate;
    }

    public void setCurrentDate(String currentDate) {
        this.currentDate = currentDate;
    }

    public String getCurrentTime() {
        return currentTime;
    }

    public void setCurrentTime(String currentTime) {
        this.currentTime = currentTime;
    }    
    
    public String getLogEvent() {
        return logEvent;
    }

    public void setLogEvent(String logEvent) {
        this.logEvent = logEvent;
    }
}
