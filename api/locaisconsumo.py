from flask import Blueprint, request, jsonify
import psycopg2
import json
import sys
import databaseutils as utils

locaisconsumo = Blueprint('locaisconsumo', __name__)

locaisconsumoColumns = ["cod_localconsumo", "designacao", "cod_restaurante", "n_funcionarios"]

@locaisconsumo.route('/api/locaisconsumo', methods=['GET'])
def get_locaisconsumo():
    try:
        connection = psycopg2.connect(host=sys.argv[1], port=sys.argv[2], database=sys.argv[3], user=sys.argv[4], password=sys.argv[5])

        cursor = connection.cursor()
        cursor.execute("SELECT * FROM selectlocaisconsumo();")
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
    return jsonify({'message': utils.beautifyFetchAll(locaisconsumoColumns, query_result)}), 200


@locaisconsumo.route('/api/locaisconsumo/<cod_LocalConsumo>', methods=['GET'])
def get_localconsumo(cod_LocalConsumo):
    try:
        connection = psycopg2.connect(host=sys.argv[1], port=sys.argv[2], database=sys.argv[3], user=sys.argv[4], password=sys.argv[5])

        cursor = connection.cursor()
        cursor.execute(
            "SELECT * FROM selectlocalconsumo(%s);", (cod_LocalConsumo,))
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
    return jsonify({'message': utils.beautifyFetchOne(locaisconsumoColumns, query_result)}), 200


@locaisconsumo.route('/api/locaisconsumo', methods=['POST'])
def post_localconsumo():
    try:
        connection = psycopg2.connect(host=sys.argv[1], port=sys.argv[2], database=sys.argv[3], user=sys.argv[4], password=sys.argv[5])

        cursor = connection.cursor()
        cursor.execute("call insertlocaisconsumo(%s);",
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


@locaisconsumo.route('/api/locaisconsumo/<cod_LocalConsumo>', methods=['PUT'])
def put_localconsumo(cod_LocalConsumo):
    try:
        connection = psycopg2.connect(host=sys.argv[1], port=sys.argv[2], database=sys.argv[3], user=sys.argv[4], password=sys.argv[5])

        cursor = connection.cursor()
        cursor.execute("call updatelocaisconsumo(%s,%s);",
                       (cod_LocalConsumo, json.dumps(request.json)))
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


@locaisconsumo.route('/api/locaisconsumo/<cod_LocalConsumo>', methods=['DELETE'])
def delete_localconsumo(cod_LocalConsumo):
    try:
        connection = psycopg2.connect(host=sys.argv[1], port=sys.argv[2], database=sys.argv[3], user=sys.argv[4], password=sys.argv[5])

        cursor = connection.cursor()
        cursor.execute("call deletelocaisconsumo(%s);",
                       (cod_LocalConsumo,))
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
