from flask import Blueprint

# Define Blueprint
client = Blueprint('client', __name__)

# Get client
@client.route('/', methods=['GET'])
def get_clients():
    return "Get Method"

# Get client
@client.route('/<cod_client>', methods=['GET'])
def get_client(cod_client):
    return 'Get Method'

# Post client
@client.route('/', methods=['POST'])
def post_client():
    return 'Post Method'

# Put client
@client.route('/<cod_client>', methods=['PUT'])
def put_client(cod_client):
    return 'Put Method'

# Delete client
@client.route('/<cod_client>', methods=['DELETE'])
def delete_client(cod_client):
    return 'Delete Method'
