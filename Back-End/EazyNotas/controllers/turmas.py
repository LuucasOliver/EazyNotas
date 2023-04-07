import json
import sys
sys.path.insert(0, './')
import sql

def createTurma(sala, idProfessor):
    cursor = sql.conectabanco()
    sqlQuery = 'INSERT INTO TURMA(sala, idProfessor) VALUES(?, ?)'
    params = sala, idProfessor
    print(sala, idProfessor)
    cursor.execute(sqlQuery, params)
    cursor.commit()
    cursor.close()
    return

def getAllTurma():

    cursor = sql.conectabanco()
    cursor.execute("SELECT idTurma, sala, idProfessor FROM TURMA")
    rows = cursor.fetchall()
    result = [dict(zip([column[0] for column in cursor.description], row)) for row in rows]
    json_string = json.dumps(result)
    return json_string

def getTurma(idTurma):

    cursor = sql.conectabanco()
    sqlQuery = "SELECT idTurma, sala, idProfessor FROM TURMA WHERE idTurma = ?"
    cursor.execute(sqlQuery, idTurma)
    rows = cursor.fetchall()
    result = [dict(zip([column[0] for column in cursor.description], row)) for row in rows]
    json_string = json.dumps(result)
    return json_string 