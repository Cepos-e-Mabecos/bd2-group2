from flask import Blueprint

consumos = Blueprint('consumos', __name__)


@consumos.route('/api/consumos', methods=['GET'])
def get_consumos():
    return 'GET Consumos'


@consumos.route('/api/consumos/<cod_Consumo>', methods=['GET'])
def get_consumo(cod_Consumo):
    return 'GET Consumos'


@consumos.route('/api/consumos', methods=['POST'])
def post_consumo():
    return 'POST Consumos'


@consumos.route('/api/consumos/<cod_Consumo>', methods=['PUT'])
def put_consumo(cod_Consumo):
    return 'PUT Consumos'


@consumos.route('/api/consumos/<cod_Consumo>', methods=['DELETE'])
def delete_consumo(cod_Consumo):
    return 'DELETE Consumos'
