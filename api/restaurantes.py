from flask import Blueprint, request
import json
import databaseutils as utils

restaurantes = Blueprint("restaurantes", __name__)

restaurantesColumns = [
    "cod_restaurante", "designacao", "cod_local", "n_ementas",
    "n_locaisconsumo"
]


@restaurantes.route("/api/restaurantes", methods=["GET"])
@restaurantes.route("/api/restaurantes/", methods=["GET"])
def get_restaurantes():
    return utils.getAll(restaurantesColumns,
                        f"SELECT * FROM selectrestaurantes();")


@restaurantes.route("/api/restaurantes/<cod_Restaurante>", methods=["GET"])
@restaurantes.route("/api/restaurantes/<cod_Restaurante>/", methods=["GET"])
def get_restaurante(cod_Restaurante):
    return utils.getOne(
        restaurantesColumns,
        f"SELECT * FROM selectrestaurante('{cod_Restaurante}');")


@restaurantes.route("/api/restaurantes", methods=["POST"])
@restaurantes.route("/api/restaurantes/", methods=["POST"])
def post_restaurante():
    return utils.postOne(
        f"CALL insertrestaurantes('{json.dumps(request.json)}');")


@restaurantes.route("/api/restaurantes/<cod_Restaurante>", methods=["PUT"])
@restaurantes.route("/api/restaurantes/<cod_Restaurante>/", methods=["PUT"])
def put_restaurante(cod_Restaurante):
    return utils.putOne(
        f"CALL updaterestaurantes('{cod_Restaurante}', '{json.dumps(request.json)}');"
    )


@restaurantes.route("/api/restaurantes/<cod_Restaurante>", methods=["DELETE"])
@restaurantes.route("/api/restaurantes/<cod_Restaurante>/", methods=["DELETE"])
def delete_restaurante(cod_Restaurante):
    return utils.deleteOne(f"CALL deleterestaurantes('{cod_Restaurante}');")