from flask import Blueprint

# Define Blueprint
alergia = Blueprint('alergia', __name__)

# Get alergias
@alergia.route('/', methods=['GET'])
def get_alergias():
    return "Get Method"

# Get alergia
@alergia.route('/<cod_alergia>', methods=['GET'])
def get_alergia(cod_alergia):
    return 'Get Method'

# Post alergia
@alergia.route('/', methods=['POST'])
def post_alergia():
    return 'Post Method'

# Put alergia
@alergia.route('/<cod_alergia>', methods=['PUT'])
def put_alergia(cod_alergia):
    return 'Put Method'

# Delete alergia
@alergia.route('/<cod_alergia>', methods=['DELETE'])
def delete_alergia(cod_alergia):
    return 'Delete Method'
