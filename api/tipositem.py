from flask import Blueprint, request
import json
import databaseutils as utils

tipositem = Blueprint("tipositem", __name__)

tipositemColumns = ["cod_tipoitem", "designacao"]


@tipositem.route("/api/tipositem", methods=["GET"])
@tipositem.route("/api/tipositem/", methods=["GET"])
def get_tipositem():
    return utils.getAll(tipositemColumns, f"SELECT * FROM selecttipositem();")


@tipositem.route("/api/tipositem/<cod_TipoItem>", methods=["GET"])
@tipositem.route("/api/tipositem/<cod_TipoItem>/", methods=["GET"])
def get_tipoitem(cod_TipoItem):
    return utils.getOne(tipositemColumns,
                        f"SELECT * FROM selecttipoitem('{cod_TipoItem}');")


@tipositem.route("/api/tipositem", methods=["POST"])
@tipositem.route("/api/tipositem/", methods=["POST"])
def post_tipoitem():
    return utils.postOne(
        f"CALL inserttipositem('{json.dumps(request.json)}');")


@tipositem.route("/api/tipositem/<cod_TipoItem>", methods=["PUT"])
@tipositem.route("/api/tipositem/<cod_TipoItem>/", methods=["PUT"])
def put_tipoitem(cod_TipoItem):
    return utils.putOne(
        f"CALL updatetipositem('{cod_TipoItem}', '{json.dumps(request.json)}');"
    )


@tipositem.route("/api/tipositem/<cod_TipoItem>", methods=["DELETE"])
@tipositem.route("/api/tipositem/<cod_TipoItem>/", methods=["DELETE"])
def delete_tipoitem(cod_TipoItem):
    return utils.deleteOne(f"CALL deletetipositem('{cod_TipoItem}');")