from flask import Blueprint

# Define Blueprint
item = Blueprint('item', __name__)

# Get items
@item.route('/', methods=['GET'])
def get_items():
    return "Get Method"

# Get item
@item.route('/<cod_item>', methods=['GET'])
def get_item(cod_item):
    return 'Get Method'

# Post item
@item.route('/', methods=['POST'])
def post_item():
    return 'Post Method'

# Put item
@item.route('/<cod_item>', methods=['PUT'])
def put_item(cod_item):
    return 'Put Method'

# Delete item
@item.route('/<cod_item>', methods=['DELETE'])
def delete_item(cod_item):
    return 'Delete Method'
