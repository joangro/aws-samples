from flask import Flask

application=Flask(__name__)

@application.route('/')
def main():
    return "ok"

if __name__ == "__main__":
    application.run('0.0.0.0', debug=True)
