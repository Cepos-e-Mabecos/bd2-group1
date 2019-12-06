from flask import Blueprint

# Define Blueprint
item_type = Blueprint('item_type', __name__)

# Get item_types
@item_type.route('/', methods=['GET'])
def get_item_types():
    return "Get Method"

# Get item_type
@item_type.route('/<cod_item_type>', methods=['GET'])
def get_item_type(cod_item_type):
    return 'Get Method'

# Post item_type
@item_type.route('/', methods=['POST'])
def post_item_type():
    return 'Post Method'

# Put item_type
@item_type.route('/<cod_item_type>', methods=['PUT'])
def put_item_type(cod_item_type):
    return 'Put Method'

# Delete item_type
@item_type.route('/<cod_item_type>', methods=['DELETE'])
def delete_item_type(cod_item_type):
    return 'Delete Method'
