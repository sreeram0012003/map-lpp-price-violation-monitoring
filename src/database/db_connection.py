import mysql.connector

conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="your_password",
    database="data_analysis"
)

print("MySQL connected successfully")
