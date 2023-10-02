from flask import Flask
from datetime import datetime

app = Flask(__name__)

@app.route('/')
def index():
    po = f'<h1> Captone Project of Udacity VUNPH </h1>'
    return po

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80, debug=True)