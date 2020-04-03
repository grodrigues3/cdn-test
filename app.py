from flask import Flask
import socket
app = Flask(__name__)


"""
Sample code to test out google cloud's load balancing and CDN
"""
@app.route('/')
def hello():
    hostname = socket.gethostname()
    return "Hellooo World! from " + hostname

if __name__ == '__main__':
    app.run("0.0.0.0", port=5000, debug=True)
