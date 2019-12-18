from flask import Blueprint, request
import json
import databaseutils as utils

ementas = Blueprint("ementas", __name__)

ementasColumns = [
    "cod_ementa", "cod_tipoementa", "cod_dataementa", "cod_tiporefeicao",
    "cod_restaurante", "preco"
]


@ementas.route("/api/ementas", methods=["GET"])
def get_ementas():
    return utils.getAll(ementasColumns, f"SELECT * FROM selectementas();")


@ementas.route("/api/ementas/<cod_Ementa>", methods=["GET"])
def get_ementa(cod_Ementa):
    return utils.getOne(ementasColumns,
                        f"SELECT * FROM selectementa({cod_Ementa});")


@ementas.route("/api/ementas", methods=["POST"])
def post_ementa():
    return utils.postOne(f"CALL insertementas({json.dumps(request.json)});")


@ementas.route("/api/ementas/<cod_Ementa>", methods=["PUT"])
def put_ementa(cod_Ementa):
    return utils.putOne(
        f"CALL updateementas({cod_Ementa}, {json.dumps(request.json)});")


@ementas.route("/api/ementas/<cod_Ementa>", methods=["DELETE"])
def delete_ementa(cod_Ementa):
    return utils.deleteOne(f"CALL deleteementas({cod_Ementa});")