#!/usr/local/bin/python3
import cgitb, cgi
import mysql.connector
import os
import urllib

cgitb.enable()

form = cgi.FieldStorage()
username = form['userid'].value
password = form['password'].value

#Check to see if user is login, clear or error
login = False
clear = False
error = False

if "login" in form:
        login = True
elif "clear" in form:
        clear = True
else:
        error = True

print("Content-Type: text/html")    # HTML is following
print()                             # blank line required, end of headers
print("<html>")


# connect to database
cnx = mysql.connector.connect(user='root',
                                password='root',
                                database='cms',
                                host='127.0.0.1')

#MYSQL code here
cursor1 = cnx.cursor()  # Creates a cursor object, which is used to execute a MySQL query

# determine user level 
ul_query = 'SELECT user_name, user_password FROM accounts WHERE user_name = \'%s\'' % username

cursor1.execute(ul_query)
result = cursor1.fetchone()


if login:
        if result is None:
                # user does not exist. Prompt user to register
                print("<body><p>")
                print('Userid does not exist.</p><br>')
                print('Click back and register.')
        elif result[1] == password:
                print("<head>")
                print("<meta http-equiv=\"refresh\" content=\"0;url=student.html\" /> ")
                print("</head>")
                print("<body><p>")
                print('</p><br>')
                print('Welcome,', username)
                print('reDirecting')
        else:
                print("<body><p>")
                print('Incorrect password for user: ', username)
print("</body></html>")
cnx.commit()    # IMPORTANT. Must commit 
cnx.close() # close the connection
