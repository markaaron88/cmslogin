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

# HTML Header
username = form.getvalue('userid')
password = form.getvalue('password')

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

student_query = 'SELECT a.user_name, grade, grade_percentage \
FROM accounts a JOIN grades g ON a.user_id = g.user_id \
WHERE user_name = %s;'

teacher_query = 'SELECT a.user_name, grade, grade_percentage \
FROM accounts a JOIN grades g ON a.user_id = g.user_id \
WHERE class_id = (SELECT class_id FROM accounts WHERE user_name = %s);'

# determine user level 
ul_query = 'SELECT user_level FROM accounts'

cursor1.execute(ul_query)
result = cursor.fetchone()

print('<table border="1"><tr><th>Student Name</th><th>Letter Grade</th><th>Percentage</th></tr>')

if result == 1:
    cursor2.execute(student_query, (username,))
    print('Here is your grade:')
    grade = cursor2.fetchone()
    print ('<tr><td>%s <td>%s <td>%s </tr>' % grade)
elif result == 2:
    cursor2.execute(teacher_query, (username,))
    print("These are your student's grades:")
    grades = cursor2.fetchone()
    while grades is not None:
        print ('<tr><td>%s <td>%s <td>%s </tr>' % grades)
        grades = cursor2.fetchone()
else:
    print('Sorry, you do not have access to view grades')

print('<br>')
print('</table>')
print('<a href="/loggedin.py">Back Button</a><br/>')
print('</body></html>')
cnx.commit()
cnx.close()


