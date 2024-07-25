import sqlite3

# Create a new SQLite database (or connect to existing one)
conn = sqlite3.connect('my_database.db')
cursor = conn.cursor()

# Execute the SQL commands from create.sql
with open('create.sql', 'r') as file:
    create_sql = file.read()
cursor.executescript(create_sql)

# Execute the SQL commands from insert.sql
with open('insert.sql', 'r') as file:
    insert_sql = file.read()
cursor.executescript(insert_sql)

# Commit changes and close the connection
conn.commit()
conn.close()
