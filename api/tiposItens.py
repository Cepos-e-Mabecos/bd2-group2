from flask import Blueprint, request, jsonify
import psycopg2
import json

tiposItens = Blueprint('tiposItens', __name__)


@tiposItens.route('/api/tipositens', methods=['GET'])
def get_tipositens():
    try:
        connection = psycopg2.connect(
            user="root", password="root", host="localhost", port="5432", database="bd")

        cursor = connection.cursor()
        cursor.execute("SELECT * FROM TiposItens;")
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


@tiposItens.route('/api/tipositens/<cod_TipoItem>', methods=['GET'])
def get_tipoitem(cod_TipoItem):
    try:
        connection = psycopg2.connect(
            user="root", password="root", host="localhost", port="5432", database="bd")

        cursor = connection.cursor()
        cursor.execute(
            "SELECT * FROM TiposItens WHERE cod_TipoItem = %s;", (cod_TipoItem,))
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


@tiposItens.route('/api/tipositens', methods=['POST'])
def post_tipoitem():
    try:
        connection = psycopg2.connect(
            user="root", password="root", host="localhost", port="5432", database="bd")

        cursor = connection.cursor()
        cursor.execute("call insertTiposItens(%s);",
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


@tiposItens.route('/api/tipositens/<cod_TipoItem>', methods=['PUT'])
def put_tipoitem(cod_TipoItem):
    try:
        connection = psycopg2.connect(
            user="root", password="root", host="localhost", port="5432", database="bd")

        cursor = connection.cursor()
        cursor.execute("call updateTiposItens(%s,%s);",
                       (cod_TipoItem, json.dumps(request.json)))
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


@tiposItens.route('/api/tipositens/<cod_TipoItem>', methods=['DELETE'])
def delete_tipoitem(cod_TipoItem):
    try:
        connection = psycopg2.connect(
            user="root", password="root", host="localhost", port="5432", database="bd")

        cursor = connection.cursor()
        cursor.execute("call deleteTiposItens(%s);",
                       (cod_TipoItem,))
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
