import pytest
import requests
import json

url = "http://127.0.0.1:5000/api/"
endpointName = "datasementa"
idTeste = "tPirSbDCiw"
infoTeste = {
    "cod_dataementa": "tPirSbDCiw",
    "data_ementa": "Thu, 19 Dec 2019 23:20:29 GMT"
}


def test_case1_get():
    response = requests.get(f"{url}{endpointName}/")
    assert response.status_code == 200


def test_case2_get():
    response = requests.get(f"{url}{endpointName}/{idTeste}/")
    assert response.status_code == 200


def test_case3_post():

    headers = {"Content-Type": "application/json"}

    data = {"data_ementa": "Thu, 19 Dec 2019 23:20:29 GMT"}

    response = requests.post(f"{url}{endpointName}/",
                             data=json.dumps(data),
                             headers=headers)
    assert response.status_code == 200


def test_case4_put():

    headers = {"Content-Type": "application/json"}

    data = {"data_ementa": "Thu, 19 Dec 2020 23:20:29 GMT"}

    response = requests.put(f"{url}{endpointName}/{idTeste}/",
                            data=json.dumps(data),
                            headers=headers)

    assert response.status_code == 200


def test_case5_delete():
    response = requests.delete(f"{url}{endpointName}/{idTeste}/")
    assert response.status_code == 200