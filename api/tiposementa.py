from flask import Blueprint, request, jsonify
import psycopg2
import json
import sys
import databaseutils as utils

tiposementa = Blueprint('tiposementa', __name__)

tiposementaColumns = ["cod_tipoementa", "designacao"]

@tiposementa.route('/api/tiposementa', methods=['GET'])
def get_tiposementa():
    try:
        connection = psycopg2.connect(host=sys.argv[1], port=sys.argv[2], database=sys.argv[3], user=sys.argv[4], password=sys.argv[5])

        cursor = connection.cursor()
        cursor.execute("SELECT * FROM selecttiposementa();")
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
    return jsonify({'message': utils.beautifyFetchAll(tiposementaColumns, query_result)}), 200


@tiposementa.route('/api/tiposementa/<cod_TipoEmenta>', methods=['GET'])
def get_tipoementa(cod_TipoEmenta):
    try:
        connection = psycopg2.connect(host=sys.argv[1], port=sys.argv[2], database=sys.argv[3], user=sys.argv[4], password=sys.argv[5])

        cursor = connection.cursor()
        cursor.execute(
            "SELECT * FROM selecttipoementa(%s);", (cod_TipoEmenta,))
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
    return jsonify({'message': utils.beautifyFetchOne(tiposementaColumns, query_result)}), 200


@tiposementa.route('/api/tiposementa', methods=['POST'])
def post_tipoementa():
    try:
        connection = psycopg2.connect(host=sys.argv[1], port=sys.argv[2], database=sys.argv[3], user=sys.argv[4], password=sys.argv[5])

        cursor = connection.cursor()
        cursor.execute("call inserttiposementa(%s);",
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


@tiposementa.route('/api/tiposementa/<cod_TipoEmenta>', methods=['PUT'])
def put_tipoementa(cod_TipoEmenta):
    try:
        connection = psycopg2.connect(host=sys.argv[1], port=sys.argv[2], database=sys.argv[3], user=sys.argv[4], password=sys.argv[5])

        cursor = connection.cursor()
        cursor.execute("call updatetiposementa(%s,%s);",
                       (cod_TipoEmenta, json.dumps(request.json)))
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


@tiposementa.route('/api/tiposementa/<cod_TipoEmenta>', methods=['DELETE'])
def delete_tipoementa(cod_TipoEmenta):
    try:
        connection = psycopg2.connect(host=sys.argv[1], port=sys.argv[2], database=sys.argv[3], user=sys.argv[4], password=sys.argv[5])

        cursor = connection.cursor()
        cursor.execute("call deletetiposementa(%s);",
                       (cod_TipoEmenta,))
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
