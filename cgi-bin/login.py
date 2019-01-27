import cgitb, cgi
import mysql.connector
import os
import urllib

cgitb.enable()

form = cgi.FieldStorage()
username = form['user_name'].value
password = form['user_password'].value

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
print("<html><body><p>")


# connect to database
cnx = mysql.connector.connect(user='root',
                                password='root',
                                database='cms',
                                host='127.0.0.1')

#MYSQL code here
cursor1 = cnx.cursor()  # Creates a cursor object, which is used to execute a MySQL query

# determine user level 
ul_query = 'SELECT user_level FROM accounts'

cursor1.execute(ul_query)
result = cursor1.fetchone()
currentpage = os.path.join(os.getcwd(),student.html)
page = urlib.request.urlopen(currentpage).read()
	
if login:
	if result is None:
                # user does not exist. Prompt user to register
                print('Userid does not exist.</p><br>')
                print('Click back and register.')
        elif result[2] == password:        
                print('</p><br>')
                print(page)
                print ('Welcome,', username)
	else:
                print('Incorrect password for user: ', username)
print("</body></html>")
cnx.commit()    # IMPORTANT. Must commit 
cnx.close() # close the connection
