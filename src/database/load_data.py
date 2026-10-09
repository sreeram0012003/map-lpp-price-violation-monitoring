import pandas as pd
from db_connection import conn

df = pd.read_sql("SELECT * FROM violation_table", conn)

print(df.head())
print("Rows:", len(df))

conn.close()