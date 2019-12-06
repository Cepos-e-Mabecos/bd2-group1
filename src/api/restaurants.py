from flask import Blueprint

# Define Blueprint
restaurant = Blueprint('restaurant', __name__)

# Get restaurants
@restaurant.route('/', methods=['GET'])
def get_restaurants():
    return "Get Method"

# Get restaurant
@restaurant.route('/<cod_restaurant>', methods=['GET'])
def get_restaurant(cod_restaurant):
    return 'Get Method'

# Post restaurant
@restaurant.route('/', methods=['POST'])
def post_restaurant():
    return 'Post Method'

# Put restaurant
@restaurant.route('/<cod_restaurant>', methods=['PUT'])
def put_restaurant(cod_restaurant):
    return 'Put Method'

# Delete restaurant
@restaurant.route('/<cod_restaurant>', methods=['DELETE'])
def delete_restaurant(cod_restaurant):
    return 'Delete Method'
