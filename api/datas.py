from flask import Blueprint

datas = Blueprint('datas', __name__)


@datas.route('/api/datas', methods=['GET'])
def get_datas():
    return 'GET Datas'


@datas.route('/api/datas/<cod_Data>', methods=['GET'])
def get_data(cod_Data):
    return 'GET Datas'


@datas.route('/api/datas', methods=['POST'])
def post_data():
    return 'POST Datas'


@datas.route('/api/datas/<cod_Data>', methods=['PUT'])
def put_data(cod_Data):
    return 'PUT Datas'


@datas.route('/api/datas/<cod_Data>', methods=['DELETE'])
def delete_data(cod_Data):
    return 'DELETE Datas'
