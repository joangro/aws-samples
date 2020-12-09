from flask import Flask
import os

application=Flask(__name__)

var1 = os.environ.get('TEST', 'nothing found')
var2 = os.environ.get('TEST2', 'nothing found')

@application.route('/')
def index():
    return  "Var 1: {}\nVar 2: {}".format(var1, var2)

if __name__=="__main__":
    application.run("127.0.0.1", debug=True)
