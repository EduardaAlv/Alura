-- Auto Incremento
-- O Identity cria um auto incremento no id, o primeiro valor é de onde vai começar (1, -), o segundo é de quanto ele vai incrementar a cada dado inserido.
CREATE TABLE TAB_IDENTITY (
    ID INT IDENTITY(1,1) NOT NULL, 
    DESCRITOR VARCHAR (20) NULL
);