# Import Flask
from flask import Flask, jsonify
from api.allergies import allergy
from api.clients import client
from api.comsumptions import comsumption
from api.dates import date
from api.food_menus import food_menu
from api.employees import employee
from api.items import item
from api.allergy_items import allergy_item
from api.food_menu_items import food_menu_item
from api.locals import local
from api.comsumption_locals import comsumption_local
from api.restaurants import restaurant
from api.food_menu_type import food_menu_type
from api.item_type import item_type
from api.local_types import local_type
from api.comsumption_locals_employees import comsumption_local_employee
from api.comsumption_locals_restaurants import comsumption_local_restaurant


# Init App
app = Flask(__name__)

# Register Blueprints
app.register_blueprint(allergy, url_prefix="/api/allergy")
app.register_blueprint(allergy_item, url_prefix="/api/allergy-item")
app.register_blueprint(client, url_prefix="/api/client")
app.register_blueprint(comsumption, url_prefix="/api/comsumption")
app.register_blueprint(comsumption_local_employee,
                       url_prefix="/api/comsumption-local-employee")
app.register_blueprint(comsumption_local_restaurant,
                       url_prefix="/api/comsumption-local-restaurant")
app.register_blueprint(date, url_prefix="/api/date")
app.register_blueprint(food_menu, url_prefix="/api/food-menu")
app.register_blueprint(employee, url_prefix="/api/employee")
app.register_blueprint(item, url_prefix="/api/item")
app.register_blueprint(food_menu_item, url_prefix="/api/food-menu-item")
app.register_blueprint(local, url_prefix="/api/local")
app.register_blueprint(comsumption_local, url_prefix="/api/comsumption-local")
app.register_blueprint(restaurant, url_prefix="/api/restaurant")
app.register_blueprint(food_menu_type, url_prefix="/api/food-menu-type")
app.register_blueprint(item_type, url_prefix="/api/item-type")
app.register_blueprint(local_type, url_prefix="/api/local-type")


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
