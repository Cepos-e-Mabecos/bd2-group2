from flask import Blueprint

tiposRefeicao = Blueprint('tiposRefeicao', __name__)


@tiposRefeicao.route('/api/tiposrefeicao', methods=['GET'])
def get_tiposrefeicao():
    return 'GET TiposRefeicao'


@tiposRefeicao.route('/api/tiposrefeicao/<cod_TipoRefeicao>', methods=['GET'])
def get_tiporefeicao(cod_TipoRefeicao):
    return 'GET TiposRefeicao'


@tiposRefeicao.route('/api/tiposrefeicao', methods=['POST'])
def post_tiporefeicao():
    return 'POST TiposRefeicao'


@tiposRefeicao.route('/api/tiposrefeicao/<cod_TipoRefeicao>', methods=['PUT'])
def put_tiporefeicao(cod_TipoRefeicao):
    return 'PUT TiposRefeicao'


@tiposRefeicao.route('/api/tiposrefeicao/<cod_TipoRefeicao>', methods=['DELETE'])
def delete_tiporefeicao(cod_TipoRefeicao):
    return 'DELETE TiposRefeicao'
