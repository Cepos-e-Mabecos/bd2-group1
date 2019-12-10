# Import Packages
from flask import Blueprint, jsonify, request
import psycopg2
import config

# Define Blueprint
allergy = Blueprint('allergy', __name__)

# Get allergies
@allergy.route('/', methods=['GET'])
def get_allergies():
    try:
        # Get connection
        connection = psycopg2.connect(
            host=config.HOST(),
            port=config.PORT(),
            database=config.DB_NAME(),
            user=config.POSTGRES_USER(),
            password=config.POSTGRES_PASSWORD()
        )

        # Defining the cursor to execute on the database
        cur = connection.cursor()

        # Creating the SQL Command
        encoded_command = (
            f"Select * From Select_Allergies")

        # Executing the SQL Command
        cur.execute(encoded_command)

        # Fetching all the records
        database_records = cur.fetchall()

        # Json of the records
        jsonify(database_records)

        # List of Records
        list_records = []

        for record in database_records:
            dictionary_row = {
                "Allergy_Cod": record[0], "Symptom": record[1]
            }
            list_records.append(dictionary_row)

    except (Exception, psycopg2.Error) as error:
        return jsonify({
            "Result": error
        }), 500
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
            "Results": list_records
        }), 201

# Get allergy
@allergy.route('/<cod_allergy>', methods=['GET'])
def get_allergy(cod_allergy):
    try:
       # Get connection
        connection = psycopg2.connect(
            host=config.HOST(),
            port=config.PORT(),
            database=config.DB_NAME(),
            user=config.POSTGRES_USER(),
            password=config.POSTGRES_PASSWORD()
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
def post_allergy():
    try:
        # Get connection
        connection = psycopg2.connect(
            host=config.HOST(),
            port=config.PORT(),
            database=config.DB_NAME(),
            user=config.POSTGRES_USER(),
            password=config.POSTGRES_PASSWORD()
        )

        # Defining the cursor to execute on the database
        cur = connection.cursor()

        # Get the Data as Json
        data_json = request.get_json()

        # Creating the SQL Command
        encoded_command = (
            f"call insert_allergy('{data_json}')")

        # Executing the SQL Command
        cur.execute(encoded_command)

    except (Exception, psycopg2.Error) as error:
        return jsonify({
            "Result": error
        }), 500
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
            "Message": "Success"
        }), 201

# Put allergy
@allergy.route('/<cod_allergy>', methods=['PUT'])
def put_allergy(cod_allergy):
    try:
        # Get connection
        connection = psycopg2.connect(
            host=config.HOST(),
            port=config.PORT(),
            database=config.DB_NAME(),
            user=config.POSTGRES_USER(),
            password=config.POSTGRES_PASSWORD()
        )

        # Defining the cursor to execute on the database
        cur = connection.cursor()

        # Get the Data as Json
        data_json = request.get_json()

        # Creating the SQL Command
        encoded_command = (
            f"call update_allergy({cod_allergy},'{data_json}')")

        print(encoded_command)

        # Executing the SQL Command
        cur.execute(encoded_command)

    except (Exception, psycopg2.Error) as error:
        return jsonify({
            "Result": error
        }), 500
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
            "Message": "Success"
        }), 201

# Delete allergy
@allergy.route('/<cod_allergy>', methods=['DELETE'])
def delete_allergy(cod_allergy):
    return 'Delete Method'
