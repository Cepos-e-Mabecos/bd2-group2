from flask import Blueprint, request
import json
import databaseutils as utils

itens = Blueprint("itens", __name__)

itensColumns = ["cod_item", "designacao", "custo", "cod_tipoitem"]


@itens.route("/api/itens", methods=["GET"])
@itens.route("/api/itens/", methods=["GET"])
def get_itens():
    return utils.getAll(itensColumns, f"SELECT * FROM selectiten();")


@itens.route("/api/itens/<cod_Item>", methods=["GET"])
@itens.route("/api/itens/<cod_Item>/", methods=["GET"])
def get_item(cod_Item):
    return utils.getOne(itensColumns,
                        f"SELECT * FROM selectitem('{cod_Item}');")


@itens.route("/api/itens", methods=["POST"])
@itens.route("/api/itens/", methods=["POST"])
def post_item():
    return utils.postOne(f"CALL insertitens('{json.dumps(request.json)}');")


@itens.route("/api/itens/<cod_Item>", methods=["PUT"])
@itens.route("/api/itens/<cod_Item>/", methods=["PUT"])
def put_item(cod_Item):
    return utils.putOne(
        f"CALL updateitens('{cod_Item}', '{json.dumps(request.json)}');")


@itens.route("/api/itens/<cod_Item>", methods=["DELETE"])
@itens.route("/api/itens/<cod_Item>/", methods=["DELETE"])
def delete_item(cod_Item):
    return utils.deleteOne(f"CALL deleteitens('{cod_Item}');")