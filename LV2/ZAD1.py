from flask import flask

app = Flask("Prva flask aplikacija")

@app.get('/')
def index():
    return 'Početna stranica'

@app.get('/login')
def index():
    return 'Stranica za prijavu'
    