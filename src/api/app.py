from flask import Flask, request, jsonify
from flask_cors import CORS
 
from allergies import allergy
from clients import client
from comsumptions import comsumption
from dates import date
from food_menus import food_menu
from employees import employee
from items import item
from allergy_items import allergy_item
from food_menu_items import food_menu_item
from locals import local
from comsumption_locals import comsumption_local
from restaurants import restaurant
from food_menu_type import food_menu_type
from item_type import item_type
from local_types import local_type
from comsumption_locals_employees import comsumption_local_employee
from comsumption_locals_restaurants import comsumption_local_restaurant


# Init App
app = Flask(__name__)
cors = CORS(app, resources={r"/*": {"origins": "*"}})
# Register Blueprints
app.register_blueprint(allergy)
app.register_blueprint(allergy_item)
app.register_blueprint(client)
app.register_blueprint(comsumption)
app.register_blueprint(comsumption_local_employee)
app.register_blueprint(comsumption_local_restaurant)
app.register_blueprint(date)
app.register_blueprint(food_menu)
app.register_blueprint(employee)
app.register_blueprint(item)
app.register_blueprint(food_menu_item)
app.register_blueprint(local)
app.register_blueprint(comsumption_local)
app.register_blueprint(restaurant)
app.register_blueprint(food_menu_type)
app.register_blueprint(item_type)
app.register_blueprint(local_type)


@app.route('/restaurant', methods=['GET'])
def api_restaurant():
    return jsonify([{'name':'Restaurante da Tua Tia', 'location':'Em casa'},{'name':'Restaurante da Teu Tio', 'location':'Na Rua'}])
    
# Run Server
if __name__ == '__main__':
    app.run(debug=True, port=5001)