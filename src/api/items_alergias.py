from flask import Blueprint

# Define Blueprint
item_alergia = Blueprint('item_alergia', __name__)

# Get item_alergias
@item_alergia.route('/', methods=['GET'])
def get_items_alergias():
    return "Get Method"

# Get item_alergia
@item_alergia.route('/<cod_item_alergia>', methods=['GET'])
def get_item_alergia(cod_item_alergia):
    return 'Get Method'

# Post item_alergia
@item_alergia.route('/', methods=['POST'])
def post_item_alergia():
    return 'Post Method'

# Put item_alergia
@item_alergia.route('/<cod_item_alergia>', methods=['PUT'])
def put_item_alergia(cod_item_alergia):
    return 'Put Method'

# Delete item_alergia
@item_alergia.route('/<cod_item_alergia>', methods=['DELETE'])
def delete_item_alergia(cod_item_alergia):
    return 'Delete Method'
