from flask import Flask, render_template

app = Flask(__name__)

@app.route('/')
def index():
    po = "<h1> Captone Project of Udacity VUNPH </h1>"
    return po.format(format)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80, debug=True)