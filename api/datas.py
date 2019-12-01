from flask import Blueprint, request, jsonify
import psycopg2
import json

datas = Blueprint('datas', __name__)


@datas.route('/api/datas', methods=['GET'])
def get_datas():
    try:
        connection = psycopg2.connect(
            user="root", password="root", host="localhost", port="5432", database="bd")

        cursor = connection.cursor()
        cursor.execute("SELECT * FROM Datas;")
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


@datas.route('/api/datas/<cod_Data>', methods=['GET'])
def get_data(cod_Data):
    try:
        connection = psycopg2.connect(
            user="root", password="root", host="localhost", port="5432", database="bd")

        cursor = connection.cursor()
        cursor.execute(
            "SELECT * FROM Datas WHERE cod_Data = %s;", (cod_Data,))
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


@datas.route('/api/datas', methods=['POST'])
def post_data():
    try:
        connection = psycopg2.connect(
            user="root", password="root", host="localhost", port="5432", database="bd")

        cursor = connection.cursor()
        cursor.execute("call insertDatas(%s);",
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


@datas.route('/api/datas/<cod_Data>', methods=['PUT'])
def put_data(cod_Data):
    try:
        connection = psycopg2.connect(
            user="root", password="root", host="localhost", port="5432", database="bd")

        cursor = connection.cursor()
        cursor.execute("call updateDatas(%s,%s);",
                       (cod_Data, json.dumps(request.json)))
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


@datas.route('/api/datas/<cod_Data>', methods=['DELETE'])
def delete_data(cod_Data):
    try:
        connection = psycopg2.connect(
            user="root", password="root", host="localhost", port="5432", database="bd")

        cursor = connection.cursor()
        cursor.execute("call deleteDatas(%s);",
                       (cod_Data,))
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
