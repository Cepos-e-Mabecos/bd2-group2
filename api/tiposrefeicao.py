from flask import Blueprint, request, jsonify
import psycopg2
import json
import sys
import databaseutils as utils

tiposrefeicao = Blueprint('tiposrefeicao', __name__)

tiposrefeicaoColumns = ["cod_tiporefeicao", "designacao"]

@tiposrefeicao.route('/api/tiposrefeicao', methods=['GET'])
def get_tiposrefeicao():
    try:
        connection = psycopg2.connect(host=sys.argv[1], port=sys.argv[2], database=sys.argv[3], user=sys.argv[4], password=sys.argv[5])

        cursor = connection.cursor()
        cursor.execute("SELECT * FROM selecttiposrefeicao();")
        query_result = cursor.fetchall()
        connection.commit()

    except (Exception, psycopg2.Error) as error:
        return jsonify({'message': error}), 400

    finally:
        # closing database connection.
        if(connection):
            cursor.close()
            connection.close()
            print("PostgreSQL connection is closed")
    return jsonify({'message': utils.beautifyFetchAll(tiposrefeicaoColumns, query_result)}), 200


@tiposrefeicao.route('/api/tiposrefeicao/<cod_TipoRefeicao>', methods=['GET'])
def get_tiporefeicao(cod_TipoRefeicao):
    try:
        connection = psycopg2.connect(host=sys.argv[1], port=sys.argv[2], database=sys.argv[3], user=sys.argv[4], password=sys.argv[5])

        cursor = connection.cursor()
        cursor.execute(
            "SELECT * FROM selecttiporefeicao(%s);", (cod_TipoRefeicao,))
        query_result = cursor.fetchone()
        connection.commit()

    except (Exception, psycopg2.Error) as error:
        return jsonify({'message': error}), 400

    finally:
        # closing database connection.
        if(connection):
            cursor.close()
            connection.close()
            print("PostgreSQL connection is closed")
    return jsonify({'message': utils.beautifyFetchOne(tiposrefeicaoColumns, query_result)}), 200


@tiposrefeicao.route('/api/tiposrefeicao', methods=['POST'])
def post_tiporefeicao():
    try:
        connection = psycopg2.connect(host=sys.argv[1], port=sys.argv[2], database=sys.argv[3], user=sys.argv[4], password=sys.argv[5])

        cursor = connection.cursor()
        cursor.execute("call inserttiposrefeicao(%s);",
                       (json.dumps(request.json),))
        connection.commit()

    except (Exception, psycopg2.Error) as error:
        return jsonify({'message': error}), 400

    finally:
        # closing database connection.
        if(connection):
            cursor.close()
            connection.close()
            print("PostgreSQL connection is closed")
    return jsonify({'message': request.json}), 200


@tiposrefeicao.route('/api/tiposrefeicao/<cod_TipoRefeicao>', methods=['PUT'])
def put_tiporefeicao(cod_TipoRefeicao):
    try:
        connection = psycopg2.connect(host=sys.argv[1], port=sys.argv[2], database=sys.argv[3], user=sys.argv[4], password=sys.argv[5])

        cursor = connection.cursor()
        cursor.execute("call updatetiposrefeicao(%s,%s);",
                       (cod_TipoRefeicao, json.dumps(request.json)))
        connection.commit()

    except (Exception, psycopg2.Error) as error:
        return jsonify({'message': error}), 400

    finally:
        # closing database connection.
        if(connection):
            cursor.close()
            connection.close()
            print("PostgreSQL connection is closed")
    return jsonify({'message': request.json}), 200


@tiposrefeicao.route('/api/tiposrefeicao/<cod_TipoRefeicao>', methods=['DELETE'])
def delete_tiporefeicao(cod_TipoRefeicao):
    try:
        connection = psycopg2.connect(host=sys.argv[1], port=sys.argv[2], database=sys.argv[3], user=sys.argv[4], password=sys.argv[5])

        cursor = connection.cursor()
        cursor.execute("call deletetiposrefeicao(%s);",
                       (cod_TipoRefeicao,))
        connection.commit()

    except (Exception, psycopg2.Error) as error:
        return jsonify({'message': error}), 400

    finally:
        # closing database connection.
        if(connection):
            cursor.close()
            connection.close()
            print("PostgreSQL connection is closed")
    return jsonify({'message': "Success"}), 200
