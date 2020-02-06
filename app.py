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

@app.route('/createClient')
def createClients():
    return render_template('createClient.html')

@app.route('/readClient')
def readClient():
    return render_template('readClient.html')

@app.route('/updateClient')
def updateClient():
    return render_template('updateClient.html') 

@app.route('/deleteClient')
def deleteClient():
    return render_template('deleteClient.html') 

@app.route('/createMenu')
def createMenu():
    return render_template('createMenu.html')

@app.route('/readMenu')
def readMenu():
    return render_template('readMenu.html')

@app.route('/deleteMenu')
def deleteMenu():
    return render_template('deleteMenu.html')
# Run Server
if __name__ == '__main__':
    app.run(debug=True)