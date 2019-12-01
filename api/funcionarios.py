from flask import Blueprint, request, jsonify
import psycopg2
import json

funcionarios = Blueprint('funcionarios', __name__)


@funcionarios.route('/api/funcionarios', methods=['GET'])
def get_funcionarios():
    try:
        connection = psycopg2.connect(
            user="root", password="root", host="localhost", port="5432", database="bd")

        cursor = connection.cursor()
        cursor.execute("SELECT * FROM Funcionarios;")
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


@funcionarios.route('/api/funcionarios/<cod_Funcionario>', methods=['GET'])
def get_funcionario(cod_Funcionario):
    try:
        connection = psycopg2.connect(
            user="root", password="root", host="localhost", port="5432", database="bd")

        cursor = connection.cursor()
        cursor.execute(
            "SELECT * FROM Funcionarios WHERE cod_Funcionario = %s;", (cod_Funcionario,))
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


@funcionarios.route('/api/funcionarios', methods=['POST'])
def post_funcionario():
    try:
        connection = psycopg2.connect(
            user="root", password="root", host="localhost", port="5432", database="bd")

        cursor = connection.cursor()
        cursor.execute("call insertFuncionarios(%s);",
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


@funcionarios.route('/api/funcionarios/<cod_Funcionario>', methods=['PUT'])
def put_funcionario(cod_Funcionario):
    try:
        connection = psycopg2.connect(
            user="root", password="root", host="localhost", port="5432", database="bd")

        cursor = connection.cursor()
        cursor.execute("call updateFuncionarios(%s,%s);",
                       (cod_Funcionario, json.dumps(request.json)))
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


@funcionarios.route('/api/funcionarios/<cod_Funcionario>', methods=['DELETE'])
def delete_funcionario(cod_Funcionario):
    try:
        connection = psycopg2.connect(
            user="root", password="root", host="localhost", port="5432", database="bd")

        cursor = connection.cursor()
        cursor.execute("call deleteFuncionarios(%s);",
                       (cod_Funcionario,))
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
