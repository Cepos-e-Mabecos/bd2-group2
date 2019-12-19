from flask import Blueprint, request
import json
import databaseutils as utils

datasementa = Blueprint("datasementa", __name__)

datasementaColumns = ["cod_dataementa", "data_ementa"]


@datasementa.route("/api/datasementa", methods=["GET"])
@datasementa.route("/api/datasementa/", methods=["GET"])
def get_datasementa():
    return utils.getAll(datasementaColumns,
                        f"SELECT * FROM selectdatasementa();")


@datasementa.route("/api/datasementa/<cod_DataEmenta>", methods=["GET"])
@datasementa.route("/api/datasementa/<cod_DataEmenta>/", methods=["GET"])
def get_dataementa(cod_DataEmenta):
    return utils.getOne(datasementaColumns,
                        f"SELECT * FROM selectconsumo('{cod_DataEmenta}');")


@datasementa.route("/api/datasementa", methods=["POST"])
@datasementa.route("/api/datasementa/", methods=["POST"])
def post_dataementa():
    return utils.postOne(
        datasementaColumns,
        f"SELECT * FROM insertdatasementa('{json.dumps(request.json)}');")


@datasementa.route("/api/datasementa/<cod_DataEmenta>", methods=["PUT"])
@datasementa.route("/api/datasementa/<cod_DataEmenta>/", methods=["PUT"])
def put_dataementa(cod_DataEmenta):
    return utils.putOne(
        f"CALL updatedatasementa('{cod_DataEmenta}', '{json.dumps(request.json)}');"
    )


@datasementa.route("/api/datasementa/<cod_DataEmenta>", methods=["DELETE"])
@datasementa.route("/api/datasementa/<cod_DataEmenta>/", methods=["DELETE"])
def delete_dataementa(cod_DataEmenta):
    return utils.deleteOne(f"CALL deletedatasementa('{cod_DataEmenta}');")