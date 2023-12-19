
from flask import Flask, url_for, redirect, request, make_response, render_template, session, g
import MySQLdb



app = Flask('Prva flask aplikacija')

app.secret_key = '_de5jRRR83x'



#LV7 ZAD3
@app.get('/')
def index():
    g.cursor.execute(render_template('datoteka.sql', table='temperatura'))


    response = render_template('index.html', naslov='Početna stranica', Username=session['username'], temperatura=g.cursor.fetchall())
    return response, 200

@app.get('/login')
def login():
    response = render_template('login.html', naslov='Stranica za prijavu')
    return response, 200

#LV7 4zad
@app.post('/temperatura')
def put_temperatura():
    global temperatura
    response = make_response()
    if request.json.get('temperatura') is not None:
        query = render_template('datoteka2.sql', value=request.json.get('temperatura'))
        g.cursor.execute(query)
        response.data = 'Uspješno ste postavili temperaturu'
        response.status_code = 201
    else:
        response.data = 'Niste napisali ispravan ključ'
        response.status_code = 404
    return response


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

#LV7
#2.zad
@app.before_request
def before_request_func():
    g.connection = MySQLdb.connect(host="localhost", user="app", passwd="1234", db="lv6")
    g.cursor = g.connection.cursor()

    if request.path == '/login' or request.path == '/static' or request.path == '/temperatura':
        return

    if session.get('username') is None:
        return redirect(url_for('login'))

@app.after_request
def after_request_func(response):
    g.connection.commit()
    g.connection.close()

    return response

#3.zad


if __name__ == '__main__':
    app.run(host = '0.0.0.0', port = 80)