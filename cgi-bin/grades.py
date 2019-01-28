#!/usr/local/bin/python3
# Mark Mariscal, Christopher Piwarski, Wais Robleh
# Midterm Project
# 25 January 2019
# CST363 Databases Online
# this file must be in the /cgi-bin/ directory of the server
from os import environ
import string
import cgitb, cgi
import mysql.connector
cgitb.enable()

form = cgi.FieldStorage()

# HTML Header
#Get username and password from previous file
print(environ['HTTP_Cookie'])

cookies = environ['HTTP_Cookie']

def find_between(words, first, last):
  try:
    start = words.index(first) + len(first)
    end = words.index(last,start)
    return words[start:end]
  except  ValueError:
    return ""

username = find_between(cookies,"username=",";")
password = find_between(cookies,"password=",";")


# HTML Header
#Below works. Delete after

print("Content-Type: text/html")
print()
print("<html><body>")



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
ul_query = 'SELECT user_level FROM accounts WHERE user_name = \'%s\'' %username

cursor1.execute(ul_query)
fetch = cursor1.fetchone()
test = str(fetch)
result = find_between(test,"(",",")

print('<table border="1"><tr><th>Student Name</th><th>Letter Grade</th><th>Percentage</th></tr>')

print(result)

if result == "1":
    cursor2.execute(student_query, (username,))
    print('Here is your grade:')
    grade = cursor2.fetchone()
    print ('<tr><td>%s <td>%s <td>%s </tr>' % grade)
elif result == "2":
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
print('<a href="/login.py">Back Button</a><br/>')
print('</body></html>')
cnx.commit()
cnx.close()


