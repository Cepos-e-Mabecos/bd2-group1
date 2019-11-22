from flask import Blueprint

# Define Blueprint
consumo = Blueprint('consumo', __name__)

# Get Consumos
@consumo.route('/', methods=['GET'])
def get_consumos():
    return "Get Method"

# Get Consumo
@consumo.route('/<cod_consumo>', methods=['GET'])
def get_consumo(cod_consumo):
    return 'Get Method'

# Post Consumo
@consumo.route('/', methods=['POST'])
def post_consumo():
    return 'Post Method'

# Put Consumo
@consumo.route('/<cod_consumo>', methods=['PUT'])
def put_consumo(cod_consumo):
    return 'Put Method'

# Delete Consumo
@consumo.route('/<cod_consumo>', methods=['DELETE'])
def delete_consumo(cod_consumo):
    return 'Delete Method'
