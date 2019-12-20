from flask import Blueprint, request
import json
import databaseutils as utils

consumos = Blueprint("consumos", __name__)

consumosColumns = [
    "cod_consumo", "data_consumo", "cod_cliente", "cod_funcionario",
    "n_ementas_consumidas", "total"
]


@consumos.route("/api/consumos", methods=["GET"])
@consumos.route("/api/consumos/", methods=["GET"])
def get_consumos():
    return utils.getAll(consumosColumns, f"SELECT * FROM selectconsumos();")


@consumos.route("/api/consumos/<cod_Consumo>", methods=["GET"])
@consumos.route("/api/consumos/<cod_Consumo>/", methods=["GET"])
def get_consumo(cod_Consumo):
    return utils.getOne(consumosColumns,
                        f"SELECT * FROM selectconsumo('{cod_Consumo}');")


@consumos.route("/api/consumos", methods=["POST"])
@consumos.route("/api/consumos/", methods=["POST"])
def post_consumo():
    return utils.postOne(f"CALL insertconsumos('{json.dumps(request.json)}');")


@consumos.route("/api/consumos/<cod_Consumo>", methods=["PUT"])
@consumos.route("/api/consumos/<cod_Consumo>/", methods=["PUT"])
def put_consumo(cod_Consumo):
    return utils.putOne(
        f"CALL updateconsumos('{cod_Consumo}', '{json.dumps(request.json)}');")


@consumos.route("/api/consumos/<cod_Consumo>", methods=["DELETE"])
@consumos.route("/api/consumos/<cod_Consumo>/", methods=["DELETE"])
def delete_consumo(cod_Consumo):
    return utils.deleteOne(f"CALL deleteconsumos('{cod_Consumo}');")