import json
import sys
sys.path.insert(0, './')
import sql

def createAluno(rA, nome, idTipo, idTurma, senhaAluno):
    cursor = sql.conectabanco()
    sqlQuery = 'INSERT INTO ALUNO ( nome, idTipo, idTurma, senhaAluno) VALUES(?, ?, ?, ?)'
    params = rA, nome, idTipo, idTurma, senhaAluno 
    print(rA, nome, idTipo, idTurma, senhaAluno)
    cursor.execute(sqlQuery, params)
    cursor.commit()
    cursor.close()
    return 

def getAllAlunos():

    cursor = sql.conectabanco()
    cursor.execute("SELECT rA, nome, idTipo, idTurma, senhaAluno CONVERT(VARCHAR, dataInserido, 101) dataInserido FROM ALUNO WHERE bitAtivo = 1")
    rows = cursor.fetchall()
    result = [dict(zip([column[0] for column in cursor.description], row)) for row in rows]
    json_string = json.dumps(result)
    return json_string

def getAluno(rA):

    cursor = sql.conectabanco()
    sqlQuery = "SELECT rA, nome, idTipo, idTurma, senhaAluno CONVERT(VARCHAR, dataInserido, 101) dataInserido FROM ALUNO WHERE bitAtivo = 1 AND idAluno = ?"
    cursor.execute(sqlQuery, idAluno)
    rows = cursor.fetchall()
    result = [dict(zip([column[0] for column in cursor.description], row)) for row in rows]
    json_string = json.dumps(result)
    return json_string

