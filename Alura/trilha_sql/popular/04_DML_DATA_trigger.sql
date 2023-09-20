-- Trigger
-- um procedimento que fica armazenado, e ele é executado automaticamente quando um evento que você definir for executado.

-- Criar a tabela de Clientes
CREATE TABLE Clientes (
    ID INT PRIMARY KEY,
    Nome VARCHAR(50),
    Email VARCHAR(50)
);

-- Criar a tabela de Auditoria
CREATE TABLE Auditoria (
    ID INT PRIMARY KEY,
    Acao VARCHAR(50),
    DataHora DATETIME,
    TabelaAfectada VARCHAR(50)
);

-- Criar o trigger de auditoria
CREATE TRIGGER TriggerAuditoria
ON Clientes
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    DECLARE @Acao VARCHAR(50);
    SET @Acao = CASE
        WHEN EXISTS (SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted) THEN 'UPDATE'
        WHEN EXISTS (SELECT * FROM inserted) THEN 'INSERT'
        WHEN EXISTS (SELECT * FROM deleted) THEN 'DELETE'
    END;

    INSERT INTO Auditoria (Acao, DataHora, TabelaAfectada)
    VALUES (@Acao, GETDATE(), 'Clientes');
END;


-- Neste exemplo, sempre que um registro é inserido, atualizado ou excluído na tabela "Clientes", 
-- o trigger "TriggerAuditoria" é acionado. Ele determina a ação realizada (inserção, atualização ou exclusão) 
-- com base nas tabelas especiais "inserted" e "deleted" que são automaticamente populadas pelo SQL Server 
-- durante o acionamento do trigger. Em seguida, insere um registro na tabela "Auditoria" para registrar as informações sobre a ação realizada.
