# AutoQuery

This repository provides a Python application for setting up and interacting with a SQLite database. The application automates database creation, integrates with a Large Language Model (LLM) with Vanna for advanced querying and training, and exposes a Flask-based web interface for interaction.

## Features

- **Database Initialization**: Automatically creates and initializes the SQLite database using provided SQL scripts.
- **LLM Integration**: Uses a Large Language Model with Vanna to train on database schema and documentation.
- **Web Interface**: Provides a Flask web application for querying the database.

## Prerequisites

- Python 3.10 or later
- SQL scripts: `Create_Tables.sql`, `Insert.sql`, `Queries.sql`

## Installation

1. **Clone the Repository**:

    ```bash
    git clone https://github.com/yourusername/your-repo-name.git
    cd your-repo-name
    ```

2. **Install Dependencies**:

    Create a virtual environment and install the required packages:

    ```bash
    python -m venv env
    source env/bin/activate  # On Windows, use `env\Scripts\activate.bat`
    pip install -r requirements.txt
    ```

3. **Start the Web Application**:

    ```bash
    python main.py
    ```

    The application will start a Flask web server on port 4000.

2. **Access the Web Interface**:

    Open a web browser and navigate to `http://localhost:4000` to interact with the database via the web interface.

## Files

- `main.py`: The script sets up the database, trains the LLM with Vanna and runs the Flask app.
- `Create_Tables.sql`: SQL script for creating database tables.
- `Insert.sql`: SQL script for inserting initial data.
- `Queries.sql`: SQL script containing example queries for training.
- `requirements.txt`: File listing Python package dependencies.

## Contributing

Feel free to open issues or submit pull requests if you find bugs or want to contribute enhancements.
