from flask import Blueprint, request, jsonify
import psycopg2
import json

restaurantes = Blueprint('restaurantes', __name__)


@restaurantes.route('/api/restaurantes', methods=['GET'])
def get_restaurantes():
    try:
        connection = psycopg2.connect(
            user="root", password="root", host="localhost", port="5432", database="bd")

        cursor = connection.cursor()
        cursor.execute("SELECT * FROM Restaurantes;")
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


@restaurantes.route('/api/restaurantes/<cod_Restaurante>', methods=['GET'])
def get_restaurante(cod_Restaurante):
    try:
        connection = psycopg2.connect(
            user="root", password="root", host="localhost", port="5432", database="bd")

        cursor = connection.cursor()
        cursor.execute(
            "SELECT * FROM Restaurantes WHERE cod_Restaurante = %s;", (cod_Restaurante,))
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


@restaurantes.route('/api/restaurantes', methods=['POST'])
def post_restaurante():
    try:
        connection = psycopg2.connect(
            user="root", password="root", host="localhost", port="5432", database="bd")

        cursor = connection.cursor()
        cursor.execute("call insertRestaurantes(%s);",
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


@restaurantes.route('/api/restaurantes/<cod_Restaurante>', methods=['PUT'])
def put_restaurante(cod_Restaurante):
    try:
        connection = psycopg2.connect(
            user="root", password="root", host="localhost", port="5432", database="bd")

        cursor = connection.cursor()
        cursor.execute("call updateRestaurantes(%s,%s);",
                       (cod_Restaurante, json.dumps(request.json)))
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


@restaurantes.route('/api/restaurantes/<cod_Restaurante>', methods=['DELETE'])
def delete_restaurante(cod_Restaurante):
    try:
        connection = psycopg2.connect(
            user="root", password="root", host="localhost", port="5432", database="bd")

        cursor = connection.cursor()
        cursor.execute("call deleteRestaurantes(%s);",
                       (cod_Restaurante,))
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
