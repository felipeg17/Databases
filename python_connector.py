import mysql.connector
from mysql.connector import Error

def get_connection():
  connection = mysql.connector.connect(host='localhost',
                                        database='platziblog',
                                        user='root',
                                        password='waterl00')
  return connection

def close_connection(connection):
  if connection:
      connection.close()

def read_database_version():
  try:
      connection = get_connection()
      cursor = connection.cursor()
      cursor.execute("SELECT version();")
      db_version = cursor.fetchone()
      print("You are connected to MySQL version: ", db_version)
      close_connection(connection)
  except (Exception, mysql.connector.Error) as error:
      print("Error while getting data", error)

def print_table():
  try:
        connection = get_connection()
        cursor = connection.cursor()
        cursor.execute("SELECT login FROM usuarios WHERE id>2")
        records = cursor.fetchall()
        for row in records:
          print(row)

        close_connection(connection)
  except (Exception, mysql.connector.Error) as error:
      print("Error while getting data", error)
    

print_table()