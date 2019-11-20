from flask import Blueprint

# Define Blueprint
funcionario = Blueprint('funcionario', __name__)

# Get funcionarios
@funcionario.route('/', methods=['GET'])
def get_funcionarios():
    return "Get Method"

# Get funcionario
@funcionario.route('/<cod_funcionario>', methods=['GET'])
def get_funcionario(cod_funcionario):
    return 'Get Method'

# Post funcionario
@funcionario.route('/', methods=['POST'])
def post_funcionario():
    return 'Post Method'

# Put funcionario
@funcionario.route('/<cod_funcionario>', methods=['PUT'])
def put_funcionario(cod_funcionario):
    return 'Put Method'

# Delete funcionario
@funcionario.route('/<cod_funcionario>', methods=['DELETE'])
def delete_funcionario(cod_funcionario):
    return 'Delete Method'
