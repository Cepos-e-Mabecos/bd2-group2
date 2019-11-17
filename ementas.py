from flask import Blueprint

ementas = Blueprint('ementas', __name__)


@ementas.route('/api/ementas', methods=['GET'])
def get_ementas():
    return 'GET Ementas'


@ementas.route('/api/ementas/<cod_Ementa>', methods=['GET'])
def get_ementa(cod_Ementa):
    return 'GET Ementas'


@ementas.route('/api/ementas', methods=['POST'])
def post_ementa():
    return 'POST Ementas'


@ementas.route('/api/ementas/<cod_Ementa>', methods=['PUT'])
def put_ementa(cod_Ementa):
    return 'PUT Ementas'


@ementas.route('/api/ementas/<cod_Ementa>', methods=['DELETE'])
def delete_ementa(cod_Ementa):
    return 'DELETE Ementas'
