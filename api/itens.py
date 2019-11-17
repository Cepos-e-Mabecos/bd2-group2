from flask import Blueprint

itens = Blueprint('itens', __name__)


@itens.route('/api/itens', methods=['GET'])
def get_itens():
    return 'GET Itens'


@itens.route('/api/itens/<cod_Item>', methods=['GET'])
def get_item(cod_Item):
    return 'GET Itens'


@itens.route('/api/itens', methods=['POST'])
def post_item():
    return 'POST Itens'


@itens.route('/api/itens/<cod_Item>', methods=['PUT'])
def put_item(cod_Item):
    return 'PUT Itens'


@itens.route('/api/itens/<cod_Item>', methods=['DELETE'])
def delete_item(cod_Item):
    return 'DELETE Itens'
