from flask import Blueprint

# Define Blueprint
food_menu_item = Blueprint('food_menu_item', __name__)

# Get food_menu_items
@food_menu_item.route('/', methods=['GET'])
def get_food_menu_items():
    return "Get Method"

# Get food_menu_item
@food_menu_item.route('/<cod_item>/<cod_food_menu>', methods=['GET'])
def get_food_menu_item(cod_food_menu_item):
    return 'Get Method'

# Post food_menu_item
@food_menu_item.route('/', methods=['POST'])
def post_food_menu_item():
    return 'Post Method'

# Put food_menu_item
@food_menu_item.route('/<cod_item>/<cod_food_menu>', methods=['PUT'])
def put_food_menu_item(cod_food_menu_item):
    return 'Put Method'

# Delete food_menu_item
@food_menu_item.route('/<cod_item>/<cod_food_menu>', methods=['DELETE'])
def delete_food_menu_item(cod_food_menu_item):
    return 'Delete Method'
