from flask import Flask

app=Flask(__name__)

@app.route('/')
def index():
    return 'OK', 200

if __name__=='__main__':
    #app.run('127.0.0.1', port=8080, debug=True)
    app.run(debug=True)
