from flask import Flask, request, jsonify
from flask_cors import CORS

from restaurants import restaurant



# Init App
app = Flask(__name__)
cors = CORS(app, resources={r"/*": {"origins": "*"}})
# Register Blueprints
app.register_blueprint(restaurant, url_prefix="/restaurant")


##@app.route('/restaurant', methods=['GET'])
##def api_restaurant():
##    return jsonify([{'name':'Restaurante da Tua Tia', 'location':'Em casa'},{'name':'Restaurante da Teu Tio', 'location':'Na Rua'}])
   
# Run Server
if __name__ == '__main__':
    app.run(debug=True, port=5001)