from flask import Blueprint

clientes = Blueprint('clientes', __name__)


@clientes.route('/api/clientes', methods=['GET'])
def get_clientes():
    return 'GET Clientes'


@clientes.route('/api/clientes/<cod_Cliente>', methods=['GET'])
def get_cliente(cod_Cliente):
    return 'GET Cliente'


@clientes.route('/api/clientes', methods=['POST'])
def post_cliente():
    return 'POST Cliente'


@clientes.route('/api/clientes/<cod_Cliente>', methods=['PUT'])
def put_cliente(cod_Cliente):
    return 'PUT Cliente'


@clientes.route('/api/clientes/<cod_Cliente>', methods=['DELETE'])
def delete_cliente(cod_Cliente):
    return 'Clientes'
