from flask import Blueprint

# Define Blueprint
tipo_local = Blueprint('tipo_local', __name__)

# Get tipo_locals
@tipo_local.route('/', methods=['GET'])
def get_tipos_locais():
    return "Get Method"

# Get tipo_local
@tipo_local.route('/<cod_tipo_local>', methods=['GET'])
def get_tipo_local(cod_tipo_local):
    return 'Get Method'

# Post tipo_local
@tipo_local.route('/', methods=['POST'])
def post_tipo_local():
    return 'Post Method'

# Put tipo_local
@tipo_local.route('/<cod_tipo_local>', methods=['PUT'])
def put_tipo_local(cod_tipo_local):
    return 'Put Method'

# Delete tipo_local
@tipo_local.route('/<cod_tipo_local>', methods=['DELETE'])
def delete_tipo_local(cod_tipo_local):
    return 'Delete Method'
