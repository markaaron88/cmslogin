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

CREATE TABLE classes (
    class_id INT PRIMARY KEY AUTO_INCREMENT,
    class_name VARCHAR(50),
    class_time DECIMAL (4,2),
    classroom_number INT(50),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    class_units DECIMAL(3,2)
);

CREATE TABLE accounts (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    user_name VARCHAR(50) NOT NULL,
    user_password VARCHAR(50) NOT NULL,
    user_level INT NOT NULL,
    class_id INT,
    CONSTRAINT user_level_fk FOREIGN KEY (user_level) REFERENCES user_levels (account_level),
    CONSTRAINT class_id_fk FOREIGN KEY (class_id) REFERENCES classes(class_id)
);

CREATE TABLE grades (
    grade_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    grades INT,
    grade VARCHAR(50),
    grade_percentage INT(50),
    CONSTRAINT user_id_fk FOREIGN KEY (user_id) REFERENCES accounts (user_id)
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
    
INSERT INTO classes
    (class_name, class_time, classroom_number, start_date, end_date, class_units)
VALUES
    ("Databases", 9.50, 1, "2019-01-05", "2019-4-25", 4.5);
    
-- create administrator
INSERT INTO accounts
    (user_name, user_password, user_level)
VALUES
    ("admin", "admin", 3);
    
-- create teachers
INSERT INTO accounts
    (user_name, user_password, user_level, class_id)
VALUES
    ("teacher1", "teacher1", 2, 1);
    
INSERT INTO accounts
    (user_name, user_password, user_level, class_id)
VALUES
    ("teacher2", "teacher2", 2, 2);
    
INSERT INTO accounts
    (user_name, user_password, user_level, class_id)
VALUES
    ("teacher3", "teacher3", 2, 3);

-- create students
INSERT INTO accounts
    (user_name, user_password, user_level, class_id)
VALUES
    ("student1", "student1", 1, 1);

INSERT INTO accounts
    (user_name, user_password, user_level, class_id)
VALUES
    ("student2", "student2", 1, 1);
    
INSERT INTO accounts
    (user_name, user_password, user_level, class_id)
VALUES
    ("student3", "student3", 1, 1);
    
INSERT INTO accounts
    (user_name, user_password, user_level, class_id)
VALUES
    ("student4", "student4", 1, 1);
    
INSERT INTO accounts
    (user_name, user_password, user_level, class_id)
VALUES
    ("student5", "student5", 1, 1);
    
INSERT INTO accounts
    (user_name, user_password, user_level, class_id)
VALUES
    ("student6", "student6", 1, 2);
    
INSERT INTO accounts
    (user_name, user_password, user_level, class_id)
VALUES
    ("student7", "student7", 1, 2);
    
INSERT INTO accounts
    (user_name, user_password, user_level, class_id)
VALUES
    ("student8", "student8", 1, 2);
    
INSERT INTO accounts
    (user_name, user_password, user_level, class_id)
VALUES
    ("student9", "student9", 1, 2);
    
INSERT INTO accounts
    (user_name, user_password, user_level, class_id)
VALUES
    ("student10", "student10", 1, 2);
    
INSERT INTO accounts
    (user_name, user_password, user_level, class_id)
VALUES
    ("student11", "student11", 1, 3);
    
INSERT INTO accounts
    (user_name, user_password, user_level, class_id)
VALUES
    ("student12", "student12", 1, 3);
    
INSERT INTO accounts
    (user_name, user_password, user_level, class_id)
VALUES
    ("student13", "student13", 1, 3);
    
INSERT INTO accounts
    (user_name, user_password, user_level, class_id)
VALUES
    ("student14", "student14", 1, 3);
    
INSERT INTO accounts
    (user_name, user_password, user_level, class_id)
VALUES
    ("student15", "student15", 1, 3);
    
    