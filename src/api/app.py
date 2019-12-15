from flask import Flask, request, jsonify
from flask_cors import CORS

from restaurants import restaurant
from locals import local
from local_types import local_type
from employees import employee

# Init App
app = Flask(__name__)
cors = CORS(app, resources={r"/*": {"origins": "*"}})
# Register Blueprints
app.register_blueprint(restaurant, url_prefix="/restaurant")
app.register_blueprint(local, url_prefix="/local")
app.register_blueprint(local_type, url_prefix="/local_type")
app.register_blueprint(employee, url_prefix="/employee")


# @app.route('/restaurant', methods=['GET'])
# def api_restaurant():
# return jsonify([{'name':'Restaurante da Tua Tia', 'location':'Em casa'},{'name':'Restaurante da Teu Tio', 'location':'Na Rua'}])

# Run Server
if __name__ == '__main__':
    app.run(debug=True, port=5001)
