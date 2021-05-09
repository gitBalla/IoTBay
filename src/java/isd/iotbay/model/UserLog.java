package isd.iotbay.model;

/**
 *
 * @author johnballa
 */

public class UserLog implements java.io.Serializable{
    //declarations

    private String logEvent;
    private long currentTimeStamp;

    //constructor

    public UserLog(String logEvent, long currentTimeStamp) {
        this.logEvent = logEvent;
        this.currentTimeStamp = currentTimeStamp;
    }

    public String getLogEvent() {
        return logEvent;
    }

    public void setLogEvent(String logEvent) {
        this.logEvent = logEvent;
    }

    public long getCurrentTimeStamp() {
        return currentTimeStamp;
    }

    public void setCurrentTimeStamp(long currentTimeStamp) {
        this.currentTimeStamp = currentTimeStamp;
    }
}
