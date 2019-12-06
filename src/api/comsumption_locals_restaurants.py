from flask import Blueprint

# Define Blueprint
comsumption_local_restaurant = Blueprint(
    'comsumption_local_restaurant', __name__)

# Get comsumption_local_restaurants
@comsumption_local_restaurant.route('/', methods=['GET'])
def get_comsumption_local_restaurants():
    return "Get Method"

# Get comsumption_local_restaurant
@comsumption_local_restaurant.route('/<cod_comsumption_local_restaurant>', methods=['GET'])
def get_comsumption_local_restaurant(cod_comsumption_local_restaurant):
    return 'Get Method'

# Post comsumption_local_restaurant
@comsumption_local_restaurant.route('/', methods=['POST'])
def post_comsumption_local_restaurant():
    return 'Post Method'

# Put comsumption_local_restaurant
@comsumption_local_restaurant.route('/<cod_comsumption_local_restaurant>', methods=['PUT'])
def put_comsumption_local_restaurant(cod_comsumption_local_restaurant):
    return 'Put Method'

# Delete comsumption_local_restaurant
@comsumption_local_restaurant.route('/<cod_comsumption_local_restaurant>', methods=['DELETE'])
def delete_comsumption_local_restaurant(cod_comsumption_local_restaurant):
    return 'Delete Method'
