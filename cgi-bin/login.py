#!/usr/local/bin/python3
import cgitb, cgi
import mysql.connector
import os
import urllib
import sys

cgitb.enable()
form = cgi.FieldStorage()
if 'userid' not in form:
        username = None
else:
        username = form['userid'].value
if 'password' not in form:
        password = None
else:
        password = form['password'].value


print("Set-Cookie:username = %s" % username)
print("Set-Cookie:password = %s" % password)
#print("Set-Cookie:Expires = Tuesday, 31-January-2019 23:12:40 GMT\";\r\n")
#print("Set-Cookie:Domain = 127.0.0.1/9000;\r\n")
#print("Set-Cookie:Path = /perl;\n")
#print("Content-type:text/html\r\n\r\n")
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

if username == None or password == None:
        print("<html><head><meta http-equiv=\"Refresh\" content=\"7; url=/cms.html\"/></head>")
        print("<body><p>Please write a username and or password. <a href=\"/cms.html\">Return to search</a> </p></body></html>")
        sys.exit()
# determine user level 
ul_query = 'SELECT user_name, user_password FROM accounts WHERE user_name = %s'

cursor1.execute(ul_query, (username,))
result = cursor1.fetchone()


if login:
        if result is None:
                # user does not exist. Prompt user to register
                print("<body><p>")
                print('Userid does not exist.</p><br>')
                print('Click back and register.')
                print('<a href="http://127.0.0.1:9000/cms.html">Back Button</a><br/>')
        elif result[1] == password:
                print("<head>")
                print("<meta http-equiv=\"refresh\" content=\"0;url=http://127.0.0.1:9000/portal.html\" /> ")
                print("</head>")
                print("<title>You are about to be redirected</title>")
                print("<body><p>")
                print('</p><br>')
                print('Welcome,', username)
                print('reDirecting')
        else:
                print("<body><p>")
                print('Incorrect password for user: ', username)
                print('<br>')
                print('Click back and use the correct password.')
                print('<a href="http://127.0.0.1:9000/cms.html">Back Button</a><br/>')
elif clear:
        print("<head>")
        print("<meta http-equiv=\"refresh\" content=\"0;url=http://127.0.0.1:9000/cms.html\" /> ")
        print("</head>")
        print("<title>You are about to be redirected</title>")
        print("<body><p>")
        print('</p><br>')
        print('reDirecting')
print("</body></html>")
cnx.commit()    # IMPORTANT. Must commit 
cnx.close() # close the connection
