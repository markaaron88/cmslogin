# Mark Mariscal, Christopher Piwarski, Wais Robleh
# Midterm Project
# 03 February 2019
# CST363 Databases Online
# OLAP SQL Queries

-- How many times did USER TYPE log in that day, week, month
SELECT l.user_id, 
    user_name, 
    COUNT(*) AS logins 
FROM logins l JOIN user_account ua 
    ON l.user_id = ua.user_id 
WHERE user_level = 3
GROUP BY user_name;

-- How many total log ins for each class
SELECT class_id, COUNT(*) FROM logins GROUP BY class_id;

-- What class is the average grade of each class?
SELECT class_name AS 'Class',  COUNT(*) AS 'Students', 
ROUND(AVG(
CASE
    WHEN grade = 'A' THEN 4.0
    WHEN grade = 'B' THEN 3.0
    WHEN grade = 'C' THEN 2.0
    WHEN grade = 'D' THEN 1.0
    ELSE 0.0 
END),1) AS 'AverageClassGrade'
FROM
cms.grades g INNER JOIN cms.accounts a
    ON g.user_id = a.user_id
INNER JOIN cms.classes c
    ON a.class_id = c.class_id
GROUP BY class_name

-- What is the most popular class? 
SELECT class_name, count(*) AS 'Number of Students'
FROM cms.accounts a INNER JOIN cms.classes c
    ON a.class_id = c.class_id
GROUP BY class_name

-- access all the system logins for a particular day (attendence roll call)
SELECT l.user_id, ua.user_name, c.class_name 
FROM logins l JOIN user_account ua 
    ON l.user_id = ua.user_id LEFT JOIN classes c 
    ON l.class_id = c.class_id 
WHERE l.login_date > '2019-02-04' AND l.login_date < '2019-02-05';