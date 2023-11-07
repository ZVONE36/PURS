from flask import Flask, url_for, redirect, request

app = Flask("Prva flask aplikacija")

temperatura = []

@app.get('/')
def index():
    return 'Početna stranica'


@app.get('/login')
def login():
    return 'Stranica za prijavu'


@app.post('/login')
def check():
    username = request.json.get('username')
    password = request.json.get('password')
    
    if username == 'PURS' and password == '1234':
        return redirect(url_for('index'))
    else:
        return redirect(url_for('login'))

@app.post('/temperatura')
def rect():
    temp = request.json.get('temperatura')
    if temp is not None:
        global temperatura
        temperatura.append(temp)
        return 'Uspješno ste postavili temperaturu'
    else:
        return 'Niste upisali ispravan kluč'

if __name__ == '__main__':
    app.run()