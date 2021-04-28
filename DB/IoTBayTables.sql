/**
 * Author:  johnballa
 * Created: 26/04/2021
 */

-- create table for user, superclass of customer and staff
CREATE TABLE USER_T (
    USERID      INTEGER     NOT NULL AUTO_INCREMENT, 
    EMAIL       VARCHAR(50) NOT NULL, 
    FIRSTNAME   VARCHAR(20) NOT NULL, 
    LASTNAME    VARCHAR(20) NOT NULL, 
    PASSWORD    VARCHAR(30) NOT NULL, 
    PRIMARY KEY (USERID)
    );

-- create table for customer, subclass of user
CREATE TABLE CUSTOMER_T (
    USERID      INTEGER     NOT NULL AUTO_INCREMENT, 
    ADDRESS1    VARCHAR(50),
    ADDRESS2    VARCHAR(50),
    CITY        VARCHAR(15),
    STATELOC    VARCHAR(3),
    POSTCODE    INTEGER,
    PHONE       VARCHAR(12) NOT NULL,
    PRIMARY KEY (USERID),
    FOREIGN KEY (USERID) REFERENCES USER_T (USERID)
    );

--create table for staff, subclass of user, superclass of adminstaff
CREATE TABLE STAFF_T (
    USERID      INTEGER     NOT NULL AUTO_INCREMENT, 
    STAFFID     INTEGER     NOT NULL,
    PRIMARY KEY (USERID),
    FOREIGN KEY (USERID) REFERENCES USER_T (USERID)
    );

--create table for staff, subclass of staff, user
CREATE TABLE ADMINSTAFF_T (
    USERID      INTEGER       NOT NULL AUTO_INCREMENT, 
    PRIMARY KEY (USERID),
    FOREIGN KEY (USERID) REFERENCES STAFF_T (USERID)
    );

--create table for product
CREATE TABLE PRODUCT_T (
    PRIMARY KEY (PRODUCTID) INTEGER NOT NULL,
    NAME VARCHAR(40) NOT NULL,
    DESCRIPTION VARCHAR(200) NOT NULL,
    PRICE FLOAT(10) NOT NULL,
    STOCK INTEGER NOT NULL,
    );

--create table for collection
CREATE TABLE COLLECTION_T (
    PRIMARY KEY (COLLECTID) INTEGER,
    COLLECTNAME VARCHAR(40) NOT NULL,
    );

--create table for payment
CREATE TABLE PAYMENT_T (
    PAYID INTEGER NOT NULL,
    PAYMETHOD VARCHAR(10) NOT NULL,
    CCTYPE VARCHAR(10),
    CCNUMBER INTEGER(16),
    CCEXP DATE,
    CCSECURITY INTEGER(3),
    PAYEMAIL VARCHAR(50),
    PRIMARY KEY (PAYID)
);