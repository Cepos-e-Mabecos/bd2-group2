import pytest
import requests
import json

url = 'http://127.0.0.1:5000/api/'
endpointName = 'itens'
idTeste = 'RUxjbG4PFg'
infoTeste = {
    "cod_item": "RUxjbG4PFg",
    "cod_tipoitem": "PowJfLXyqQ",
    "custo": "$4.50",
    "designacao": "Ovo"
}


def test_case1_get():
    response = requests.get(f"{url}{endpointName}/")
    assert response.status_code == 200


def test_case2_get():
    response = requests.get(f"{url}{endpointName}/{idTeste}/")
    assert response.status_code == 200
    assert response.json().get('message') == infoTeste


def test_case3_post():

    headers = {'Content-Type': 'application/json'}

    data = {
        "cod_tipoitem": "PowJfLXyqQ",
        "custo": "$4.50",
        "designacao": "Itens Teste"
    }

    response = requests.post(f"{url}{endpointName}/",
                             data=json.dumps(data),
                             headers=headers)
    assert response.status_code == 200


def test_case4_put():

    headers = {'Content-Type': 'application/json'}

    data = {
        "cod_tipoitem": "PowJfLXyqQ",
        "custo": "$4.50",
        "designacao": "Itens Teste PUT"
    }

    response = requests.put(f"{url}{endpointName}/{idTeste}/",
                            data=json.dumps(data),
                            headers=headers)

    assert response.status_code == 200
    assert response.json().get('message') == data


def test_case5_delete():
    response = requests.delete(f"{url}{endpointName}/{idTeste}/")
    assert response.status_code == 200
    assert response.json().get('message') == "Success"