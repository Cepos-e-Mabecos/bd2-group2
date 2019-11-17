from flask import Blueprint

funcionarios = Blueprint('funcionarios', __name__)


@funcionarios.route('/api/funcionarios', methods=['GET'])
def get_funcionarios():
    return 'GET Funcionarios'


@funcionarios.route('/api/funcionarios/<cod_Funcionario>', methods=['GET'])
def get_funcionario(cod_Funcionario):
    return 'GET Funcionario'


@funcionarios.route('/api/funcionarios', methods=['POST'])
def post_funcionario():
    return 'POST Funcionario'


@funcionarios.route('/api/funcionarios/<cod_Funcionario>', methods=['PUT'])
def put_funcionario(cod_Funcionario):
    return 'PUT Funcionario'


@funcionarios.route('/api/funcionarios/<cod_Funcionario>', methods=['DELETE'])
def delete_funcionario(cod_Funcionario):
    return 'DELETE Funcionario'
