from flask import Blueprint, request
import json
import databaseutils as utils

clientes = Blueprint("clientes", __name__)

clientesColumns = ["cod_cliente", "nome", "nif", "n_consumos"]


@clientes.route("/api/clientes", methods=["GET"])
def get_clientes():
    return utils.getAll(clientesColumns, f"SELECT * FROM selectclientes();")


@clientes.route("/api/clientes/<cod_Cliente>", methods=["GET"])
def get_cliente(cod_Cliente):
    return utils.getOne(clientesColumns,
                        f"SELECT * FROM selectcliente({cod_Cliente});")


@clientes.route("/api/clientes", methods=["POST"])
def post_cliente():
    return utils.postOne(f"CALL insertclientes({json.dumps(request.json)});")


@clientes.route("/api/clientes/<cod_Cliente>", methods=["PUT"])
def put_cliente(cod_Cliente):
    return utils.putOne(
        f"CALL updateclientes({cod_Cliente}, {json.dumps(request.json)});")


@clientes.route("/api/clientes/<cod_Cliente>", methods=["DELETE"])
def delete_cliente(cod_Cliente):
    return utils.deleteOne(f"CALL deleteclientes({cod_Cliente});")