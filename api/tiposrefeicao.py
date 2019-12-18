from flask import Blueprint, request
import json
import databaseutils as utils

tiposrefeicao = Blueprint('tiposrefeicao', __name__)

tiposrefeicaoColumns = ["cod_tiporefeicao", "designacao"]


@tiposrefeicao.route('/api/tiposrefeicao', methods=['GET'])
def get_tiposrefeicao():
    return utils.getAll(tiposrefeicaoColumns,
                        f"SELECT * FROM selecttiposrefeicao();")


@tiposrefeicao.route('/api/tiposrefeicao/<cod_TipoRefeicao>', methods=['GET'])
def get_tiporefeicao(cod_TipoRefeicao):
    return utils.getOne(
        tiposrefeicaoColumns,
        f"SELECT * FROM selecttiporefeicao({cod_TipoRefeicao});")


@tiposrefeicao.route('/api/tiposrefeicao', methods=['POST'])
def post_tiporefeicao():
    return utils.postOne(
        f"CALL inserttiposrefeicao({json.dumps(request.json)});")


@tiposrefeicao.route('/api/tiposrefeicao/<cod_TipoRefeicao>', methods=['PUT'])
def put_tiporefeicao(cod_TipoRefeicao):
    return utils.putOne(
        f"CALL updatetiposrefeicao({cod_TipoRefeicao}, {json.dumps(request.json)});"
    )


@tiposrefeicao.route('/api/tiposrefeicao/<cod_TipoRefeicao>',
                     methods=['DELETE'])
def delete_tiporefeicao(cod_TipoRefeicao):
    return utils.deleteOne(f"CALL deletetiposrefeicao({cod_TipoRefeicao});")