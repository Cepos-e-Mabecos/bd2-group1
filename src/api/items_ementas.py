from flask import Blueprint

# Define Blueprint
item_ementa = Blueprint('item_ementa', __name__)

# Get item_ementas
@item_ementa.route('/', methods=['GET'])
def get_itens_ementas():
    return "Get Method"

# Get item_ementa
@item_ementa.route('/<cod_item_ementa>', methods=['GET'])
def get_item_ementa(cod_item_ementa):
    return 'Get Method'

# Post item_ementa
@item_ementa.route('/', methods=['POST'])
def post_item_ementa():
    return 'Post Method'

# Put item_ementa
@item_ementa.route('/<cod_item_ementa>', methods=['PUT'])
def put_item_ementa(cod_item_ementa):
    return 'Put Method'

# Delete item_ementa
@item_ementa.route('/<cod_item_ementa>', methods=['DELETE'])
def delete_item_ementa(cod_item_ementa):
    return 'Delete Method'
