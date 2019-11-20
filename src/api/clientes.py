from flask import Blueprint

# Define Blueprint
cliente = Blueprint('cliente', __name__)

# Get cliente
@cliente.route('/', methods=['GET'])
def get_clientes():
    return "Get Method"

# Get cliente
@cliente.route('/<cod_cliente>', methods=['GET'])
def get_cliente(cod_cliente):
    return 'Get Method'

# Post cliente
@cliente.route('/', methods=['POST'])
def post_cliente():
    return 'Post Method'

# Put cliente
@cliente.route('/<cod_cliente>', methods=['PUT'])
def put_cliente(cod_cliente):
    return 'Put Method'

# Delete cliente
@cliente.route('/<cod_cliente>', methods=['DELETE'])
def delete_cliente(cod_cliente):
    return 'Delete Method'
