# Mark Mariscal, Christopher Piwarski, Wais Robleh
# Midterm Project
# 03 February 2019
# CST363 Databases Online
# OLAP ETL Script

INSERT INTO cmsdw.classes (class_id, class_name, class_time, classroom_number, start_date, end_date, class_units) SELECT * FROM cms.classes;

INSERT INTO user_levels (account_level, level_name, grade_access) (SELECT * FROM cms.user_levels);

INSERT INTO user_account (user_id ,user_name, user_password, grades) (SELECT ua.user_id, user_name, user_password, grade FROM cms.accounts ua JOIN cms.grades g ON ua.user_id = g.user_id);

INSERT INTO cmsdw.logins (login_date, user_id, user_level, class_id) (SELECT login_date, lo.user_id, user_level, class_id FROM cms.login_times lo JOIN cms.accounts c ON lo.user_id =c.user_id);