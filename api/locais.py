from flask import Blueprint

locais = Blueprint('locais', __name__)


@locais.route('/api/locais', methods=['GET'])
def get_locais():
    return 'GET Locais'


@locais.route('/api/locais/<cod_Local>', methods=['GET'])
def get_local(cod_Local):
    return 'GET Locais'


@locais.route('/api/locais', methods=['POST'])
def post_local():
    return 'POST Locais'


@locais.route('/api/locais/<cod_Local>', methods=['PUT'])
def put_local(cod_Local):
    return 'PUT Locais'


@locais.route('/api/locais/<cod_Local>', methods=['DELETE'])
def delete_local(cod_Local):
    return 'DELETE Locais'
