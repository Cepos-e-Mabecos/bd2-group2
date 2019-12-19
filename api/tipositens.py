from flask import Blueprint, request
import json
import databaseutils as utils

tipositens = Blueprint("tipositens", __name__)

tipositensColumns = ["cod_tipoitem", "designacao"]


@tipositens.route("/api/tipositens", methods=["GET"])
@tipositens.route("/api/tipositens/", methods=["GET"])
def get_tipositens():
    return utils.getAll(tipositensColumns, f"SELECT * FROM selecttipositem();")


@tipositens.route("/api/tipositens/<cod_TipoItem>", methods=["GET"])
@tipositens.route("/api/tipositens/<cod_TipoItem>/", methods=["GET"])
def get_tipoitem(cod_TipoItem):
    return utils.getOne(tipositensColumns,
                        f"SELECT * FROM selecttipoitem('{cod_TipoItem}');")


@tipositens.route("/api/tipositens", methods=["POST"])
@tipositens.route("/api/tipositens/", methods=["POST"])
def post_tipoitem():
    return utils.postOne(
        f"CALL inserttipositens('{json.dumps(request.json)}');")


@tipositens.route("/api/tipositens/<cod_TipoItem>", methods=["PUT"])
@tipositens.route("/api/tipositens/<cod_TipoItem>/", methods=["PUT"])
def put_tipoitem(cod_TipoItem):
    return utils.putOne(
        f"CALL updatetipositem('{cod_TipoItem}', '{json.dumps(request.json)}');"
    )


@tipositens.route("/api/tipositens/<cod_TipoItem>", methods=["DELETE"])
@tipositens.route("/api/tipositens/<cod_TipoItem>/", methods=["DELETE"])
def delete_tipoitem(cod_TipoItem):
    return utils.deleteOne(f"CALL deletetipositem('{cod_TipoItem}');")