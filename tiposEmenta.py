from flask import Blueprint

tiposEmenta = Blueprint('tiposEmenta', __name__)


@tiposEmenta.route('/api/tiposementa', methods=['GET'])
def get_tiposementa():
    return 'GET TiposEmenta'


@tiposEmenta.route('/api/tiposementa/<cod_TipoEmenta>', methods=['GET'])
def get_tipoementa(cod_TipoEmenta):
    return 'GET TiposEmenta'


@tiposEmenta.route('/api/tiposementa', methods=['POST'])
def post_tipoementa():
    return 'POST TiposEmenta'


@tiposEmenta.route('/api/tiposementa/<cod_TipoEmenta>', methods=['PUT'])
def put_tipoementa(cod_TipoEmenta):
    return 'PUT TiposEmenta'


@tiposEmenta.route('/api/tiposementa/<cod_TipoEmenta>', methods=['DELETE'])
def delete_tipoementa(cod_TipoEmenta):
    return 'DELETE TiposEmenta'
