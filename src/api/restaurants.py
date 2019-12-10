from flask import Blueprint, request, jsonify
import psycopg2
import json
import sys
import config
# Define Blueprint
restaurant = Blueprint('restaurant', __name__)

# Get restaurants
@restaurant.route('/', methods=['GET'])
def get_restaurants():
    try:
        connection = psycopg2.connect(host=config.HOST(), port=config.PORT(), database=config.DB_NAME(), user=config.POSTGRES_USER(), password=config.POSTGRES_PASSWORD())
       
    except (Exception, psycopg2.Error) as error:
        return jsonify({'message': error}), 400

    finally:
        # closing database connection.
        if(connection):
            return "PostgreSQL connection established"

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
