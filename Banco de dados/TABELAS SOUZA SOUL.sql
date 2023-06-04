Create table TIPO (
	idTipo INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	nomeTipo VARCHAR(50),
	bitAtivo BIT DEFAULT 1
)

--inserir Tipo
insert into TIPO (nomeTipo) VALUES ('Professor')
insert into TIPO (nomeTipo) VALUES ('Aluno')

select * from TIPO

Create table PROFESSOR (
	idProfessor INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	nome VARCHAR(50),
	idTipo INT,
	dataInserido DATETIME DEFAULT GETDATE(),
	bitAtivo BIT DEFAULT 1,
	senhaProfessor VARCHAR(50) NOT NULL,
	FOREIGN KEY (idTipo) REFERENCES TIPO(idTipo) ON DELETE CASCADE
	)

Create Table TURMA (
	idTurma INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	sala VARCHAR(50),
	idProfessor INT,
	FOREIGN KEY (idProfessor) REFERENCES PROFESSOR(idProfessor)ON DELETE CASCADE
)

Create table ALUNO (
	rA INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	idTipo INT,
	idTurma INT,
	nome VARCHAR(50),
	dataInserido DATETIME DEFAULT GETDATE(),
	bitAtivo BIT DEFAULT 1,
	senhaAlUNO VARCHAR(50) NOT NULL,
	FOREIGN KEY (idTipo) REFERENCES TIPO(idTipo) ON DELETE CASCADE,
	FOREIGN KEY (idTurma) REFERENCES TURMA(idTurma)
)

Create table MATERIAS (
	idMateria INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	nomeMat VARCHAR(50),
	diaMateria VARCHAR(50),
	horarioAula VARCHAR(50,
	idProfessor INT,
	FOREIGN KEY (idProfessor) REFERENCES PROFESSOR(idProfessor) ON DELETE CASCADE
)

Create table NOTA (
	idNotas INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	rA INT,
	idMateria INT,
	notaP1 INT,
	notaP2 INT,
	notaRc INT,
	FOREIGN KEY (rA) REFERENCES ALUNO(rA) ON DELETE CASCADE,
	FOREIGN KEY (idMateria) REFERENCES MATERIAS(idMateria)
)

Create table FREQUENCIA (
	idFrequencia INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	rA INT,
	idMateria INT,
	pAluno INT,
	fAluno INT,
	freqAluno INT,
	FOREIGN KEY (rA) REFERENCES ALUNO(rA) ON DELETE CASCADE,
	FOREIGN KEY (idMateria) REFERENCES MATERIAS(idMateria)
)

/*--VISUALIZAR O BANCO INTERLIGANDO AS TABELAS
SELECT * FROM (
SELECT A.rA, A.nome, T.nomeTipo, R.sala, M.nomeMat, N.valorNota, F.NumFreq, FROM ALUNOS A
INNER JOIN TIPO T ON A.idTipo = T.idTipo
INNER JOIN NOTA N ON A.rA = N.rA
INNER JOIN MATERIAS M ON M.idMateria = N.idMateria
INNER JOIN TURMA R ON R.idTurma = A.idTurma
INNER JOIN FREQUENCIA F ON A.rA = F.rA AND F.idMateria = M.idMateria
) AS

SELECT * FROM(
SELECT P.nome, T.nomeTipo, U.ra, M.nomeMat, R.sala, U.bitAtivo FROM PROFESSOR P
INNER JOIN TIPO T ON P.idTipo = T.idTipo
INNER JOIN MATERIAS M ON P.idProfessor = M.idProfessor
INNER JOIN TURMA R ON R.idProfessor = P.idProfessor
)AS USUARIOS*/