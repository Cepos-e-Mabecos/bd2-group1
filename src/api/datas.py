from flask import Blueprint

# Define Blueprint
data = Blueprint('data', __name__)

# Get datas
@data.route('/', methods=['GET'])
def get_datas():
    return "Get Method"

# Get data
@data.route('/<cod_data>', methods=['GET'])
def get_data(cod_data):
    return 'Get Method'

# Post data
@data.route('/', methods=['POST'])
def post_data():
    return 'Post Method'

# Put data
@data.route('/<cod_data>', methods=['PUT'])
def put_data(cod_data):
    return 'Put Method'

# Delete data
@data.route('/<cod_data>', methods=['DELETE'])
def delete_data(cod_data):
    return 'Delete Method'
