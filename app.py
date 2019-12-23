from flask import Flask, render_template, request, jsonify
 
# Init App
app = Flask(__name__)



# Test Route
@app.route('/')
def hello_world():
    return render_template("index.html")

@app.route('/restaurant')
def restaurant():
    return render_template("restaurant.html")


@app.route('/readRestaurant')
def readRestaurant():
    return render_template("readRestaurant.html")
    
# Run Server
if __name__ == '__main__':
    app.run(debug=True)