-- Team 10 Midterm Project
-- M. Mariscal, C. Piwarski, W. Robleh
-- 23 January 2019


-- create database and tables

DROP DATABASE IF EXISTS cms;
CREATE DATABASE cms;

USE cms;

CREATE TABLE user_levels (
    account_level INT PRIMARY KEY AUTO_INCREMENT,
    level_name VARCHAR(75) NOT NULL,
    grade_access VARCHAR(25) NOT NULL
);

CREATE TABLE accounts (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    user_name VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    user_level INT NOT NULL,
    class_id INT NOT NULL,
    CONSTRAINT user_level_fk FOREIGN KEY (user_level) REFERENCES user_levels (account_level)
);

CREATE TABLE grades (
    grade_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    grades INT,
    grade VARCHAR(50),
    grade_percentage INT(50),
    CONSTRAINT user_id_fk FOREIGN KEY (user_id) REFERENCES accounts (user_id)
);

CREATE TABLE classes (
    class_id INT PRIMARY KEY AUTO_INCREMENT,
    class_name VARCHAR(50),
    class_time INT(50),
    classroom_number INT(50),
    teacher_name VARCHAR(50),
    teacher_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    class_Units DECIMAL(3,2),
    CONSTRAINT teacher_id_fk FOREIGN KEY (teacher_id) REFERENCES accounts (user_id)
);

-- insert data
