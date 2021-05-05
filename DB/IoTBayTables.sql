/**
 * Author:  johnballa
 * Created: 26/04/2021
 */

-- create table for user (staff and admin delineated by boolean is_ values)
CREATE TABLE USER_T (
    USERID      INTEGER     NOT NULL 
        GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1), 
    EMAIL       VARCHAR(50) NOT NULL, 
    FIRSTNAME   VARCHAR(20) NOT NULL, 
    LASTNAME    VARCHAR(20) NOT NULL, 
    PASSWORD    VARCHAR(30) NOT NULL, 
    ADDRESS1    VARCHAR(50),
    ADDRESS2    VARCHAR(50),
    CITY        VARCHAR(15),
    STATELOC    VARCHAR(3),
    POSTCODE    VARCHAR(5),
    PHONE       VARCHAR(12),
    IS_STAFF    BOOLEAN     NOT NULL,
    IS_ADMIN    BOOLEAN     NOT NULL,
    PRIMARY KEY (USERID)
    );

-- insert statements into user table to test database
INSERT INTO USER_T(EMAIL,FIRSTNAME,LASTNAME,PASSWORD,ADDRESS1,CITY,STATELOC,POSTCODE,PHONE,IS_STAFF,IS_ADMIN) 
    VALUES ('admin@iotbay.com','Admin','Istrator','admin1','123 This Street','This City','NSW','2000','0455667788',TRUE,TRUE);
INSERT INTO USER_T(EMAIL,FIRSTNAME,LASTNAME,PASSWORD,ADDRESS1,CITY,STATELOC,POSTCODE,PHONE,IS_STAFF,IS_ADMIN) 
    VALUES ('staff@iotbay.com','Staff','Worker','staff1','234 This Street','This City','NSW','2000','0455667799',TRUE,FALSE);
INSERT INTO USER_T(EMAIL,FIRSTNAME,LASTNAME,PASSWORD,ADDRESS1,CITY,STATELOC,POSTCODE,PHONE,IS_STAFF,IS_ADMIN) 
    VALUES ('1337iotguy@yahoo.com','Bob','Smith','customer1','345 This Street','This City','NSW','2000','0400000000',FALSE,FALSE);

-- create table for user logs, FK to user table
CREATE TABLE USER_LOG_T (
    LOGID      INTEGER     NOT NULL 
        GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1), 
    USERID     INTEGER     NOT NULL,
    LOGTIME    TIME        NOT NULL,
    LOGDATE    DATE        NOT NULL,
    LOGEVENT   VARCHAR(20) NOT NULL,
    PRIMARY KEY (LOGID),
    FOREIGN KEY (USERID) REFERENCES USER_T (USERID)
    );

-- insert statements into user log table to test database
INSERT INTO USER_LOG_T(USERID,LOGTIME,LOGDATE,LOGEVENT)
    VALUES (1,'07:00:00','2021-04-01','LOGIN');
INSERT INTO USER_LOG_T(USERID,LOGTIME,LOGDATE,LOGEVENT)
    VALUES (1,'08:00:00','2021-04-01','LOGOUT');
INSERT INTO USER_LOG_T(USERID,LOGTIME,LOGDATE,LOGEVENT)
    VALUES (2,'07:00:00','2021-04-01','LOGIN');
INSERT INTO USER_LOG_T(USERID,LOGTIME,LOGDATE,LOGEVENT)
    VALUES (2,'08:00:00','2021-04-01','LOGOUT');
INSERT INTO USER_LOG_T(USERID,LOGTIME,LOGDATE,LOGEVENT)
    VALUES (3,'07:00:00','2021-04-01','LOGIN');
INSERT INTO USER_LOG_T(USERID,LOGTIME,LOGDATE,LOGEVENT)
    VALUES (3,'07:30:00','2021-04-01','UPDATE');
INSERT INTO USER_LOG_T(USERID,LOGTIME,LOGDATE,LOGEVENT)
    VALUES (3,'08:00:00','2021-04-01','LOGOUT');

--create table for product
CREATE TABLE PRODUCT_T (
    PRODUCTID   INTEGER     NOT NULL PRIMARY KEY,
    NAME        VARCHAR(40) NOT NULL,
    DESCRIPTION VARCHAR(200)NOT NULL,
    PRICE       FLOAT(10)   NOT NULL,
    STOCK       INTEGER     NOT NULL
    );

--create table for collection
CREATE TABLE COLLECTION_T (
    COLLECTID   INTEGER     NOT NULL PRIMARY KEY,
    COLLECTNAME VARCHAR(40) NOT NULL
    );

--create table for payment
CREATE TABLE PAYMENT_T (
    PAYID INTEGER NOT NULL,
    PAYMETHOD VARCHAR(10) NOT NULL,
    PRIMARY KEY (PAYID)
);

CREATE TABLE CREDIT_CARD_T (
    PAYID INTEGER NOT NULL,
    CCTYPE VARCHAR(10),
    CCNUMBER INTEGER,
    CCEXP DATE,
    CCSECURITY INTEGER,
    PAYEMAIL VARCHAR(50),
    PRIMARY KEY (PAYID),
    FOREIGN KEY (PAYID) REFERENCES PAYMENT_T (PAYID)
);

CREATE TABLE BANK_ACCOUNT_T (
    PAYID INTEGER NOT NULL,
    BSBNUMBER INTEGER NOT NULL,
    PRIMARY KEY (PAYID),
    FOREIGN KEY (PAYID) REFERENCES PAYMENT_T (PAYID)
);

CREATE TABLE PAYPAL_T (
    PAYID INTEGER NOT NULL,
    PAYPAL_USERNAME VARCHAR(20) NOT NULL,
    PAYPAL_PASSWORD VARCHAR(20) NOT NULL,
    PRIMARY KEY (PAYID),
    FOREIGN KEY (PAYID) REFERENCES PAYMENT_T (PAYID)
);