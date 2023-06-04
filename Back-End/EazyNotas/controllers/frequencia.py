import json
import sys
sys.path.insert(0, './')
import sql

def createFrequencia(rA,idMateria, pAluno, fAluno, freqAluno):
    cursor = sql.conectabanco()
    sqlQuery = 'INSERT INTO FREQUENCIA (rA,idMateria, pAluno, fAluno, freqAluno) VALUES(?, ?, ?)'
    params = rA,idMateria, pAluno, fAluno, freqAluno
    print(rA,idMateria, pAluno, fAluno, freqAluno)
    cursor.execute(sqlQuery, params)
    cursor.commit()
    cursor.close()
    return

def getAllFrequencia():

    cursor = sql.conectabanco()
    cursor.execute("SELECT rA,idMateria, pAluno, fAluno, freqAluno FROM FREQUENCIA")
    rows = cursor.fetchall()
    result = [dict(zip([column[0] for column in cursor.description], row)) for row in rows]
    json_string = json.dumps(result)
    return json_string

def getFrequencia(rA):

    cursor = sql.conectabanco()
    sqlQuery = "SELECT rA,idMateria, pAluno, fAluno, freqAluno FROM FREQUENCIA WHERE rA = ?"
    cursor.execute(sqlQuery, rA)
    rows = cursor.fetchall()
    result = [dict(zip([column[0] for column in cursor.description], row)) for row in rows]
    json_string = json.dumps(result)
    return json_string 
