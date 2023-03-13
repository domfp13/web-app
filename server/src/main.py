from flask import Flask
from os import environ

app = Flask(__name__)

@app.route("/")
def home():
    return "Hellow, this is an application"

if __name__ == "__main__":
    server_port = int(environ.get('PORT', '8080'))
    app.run(debug=True, host='0.0.0.0', port=server_port)
