import pandas as pd
import sys
from pathlib import Path

sys.path.append(str(Path(__file__).resolve().parents[1]))
from database.db_connection import conn

df = pd.read_sql("SELECT * FROM violation_table", conn)

df["Violation_date"] = pd.to_datetime(df["Violation_date"])
df["Price_difference"] = df["Promotional_price"] - df["Advertised_price"]

print(df.head())
print("Total violations:", len(df))

df.to_csv("processed_violations.csv", index=False)

conn.close()