from flask import Blueprint, request
import json
import databaseutils as utils

funcionarios = Blueprint("funcionarios", __name__)

funcionariosColumns = [
    "cod_funcionario", "nome", "cod_localconsumo", "ativo", "n_consumos"
]


@funcionarios.route("/api/funcionarios", methods=["GET"])
@funcionarios.route("/api/funcionarios/", methods=["GET"])
def get_funcionarios():
    return utils.getAll(funcionariosColumns,
                        f"SELECT * FROM selectfuncionarios();")


@funcionarios.route("/api/funcionarios/<cod_Funcionario>", methods=["GET"])
@funcionarios.route("/api/funcionarios/<cod_Funcionario>/", methods=["GET"])
def get_funcionario(cod_Funcionario):
    return utils.getOne(
        funcionariosColumns,
        f"SELECT * FROM selectfuncionario('{cod_Funcionario}');")


@funcionarios.route("/api/funcionarios", methods=["POST"])
@funcionarios.route("/api/funcionarios/", methods=["POST"])
def post_funcionario():
    return utils.postOne(
        f"CALL insertfuncionarios('{json.dumps(request.json)}');")


@funcionarios.route("/api/funcionarios/<cod_Funcionario>", methods=["PUT"])
@funcionarios.route("/api/funcionarios/<cod_Funcionario>/", methods=["PUT"])
def put_funcionario(cod_Funcionario):
    return utils.putOne(
        f"CALL updatefuncionarios('{cod_Funcionario}', '{json.dumps(request.json)}');"
    )


@funcionarios.route("/api/funcionarios/<cod_Funcionario>", methods=["DELETE"])
@funcionarios.route("/api/funcionarios/<cod_Funcionario>/", methods=["DELETE"])
def delete_funcionario(cod_Funcionario):
    return utils.deleteOne(f"CALL deletefuncionarios('{cod_Funcionario}');")