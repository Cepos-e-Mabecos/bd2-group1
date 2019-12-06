from flask import Blueprint

# Define Blueprint
allergy_item = Blueprint('allergy_item', __name__)

# Get allergies_items
@allergy_item.route('/', methods=['GET'])
def get_allergies_items():
    return "Get Method"

# Get allergy_item
@allergy_item.route('/<cod_allergy_item>', methods=['GET'])
def get_allergy_item(cod_allergy_item):
    return 'Get Method'

# Post allergy_item
@allergy_item.route('/', methods=['POST'])
def post_allergy_item():
    return 'Post Method'

# Put allergy_item
@allergy_item.route('/<cod_allergy_item>', methods=['PUT'])
def put_allergy_item(cod_allergy_item):
    return 'Put Method'

# Delete allergy_item
@allergy_item.route('/<cod_allergy_item>', methods=['DELETE'])
def delete_allergy_item(cod_allergy_item):
    return 'Delete Method'
