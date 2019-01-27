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
print('Content-Type: text/html')
print()
print('<html><title>Registration</title>><body>')
print("""<form action="/cgi-bin/login.py" method = "post">
 New Userid: <input type="text" name="register_userid"/> <br/>
 New Password: <input type="text" name="register_password" />
 <br>
 <input type="submit" value="login" name="login"/>
 <input type="submit" value="register" name="register"/>
</form>""")
print("</body></html>")
