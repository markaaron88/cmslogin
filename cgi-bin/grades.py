#!/usr/local/bin/python3
# Mark Mariscal, Christopher Piwarski, Wais Robleh
# Midterm Project
# 25 January 2019
# CST363 Databases Online
# this file must be in the /cgi-bin/ directory of the server

import cgitb, cgi
import mysql.connector
cgitb.enable()

cgitb.enable()
form = cgi.FieldStorage()
username = form['login'].value

# page header
print('Content-Type: text/html')
print()
print('<html><body>')

try:
    cnx = mysql.connector.connect(user='root',
                                password='TINYtinytiny0000',
                                database='cms',
                                host='127.0.0.1')
except mysql.connector.Error as err:
    raise SystemExit
    print("ERROR", err)

student_query = 'SELECT a.user_name, grade, grade_percentage \
FROM accounts a JOIN grades g ON a.user_id = g.user_id \
WHERE user_name = %s;'

teacher_query = 'SELECT a.user_name, grade, grade_percentage \
FROM accounts a JOIN grades g ON a.user_id = g.user_id;'



