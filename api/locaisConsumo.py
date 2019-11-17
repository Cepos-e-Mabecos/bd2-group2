from flask import Blueprint

locaisConsumo = Blueprint('locaisConsumo', __name__)


@locaisConsumo.route('/api/locaisconsumo', methods=['GET'])
def get_locaisconsumo():
    return 'GET LocaisConsumo'


@locaisConsumo.route('/api/locaisconsumo/<cod_LocalConsumo>', methods=['GET'])
def get_localconsumo(cod_LocalConsumo):
    return 'GET LocaisConsumo'


@locaisConsumo.route('/api/locaisconsumo', methods=['POST'])
def post_localconsumo():
    return 'POST LocaisConsumo'


@locaisConsumo.route('/api/locaisconsumo/<cod_LocalConsumo>', methods=['PUT'])
def put_localconsumo(cod_LocalConsumo):
    return 'PUT LocaisConsumo'


@locaisConsumo.route('/api/locaisconsumo/<cod_LocalConsumo>', methods=['DELETE'])
def delete_localconsumo(cod_LocalConsumo):
    return 'DELETE LocaisConsumo'
