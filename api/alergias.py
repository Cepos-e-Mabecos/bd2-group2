from flask import Blueprint, request
import json
import databaseutils as utils

alergias = Blueprint("alergias", __name__)

alergiasColumns = ["cod_alergia", "designacao"]


@alergias.route("/api/alergias", methods=["GET"])
@alergias.route("/api/alergias/", methods=["GET"])
def get_alergias():
    return utils.getAll(alergiasColumns, f"SELECT * FROM selectalergias();")


@alergias.route("/api/alergias/<cod_Alergia>", methods=["GET"])
@alergias.route("/api/alergias/<cod_Alergia>/", methods=["GET"])
def get_alergia(cod_Alergia):
    return utils.getOne(alergiasColumns,
                        f"SELECT * FROM selectalergia('{cod_Alergia}');")


@alergias.route("/api/alergias", methods=["POST"])
@alergias.route("/api/alergias/", methods=["POST"])
def post_alergia():
    return utils.postOne(
        alergiasColumns,
        f"SELECT * FROM insertalergias('{json.dumps(request.json)}');")


@alergias.route("/api/alergias/<cod_Alergia>", methods=["PUT"])
@alergias.route("/api/alergias/<cod_Alergia>/", methods=["PUT"])
def put_alergia(cod_Alergia):
    return utils.putOne(
        f"CALL updatealergias('{cod_Alergia}', '{json.dumps(request.json)}');")


@alergias.route("/api/alergias/<cod_Alergia>", methods=["DELETE"])
@alergias.route("/api/alergias/<cod_Alergia>/", methods=["DELETE"])
def delete_alergia(cod_Alergia):
    return utils.deleteOne(f"CALL deletealergias('{cod_Alergia}');")