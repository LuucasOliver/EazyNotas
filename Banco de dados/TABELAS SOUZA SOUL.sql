Create table USUARIO (
	idUsuario INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	ra INT not null,
	dataInserido DATETIME DEFAULT GETDATE(),
	bitAtivo BIT DEFAULT 1
)

--Inserir Usuario
INSERT INTO USUARIO(ra) VALUES('1234567')
INSERT INTO USUARIO(ra) VALUES('7891011')
INSERT INTO USUARIO(ra) VALUES('1213141')
INSERT INTO USUARIO(ra) VALUES('1516171')
SELECT * FROM USUARIO

Create table TIPO (
	idTipo INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	nomeTipo VARCHAR(50),
	bitAtivo BIT DEFAULT 1
)

-- Inserir Tipo
INSERT INTO TIPO(nomeTipo) VALUES('Aluno')
INSERT INTO TIPO(nomeTipo) VALUES('Professor')
SELECT * FROM TIPO

Create table PROFESSOR (
	idProfessor INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	idUsuario INT,
	nome VARCHAR(50),
	idTipo INT,
	dataInserido DATETIME DEFAULT GETDATE(),
	bitAtivo BIT DEFAULT 1
	FOREIGN KEY (idUsuario) REFERENCES USUARIO(idUsuario) ON DELETE CASCADE,
	FOREIGN KEY (idTipo) REFERENCES TIPO(idTipo) ON DELETE CASCADE
	)

--Inserir Professor
INSERT INTO PROFESSOR(idUsuario,nome,idTipo) VALUES(1,'Paulo Guina',2)
INSERT INTO PROFESSOR(idUsuario,nome,idTipo) VALUES(2,'Guinastico',2)
SELECT * FROM PROFESSOR


Create Table TURMA (
	idTurma INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	sala VARCHAR(50),
	idProfessor INT,
	FOREIGN KEY (idProfessor) REFERENCES PROFESSOR(idProfessor)ON DELETE CASCADE
)

--Inserir Turma
INSERT INTO TURMA(sala, idProfessor) VALUES ('2A', 1)
INSERT INTO TURMA(sala, idProfessor) VALUES ('3A', 1)
INSERT INTO TURMA(sala, idProfessor) VALUES ('1B', 2)
INSERT INTO TURMA(sala, idProfessor) VALUES ('2B', 2)
SELECT * FROM TURMA

Create table ALUNO (
	idAluno INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	idUsuario INT,
	idTipo INT,
	idTurma INT,
	nome VARCHAR(50),
	dataInserido DATETIME DEFAULT GETDATE(),
	bitAtivo BIT DEFAULT 1
	FOREIGN KEY (idUsuario) REFERENCES USUARIO(idUsuario) ON DELETE CASCADE,
	FOREIGN KEY (idTipo) REFERENCES TIPO(idTipo) ON DELETE CASCADE,
	FOREIGN KEY (idTurma) REFERENCES TURMA(idTurma)
)

--Inserir Aluno
INSERT INTO ALUNO (idUsuario, idTipo, idTurma, nome) VALUES (3,1,1,'Jailson Mendes')
INSERT INTO ALUNO (idUsuario, idTipo, idTurma, nome) VALUES (4,1,2,'Pistoleiro Papaco')
SELECT * FROM ALUNO

Create table MATERIAS (
	idMateria INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	nomeMat VARCHAR(50),
	idProfessor INT,
	FOREIGN KEY (idProfessor) REFERENCES PROFESSOR(idProfessor) ON DELETE CASCADE
)


--Inserir Materia
INSERT INTO MATERIAS(nomeMat, idProfessor) VALUES ('HISTORIA',1)
INSERT INTO MATERIAS(nomeMat, idProfessor) VALUES ('GEOGRAFIA',1)
INSERT INTO MATERIAS(nomeMat, idProfessor) VALUES ('MATEMATICA',2)
SELECT * FROM MATERIAS

Create table NOTA (
	idNotas INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	idAluno INT,
	idMateria INT,
	valorNota INT,
	FOREIGN KEY (idAluno) REFERENCES ALUNO(idAluno) ON DELETE CASCADE,
	FOREIGN KEY (idMateria) REFERENCES MATERIAS(idMateria)
)

-- Inserir Notas
INSERT INTO NOTA (valorNota, idAluno, idMateria) VALUES (9,1,1)
INSERT INTO NOTA (valorNota, idAluno, idMateria) VALUES (8,1,2)
INSERT INTO NOTA (valorNota, idAluno, idMateria) VALUES (7,1,3)
INSERT INTO NOTA (valorNota, idAluno, idMateria) VALUES (6,2,1)
INSERT INTO NOTA (valorNota, idAluno, idMateria) VALUES (5,2,2)
INSERT INTO NOTA (valorNota, idAluno, idMateria) VALUES (4,2,3)
SELECT * FROM NOTA

Create table FREQUENCIA (
	idFrequencia INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	idAluno INT,
	idMateria INT,
	NumFreq INT
	FOREIGN KEY (idAluno) REFERENCES ALUNO(idAluno) ON DELETE CASCADE,
	FOREIGN KEY (idMateria) REFERENCES MATERIAS(idMateria)
)

--Inserir Frequencia
INSERT INTO FREQUENCIA (idAluno,idMateria, NumFreq) VALUES (1,1,60)
INSERT INTO FREQUENCIA (idAluno,idMateria, NumFreq) VALUES (1,2,75)
INSERT INTO FREQUENCIA (idAluno,idMateria, NumFreq) VALUES (1,3,100)
INSERT INTO FREQUENCIA (idAluno,idMateria, NumFreq) VALUES (2,1,100)
INSERT INTO FREQUENCIA (idAluno,idMateria, NumFreq) VALUES (2,2,100)
INSERT INTO FREQUENCIA (idAluno,idMateria, NumFreq) VALUES (2,3,85)
SELECT * FROM FREQUENCIA

--VISUALIZAR O BANCO INTERLIGANDO AS TABELAS
SELECT * FROM (
SELECT U.idUsuario, A.idAluno, A.nome, T.nomeTipo, U.ra, R.sala, M.nomeMat, N.valorNota, F.NumFreq, U.bitAtivo FROM USUARIO U
INNER JOIN ALUNO A ON U.idUsuario = A.idUsuario
INNER JOIN TIPO T ON A.idTipo = T.idTipo
INNER JOIN NOTA N ON A.idAluno = N.idAluno
INNER JOIN MATERIAS M ON M.idMateria = N.idMateria
INNER JOIN TURMA R ON R.idTurma = A.idTurma
INNER JOIN FREQUENCIA F ON F.idAluno = A.idAluno AND F.idMateria = M.idMateria
) AS USUARIO

SELECT * FROM(
SELECT U.idUsuario,P.nome, T.nomeTipo, U.ra, M.nomeMat, R.sala, U.bitAtivo FROM USUARIO U
INNER JOIN PROFESSOR P ON U.idUsuario = P.idUsuario
INNER JOIN TIPO T ON P.idTipo = T.idTipo
INNER JOIN MATERIAS M ON P.idProfessor = M.idProfessor
INNER JOIN TURMA R ON R.idProfessor = P.idProfessor
)AS USUARIOS
