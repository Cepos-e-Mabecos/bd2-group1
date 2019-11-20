from flask import Blueprint

# Define Blueprint
tipo_item = Blueprint('tipo_item', __name__)

# Get tipo_items
@tipo_item.route('/', methods=['GET'])
def get_tipos_items():
    return "Get Method"

# Get tipo_item
@tipo_item.route('/<cod_tipo_item>', methods=['GET'])
def get_tipo_item(cod_tipo_item):
    return 'Get Method'

# Post tipo_item
@tipo_item.route('/', methods=['POST'])
def post_tipo_item():
    return 'Post Method'

# Put tipo_item
@tipo_item.route('/<cod_tipo_item>', methods=['PUT'])
def put_tipo_item(cod_tipo_item):
    return 'Put Method'

# Delete tipo_item
@tipo_item.route('/<cod_tipo_item>', methods=['DELETE'])
def delete_tipo_item(cod_tipo_item):
    return 'Delete Method'
