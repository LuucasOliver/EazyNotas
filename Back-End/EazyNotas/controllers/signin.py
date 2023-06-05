import json
import sys
sys.path.insert(0, './')
import sql
from flask import jsonify

def login(nome, senha):
    cursor = sql.conectabanco()
    params = nome, senha

    # Consulta SQL para professor
    query_professor = "SELECT * FROM professor WHERE nome = ? AND senhaProfessor = ?"

    # Executa a consulta para professor
    cursor.execute(query_professor, params)

    # Verifica se o professor existe no banco de dados
    professor = cursor.fetchone()

    if professor:
        # Login bem-sucedido para professor
        response = {
            'message': 'Login bem-sucedido!', 
            'role': 'professor',
            "idProfessor": professor[0]
        }
        cursor.commit()
        cursor.close()
        return jsonify(response), 200

    # Consulta SQL para aluno
    query_aluno = "SELECT * FROM aluno WHERE nome = %s AND senhaAluno = %s"

    # Executa a consulta para aluno
    cursor.execute(query_aluno, params)

    # Verifica se o aluno existe no banco de dados
    aluno = cursor.fetchone()

    if aluno:
        # Login bem-sucedido para aluno
        response = {
            'message': 'Login bem-sucedido!',
            'role': 'aluno',
            'ra': aluno[0]
        }
        cursor.commit()
        cursor.close()
        return jsonify(response), 200
    else:
        # Credenciais inválidas
        response = {'message': 'Credenciais inválidas!'}
        cursor.commit()
        cursor.close()
        return jsonify(response), 401