#!/usr/local/bin/python3
# Team 10 Midterm Project
# CST363 Databases CS Fully Online
# 25 January 2019
# This file must be located in the cgi-bin folder of the server's directory

import cgitb, cgi
import mysql.connector
cgitb.enable()

cgitb.enable()
form = cgi.FieldStorage()
user_name = form['login'].value
password = form['password'].value

# HTML File Header
print('Content-Type: text/html')
print()
print('<TITLE>Grades</TITLE>')

user_level_query = 'SELECT user_level FROM accounts WHERE user_name = %s'

try:
    cnx = mysql.connector.connect(username='root',
                                  password='TINYtinytiny0000',
                                  database='cst363',
                                  host='localhost')
    cursor = cnx.cursor()


except mysql.connector.Error as e:
    print('Error creating database connection. Ending Program\n ', e)
    raise SystemExit