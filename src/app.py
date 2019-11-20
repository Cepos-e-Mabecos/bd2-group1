# Import Flask
from flask import Flask, jsonify
from api.alergias import alergia
from api.clientes import cliente
from api.consumos import consumo
from api.datas import data
from api.ementas import ementa
from api.funcionarios import funcionario
from api.items import item
from api.items_alergias import item_alergia
from api.items_ementas import item_ementa
from api.locais import local
from api.locais_consumo import local_consumo
from api.restaurantes import restaurante
from api.tipo_ementas import tipo_ementa
from api.tipo_item import tipo_item
from api.tipo_local import tipo_local

# Init App
app = Flask(__name__)

# Register Blueprints
app.register_blueprint(alergia, url_prefix="/api/alergia")
app.register_blueprint(cliente, url_prefix="/api/cliente")
app.register_blueprint(consumo, url_prefix="/api/consumo")
app.register_blueprint(data, url_prefix="/api/data")
app.register_blueprint(ementa, url_prefix="/api/ementa")
app.register_blueprint(funcionario, url_prefix="/api/funcionario")
app.register_blueprint(item, url_prefix="/api/item")
app.register_blueprint(item_alergia, url_prefix="/api/item_alergia")
app.register_blueprint(item_ementa, url_prefix="/api/item_ementa")
app.register_blueprint(local, url_prefix="/api/local")
app.register_blueprint(local_consumo, url_prefix="/api/local_consumo")
app.register_blueprint(restaurante, url_prefix="/api/restaurante")
app.register_blueprint(tipo_ementa, url_prefix="/api/tipo_ementa")
app.register_blueprint(tipo_item, url_prefix="/api/tipo_item")
app.register_blueprint(tipo_local, url_prefix="/api/tipo_local")


# Test Route
@app.route('/', methods=['GET'])
def hello_world():
    return jsonify({
        'Name': 'Edwin!',
        'Age': '23',
        'City': 'Viseu'
    })


# Run Server
if __name__ == '__main__':
    app.run(debug=True)
