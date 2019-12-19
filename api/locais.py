from flask import Blueprint, request
import json
import databaseutils as utils

locais = Blueprint("locais", __name__)

locaisColumns = ["cod_local", "designacao", "n_restaurantes"]


@locais.route("/api/locais", methods=["GET"])
@locais.route("/api/locais/", methods=["GET"])
def get_locais():
    return utils.getAll(locaisColumns, f"SELECT * FROM selectlocais();")


@locais.route("/api/locais/<cod_Local>", methods=["GET"])
@locais.route("/api/locais/<cod_Local>/", methods=["GET"])
def get_local(cod_Local):
    return utils.getOne(locaisColumns,
                        f"SELECT * FROM selectlocal('{cod_Local}');")


@locais.route("/api/locais", methods=["POST"])
@locais.route("/api/locais/", methods=["POST"])
def post_local():
    return utils.postOne(
        locaisColumns,
        f"SELECT * FROM insertlocais('{json.dumps(request.json)}');")


@locais.route("/api/locais/<cod_Local>", methods=["PUT"])
@locais.route("/api/locais/<cod_Local>/", methods=["PUT"])
def put_local(cod_Local):
    return utils.putOne(
        f"CALL updatelocais('{cod_Local}', '{json.dumps(request.json)}');")


@locais.route("/api/locais/<cod_Local>", methods=["DELETE"])
@locais.route("/api/locais/<cod_Local>/", methods=["DELETE"])
def delete_local(cod_Local):
    return utils.deleteOne(f"CALL deletelocais('{cod_Local}');")