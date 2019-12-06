from flask import Blueprint

# Define Blueprint
food_menu = Blueprint('food_menu', __name__)

# Get food_menus
@food_menu.route('/', methods=['GET'])
def get_food_menus():
    return "Get Method"

# Get food_menu
@food_menu.route('/<cod_food_menu>', methods=['GET'])
def get_food_menu(cod_food_menu):
    return 'Get Method'

# Post food_menu
@food_menu.route('/', methods=['POST'])
def post_food_menu():
    return 'Post Method'

# Put food_menu
@food_menu.route('/<cod_food_menu>', methods=['PUT'])
def put_food_menu(cod_food_menu):
    return 'Put Method'

# Delete food_menu
@food_menu.route('/<cod_food_menu>', methods=['DELETE'])
def delete_food_menu(cod_food_menu):
    return 'Delete Method'
