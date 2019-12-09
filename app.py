from flask import Flask, render_template, request, jsonify
 
from src.api.allergies import allergy
from src.api.clients import client
from src.api.comsumptions import comsumption
from src.api.dates import date
from src.api.food_menus import food_menu
from src.api.employees import employee
from src.api.items import item
from src.api.allergy_items import allergy_item
from src.api.food_menu_items import food_menu_item
from src.api.locals import local
from src.api.comsumption_locals import comsumption_local
from src.api.restaurants import restaurant
from src.api.food_menu_type import food_menu_type
from src.api.item_type import item_type
from src.api.local_types import local_type
from src.api.comsumption_locals_employees import comsumption_local_employee
from src.api.comsumption_locals_restaurants import comsumption_local_restaurant


# Init App
app = Flask(__name__)

# Register Blueprints
app.register_blueprint(allergy, url_prefix="/src.api/allergy")
app.register_blueprint(allergy_item, url_prefix="/src.api/allergy-item")
app.register_blueprint(client, url_prefix="/src.api/client")
app.register_blueprint(comsumption, url_prefix="/src.api/comsumption")
app.register_blueprint(comsumption_local_employee,
                       url_prefix="/src.api/comsumption-local-employee")
app.register_blueprint(comsumption_local_restaurant,
                       url_prefix="/src.api/comsumption-local-restaurant")
app.register_blueprint(date, url_prefix="/src.api/date")
app.register_blueprint(food_menu, url_prefix="/src.api/food-menu")
app.register_blueprint(employee, url_prefix="/src.api/employee")
app.register_blueprint(item, url_prefix="/src.api/item")
app.register_blueprint(food_menu_item, url_prefix="/src.api/food-menu-item")
app.register_blueprint(local, url_prefix="/src.api/local")
app.register_blueprint(comsumption_local, url_prefix="/src.api/comsumption-local")
app.register_blueprint(restaurant, url_prefix="/src.api/restaurant")
app.register_blueprint(food_menu_type, url_prefix="/src.api/food-menu-type")
app.register_blueprint(item_type, url_prefix="/src.api/item-type")
app.register_blueprint(local_type, url_prefix="/src.api/local-type")


# Test Route
@app.route('/', methods=['GET'])
def hello_world():
    return render_template("index.html")

@app.route('/api/restaurant', methods=['GET'])
def api_restaurant():
    return jsonify([{'name':'Restaurante da Tua Tia', 'location':'Em casa'},{'name':'Restaurante da Teu Tio', 'location':'Na Rua'}])

@app.route('/restaurant')
def restaurant():
    teste = api_restaurant()
    print(teste)
    return render_template("restaurant.html", teste=teste)
    
# Run Server
if __name__ == '__main__':
    app.run(debug=True)