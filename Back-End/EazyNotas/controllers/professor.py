import json
import sys
sys.path.insert(0, './')
import sql

def createProf(nome, senhaProfessor):
    cursor = sql.conectabanco()
    sqlQuery = 'INSERT INTO PROFESSOR(nome,senhaProfessor) VALUES(?, ?)'
    params = nome, senhaProfessor
    print(nome, senhaProfessor)
    cursor.execute(sqlQuery, params)
    cursor.commit()
    cursor.close()
    return 

def getAllProf():
    cursor = sql.conectabanco()
    cursor.execute("SELECT nome, idProfessor, senhaProfessor, CONVERT(VARCHAR, dataInserido, 101) dataInserido FROM PROFESSOR WHERE bitAtivo = 1")
    rows = cursor.fetchall()
    result = [dict(zip([column[0] for column in cursor.description], row)) for row in rows]
    json_string = json.dumps(result)
    return json_string

def getProf(idProfessor):

    cursor = sql.conectabanco()
    sqlQuery = "SELECT nome, idTipo, senhaProfessor, CONVERT(VARCHAR, dataInserido, 101) dataInserido FROM PROFESSOR"
    cursor.execute(sqlQuery, idProfessor)
    rows = cursor.fetchall()
    result = [dict(zip([column[0] for column in cursor.description], row)) for row in rows]
    json_string = json.dumps(result)
    return json_string