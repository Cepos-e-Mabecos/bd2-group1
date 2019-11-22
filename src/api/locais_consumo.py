from flask import Blueprint

# Define Blueprint
local_consumo = Blueprint('local_consumo', __name__)

# Get local_consumos
@local_consumo.route('/', methods=['GET'])
def get_locais_consumos():
    return "Get Method"

# Get local_consumo
@local_consumo.route('/<cod_local_consumo>', methods=['GET'])
def get_local_consumo(cod_local_consumo):
    return 'Get Method'

# Post local_consumo
@local_consumo.route('/', methods=['POST'])
def post_local_consumo():
    return 'Post Method'

# Put local_consumo
@local_consumo.route('/<cod_local_consumo>', methods=['PUT'])
def put_local_consumo(cod_local_consumo):
    return 'Put Method'

# Delete local_consumo
@local_consumo.route('/<cod_local_consumo>', methods=['DELETE'])
def delete_local_consumo(cod_local_consumo):
    return 'Delete Method'
