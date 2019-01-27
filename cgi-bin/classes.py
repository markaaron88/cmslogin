#!/usr/local/bin/python3
# Mark Mariscal, Christopher Piwarski, Wais Robleh
# Midterm Project
# 26 January 2019
# CST363 Databases Online
# this file must be in the /cgi-bin/ directory of the server

import cgitb, cgi
import mysql.connector
cgitb.enable()

cgitb.enable()
form = cgi.FieldStorage()
username = form['login'].value

# HTML Header
print('Content-Type: text/html')
print()
print('<html><title>CLASSES</title>><body>')

try:
    cnx = mysql.connector.connect(user='root',
                                password='Mercy1988!',
                                database='cst363',
                                host='127.0.0.1')

    cursor1 = cnx.cursor()
    cursor2 = cnx.cursor()
except mysql.connector.Error as err:
    raise SystemExit
    print("ERROR", err)

student_query = 'SELECT a.user_name, classes, \
FROM accounts a JOIN classes c ON a.user_id = g.user_id \
WHERE user_name = %s;'

teacher_query = 'SELECT a.user_name, class,  \
FROM accounts a JOIN classes c ON a.user_id = g.user_id \
WHERE class_id = (SELECT class_id FROM accounts WHERE user_name = %s);'

# determine user level 
ul_query = 'SELECT user_level FROM accounts'

cursor1.execute(ul_query)
result = cursor.fetchone()

print('<table border="1"><tr><th>Student Name</th><th>Classes</th><th>')


print('<br>')
print('</table>')
print('<a href="/loggedin.py">Back Button</a><br/>')
print('</body></html>')
cnx.commit()
cnx.close()
