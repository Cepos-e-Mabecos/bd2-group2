from flask import Blueprint, request, jsonify
import psycopg2
import json
import sys
import databaseutils as utils

locais = Blueprint('locais', __name__)

locaisColumns = ["cod_local", "designacao"]

@locais.route('/api/locais', methods=['GET'])
def get_locais():
    try:
        connection = psycopg2.connect(host=sys.argv[1], port=sys.argv[2], database=sys.argv[3], user=sys.argv[4], password=sys.argv[5])

        cursor = connection.cursor()
        cursor.execute("SELECT * FROM selectlocais();")
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
    return jsonify({'message': utils.beautifyFetchAll(locaisColumns, query_result)}), 200


@locais.route('/api/locais/<cod_Local>', methods=['GET'])
def get_local(cod_Local):
    try:
        connection = psycopg2.connect(host=sys.argv[1], port=sys.argv[2], database=sys.argv[3], user=sys.argv[4], password=sys.argv[5])

        cursor = connection.cursor()
        cursor.execute(
            "SELECT * FROM selectlocal(%s);", (cod_Local,))
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
    return jsonify({'message': utils.beautifyFetchOne(locaisColumns, query_result)}), 200


@locais.route('/api/locais', methods=['POST'])
def post_local():
    try:
        connection = psycopg2.connect(host=sys.argv[1], port=sys.argv[2], database=sys.argv[3], user=sys.argv[4], password=sys.argv[5])

        cursor = connection.cursor()
        cursor.execute("call insertlocais(%s);",
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


@locais.route('/api/locais/<cod_Local>', methods=['PUT'])
def put_local(cod_Local):
    try:
        connection = psycopg2.connect(host=sys.argv[1], port=sys.argv[2], database=sys.argv[3], user=sys.argv[4], password=sys.argv[5])

        cursor = connection.cursor()
        cursor.execute("call updatelocais(%s,%s);",
                       (cod_Local, json.dumps(request.json)))
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


@locais.route('/api/locais/<cod_Local>', methods=['DELETE'])
def delete_local(cod_Local):
    try:
        connection = psycopg2.connect(host=sys.argv[1], port=sys.argv[2], database=sys.argv[3], user=sys.argv[4], password=sys.argv[5])

        cursor = connection.cursor()
        cursor.execute("call deletelocais(%s);",
                       (cod_Local,))
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
