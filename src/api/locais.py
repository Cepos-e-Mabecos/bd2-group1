from flask import Blueprint

# Define Blueprint
local = Blueprint('local', __name__)

# Get locals
@local.route('/', methods=['GET'])
def get_locais():
    return "Get Method"

# Get local
@local.route('/<cod_local>', methods=['GET'])
def get_local(cod_local):
    return 'Get Method'

# Post local
@local.route('/', methods=['POST'])
def post_local():
    return 'Post Method'

# Put local
@local.route('/<cod_local>', methods=['PUT'])
def put_local(cod_local):
    return 'Put Method'

# Delete local
@local.route('/<cod_local>', methods=['DELETE'])
def delete_local(cod_local):
    return 'Delete Method'
