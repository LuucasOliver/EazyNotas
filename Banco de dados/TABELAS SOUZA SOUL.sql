PRINT 'BEFORE TRY'
BEGIN TRY
    BEGIN TRAN
		PRINT 'First Statement in the TRY block'

		Create table PROFESSOR (
			idProfessor INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
			nome VARCHAR(50),
			dataInserido DATETIME DEFAULT GETDATE(),
			bitAtivo BIT DEFAULT 1,
			senhaProfessor VARCHAR(50) NOT NULL,
			)

		Create Table TURMA (
			idTurma INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
			sala VARCHAR(50),
			idProfessor INT,
			FOREIGN KEY (idProfessor) REFERENCES PROFESSOR(idProfessor)ON DELETE CASCADE
		)

		Create table ALUNO (
			rA INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
			idTurma INT,
			nome VARCHAR(50),
			dataInserido DATETIME DEFAULT GETDATE(),
			bitAtivo BIT DEFAULT 1,
			senhaAlUNO VARCHAR(50) NOT NULL,
			FOREIGN KEY (idTurma) REFERENCES TURMA(idTurma)
		)

		Create table MATERIAS (
			idMateria INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
			nomeMat VARCHAR(50),
			diaMateria VARCHAR(50),
			horarioAula VARCHAR(50),
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
     PRINT 'Last Statement in the TRY block'
    COMMIT TRAN
END TRY
BEGIN CATCH
    PRINT 'In CATCH Block'
    IF(@@TRANCOUNT > 0)
        ROLLBACK TRAN;
    THROW; -- raise error to the client
END CATCH

GO

