from flask import Blueprint

alergias = Blueprint('alergias', __name__)


@alergias.route('/api/alergias', methods=['GET'])
def get_alergias():
    return 'GET Alergias'


@alergias.route('/api/alergias/<cod_Alergia>', methods=['GET'])
def get_alergia(cod_Alergia):
    return 'GET Alergias'


@alergias.route('/api/alergias', methods=['POST'])
def post_alergia():
    return 'POST Alergias'


@alergias.route('/api/alergias/<cod_Alergia>', methods=['PUT'])
def put_alergia(cod_Alergia):
    return 'PUT Alergias'


@alergias.route('/api/alergias/<cod_Alergia>', methods=['DELETE'])
def delete_alergia(cod_Alergia):
    return 'DELETE Alergias'
