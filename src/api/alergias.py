from flask import Blueprint, jsonify, request

# Define Blueprint
alergia = Blueprint('alergia', __name__)

# Get Alergias
@alergia.route('/', methods=['GET'])
def get_alergias():
    return jsonify(
        {
            'Item': 'Cenoura',
            'Sintoma': 'Vomitos'
        },
        {
            'Item': 'Sal',
            'Sintoma': 'Borbulhas'
        }
    )

# Get Alergia
@alergia.route('/<cod_alergia>', methods=['GET'])
def get_alergia(cod_alergia):
    if (int(cod_alergia) == 10):
        return jsonify({
            'Item': 'Cenoura',
            'Sintoma': 'Vomitos'
        })
    else:
        return 'No valid value with that ID!'

# Post Alergia
@alergia.route('/', methods=['POST'])
def post_alergia():
    sintoma = request.json['sintoma']
    return f'Alergia created with {sintoma}'

# Put Alergia
@alergia.route('/<cod_alergia>', methods=['PUT'])
def put_alergia(cod_alergia):
    if(int(cod_alergia) == 5):
        sintoma = request.json['sintoma']
        return f'Alergia changed to {sintoma}'
    else:
        return f'No alergia found with cod:{cod_alergia}'

# Delete Alergia
@alergia.route('/<cod_alergia>', methods=['DELETE'])
def delete_alergia(cod_alergia):
    if(int(cod_alergia) == 5):
        return f'Alergia with code: {cod_alergia} deleted'
    else:
        return f'No alergia found with cod: {cod_alergia}'
