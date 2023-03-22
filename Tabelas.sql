Create table USUARIO (
	idUsuario int NOT NULL identity(1,1) Primary key,
	ra int not null,
	dataInserido datetime default GETDATE(),
	bitAtivo bit default 1
)

--inserir usuario
insert into Usuario(RA) VALUES('897865')
SELECT * FROM Usuario

UPDATE USUARIO sET bitAtivo = 0

--para caso de merda extremas
UPDATE PROFESSOR SET idusuario = 3 WHERE idProfessor = 2

Create table PROFESSOR (
	idProfessor int NOT NULL identity(1,1) Primary key,
	idUsuario int,
	nome varchar(50),
	idTipo int,
	dataInserido datetime default GETDATE(),
	bitAtivo bit default 1
)
--Inserir Professor
insert into PROFESSOR(idUsuario,nome,idTipo) VALUES ()

Create table ALUNO (
	idAluno int NOT NULL identity(1,1) Primary key,
	idUsuario int,
	idTipo int,
	idTurma int,
	nome varchar(50),
	dataInserido datetime default GETDATE(),
	bitAtivo bit default 1
)
--Inserir Aluno
insert into ALUNO (idUsuario, idTipo, idTurma, nome) VALUES ()

Create table TIPO (
	idTipo int,
	nomeTipo varchar(50),
	bitAtivo bit default 1
)

-- Inserir Tipo
insert into TIPO (idTipo,nomeTipo) VALUES (1,'Professor')

SELECT * FROM (
SELECT U.idUsuario,A.nome,T.nomeTipo, U.ra, U.bitAtivo FROM USUARIO U
INNER JOIN ALUNO A ON U.idUsuario = A.idUsuario
INNER JOIN TIPO T ON A.idTipo = T.idTipo
UNION
SELECT U.idUsuario,P.nome, T.nomeTipo, U.ra, U.bitAtivo FROM USUARIO U
INNER JOIN PROFESSOR P ON U.idUsuario = P.idUsuario
INNER JOIN TIPO T ON P.idTipo = T.idTipo
)AS USUARIOS