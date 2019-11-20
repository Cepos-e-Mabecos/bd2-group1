from flask import Blueprint

# Define Blueprint
restaurante = Blueprint('restaurante', __name__)

# Get restaurantes
@restaurante.route('/', methods=['GET'])
def get_restaurantes():
    return "Get Method"

# Get restaurante
@restaurante.route('/<cod_restaurante>', methods=['GET'])
def get_restaurante(cod_restaurante):
    return 'Get Method'

# Post restaurante
@restaurante.route('/', methods=['POST'])
def post_restaurante():
    return 'Post Method'

# Put restaurante
@restaurante.route('/<cod_restaurante>', methods=['PUT'])
def put_restaurante(cod_restaurante):
    return 'Put Method'

# Delete restaurante
@restaurante.route('/<cod_restaurante>', methods=['DELETE'])
def delete_restaurante(cod_restaurante):
    return 'Delete Method'
