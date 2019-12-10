# Import Packages
from flask import Blueprint, jsonify
import psycopg2
# Import Database file
# from db import create_connection
# Define Blueprint
allergy = Blueprint('allergy', __name__)
# Get allergies
@allergy.route('/', methods=['GET'])
def get_allergies():
    try:
        # Get connection
        connection = psycopg2.connect(
            # This will be the server (Since we are using PGAdmin then it's Localhost);
            host="localhost",
            database="postgres",  # Keep the same database name,;
            user="postgres",  # Keep the same name, "postgres"
            port="5432",
            password="postgres01"  # Keep the same password, "postgres01";
        )
        # Defining the cursor to execute on the database
        cur = connection.cursor()
        # Creating the SQL Command
        encoded_command = (
            f"Select * From Select_Allergies")
        # Executing the SQL Command
        cur.execute(encoded_command)
    except:
        return jsonify({
            "Result": "Error",
            "Message": "Error with the server!",
            "Status": "500",
            "Content-Type": "application/json"
        })
    finally:
        # commiting and closing database connection.
        if(connection):
            # First the cursor will be closed
            cur.close()
            # Then the data is commited
            connection.commit()
            # In the end the connection is closed
            connection.close()
        return jsonify({
            "Result": "Success",
            "Message": "Created with success!",
            "Status": "201",
            "Content-Type": "application/json"
        })
# Get allergy
@allergy.route('/<cod_allergy>', methods=['GET'])
def get_allergy(cod_allergy):
    try:
        # Get connection
        connection = psycopg2.connect(
            # This will be the server (Since we are using PGAdmin then it's Localhost);
            host="localhost",
            database="postgres",  # Keep the same database name,;
            user="postgres",  # Keep the same name, "postgres"
            port="5432",
            password="postgres01"  # Keep the same password, "postgres01";
        )
        # Defining the cursor to execute on the database
        cur = connection.cursor()
        # Creating the SQL Command
        encoded_command = ()
        # Executing the SQL Command
        cur.execute(encoded_command)
    except (Exception, psycopg2.Error) as error:
        return ("Allergy was not created!", error)
    finally:
        # commiting and closing database connection.
        if(connection):
            # First the cursor will be closed
            cur.close()
            # Then the data is commited
            connection.commit()
            # In the end the connection is closed
            connection.close()
        return "Allergy created with success"
# Post allergy
@allergy.route('/', methods=['POST'])
def post_allergy(data_json):
    try:
        # Get connection
        connection = psycopg2.connect(
            # This will be the server (Since we are using PGAdmin then it's Localhost);
            host="localhost",
            database="postgres",  # Keep the same database name,;
            user="postgres",  # Keep the same name, "postgres"
            port="5432",
            password="postgres01"  # Keep the same password, "postgres01";
        )
        # Defining the cursor to execute on the database
        cur = connection.cursor()
        # Creating the SQL Command
        encoded_command = (
            f"call insert_allergy('{data_json}')")
        # Executing the SQL Command
        cur.execute(encoded_command)
    except (Exception, psycopg2.Error) as error:
        return ("Allergy was not created!", error)
    finally:
        # commiting and closing database connection.
        if(connection):
            # First the cursor will be closed
            cur.close()
            # Then the data is commited
            connection.commit()
            # In the end the connection is closed
            connection.close()
        return "Allergy created with success"
# Put allergy
@allergy.route('/<cod_allergy>', methods=['PUT'])
def put_allergy(cod_allergy, data_json):
    return 'Put Method'
# Delete allergy
@allergy.route('/<cod_allergy>', methods=['DELETE'])
def delete_allergy(cod_allergy):
    return 'Delete Method'