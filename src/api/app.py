from flask import Flask, request, jsonify
from flask_cors import CORS

from restaurants import restaurant
from locals import local
from local_types import local_type
from employees import employee
from zones import zone
from item_types import item_type
from items import item
from menu_types import menu_type
from menus import menu
from clients import client
from comsumptions import comsumption
from allergies import allergy

# Init App
app = Flask(__name__)
cors = CORS(app, resources={r"/*": {"origins": "*"}})
# Register Blueprints
app.register_blueprint(restaurant, url_prefix="/restaurant")
app.register_blueprint(local, url_prefix="/local")
app.register_blueprint(local_type, url_prefix="/local-type")
app.register_blueprint(employee, url_prefix="/employee")
app.register_blueprint(zone, url_prefix="/zone")
app.register_blueprint(item_type, url_prefix="/item-type")
app.register_blueprint(item, url_prefix="/item")
app.register_blueprint(menu_type, url_prefix="/menu-type")
app.register_blueprint(menu, url_prefix="/menu")
app.register_blueprint(client, url_prefix="/client")
app.register_blueprint(comsumption, url_prefix="/comsumption")
app.register_blueprint(allergy, url_prefix="/allergy")


# @app.route('/restaurant', methods=['GET'])
# def api_restaurant():
# return jsonify([{'name':'Restaurante da Tua Tia', 'location':'Em casa'},{'name':'Restaurante da Teu Tio', 'location':'Na Rua'}])

# Run Server
if __name__ == '__main__':
    app.run(debug=True, port=5001)
