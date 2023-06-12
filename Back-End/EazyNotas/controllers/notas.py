import json
import sys
sys.path.insert(0, './')
import sql

def createNota(rA, idMateria, notaP1, notaP2, notaRc):
    cursor = sql.conectabanco()
    sqlQuery = 'INSERT INTO NOTA (rA, idMateria, notaP1, notaP2, notaRc) VALUES(?, ?, ?, ?, ?)'
    params = rA, idMateria, notaP1, notaP2, notaRc
    print(rA, idMateria, notaP1, notaP2, notaRc)
    cursor.execute(sqlQuery, params)
    cursor.commit()
    cursor.close()
    return

def getAllNota():

    cursor = sql.conectabanco()
    cursor.execute("SELECT rA, idMateria, notaP1, notaP2, notaRc FROM NOTA")
    rows = cursor.fetchall()
    result = [dict(zip([column[0] for column in cursor.description], row)) for row in rows]
    json_string = json.dumps(result)
    return json_string

def getNota(rA):

    cursor = sql.conectabanco()
    sqlQuery = "SELECT rA, idMateria, notaP1, notaP2, notaRc FROM NOTA WHERE rA = ?"
    cursor.execute(sqlQuery, rA)
    rows = cursor.fetchall()
    result = [dict(zip([column[0] for column in cursor.description], row)) for row in rows]
    json_string = json.dumps(result)
    return json_string 