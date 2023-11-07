from flask import Flask, make_response, request

app = Flask("Prva flask aplikacija")

@app.get('/prvi_bod')
def index():
    return 'Uspjeh',202

@app.get('/drugi_bod')
def drugi():
    json = {
        "broj_bodova":2 
    }
    resp = make_response(json)
    return resp

@app.delete('/treci_bod')
def treci():
    sk=request.args.get('bodovi')
    return 'Uspjeh', sk

if __name__ == '__main__':
    app.run(host='0.0.0.0', port = 80)

