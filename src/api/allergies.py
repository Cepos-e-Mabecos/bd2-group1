from flask import Blueprint

# Define Blueprint
allergy = Blueprint('allergy', __name__)

# Get allergies
@allergy.route('/', methods=['GET'])
def get_allergies():
    return "Get Method"

# Get allergy
@allergy.route('/<cod_allergy>', methods=['GET'])
def get_allergy(cod_allergy):
    return 'Get Method'

# Post allergy
@allergy.route('/', methods=['POST'])
def post_allergy():
    return 'Post Method'

# Put allergy
@allergy.route('/<cod_allergy>', methods=['PUT'])
def put_allergy(cod_allergy):
    return 'Put Method'

# Delete allergy
@allergy.route('/<cod_allergy>', methods=['DELETE'])
def delete_allergy(cod_allergy):
    return 'Delete Method'
