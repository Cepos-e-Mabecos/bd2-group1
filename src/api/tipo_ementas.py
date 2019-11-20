from flask import Blueprint

# Define Blueprint
tipo_ementa = Blueprint('tipo_ementa', __name__)

# Get tipo_ementas
@tipo_ementa.route('/', methods=['GET'])
def get_tipos_ementas():
    return "Get Method"

# Get tipo_ementa
@tipo_ementa.route('/<cod_tipo_ementa>', methods=['GET'])
def get_tipo_ementa(cod_tipo_ementa):
    return 'Get Method'

# Post tipo_ementa
@tipo_ementa.route('/', methods=['POST'])
def post_tipo_ementa():
    return 'Post Method'

# Put tipo_ementa
@tipo_ementa.route('/<cod_tipo_ementa>', methods=['PUT'])
def put_tipo_ementa(cod_tipo_ementa):
    return 'Put Method'

# Delete tipo_ementa
@tipo_ementa.route('/<cod_tipo_ementa>', methods=['DELETE'])
def delete_tipo_ementa(cod_tipo_ementa):
    return 'Delete Method'
