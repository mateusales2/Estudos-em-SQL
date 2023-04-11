create database ap1;
use ap1;
GRANT EXECUTE ON PROCEDURE RegistrarEmprestimo TO root@localhost;

# CREATES
CREATE TABLE Livros (
    ID INT PRIMARY KEY,
    Titulo VARCHAR(100) NOT NULL,
    AutorID INT NOT NULL,
    AnoPublicacao INT NOT NULL,
    Isbn VARCHAR(20) NOT NULL,
    Disponivel BOOLEAN NOT NULL
);

CREATE TABLE Autores (
    ID INT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Pais VARCHAR(50) NOT NULL
);

CREATE TABLE Emprestimos (
    ID INT PRIMARY KEY,
    LivroID INT NOT NULL,
    Usuario VARCHAR(100) NOT NULL,
    DataEmprestimo DATE NOT NULL,
    DataDevolucao DATE NULL
);

# CRUD

# CREATE
INSERT INTO Livros (ID, Titulo, AutorID, AnoPublicacao, Isbn, Disponivel) 
VALUES (1, 'O Senhor dos Anéis', 1, 1954, '9780544003415', 1);

INSERT INTO Autores (ID, Nome, Pais)
VALUES (1, 'J.R.R. Tolkien', 'Reino Unido');

INSERT INTO Emprestimos (ID, LivroID, Usuario, DataEmprestimo, DataDevolucao)
VALUES (1, 1, 'João', '2023-04-01', NULL);



# READ
SELECT * FROM Livros;
SELECT * FROM Autores;
SELECT * FROM Emprestimos;


# UPDATE
UPDATE Livros SET Disponivel = 0 WHERE ID = 1;


# DELETE (NÃO MEXA AQUI)
DELETE FROM Emprestimos WHERE ID = 1;


# VIEWS
CREATE VIEW LivrosDisponiveis AS
SELECT * FROM Livros WHERE Disponivel = 1;



# STORED PROCEDURES
CREATE PROCEDURE RegistrarEmprestimo(
    IN LivroID INT,
    IN Usuario VARCHAR(100),
    IN DataEmprestimo DATE
)
    INSERT INTO Emprestimos (LivroID, Usuario, DataEmprestimo)
    VALUES (LivroID, Usuario, DataEmprestimo);

    UPDATE Livros SET Disponivel = 0 WHERE ID = LivroID;
    
    
    # FUNCTIONS
    DELIMITER //
CREATE FUNCTION fnDiasAtraso(DataDevolucao DATE)
RETURNS INT
BEGIN
    DECLARE DiasAtraso INT;
    SET DiasAtraso = DATEDIFF(CURDATE(), DataDevolucao);

    IF (DiasAtraso > 0) THEN
        RETURN DiasAtraso;
    ELSE
        RETURN 0;
    END IF;
END //
DELIMITER ;




# TRIGGERS
DELIMITER //
CREATE TRIGGER trEmprestimoDevolucao BEFORE UPDATE ON Emprestimos
FOR EACH ROW
BEGIN
    IF NEW.DataDevolucao IS NOT NULL THEN
        UPDATE Livros SET Disponivel = 1 WHERE ID = NEW.LivroID;
    END IF;
END //
DELIMITER ;




