from flask import request, jsonify
import psycopg2
import sys


def getAll(columns, query):
    try:
        connection = psycopg2.connect(host=sys.argv[1],
                                      port=sys.argv[2],
                                      database=sys.argv[3],
                                      user=sys.argv[4],
                                      password=sys.argv[5])

        cursor = connection.cursor()
        cursor.execute(query)
        query_result = cursor.fetchall()
        connection.commit()

    except (Exception, psycopg2.Error) as error:
        return jsonify({"message": error}, 400)

    finally:
        if (connection):
            cursor.close()
            connection.close()
            print("PostgreSQL connection is close.")

    return jsonify({"message": beautifyFetchAll(columns, query_result)}, 200)


def getOne(columns, query):
    try:
        connection = psycopg2.connect(host=sys.argv[1],
                                      port=sys.argv[2],
                                      database=sys.argv[3],
                                      user=sys.argv[4],
                                      password=sys.argv[5])

        cursor = connection.cursor()
        cursor.execute(query)
        query_result = cursor.fetchone()
        connection.commit()

    except (Exception, psycopg2.Error) as error:
        return jsonify({"message": error}, 400)

    finally:
        if (connection):
            cursor.close()
            connection.close()
            print("PostgreSQL connection is close.")

    return jsonify({"message": beautifyFetchOne(columns, query_result)}, 200)


def postOne(query):
    try:
        connection = psycopg2.connect(host=sys.argv[1],
                                      port=sys.argv[2],
                                      database=sys.argv[3],
                                      user=sys.argv[4],
                                      password=sys.argv[5])

        cursor = connection.cursor()
        cursor.execute(query)
        connection.commit()

    except (Exception, psycopg2.Error) as error:
        return jsonify({"message": error}, 400)

    finally:
        if (connection):
            cursor.close()
            connection.close()
            print("PostgreSQL connection is close.")

    return jsonify({"message": request.json}, 200)


def putOne(query):
    try:
        connection = psycopg2.connect(host=sys.argv[1],
                                      port=sys.argv[2],
                                      database=sys.argv[3],
                                      user=sys.argv[4],
                                      password=sys.argv[5])

        cursor = connection.cursor()
        cursor.execute(query)
        connection.commit()

    except (Exception, psycopg2.Error) as error:
        return jsonify({"message": error}), 400

    finally:
        if (connection):
            cursor.close()
            connection.close()
            print("PostgreSQL connection is closed")
    return jsonify({"message": request.json}), 200


def deleteOne(query):
    try:
        connection = psycopg2.connect(host=sys.argv[1],
                                      port=sys.argv[2],
                                      database=sys.argv[3],
                                      user=sys.argv[4],
                                      password=sys.argv[5])

        cursor = connection.cursor()
        cursor.execute(query)
        connection.commit()

    except (Exception, psycopg2.Error) as error:
        return jsonify({"message": error}), 400

    finally:
        if (connection):
            cursor.close()
            connection.close()
            print("PostgreSQL connection is closed")
    return jsonify({"message": "Success"}), 200


def beautifyFetchAll(array1, array2):
    return [dict(zip(array1, element)) for element in array2]


def beautifyFetchOne(array1, array2):
    return dict(zip(array1, array2))
