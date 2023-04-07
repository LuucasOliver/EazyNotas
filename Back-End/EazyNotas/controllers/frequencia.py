import json
import sys
sys.path.insert(0, './')
import sql

def createFrequencia(idAluno,idMateria, NumFreq):
    cursor = sql.conectabanco()
    sqlQuery = 'INSERT INTO FREQUENCIA (idAluno,idMateria, NumFreq) VALUES(?, ?, ?)'
    params = idAluno,idMateria, NumFreq
    print(idAluno,idMateria, NumFreq)
    cursor.execute(sqlQuery, params)
    cursor.commit()
    cursor.close()
    return

def getAllFrequencia():

    cursor = sql.conectabanco()
    cursor.execute("SELECT idAluno,idMateria, NumFreq FROM FREQUENCIA")
    rows = cursor.fetchall()
    result = [dict(zip([column[0] for column in cursor.description], row)) for row in rows]
    json_string = json.dumps(result)
    return json_string

def getFrequencia(idAluno):

    cursor = sql.conectabanco()
    sqlQuery = "SELECT idAluno,idMateria, NumFreq FROM FREQUENCIA WHERE idAluno = ?"
    cursor.execute(sqlQuery, idAluno)
    rows = cursor.fetchall()
    result = [dict(zip([column[0] for column in cursor.description], row)) for row in rows]
    json_string = json.dumps(result)
    return json_string 