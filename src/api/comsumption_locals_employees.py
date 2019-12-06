from flask import Blueprint

# Define Blueprint
comsumption_local_employee = Blueprint('comsumption_local_employee', __name__)

# Get comsumption_local_employees
@comsumption_local_employee.route('/', methods=['GET'])
def get_comsumption_local_employees():
    return "Get Method"

# Get comsumption_local_employee
@comsumption_local_employee.route('/<cod_comsumption_local_employee>', methods=['GET'])
def get_comsumption_local_employee(cod_comsumption_local_employee):
    return 'Get Method'

# Post comsumption_local_employee
@comsumption_local_employee.route('/', methods=['POST'])
def post_comsumption_local_employee():
    return 'Post Method'

# Put comsumption_local_employee
@comsumption_local_employee.route('/<cod_comsumption_local_employee>', methods=['PUT'])
def put_comsumption_local_employee(cod_comsumption_local_employee):
    return 'Put Method'

# Delete comsumption_local_employee
@comsumption_local_employee.route('/<cod_comsumption_local_employee>', methods=['DELETE'])
def delete_comsumption_local_employee(cod_comsumption_local_employee):
    return 'Delete Method'
