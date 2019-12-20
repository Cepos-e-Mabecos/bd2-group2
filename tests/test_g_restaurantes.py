import pytest
import requests
import json

url = 'http://127.0.0.1:5000/api/'
endpointName = 'restaurantes'
idTeste = 'OCrWaO9X7g'
infoTeste = {
    "cod_local": "Kz6POjTWkg",
    "cod_restaurante": "OCrWaO9X7g",
    "designacao": "Restaurante do Diogo",
    "n_ementas": 0,
    "n_locaisconsumo": 2
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

    data = {'designacao': 'Restaurante Teste', 'cod_local': 'Kz6POjTWkg'}

    response = requests.post(f"{url}{endpointName}/",
                             data=json.dumps(data),
                             headers=headers)
    assert response.status_code == 200
    assert response.json().get('message') == data


def test_case4_put():

    headers = {'Content-Type': 'application/json'}

    data = {'designacao': 'Restaurante Teste PUT', 'cod_local': 'Kz6POjTWkg'}

    response = requests.put(f"{url}{endpointName}/{idTeste}/",
                            data=json.dumps(data),
                            headers=headers)

    assert response.status_code == 200


def test_case5_delete():
    response = requests.delete(f"{url}{endpointName}/{idTeste}/")
    assert response.status_code == 200
    assert response.json().get('message') == "Success"