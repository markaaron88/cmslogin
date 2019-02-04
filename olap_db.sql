# Mark Mariscal, Christopher Piwarski, Wais Robleh
# Midterm Project
# 03 February 2019
# CST363 Databases Online
# OLAP Database Generation Script

DROP SCHEMA IF EXISTS cmsdw;
CREATE SCHEMA cmsdw;
USE cmsdw;

CREATE TABLE user_levels (
    account_level INT PRIMARY KEY,
    level_name VARCHAR(50) NOT NULL,
    grade_access VARCHAR(25) NOT NULL 
);

CREATE TABLE classes (
    class_id INT PRIMARY KEY AUTO_INCREMENT,
    class_name VARCHAR(50) NOT NULL,
    class_time DECIMAL(4,2) NOT NULL,
    classroom_number INT(50) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    class_units DECIMAL(3,2) NOT NULL
);

CREATE TABLE user_account (
    user_id INT PRIMARY KEY,
    user_name VARCHAR(50) NOT NULL,
    user_password VARCHAR(50) NOT NULL,
    grades VARCHAR(50)
);

CREATE TABLE logins (
    time_id INT PRIMARY KEY AUTO_INCREMENT,
    login_date DATETIME,
    user_id INT NOT NULL,
    user_level INT NOT NULL,
    class_id INT
);

CREATE OR REPLACE VIEW student_number_of_logins AS
    SELECT l.user_id, ua.user_name, 
    class_name, 
    COUNT(*) AS "logins today" 
  FROM logins l JOIN classes c 
    ON l.class_id = c.class_id 
  JOIN user_account ua 
    ON l.user_id = ua.user_id 
  GROUP BY user_id;

