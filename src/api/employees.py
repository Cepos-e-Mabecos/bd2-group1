from flask import Blueprint

# Define Blueprint
employee = Blueprint('employee', __name__)

# Get employees
@employee.route('/', methods=['GET'])
def get_employees():
    return "Get Method"

# Get employee
@employee.route('/<cod_employee>', methods=['GET'])
def get_employee(cod_employee):
    return 'Get Method'

# Post employee
@employee.route('/', methods=['POST'])
def post_employee():
    return 'Post Method'

# Put employee
@employee.route('/<cod_employee>', methods=['PUT'])
def put_employee(cod_employee):
    return 'Put Method'

# Delete employee
@employee.route('/<cod_employee>', methods=['DELETE'])
def delete_employee(cod_employee):
    return 'Delete Method'
