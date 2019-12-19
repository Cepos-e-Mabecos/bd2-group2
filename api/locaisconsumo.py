from flask import Blueprint, request
import json
import databaseutils as utils

locaisconsumo = Blueprint("locaisconsumo", __name__)

locaisconsumoColumns = [
    "cod_localconsumo", "designacao", "cod_restaurante", "n_funcionarios"
]


@locaisconsumo.route("/api/locaisconsumo", methods=["GET"])
@locaisconsumo.route("/api/locaisconsumo/", methods=["GET"])
def get_locaisconsumo():
    return utils.getAll(locaisconsumoColumns,
                        f"SELECT * FROM selectlocaisconsumo();")


@locaisconsumo.route("/api/locaisconsumo/<cod_LocalConsumo>", methods=["GET"])
@locaisconsumo.route("/api/locaisconsumo/<cod_LocalConsumo>/", methods=["GET"])
def get_localconsumo(cod_LocalConsumo):
    return utils.getOne(
        locaisconsumoColumns,
        f"SELECT * FROM selectlocalconsumo('{cod_LocalConsumo}');")


@locaisconsumo.route("/api/locaisconsumo", methods=["POST"])
@locaisconsumo.route("/api/locaisconsumo/", methods=["POST"])
def post_localconsumo():
    return utils.postOne(
        locaisconsumoColumns,
        f"SELECT * FROM insertlocaisconsumo('{json.dumps(request.json)}');")


@locaisconsumo.route("/api/locaisconsumo/<cod_LocalConsumo>", methods=["PUT"])
@locaisconsumo.route("/api/locaisconsumo/<cod_LocalConsumo>/", methods=["PUT"])
def put_localconsumo(cod_LocalConsumo):
    return utils.putOne(
        f"CALL updatelocaisconsumo('{cod_LocalConsumo}', '{json.dumps(request.json)}');"
    )


@locaisconsumo.route("/api/locaisconsumo/<cod_LocalConsumo>",
                     methods=["DELETE"])
@locaisconsumo.route("/api/locaisconsumo/<cod_LocalConsumo>/",
                     methods=["DELETE"])
def delete_localconsumo(cod_LocalConsumo):
    return utils.deleteOne(f"CALL deletelocaisconsumo('{cod_LocalConsumo}');")