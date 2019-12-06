from flask import Blueprint

# Define Blueprint
comsumption = Blueprint('comsumption', __name__)

# Get comsumptions
@comsumption.route('/', methods=['GET'])
def get_comsumptions():
    return "Get Method"

# Get comsumption
@comsumption.route('/<cod_comsumption>', methods=['GET'])
def get_comsumption(cod_comsumption):
    return 'Get Method'

# Post comsumption
@comsumption.route('/', methods=['POST'])
def post_comsumption():
    return 'Post Method'

# Put comsumption
@comsumption.route('/<cod_comsumption>', methods=['PUT'])
def put_comsumption(cod_comsumption):
    return 'Put Method'

# Delete comsumption
@comsumption.route('/<cod_comsumption>', methods=['DELETE'])
def delete_comsumption(cod_comsumption):
    return 'Delete Method'
