# Import Packages
import psycopg2


def DB_NAME():
    DB_NAME = "BD_FINAL"
    return DB_NAME


def HOST():
    HOST = "localhost"
    return HOST


def PORT():
    PORT = 5432
    return PORT


def POSTGRES_USER():
    POSTGRES_USER = "postgres"
    return POSTGRES_USER


def POSTGRES_PASSWORD():
    POSTGRES_PASSWORD = "1250"
    return POSTGRES_PASSWORD


def create_connection():
     # Get connection
    connection = psycopg2.connect(
        host=HOST(),
        port=PORT(),
        database=DB_NAME(),
        user=POSTGRES_USER(),
        password=POSTGRES_PASSWORD()
    )
    return connection


def commit_destroy_connection(connection, cur):
    # First the cursor will be closed
    cur.close()
    # Then the data is commited
    connection.commit()
    # In the end the connection is closed
    connection.close()
