CREATE PROCEDURE dbo.inserirProfessor
RETURNS int
AS
BEGIN
    DECLARE @newID int
    
    -- Insere dados na tabela1 e retorna o ID gerado automaticamente
    INSERT INTO tabela1 (campo1, campo2) VALUES (@param1, @param2)
    SET @newID = SCOPE_IdDENTITY()
    
    -- Insere o ID retornado na tabela2
    INSERT INTO tabela2 (campo1, campo2, id_tabela1) VALUES ('valor1', 'valor2', @newID)
    
    -- Retorna o ID gerado automaticamente
    RETURN @newID
END



CREATE PROCEDURE dbo.inserirAluno
@RA INT,
@nome VARCHAR(500),
@IdTurma INT
AS
BEGIN
	DECLARE @IdUsuario INT

	INSERT INTO Usuario(RA) VALUES(@RA)
	SET @IdUsuario = SCOPE_IDENTITY()

	insert into ALUNO(idUsuario, idTipo, idTurma, nome) VALUES (@IdUsuario, 2, @IdTurma, @nome)

END

CREATE PROCEDURE dbo.inserirProfessor
@RA INT,
@nome VARCHAR(500)
AS
BEGIN
	DECLARE @IdUsuario INT

	INSERT INTO Usuario(RA) VALUES(@RA)
	SET @IdUsuario = SCOPE_IDENTITY()

	insert into PROFESSOR(idUsuario, idTipo, nome) VALUES (@IdUsuario, 1, @nome)

END

EXEC dbo.inserirProfessor '654654', 'Professor Zé'

EXEC dbo.inserirAluno '55555', 'Donetes', 1


SELECT * FROM PROFESSOR
SELECT * FROM ALUNO