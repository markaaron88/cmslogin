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
    user_password VARCHAR(50) NOT NULL,
    user_level INT NOT NULL,
    class_id INT,
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
    class_time DECIMAL (4,2),
    classroom_number INT(50),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    class_units DECIMAL(3,2)
);

-- insert data

-- create user levels
INSERT INTO user_levels
    (level_name, grade_access)
VALUES
    ("student", "No");
    
INSERT INTO user_levels
    (level_name, grade_access)
VALUES
    ("teacher", "Yes");
    
INSERT INTO user_levels
    (level_name, grade_access)
VALUES
    ("administrator", "No");
    
-- create classes
INSERT INTO classes
    (class_name, class_time, classroom_number, start_date, end_date, class_units)
VALUES
    ("History", 13.50, 7, "2019-01-05", "2019-4-25", 4.5);
    
INSERT INTO classes
    (class_name, class_time, classroom_number, start_date, end_date, class_units)
VALUES
    ("English", 9.50, 3, "2019-01-05", "2019-4-25", 5.0);
    
-- create administrator
INSERT INTO accounts
    (user_name, user_password, user_level)
VALUES
    ("admin", "admin", 3);
    
-- create teachers

-- create students
    
    
    