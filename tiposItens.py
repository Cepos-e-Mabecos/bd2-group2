from flask import Blueprint

tiposItens = Blueprint('tiposItens', __name__)


@tiposItens.route('/api/tipositens', methods=['GET'])
def get_tipositens():
    return 'GET TiposItens'


@tiposItens.route('/api/tipositens/<cod_TipoItem>', methods=['GET'])
def get_tipoitem(cod_TipoItem):
    return cod_TipoItem


@tiposItens.route('/api/tipositens', methods=['POST'])
def post_tipoitem():
    return 'POST TiposItens'


@tiposItens.route('/api/tipositens/<cod_TipoItem>', methods=['PUT'])
def put_tipoitem(cod_TipoItem):
    return 'PUT TiposItens'


@tiposItens.route('/api/tipositens/<cod_TipoItem>', methods=['DELETE'])
def delete_tipoitem(cod_TipoItem):
    return 'DELETE TiposItens'
