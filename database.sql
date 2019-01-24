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
    grade VARCHAR(50),
    grade_percentage DECIMAL(4, 2),
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
    
    
-- insert grades
    
INSERT INTO grades
    (user_id, grade, grade_percentage)
VALUES
    (5, "A", 95.38);
    
INSERT INTO grades
    (user_id, grade, grade_percentage)
VALUES
    (6, "A+", 99.30);
    
INSERT INTO grades
    (user_id, grade, grade_percentage)
VALUES
    (7, "B-", 82.61);
    
INSERT INTO grades
    (user_id, grade, grade_percentage)
VALUES
    (8, "F", 47.99);
    
INSERT INTO grades
    (user_id, grade, grade_percentage)
VALUES
    (9, "C", 76.11);

INSERT INTO grades
    (user_id, grade, grade_percentage)
VALUES
    (10, "B+", 88.74);
    
INSERT INTO grades
    (user_id, grade, grade_percentage)
VALUES
    (11, "A", 94.00);
    
INSERT INTO grades
    (user_id, grade, grade_percentage)
VALUES
    (12, "B", 86.12);
    
INSERT INTO grades
    (user_id, grade, grade_percentage)
VALUES
    (13, "C+", 78.87);
    
INSERT INTO grades
    (user_id, grade, grade_percentage)
VALUES
    (14, "C", 77.00);
    
INSERT INTO grades
    (user_id, grade, grade_percentage)
VALUES
    (15, "B-", 82.22);

INSERT INTO grades
    (user_id, grade, grade_percentage)
VALUES
    (16, "A", 95.01);
    
INSERT INTO grades
    (user_id, grade, grade_percentage)
VALUES
    (17, "A", 94.50);
    
INSERT INTO grades
    (user_id, grade, grade_percentage)
VALUES
    (18, "B+", 88.42);
    
INSERT INTO grades
    (user_id, grade, grade_percentage)
VALUES
    (19, "B+", 89.00);



