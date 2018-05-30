CREATE DATABASE IF NOT EXISTS qa_cinema;

USE qa_cinema;

SHOW TABLES;

#Age rating can be separate table, 

DROP TABLE Employee;

CREATE TABLE IF NOT EXISTS Employee (
    e_ID INT NOT NULL AUTO_INCREMENT,
    e_FName VARCHAR(20) NOT NULL,
    e_LName VARCHAR(20) NOT NULL,
    e_DOB DATE NOT NULL,
    e_Landline VARCHAR(20),
    e_Mobile VARCHAR(20),
    PRIMARY KEY (e_ID)
);

DROP TABLE Customer;

CREATE TABLE IF NOT EXISTS Customer (
    c_ID INT NOT NULL AUTO_INCREMENT,
    c_FName VARCHAR(20) NOT NULL,
    c_LName VARCHAR(20) NOT NULL,
    c_DOB DATE NOT NULL,
    c_email VARCHAR(30) NOT NULL,
    PRIMARY KEY (c_ID)
);

DROP TABLE Actor;

CREATE TABLE IF NOT EXISTS Actor (
    a_FName VARCHAR(20) NOT NULL,
    a_LName VARCHAR(20) NOT NULL,
    a_DOB DATE,
    PRIMARY KEY (a_FName , a_LName)
);

DROP TABLE Director;

CREATE TABLE IF NOT EXISTS Director (
    d_FName VARCHAR(20) NOT NULL,
    d_LName VARCHAR(20) NOT NULL,
    d_DOB DATE,
    CONSTRAINT d_ID PRIMARY KEY (d_FName , d_LName)
);

DROP TABLE Screen;

CREATE TABLE IF NOT EXISTS Screen (
    s_ID INT NOT NULL AUTO_INCREMENT,
    s_seatNo INT NOT NULL,
    s_rowNo INT,
    s_type VARCHAR(10),
    PRIMARY KEY (s_ID)
);

DROP TABLE TicketPrice;

CREATE TABLE IF NOT EXISTS TicketPrice (
    tp_ID INT NOT NULL,
    tp_type VARCHAR(10) NOT NULL,
    tp_price INT NOT NULL,
    PRIMARY KEY (tp_ID)
);

DROP TABLE Genre;

CREATE TABLE IF NOT EXISTS Genre (
    g_Name VARCHAR(20) NOT NULL,
    PRIMARY KEY (g_Name)
);

DROP TABLE Times;

CREATE TABLE IF NOT EXISTS Times (
    t_ID INT NOT NULL,
    t_Time VARCHAR(5) NOT NULL,
    PRIMARY KEY (t_ID)
);

DROP TABLE AgeRatings;

CREATE TABLE IF NOT EXISTS AgeRatings (
    ar_ID INT NOT NULL,
    ar_Rating VARCHAR(5) NOT NULL,
    PRIMARY KEY (ar_ID)
);

DROP TABLE Movie;

CREATE TABLE IF NOT EXISTS Movie (
    m_ID INT NOT NULL AUTO_INCREMENT,
    m_Name VARCHAR(40) NOT NULL,
    m_ReleaseDate DATE NOT NULL,
    m_LengthMins INT,
    m_AgeRating INT,
    m_Genre VARCHAR(20),
    PRIMARY KEY (m_ID),
    FOREIGN KEY (m_Genre)
        REFERENCES Genre (g_Name),
    FOREIGN KEY (m_AgeRating)
        REFERENCES AgeRating (ar_ID)
);
    

DROP TABLE Emergency;

CREATE TABLE IF NOT EXISTS Emergency (
    em_ID INT,
    em_Name VARCHAR(40) NOT NULL,
    em_Relationship VARCHAR(20) NOT NULL,
    em_Landline VARCHAR(20),
    em_MobileNo VARCHAR(20),
    FOREIGN KEY (em_ID)
        REFERENCES Employee (e_ID)
        ON DELETE CASCADE
);

DROP TABLE Role;

CREATE TABLE IF NOT EXISTS Role (
    r_AFName VARCHAR(20) NOT NULL,
    r_ALName VARCHAR(20) NOT NULL,
    r_MovieID INT NOT NULL,
    FOREIGN KEY (r_AFName , r_ALName)
        REFERENCES Actor (a_FName , a_LName),
    FOREIGN KEY (r_MovieID)
        REFERENCES Movie (m_ID),
    CONSTRAINT r_ID PRIMARY KEY (r_AFName , r_ALName , r_MovieID)
);

DROP TABLE Booking;

CREATE TABLE IF NOT EXISTS Booking (
    b_Reference INT NOT NULL,
    b_MovieID INT NOT NULL,
    b_CustomerID INT NOT NULL,
    b_ScreenID INT NOT NULL,
    b_Time INT NOT NULL,
    b_TicketAmount INT NOT NULL,
    FOREIGN KEY (b_MovieID)
        REFERENCES Movie (m_ID),
    FOREIGN KEY (b_CustomerID)
        REFERENCES Customer (c_ID),
    FOREIGN KEY (b_ScreenID)
        REFERENCES Screen (s_ID),
    FOREIGN KEY (b_Time)
        REFERENCES Times (t_ID),
    PRIMARY KEY (b_Reference)
);


DROP TABLE MovieTimes;

CREATE TABLE IF NOT EXISTS MovieTimes (
    mt_movieID INT NOT NULL,
    mt_time INT NOT NULL,
    FOREIGN KEY (mt_movieID)
        REFERENCES Movie (m_ID),
    FOREIGN KEY (mt_time)
        REFERENCES Times (t_ID),
    CONSTRAINT movie_time PRIMARY KEY (mt_movieID , mt_time)
);

DROP TABLE UserRating;

CREATE TABLE IF NOT EXISTS UserRating (
    ur_ID INT NOT NULL,
    ur_UserID INT,
    ur_Rating INT NOT NULL,
    ur_MovieID INT NOT NULL,
    FOREIGN KEY (ur_UserID)
        REFERENCES Customer (c_ID),
    FOREIGN KEY (ur_MovieID)
        REFERENCES Movie (m_ID),
    PRIMARY KEY (ur_ID)
);

SHOW TABLES;


