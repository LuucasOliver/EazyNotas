import json
import sys
sys.path.insert(0, './')
import sql

def createMaterias(nomeMat, idProfessor):
    cursor = sql.conectabanco()
    sqlQuery = 'INSERT INTO MATERIAS(nomeMat, idProfessor) VALUES(?, ?)'
    params = nomeMat, idProfessor
    print(nomeMat, idProfessor)
    cursor.execute(sqlQuery, params)
    cursor.commit()
    cursor.close()
    return 

def getAllMaterias():

    cursor = sql.conectabanco()
    cursor.execute("SELECT nomeMat, idProfessor FROM MATERIAS")
    rows = cursor.fetchall()
    result = [dict(zip([column[0] for column in cursor.description], row)) for row in rows]
    json_string = json.dumps(result)
    return json_string

def getMaterias(idMateria):

    cursor = sql.conectabanco()
    sqlQuery = "SELECT nomeMat, idProfessor FROM MATERIAS WHERE idMateria = ?"
    cursor.execute(sqlQuery, idMateria)
    rows = cursor.fetchall()
    result = [dict(zip([column[0] for column in cursor.description], row)) for row in rows]
    json_string = json.dumps(result)
    return json_string