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
