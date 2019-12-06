from flask import Blueprint

# Define Blueprint
date = Blueprint('date', __name__)

# Get dates
@date.route('/', methods=['GET'])
def get_dates():
    return "Get Method"

# Get date
@date.route('/<cod_date>', methods=['GET'])
def get_date(cod_date):
    return 'Get Method'

# Post date
@date.route('/', methods=['POST'])
def post_date():
    return 'Post Method'

# Put date
@date.route('/<cod_date>', methods=['PUT'])
def put_date(cod_date):
    return 'Put Method'

# Delete date
@date.route('/<cod_date>', methods=['DELETE'])
def delete_date(cod_date):
    return 'Delete Method'
