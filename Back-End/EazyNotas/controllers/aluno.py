import json
import sys
sys.path.insert(0, './')
import sql

def createAluno(idUsuario, nome, idTipo, idTurma):
    cursor = sql.conectabanco()
    sqlQuery = 'INSERT INTO ALUNO (idUsuario, nome, idTipo, idTurma) VALUES(?, ?, ?, ?)'
    params = idUsuario, nome, idTipo, idTurma 
    print(idUsuario, nome, idTipo, idTurma)
    cursor.execute(sqlQuery, params)
    cursor.commit()
    cursor.close()
    return 

def getAllAlunos():

    cursor = sql.conectabanco()
    cursor.execute("SELECT idAluno, idUsuario, nome, idTipo, idTurma, CONVERT(VARCHAR, dataInserido, 101) dataInserido FROM ALUNO WHERE bitAtivo = 1")
    rows = cursor.fetchall()
    result = [dict(zip([column[0] for column in cursor.description], row)) for row in rows]
    json_string = json.dumps(result)
    return json_string

def getAluno(idAluno):

    cursor = sql.conectabanco()
    sqlQuery = "SELECT idAluno, idUsuario, nome, idTipo, idTurma, CONVERT(VARCHAR, dataInserido, 101) dataInserido FROM ALUNO WHERE bitAtivo = 1 AND idAluno = ?"
    cursor.execute(sqlQuery, idAluno)
    rows = cursor.fetchall()
    result = [dict(zip([column[0] for column in cursor.description], row)) for row in rows]
    json_string = json.dumps(result)
    return json_string

