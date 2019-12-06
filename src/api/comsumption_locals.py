from flask import Blueprint

# Define Blueprint
comsumption_local = Blueprint('comsumption_local', __name__)

# Get comsumption_locals
@comsumption_local.route('/', methods=['GET'])
def get_comsumption_locals():
    return "Get Method"

# Get comsumption_local
@comsumption_local.route('/<cod_comsumption_local>', methods=['GET'])
def get_comsumption_local(cod_comsumption_local):
    return 'Get Method'

# Post comsumption_local
@comsumption_local.route('/', methods=['POST'])
def post_comsumption_local():
    return 'Post Method'

# Put comsumption_local
@comsumption_local.route('/<cod_comsumption_local>', methods=['PUT'])
def put_comsumption_local(cod_comsumption_local):
    return 'Put Method'

# Delete comsumption_local
@comsumption_local.route('/<cod_comsumption_local>', methods=['DELETE'])
def delete_comsumption_local(cod_comsumption_local):
    return 'Delete Method'
