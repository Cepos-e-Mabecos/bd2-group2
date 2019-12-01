from flask import Blueprint, request, jsonify
import psycopg2
import json

tiposEmenta = Blueprint('tiposEmenta', __name__)


@tiposEmenta.route('/api/tiposementa', methods=['GET'])
def get_tiposementa():
    try:
        connection = psycopg2.connect(
            user="root", password="root", host="localhost", port="5432", database="bd")

        cursor = connection.cursor()
        cursor.execute("SELECT * FROM TiposEmenta;")
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


@tiposEmenta.route('/api/tiposementa/<cod_TipoEmenta>', methods=['GET'])
def get_tipoementa(cod_TipoEmenta):
    try:
        connection = psycopg2.connect(
            user="root", password="root", host="localhost", port="5432", database="bd")

        cursor = connection.cursor()
        cursor.execute(
            "SELECT * FROM TiposEmenta WHERE cod_TipoEmenta = %s;", (cod_TipoEmenta,))
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


@tiposEmenta.route('/api/tiposementa', methods=['POST'])
def post_tipoementa():
    try:
        connection = psycopg2.connect(
            user="root", password="root", host="localhost", port="5432", database="bd")

        cursor = connection.cursor()
        cursor.execute("call insertTiposEmenta(%s);",
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


@tiposEmenta.route('/api/tiposementa/<cod_TipoEmenta>', methods=['PUT'])
def put_tipoementa(cod_TipoEmenta):
    try:
        connection = psycopg2.connect(
            user="root", password="root", host="localhost", port="5432", database="bd")

        cursor = connection.cursor()
        cursor.execute("call updateTiposEmenta(%s,%s);",
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


@tiposEmenta.route('/api/tiposementa/<cod_TipoEmenta>', methods=['DELETE'])
def delete_tipoementa(cod_TipoEmenta):
    try:
        connection = psycopg2.connect(
            user="root", password="root", host="localhost", port="5432", database="bd")

        cursor = connection.cursor()
        cursor.execute("call deleteTiposEmenta(%s);",
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
