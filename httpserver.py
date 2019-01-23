# Midterm Project Team 10
# CST363 Databases
# M. Mariscal, C. Piwarski, W. Robleh
# CMS server provided with course material

from http.server import BaseHTTPRequestHandler, HTTPServer, CGIHTTPRequestHandler

def run(server_class=HTTPServer, handler_class=CGIHTTPRequestHandler):
    server_address = ('127.0.0.1', 9000)
    httpd = server_class(server_address, handler_class)
    print("server started", 9000)
    try:
       httpd.serve_forever()
    except:
       pass
    httpd.server_close()
    print("server stopped")

run()
