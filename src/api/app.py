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
app.register_blueprint(allergy, url_prefix="/allergy")
app.register_blueprint(allergy_item, url_prefix="/allergy-item")
app.register_blueprint(client, url_prefix="/client")
app.register_blueprint(comsumption, url_prefix="/comsumption")
app.register_blueprint(comsumption_local_employee,url_prefix="/comsumption-local-employee")
app.register_blueprint(comsumption_local_restaurant,url_prefix="/comsumption-local-restaurant")
app.register_blueprint(date, url_prefix="/date")
app.register_blueprint(food_menu, url_prefix="/food-menu")
app.register_blueprint(employee, url_prefix="/employee")
app.register_blueprint(item, url_prefix="/item")
app.register_blueprint(food_menu_item, url_prefix="/food-menu-item")
app.register_blueprint(local, url_prefix="/local")
app.register_blueprint(comsumption_local, url_prefix="/comsumption-local")
app.register_blueprint(restaurant, url_prefix="/restaurant")
app.register_blueprint(food_menu_type, url_prefix="/food-menu-type")
app.register_blueprint(item_type, url_prefix="/item-type")
app.register_blueprint(local_type, url_prefix="/local-type")


##@app.route('/restaurant', methods=['GET'])
##def api_restaurant():
##    return jsonify([{'name':'Restaurante da Tua Tia', 'location':'Em casa'},{'name':'Restaurante da Teu Tio', 'location':'Na Rua'}])
   
# Run Server
if __name__ == '__main__':
    app.run(debug=True, port=5001)