from flask import Flask
import psycopg2

app = Flask(__name__)

@app.route('/')
def checkConnection():
    try:
        #conn = psycopg2.connect("dbname='test' user='test' host='database' password='Test123!'")
        conn = psycopg2.connect("dbname='test' user='test' host='127.0.0.1' password='Test123!'")
        return "ok"
    except:
        return "I am unable to connect to the database"

if __name__=='__main__':
    app.run('0.0.0.0', port=8080, debug=True)
