-- Team 10 Midterm Project
-- M. Mariscal, C. Piwarski, W. Robleh
-- 23 January 2019

DROP DATABASE IF EXISTS cms;
CREATE DATABASE cms;

USE cms;

CREATE TABLE User Levels (
    account_level   int PRIMARY KEY AUTO_INCREMENT,
    Level_name (student, teacher, admin) VARCHAR(75) NOT NULL,
    Grade_access    VARCHAR(25) NOT NULL,
);

CREATE TABLE Accounts (
    user_id int PRIMARY KEY AUTO_INCREMENT,
    user_name  varchar(50) NOT NULL,
    password     varchar(50) NOT NULL,
    user_level   varchar(50) FOREIGN KEY,
    Class   INT FOREIGN KEY
);


CREATE TABLE Grades (
Student_id  PRIMARY KEY
Grades int,
    Grade varchar(50),
Grade Percentage int(50),
    GPA  float(50),
    User_id FOREIGN KEY
         
);


CREATE TABLE Classes (
class_id int PRIMARY KEY AUTO_INCREMENT,
Class_Name var(50),
Class_Time int(50),
Classroom_Number int(50),
Teacher_Name varchar(50),
Start_date  DATE    NOT NULL,
End_date    DATE    NOT NULL,
Teacher_id  int FOREIGN KEY
Class_Units int(50) 
);
