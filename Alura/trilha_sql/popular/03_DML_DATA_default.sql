-- Default
-- cria um valor default para a tabela
CREATE TABLE TB_PADRAO (
    ID INT IDENTITY(1,1) NOT NULL, 
    DESCRITOR VARCHAR(20) NULL, 
    ENDERECO VARCHAR(20) NULL, 
    CIDADE VARCHAR(20) DEFAULT 'Rio de Janeiro', 
    DATA_CRIACAO DATE DEFAULT GETDATE()
);