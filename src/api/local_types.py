from flask import Blueprint

# Define Blueprint
local_type = Blueprint('local_type', __name__)

# Get local_types
@local_type.route('/', methods=['GET'])
def get_local_types():
    return "Get Method"

# Get local_type
@local_type.route('/<cod_local_type>', methods=['GET'])
def get_local_type(cod_local_type):
    return 'Get Method'

# Post local_type
@local_type.route('/', methods=['POST'])
def post_local_type():
    return 'Post Method'

# Put local_type
@local_type.route('/<cod_local_type>', methods=['PUT'])
def put_local_type(cod_local_type):
    return 'Put Method'

# Delete local_type
@local_type.route('/<cod_local_type>', methods=['DELETE'])
def delete_local_type(cod_local_type):
    return 'Delete Method'
