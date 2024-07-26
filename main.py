import os
import sqlite3

# Define the database file path
db_file = 'my_database.db'

# Check if the database file already exists
if not os.path.exists(db_file):
    # Create a new SQLite database (or connect to existing one)
    conn = sqlite3.connect(db_file)
    cursor = conn.cursor()

    # Execute the SQL commands from create.sql
    with open('Create_Tables.sql', 'r') as file:
        create_sql = file.read()
    cursor.executescript(create_sql)

    # Execute the SQL commands from insert.sql
    with open('Insert.sql', 'r') as file:
        insert_sql = file.read()
    cursor.executescript(insert_sql)

    # Commit changes and close the connection
    conn.commit()
    conn.close()

from vanna.ollama import Ollama
from vanna.chromadb import ChromaDB_VectorStore
class MyVanna(ChromaDB_VectorStore, Ollama):
    def __init__(self, config=None):
        ChromaDB_VectorStore.__init__(self, config=config)
        Ollama.__init__(self, config=config)

vn = MyVanna(config={'model': 'llama3.1'})

vn.connect_to_sqlite(db_file)

df_ddl = vn.run_sql("SELECT type, sql FROM sqlite_master WHERE sql is not null")
for ddl in df_ddl['sql'].to_list():
  vn.train(ddl=ddl)

vn.train(documentation="This database is designed to handle the everyday operations of a major car company. It provides functionality to view the transactions of dealers, track car inventory, and maintain the models and avaliable options of cars.")

# Read the SQL file
with open('Queries.sql', 'r') as file:
    sql_script = file.read()

# Split the script by semicolons to get individual queries
queries = sql_script.split(';')

# Execute each query and process results
for query in queries:
    query = query.strip()
    if query:
        vn.train(sql=query)

from vanna.flask import VannaFlaskApp
app = VannaFlaskApp(vn, allow_llm_to_see_data=True)
app.run(port=4000)
