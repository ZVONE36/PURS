import requests

payload = {
    "temperatura": '28',
}

response = requests.post('http://192.168.86.210/temperatura',json=payload)

print(response.text)
print(response.status_code)