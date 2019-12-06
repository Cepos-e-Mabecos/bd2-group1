from flask import Blueprint

# Define Blueprint
food_menu_type = Blueprint('food_menu_type', __name__)

# Get food_menu_types
@food_menu_type.route('/', methods=['GET'])
def get_food_meny_types():
    return "Get Method"

# Get food_menu_type
@food_menu_type.route('/<cod_food_menu_type>', methods=['GET'])
def get_food_menu_type(cod_food_menu_type):
    return 'Get Method'

# Post food_menu_type
@food_menu_type.route('/', methods=['POST'])
def post_food_menu_type():
    return 'Post Method'

# Put food_menu_type
@food_menu_type.route('/<cod_food_menu_type>', methods=['PUT'])
def put_food_menu_type(cod_food_menu_type):
    return 'Put Method'

# Delete food_menu_type
@food_menu_type.route('/<cod_food_menu_type>', methods=['DELETE'])
def delete_food_menu_type(cod_food_menu_type):
    return 'Delete Method'
