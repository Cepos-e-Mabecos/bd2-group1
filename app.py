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

@app.route('/updateRestaurant') 
def updateRestaurant():
    return render_template("updateRestaurant.html")

@app.route('/deleteRestaurant')
def deleteRestaurant():
    return render_template("deleteRestaurant.html") 

@app.route('/createEmployee')
def createRestaurant():
    return render_template("createEmployee.html")

@app.route('/readEmployee')
def readEmployee():
    return render_template("readEmployee.html")

@app.route('/updateEmployee')
def updateEmployee():
    return render_template("updateEmployee.html")

@app.route('/deleteEmployee')
def deleteEmployee():
    return render_template("deleteEmployee.html")
# Run Server
if __name__ == '__main__':
    app.run(debug=True)