import flask
from flask_cors import CORS
from alergias import alergias
from clientes import clientes
from consumos import consumos
from datasementa import datasementa
from ementas import ementas
from funcionarios import funcionarios
from itens import itens
from locaisconsumo import locaisconsumo
from locais import locais
from restaurantes import restaurantes
from tiposementa import tiposementa
from tipositens import tipositens
from tiposrefeicao import tiposrefeicao

app = flask.Flask(__name__)

app.register_blueprint(alergias)
app.register_blueprint(clientes)
app.register_blueprint(consumos)
app.register_blueprint(datasementa)
app.register_blueprint(ementas)
app.register_blueprint(funcionarios)
app.register_blueprint(itens)
app.register_blueprint(locaisconsumo)
app.register_blueprint(locais)
app.register_blueprint(restaurantes)
app.register_blueprint(tiposementa)
app.register_blueprint(tipositens)
app.register_blueprint(tiposrefeicao)

CORS(app)

app.run(host="0.0.0.0", port=80, debug=True)
