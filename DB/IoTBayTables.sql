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
    LOGID           INTEGER     NOT NULL 
        GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1), 
    USERID          INTEGER     NOT NULL,
    CURRENTDATE     DATE        NOT NULL
        DEFAULT CURRENT_DATE,
    CURRENTTIME     TIME        NOT NULL
        DEFAULT CURRENT_TIME,
    LOGEVENT        VARCHAR(20) NOT NULL,
    PRIMARY KEY (LOGID),
    FOREIGN KEY (USERID) REFERENCES USER_T (USERID)
    );

-- insert statements into user log table to test database
INSERT INTO USER_LOG_T(USERID,CURRENTDATE,CURRENTTIME,LOGEVENT)
    VALUES (1,'2021-04-01','06:00:00','REGISTER');
INSERT INTO USER_LOG_T(USERID,CURRENTDATE,CURRENTTIME,LOGEVENT)
    VALUES (1,'2021-04-01','07:00:00','LOGIN');
INSERT INTO USER_LOG_T(USERID,CURRENTDATE,CURRENTTIME,LOGEVENT)
    VALUES (1,'2021-04-01','08:00:00','LOGOUT');
INSERT INTO USER_LOG_T(USERID,CURRENTDATE,CURRENTTIME,LOGEVENT)
    VALUES (2,'2021-04-01','06:00:00','REGISTER');
INSERT INTO USER_LOG_T(USERID,CURRENTDATE,CURRENTTIME,LOGEVENT)
    VALUES (2,'2021-04-01','07:00:00','LOGIN');
INSERT INTO USER_LOG_T(USERID,CURRENTDATE,CURRENTTIME,LOGEVENT)
    VALUES (2,'2021-04-01','08:00:00','LOGOUT');
INSERT INTO USER_LOG_T(USERID,CURRENTDATE,CURRENTTIME,LOGEVENT)
    VALUES (3,'2021-04-01','06:00:00','REGISTER');
INSERT INTO USER_LOG_T(USERID,CURRENTDATE,CURRENTTIME,LOGEVENT)
    VALUES (3,'2021-04-01','07:00:00','LOGIN');
INSERT INTO USER_LOG_T(USERID,CURRENTDATE,CURRENTTIME,LOGEVENT)
    VALUES (3,'2021-04-01','07:30:00','UPDATE');
INSERT INTO USER_LOG_T(USERID,CURRENTDATE,CURRENTTIME,LOGEVENT)
    VALUES (3,'2021-04-01','08:00:00','LOGOUT');

--create table for product
CREATE TABLE PRODUCT_T (
    PRODUCTID   INTEGER     NOT NULL PRIMARY KEY,
    NAME        VARCHAR(40) NOT NULL,
    DESCRIPTION VARCHAR(200)NOT NULL,
    PRICE       FLOAT(10)   NOT NULL,
    STOCK       INTEGER     NOT NULL
    );

INSERT INTO PRODUCT_T VALUES (1,'DHT11','Humidity and Temperature Sensor',4.00,293);
INSERT INTO PRODUCT_T VALUES (2,'DS18B20','1-wire bus Sensor, Raspberry Pi Sensor',2.00,142);
INSERT INTO PRODUCT_T VALUES (3,'BMP180','Barometer Sensor, Raspberry Pi Sensor',6.25,0);
INSERT INTO PRODUCT_T VALUES (4,'RFID-RC522','Inductive RFID Card Reader',5.50,10);
INSERT INTO PRODUCT_T VALUES (5,'Raspberry Pi 7 in. Touchscreen','800x480 pixel, 10 point capacitive touchscreen',75.00,50);

--create table for collection
CREATE TABLE COLLECTION_T (
    COLLECTID   INTEGER     NOT NULL PRIMARY KEY,
    COLLECTNAME VARCHAR(40) NOT NULL
    );

--create table for order
CREATE TABLE ORDER_T (
    ORDERID INTEGER NOT NULL,
    PRIMARY KEY (ORDERID)
);

--create table for payment
CREATE TABLE PAYMENT_T (
    PAYID INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    PAYMETHOD VARCHAR(20) NOT NULL,
    CCNUMBER INTEGER,
    CCEXP VARCHAR(10),
    CCSECURITY INTEGER,
    PAYEMAIL VARCHAR(50),
    PAYAMOUNT INTEGER,
    PAYDATE VARCHAR(10),
    ORDERID INTEGER,
    PRIMARY KEY (PAYID),
    FOREIGN KEY (ORDERID) REFERENCES ORDER_T (ORDERID)
);