import pyodbc
def conectabanco():
    server = 'localhost'
    database = 'master'
    username = ''
    password = ''
    driver = '{SQL Server}'

    conn = pyodbc.connect(f"DRIVER={driver};SERVER={server};DATABASE={database};Trusted_Connection=yes;")
    cursor = conn.cursor()

    return cursor