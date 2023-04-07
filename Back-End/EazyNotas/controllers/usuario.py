import json
import sys
sys.path.insert(0, './')
import sql

def getAll():

    cursor = sql.conectabanco()
    cursor.execute("SELECT idUsuario, ra, CONVERT(VARCHAR, dataInserido, 101) dataInserido FROM USUARIO WHERE bitAtivo = 1")
    rows = cursor.fetchall()
    result = [dict(zip([column[0] for column in cursor.description], row)) for row in rows]
    json_string = json.dumps(result)
    return json_string

def getUser(idUsuario):
    cursor = sql.conectabanco()
    sqlQuery = 'SELECT * FROM (SELECT U.idUsuario, A.idAluno, A.nome, T.nomeTipo, U.ra, U.bitAtivo FROM USUARIO U INNER JOIN ALUNO A ON U.idUsuario = A.idUsuario INNER JOIN TIPO T ON A.idTipo = T.idTipo) AS USUARIO WHERE USUARIO.idUsuario = ?'
    cursor.execute(sqlQuery, idUsuario)
    rows = cursor.fetchall()
    result = [dict(zip([column[0] for column in cursor.description], row)) for row in rows]
    json_string = json.dumps(result)
    return json_string

def createUser(ra):
    cursor = sql.conectabanco()
    sqlQuery = 'INSERT INTO USUARIO(ra) VALUES(?)'
    params = ra 
    print(ra)
    cursor.execute(sqlQuery, params)
    cursor.commit()
    return 