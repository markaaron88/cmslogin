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
print('Content-Type: text/html')
print()
print('<html><title>REGISTRATION</title><body>')

try:
    cnx = mysql.connector.connect(user='root',
                                password='root',
                                database='cms',
                                host='127.0.0.1')

    cursor1 = cnx.cursor()
except mysql.connector.Error as err:
    raise SystemExit
    print("ERROR", err)

# determine user level 
ul_query = 'SELECT user_level FROM accounts WHERE user_name = \'%s\'' % username

cursor1.execute(ul_query)
fetch = cursor1.fetchone()
test = str(fetch)
result = find_between(test,"(",",")

if result == '3':
    print('<form action="/cgi-bin/register.py" method = "post">')
    print('New Userid: <input type="text" name="new_userid"/> <br/>')
    print('New Password: <input type="text" name="new_password" />')
    print('<br>')
    print('<input type="submit" value="register" name="register"/>')
    print('</form>')
else:
    print('Sorry, you do not have the correct privilege level to create user accounts.')

print('<br>')
print('</body></html>')
cnx.commit()
cnx.close()