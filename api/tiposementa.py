from flask import Blueprint, request
import json
import databaseutils as utils

tiposementa = Blueprint("tiposementa", __name__)

tiposementaColumns = ["cod_tipoementa", "designacao"]


@tiposementa.route("/api/tiposementa", methods=["GET"])
@tiposementa.route("/api/tiposementa/", methods=["GET"])
def get_tiposementa():
    return utils.getAll(tiposementaColumns,
                        f"SELECT * FROM selecttiposementa();")


@tiposementa.route("/api/tiposementa/<cod_TipoEmenta>", methods=["GET"])
@tiposementa.route("/api/tiposementa/<cod_TipoEmenta>/", methods=["GET"])
def get_tipoementa(cod_TipoEmenta):
    return utils.getOne(
        tiposementaColumns,
        f"SELECT * FROM selecttipoementa('{cod_TipoEmenta}');")


@tiposementa.route("/api/tiposementa", methods=["POST"])
@tiposementa.route("/api/tiposementa/", methods=["POST"])
def post_tipoementa():
    return utils.postOne(
        f"CALL inserttiposementa('{json.dumps(request.json)}');")


@tiposementa.route("/api/tiposementa/<cod_TipoEmenta>", methods=["PUT"])
@tiposementa.route("/api/tiposementa/<cod_TipoEmenta>/", methods=["PUT"])
def put_tipoementa(cod_TipoEmenta):
    return utils.putOne(
        f"CALL updatetiposementa('{cod_TipoEmenta}', '{json.dumps(request.json)}');"
    )


@tiposementa.route("/api/tiposementa/<cod_TipoEmenta>", methods=["DELETE"])
@tiposementa.route("/api/tiposementa/<cod_TipoEmenta>/", methods=["DELETE"])
def delete_tipoementa(cod_TipoEmenta):
    return utils.deleteOne(f"CALL deletetiposementa('{cod_TipoEmenta}');")