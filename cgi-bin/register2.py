#!/usr/local/bin/python3
# Mark Mariscal, Christopher Piwarski, Wais Robleh
# Midterm Project
# 26 January 2019
# CST363 Databases Online
# this file must be in the /cgi-bin/ directory of the server
from os import environ
import string
import cgitb, cgi
import mysql.connector
cgitb.enable()

form = cgi.FieldStorage()

new_user = form['new_userid'].value
new_psswd = form['new_password'].value
new_user_level = form['new_user_level'].value
new_user_class = form['new_user_class'].value

# HTML Header
print('Content-Type: text/html')
print()
print('<html><title>REGISTRATION</title><body>')

try:
    cnx = mysql.connector.connect(user='root',
                                password='root',
                                database='cms',
                                host='127.0.0.1')

    cursor1 = cnx.cursor()
    cursor2 = cnx.cursor()
except mysql.connector.Error as err:
    raise SystemExit
    print("ERROR", err)

# determine if user is already in the database
qsql = 'SELECT user_name FROM accounts WHERE user_name = %s;'

cursor1.execute(qsql, (new_user,))
result = cursor1.fetchone() 

if result is None:
    insert_sql = 'INSERT INTO accounts (user_name, user_password, user_level, class_id) \
    VALUES (%s, %s, %s, %s)'
    cursor2.execute(insert_sql, (new_user, new_psswd, new_user_level, new_user_class))
    print('New user has been registered.')
else:
    print('User name is already taken')

print('<br>')
print('</body></html>')
cnx.commit()
cnx.close()