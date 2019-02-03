# Mark Mariscal, Christopher Piwarski, Wais Robleh
# Midterm Project
# 03 February 2019
# CST363 Databases Online
# OLAP Database Generation Script

DROP SCHEMA IF EXISTS cmsdw;
CREATE SCHEMA cmsdw;
USE cmsdw;

CREATE TABLE fact_table (
    time_id INT PRIMARY KEY AUTO_INCREMENT,
    login_date DATE NOT NULL,
    user_level INT NOT NULL,
    class_id INT,
    grade INT
);

CREATE TABLE clases(
    class_id INT PRIMARY KEY AUTO_INCREMENT,
    class_name VARCHAR(50) NOT NULL,
    classroom_number INT(50) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    class_units DECIMAL(3,2) NOT NULL
);

CREATE TABLE user_account(
    user_id INT PRIMARY KEY,
    user_name VARCHAR(50) NOT NULL,
    user_password VARCHAR(50) NOT NULL
);

