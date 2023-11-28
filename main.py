
from flask import Flask, url_for, redirect, request, make_response, render_template, session


app = Flask('Prva flask aplikacija')

app.secret_key = '_de5jRRR83x'

@app.before_request
def before_request_func():
    if request.path == '/login':
        return
    if session.get('username') is None:
        return redirect(url_for('login'))

#LV5 ZAD2,3
@app.get('/')
def index():
    response = render_template('index.html', naslov='Početna stranica', Username=session['username'])
    return response, 200

@app.get('/login')
def login():
    response = render_template('login.html', naslov='Stranica za prijavu')
    return response, 200


@app.get('/logout')
def logout():
    session.pop('username')
    return redirect(url_for('login'))





#LV5 ZAD4
@app.post('/login')
def provjera():
    username = request.form.get('username')
    password = request.form.get('password')
    
    if username == 'PURS' and password == '1234':
        session['username'] = username
        return render_template('index.html', naslov='Početna stranica')
    else:
        print("Upisali ste krivi username ili lozinku")
        return render_template('login.html', naslov='Stranica za prijavu', poruka="Upisali ste krivi username ili lozinku")

if __name__ == '__main__':
    app.run(host = '0.0.0.0', port = 80)