from flask import Blueprint

# Define Blueprint
ementa = Blueprint('ementa', __name__)

# Get ementas
@ementa.route('/', methods=['GET'])
def get_ementas():
    return "Get Method"

# Get ementa
@ementa.route('/<cod_ementa>', methods=['GET'])
def get_ementa(cod_ementa):
    return 'Get Method'

# Post ementa
@ementa.route('/', methods=['POST'])
def post_ementa():
    return 'Post Method'

# Put ementa
@ementa.route('/<cod_ementa>', methods=['PUT'])
def put_ementa(cod_ementa):
    return 'Put Method'

# Delete ementa
@ementa.route('/<cod_ementa>', methods=['DELETE'])
def delete_ementa(cod_ementa):
    return 'Delete Method'
