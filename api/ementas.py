from flask import Blueprint, request, jsonify
import psycopg2
import json
import sys

ementas = Blueprint('ementas', __name__)


@ementas.route('/api/ementas', methods=['GET'])
def get_ementas():
    try:
        connection = psycopg2.connect(host=sys.argv[1], port=sys.argv[2], database=sys.argv[3], user=sys.argv[4], password=sys.argv[5])

        cursor = connection.cursor()
        cursor.execute("SELECT * FROM Ementas;")
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
    return jsonify({'message': query_result}), 200


@ementas.route('/api/ementas/<cod_Ementa>', methods=['GET'])
def get_ementa(cod_Ementa):
    try:
        connection = psycopg2.connect(host=sys.argv[1], port=sys.argv[2], database=sys.argv[3], user=sys.argv[4], password=sys.argv[5])

        cursor = connection.cursor()
        cursor.execute(
            "SELECT * FROM Ementas WHERE cod_Ementa = %s;", (cod_Ementa,))
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
    return jsonify({'message': query_result}), 200


@ementas.route('/api/ementas', methods=['POST'])
def post_ementa():
    try:
        connection = psycopg2.connect(host=sys.argv[1], port=sys.argv[2], database=sys.argv[3], user=sys.argv[4], password=sys.argv[5])

        cursor = connection.cursor()
        cursor.execute("call insertEmentas(%s);",
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


@ementas.route('/api/ementas/<cod_Ementa>', methods=['PUT'])
def put_ementa(cod_Ementa):
    try:
        connection = psycopg2.connect(host=sys.argv[1], port=sys.argv[2], database=sys.argv[3], user=sys.argv[4], password=sys.argv[5])

        cursor = connection.cursor()
        cursor.execute("call updateEmentas(%s,%s);",
                       (cod_Ementa, json.dumps(request.json)))
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


@ementas.route('/api/ementas/<cod_Ementa>', methods=['DELETE'])
def delete_ementa(cod_Ementa):
    try:
        connection = psycopg2.connect(host=sys.argv[1], port=sys.argv[2], database=sys.argv[3], user=sys.argv[4], password=sys.argv[5])

        cursor = connection.cursor()
        cursor.execute("call deleteEmentas(%s);",
                       (cod_Ementa,))
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
