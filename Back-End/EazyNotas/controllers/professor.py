import json
import sys
sys.path.insert(0, './')
import sql

def createProf(idUsuario, nome, idTipo):
    cursor = sql.conectabanco()
    sqlQuery = 'INSERT INTO PROFESSOR(idUsuario,nome,idTipo) VALUES(?, ?, ?)'
    params = idUsuario, nome, idTipo
    print(idUsuario, nome, idTipo)
    cursor.execute(sqlQuery, params)
    cursor.commit()
    cursor.close()
    return 

def getAllProf():

    cursor = sql.conectabanco()
    cursor.execute("SELECT idUsuario, nome, idTipo, CONVERT(VARCHAR, dataInserido, 101) dataInserido FROM PROFESSOR WHERE bitAtivo = 1")
    rows = cursor.fetchall()
    result = [dict(zip([column[0] for column in cursor.description], row)) for row in rows]
    json_string = json.dumps(result)
    return json_string

def getProf(idProfessor):

    cursor = sql.conectabanco()
    sqlQuery = "SELECT idUsuario, nome, idTipo, CONVERT(VARCHAR, dataInserido, 101) dataInserido FROM PROFESSOR WHERE bitAtivo = 1 AND idUsuario = ?"
    cursor.execute(sqlQuery, idProfessor)
    rows = cursor.fetchall()
    result = [dict(zip([column[0] for column in cursor.description], row)) for row in rows]
    json_string = json.dumps(result)
    return json_string