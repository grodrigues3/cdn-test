from flask import Flask
import socket
my_flask_app = Flask(__name__)


"""
Sample code to test out google cloud's load balancing and CDN
"""
@my_flask_app.route('/')
def hello():
    hostname = socket.gethostname()
    return "Hellooo World! from " + hostname

if __name__ == '__main__':
    my_flask_app.run("0.0.0.0", port=5000, debug=True)
