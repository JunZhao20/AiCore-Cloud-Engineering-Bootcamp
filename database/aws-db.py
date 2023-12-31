

# from sklearn.datasets import load_iris
# from sqlalchemy import create_engine
# import pandas as pd

# # Database connection details
# DATABASE_TYPE = 'postgresql'
# DBAPI = 'psycopg2'
# ENDPOINT ="my-first-rds-db.cfwyo6q8q3ql.eu-west-1.rds.amazonaws.com"
# USER = 'postgres'
# PASSWORD = "97231987432"
# PORT = 5432
# DATABASE = 'postgres'
# engine = create_engine(f"{DATABASE_TYPE}+{DBAPI}://{USER}:{PASSWORD}@{ENDPOINT}:{PORT}/{DATABASE}")

# engine.connect()

# data=load_iris()
# iris = pd.DataFrame(data['data'], columns=data['feature_names'])

# iris.to_sql('iris_dataset', engine, if_exists='replace')

# df = pd.read_sql_table('iris_dataset', engine)

# df.head()

import psycopg2

host = "my-first-rds-db.cfwyo6q8q3ql.eu-west-1.rds.amazonaws.com"
port = "5432"
database = "postgres"
user = "postgres"
password = "97231987432"

conn = psycopg2.connect(
    host=host,
    port=port,
    database=database,
    user=user,
    password=password
)

cursor = conn.cursor()

create_table_query = """
    CREATE TABLE IF NOT EXISTS sample_table (
        Col_a int,
        Col_b varchar(255)
    )
    """
    
insert_data_query = f"""
    INSERT INTO sample_table (Col_a, Col_b)
    VALUES (%s, %s)
"""

select_query = """
    SELECT * FROM sample_table
"""

data = (1, 'abc')
cursor.execute(create_table_query)
cursor.execute(insert_data_query, data)
cursor.execute(select_query)
rows = cursor.fetchall()
for row in rows:
    print(row)
    
conn.commit()
cursor.close()
conn.close()

