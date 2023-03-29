USE CURSO
CREATE TABLE Funcionarios(
Id INT IDENTITY (1,1) NOT NULL PRIMARY KEY, 
Nome VARCHAR(50) NOT NULL,
Salario DECIMAL(10,2),
Setor VARCHAR(30));

SELECT * FROM Funcionarios

SELECT nome,setor
FROM Funcionarios

SELECT nome, setor AS depto
FROM Funcionarios

INSERT INTO Funcionarios
VALUES ('João', 1000, ''), ('Jose', 1999, ''), ('Alexandre', 3000, '');


SELECT * FROM Funcionarios


INSERT INTO Funcionarios (Nome,Salario) VALUES ('Pedro', 1000);


--DML UPDATE
UPDATE Funcionarios SET Salario = '1500'
WHERE Id = '1';
SELECT * FROM Funcionarios

UPDATE Funcionarios SET Salario = Salario * 1.5, Setor = 'TI'
Where Id <> '1';

--DML DELETE
DELETE Funcionarios
WHERE Id = '1';

--DDL Criando Tabela
CREATE TABLE Colaborador (
Matricula INT IDENTITY (1,1) NOT NULL,
Nome VARCHAR (50) NOT NULL,
Sobrenome VARCHAR (50) NOT NULL,
Endereço VARCHAR (50),
Cidade VARCHAR (50), 
Pais VARCHAR (25),
Data_nasc DATE NOT NULL CHECK(Data_nasc < GETDATE()),
Data_Cadastro DATETIME DEFAULT GETDATE(),
Situacao CHAR(1) DEFAULT ('A'));

--DDL Criando Tabela com Chave Estrangeira
CREATE TABLE SALARIO(
Matricula INT PRIMARY KEY NOT NULL,
Salario DECIMAL (10,2) NOT NULL CHECK (Salario > 0)
FOREIGN KEY(Matricula) REFERENCES colaborador(matricula));


--DDL Para Adicionar Chave Primária na Tabela Colaborador
ALTER TABLE Colaborador ADD PRIMARY KEY (Matricula);