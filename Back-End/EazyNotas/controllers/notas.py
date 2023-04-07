import json
import sys
sys.path.insert(0, './')
import sql

def createNota(idAluno, idMateria, valorNota):
    cursor = sql.conectabanco()
    sqlQuery = 'INSERT INTO NOTA (idAluno, idMateria, valorNota) VALUES(?, ?, ?)'
    params = idAluno, idMateria, valorNota
    print(idAluno, idMateria, valorNota)
    cursor.execute(sqlQuery, params)
    cursor.commit()
    cursor.close()
    return

def getAllNota():

    cursor = sql.conectabanco()
    cursor.execute("SELECT idAluno, idMateria, valorNota FROM NOTA")
    rows = cursor.fetchall()
    result = [dict(zip([column[0] for column in cursor.description], row)) for row in rows]
    json_string = json.dumps(result)
    return json_string

def getNota(idAluno):

    cursor = sql.conectabanco()
    sqlQuery = "SELECT idAluno, idMateria, valorNota FROM NOTA WHERE idAluno = ?"
    cursor.execute(sqlQuery, idAluno)
    rows = cursor.fetchall()
    result = [dict(zip([column[0] for column in cursor.description], row)) for row in rows]
    json_string = json.dumps(result)
    return json_string 