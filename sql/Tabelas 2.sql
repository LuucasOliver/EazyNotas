Create table NOTA (
	idNotas int NOT NULL identity(1,1) Primary key,
	idAluno int,
	idMateria int,
	valorNota int
)

insert into NOTA (valorNota, idAluno, idMateria) values (8,1,2)
select* from NOTA

Create table MATERIAS (
	idMateria int NOT NULL identity(1,1) Primary key,
	nomeMat varchar(50),
	idProfessor int,
)

insert into MATERIAS (nomeMat,idProfessor) VALUES ('Geografia', 2)
select * from MATERIAS

Create table FREQUENCIA (
	idFrequencia int NOT NULL identity(1,1) Primary key,
	idAluno int,
	idMateria int,
	NumFreq int
)

insert into FREQUENCIA (idAluno,idMateria, NumFreq) VALUES (1,2,50)
select * from FREQUENCIA

Create Table TURMA (
	idTurma int NOT NULL identity(1,1) Primary key,
	sala varchar(50),
	horario varchar(50),
	idProfessor int
)

insert into TURMA(sala, horario, idProfessor) VALUES ('3B','12H30',2)
SELECT * FROM TURMA


SELECT * FROM (
SELECT U.idUsuario, A.idAluno, A.nome, T.nomeTipo, U.ra, R.sala, U.bitAtivo, M.nomeMat, N.valorNota, F.NumFreq FROM USUARIO U
INNER JOIN ALUNO A ON U.idUsuario = A.idUsuario
INNER JOIN TIPO T ON A.idTipo = T.idTipo
INNER JOIN NOTA N ON A.idAluno = N.idAluno
INNER JOIN MATERIAS M ON N.idMateria = M.idMateria
INNER JOIN FREQUENCIA F ON F.idMateria = M.idMateria
INNER JOIN TURMA R ON R.idTurma = A.idTurma
) AS USUARIO

SELECT * FROM(
SELECT U.idUsuario,P.nome, T.nomeTipo, U.ra, U.bitAtivo, M.nomeMat, R.sala FROM USUARIO U
INNER JOIN PROFESSOR P ON U.idUsuario = P.idUsuario
INNER JOIN TIPO T ON P.idTipo = T.idTipo
INNER JOIN MATERIAS M ON P.idProfessor = M.idProfessor
INNER JOIN TURMA R ON R.idProfessor = P.idProfessor
)AS USUARIOS

EXEC dbo.inserirProfessor '654654', 'Viturino'

EXEC dbo.inserirAluno '55555', 'Luquinhas', 1
