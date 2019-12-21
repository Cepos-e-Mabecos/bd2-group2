import pytest
import requests
import json

url = "http://127.0.0.1:5000/api/"
endpointName = "consumos"
idTeste = "tykEWk7L-A"
infoTeste = {
    "cod_cliente": "_bFWsv-uFg",
    "cod_consumo": "tykEWk7L-A",
    "cod_funcionario": "PYYAr9K67g",
    "data_consumo": "Thu, 19 Dec 2019 15:49:54 GMT",
    "n_ementas_consumidas": 1,
    "total": "$9.00"
}


def test_case1_get():
    response = requests.get(f"{url}{endpointName}/")
    assert response.status_code == 200


def test_case2_get():
    response = requests.get(f"{url}{endpointName}/{idTeste}/")
    assert response.status_code == 200


def test_case3_post():

    headers = {"Content-Type": "application/json"}

    data = {"cod_cliente": "4DE91p_xZA", "cod_funcionario": "9pOoz97XDQ"}

    response = requests.post(f"{url}{endpointName}/",
                             data=json.dumps(data),
                             headers=headers)
    assert response.status_code == 200


def test_case4_put():

    headers = {"Content-Type": "application/json"}

    data = {
        "data_consumo": "Thu, 19 Dec 2021 15:24:28 GMT",
        "cod_cliente": "4DE91p_xZA",
        "cod_funcionario": "PYYAr9K67g"
    }

    response = requests.put(f"{url}{endpointName}/{idTeste}/",
                            data=json.dumps(data),
                            headers=headers)

    assert response.status_code == 200


def test_case5_delete():
    response = requests.delete(f"{url}{endpointName}/{idTeste}/")
    assert response.status_code == 200