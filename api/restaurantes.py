from flask import Blueprint

restaurantes = Blueprint('restaurantes', __name__)


@restaurantes.route('/api/restaurantes', methods=['GET'])
def get_restaurantes():
    return 'GET Restaurantes'


@restaurantes.route('/api/restaurantes/<cod_Restaurante>', methods=['GET'])
def get_restaurante(cod_Restaurante):
    return 'GET Restaurantes'


@restaurantes.route('/api/restaurantes', methods=['POST'])
def post_restaurante():
    return 'POST Restaurantes'


@restaurantes.route('/api/restaurantes/<cod_Restaurante>', methods=['PUT'])
def put_restaurante(cod_Restaurante):
    return 'PUT Restaurantes'


@restaurantes.route('/api/restaurantes/<cod_Restaurante>', methods=['DELETE'])
def delete_restaurante(cod_Restaurante):
    return 'DELETE Restaurantes'
