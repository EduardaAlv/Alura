--2) Listar todos os clientes

SELECT * FROM [TABELA DE CLIENTES]

--3) Mostrar o número de clientes da tabela

SELECT COUNT(*) FROM [TABELA DE CLIENTES]

--4) Seleção com o CPF dos clientes e

SELECT X.CPF, X.NOME
FROM ( SELECT Row_Number() Over (Order By CPF) as RowNum, * from [TABELA DE CLIENTES]) X
WHERE X.RowNum = 5

--5) Entre com o script

DECLARE @CPF VARCHAR(11);
DECLARE @NOME VARCHAR(100);
DECLARE @NUMERO_CLIENTES INT;
DECLARE @I INT;
DECLARE @MES INT, @ANO INT;
DECLARE @TOTAL_VENDAS FLOAT;
DECLARE @TABELA_FINAL TABLE (CPF VARCHAR(11), NOME VARCHAR(100), MES INT, ANO INT, VALOR_TOTAL FLOAT);

SET @MES = 2;
SET @ANO = 2015;
SELECT @NUMERO_CLIENTES = COUNT(*) FROM [TABELA DE CLIENTES];
SET @I = 1;
WHILE @I <= @NUMERO_CLIENTES
BEGIN
    SELECT @CPF = X.CPF, @NOME = X.NOME
        FROM ( SELECT Row_Number() Over (Order By CPF) as RowNum, * from [TABELA DE CLIENTES]) X
        WHERE X.RowNum = @I;

--6) Agora vamos ver o total de vendas por CPF

--7) Faça o select para ver o funcionamento do comando

SELECT
    SUM([ITENS NOTAS FISCAIS].QUANTIDADE * [ITENS NOTAS FISCAIS].[PREÇO]) 
    FROM [NOTAS FISCAIS]
    INNER JOIN [ITENS NOTAS FISCAIS]
    ON [NOTAS FISCAIS].NUMERO = [ITENS NOTAS FISCAIS].NUMERO
    WHERE [NOTAS FISCAIS].CPF = '1471156710'
    AND YEAR([NOTAS FISCAIS].DATA) = 2015 AND MONTH([NOTAS FISCAIS].DATA) = 1;

--8) Transportando a consulta para dentro do script

DECLARE @CPF VARCHAR(11);
DECLARE @NOME VARCHAR(100);
DECLARE @NUMERO_CLIENTES INT;
DECLARE @I INT;
DECLARE @MES INT, @ANO INT;
DECLARE @TOTAL_VENDAS FLOAT;

SET @MES = 1;
SET @ANO = 2015;
SELECT @NUMERO_CLIENTES = COUNT(*) FROM [TABELA DE CLIENTES];
SET @I = 1;
WHILE @I <= @NUMERO_CLIENTES
BEGIN
    SELECT @CPF = X.CPF, @NOME = X.NOME
        FROM ( SELECT Row_Number() Over (Order By CPF) as RowNum, * from [TABELA DE CLIENTES]) X
        WHERE X.RowNum = @I;

    SELECT
        @TOTAL_VENDAS = SUM([ITENS NOTAS FISCAIS].QUANTIDADE * [ITENS NOTAS FISCAIS].[PREÇO]) 
        FROM [NOTAS FISCAIS]
        INNER JOIN [ITENS NOTAS FISCAIS]
        ON [NOTAS FISCAIS].NUMERO = [ITENS NOTAS FISCAIS].NUMERO
        WHERE [NOTAS FISCAIS].CPF = @CPF
        AND YEAR([NOTAS FISCAIS].DATA) = @ANO AND MONTH([NOTAS FISCAIS].DATA) = @MES;

    PRINT 'Vendas para ' + @CPF + ' - ' + @NOME + ' NO MÊS ' + 
        CONVERT(VARCHAR(2), @MES) + ' E ANO ' + CONVERT(VARCHAR(4), @ANO) + 
        ' FOI DE ' +  CONVERT(VARCHAR(20), @TOTAL_VENDAS);
    SET @I = @I + 1;
END;

--9) Acertando a conversão de FLOAT para VARCHAR

DECLARE @CPF VARCHAR(11);
DECLARE @NOME VARCHAR(100);
DECLARE @NUMERO_CLIENTES INT;
DECLARE @I INT;
DECLARE @MES INT, @ANO INT;
DECLARE @TOTAL_VENDAS FLOAT;

SET @MES = 2;
SET @ANO = 2015;
SELECT @NUMERO_CLIENTES = COUNT(*) FROM [TABELA DE CLIENTES];
SET @I = 1;
WHILE @I <= @NUMERO_CLIENTES
BEGIN
    SELECT @CPF = X.CPF, @NOME = X.NOME
        FROM ( SELECT Row_Number() Over (Order By CPF) as RowNum, * from [TABELA DE CLIENTES]) X
        WHERE X.RowNum = @I;

    SELECT
        @TOTAL_VENDAS = SUM([ITENS NOTAS FISCAIS].QUANTIDADE * [ITENS NOTAS FISCAIS].[PREÇO]) 
        FROM [NOTAS FISCAIS]
        INNER JOIN [ITENS NOTAS FISCAIS]
        ON [NOTAS FISCAIS].NUMERO = [ITENS NOTAS FISCAIS].NUMERO
        WHERE [NOTAS FISCAIS].CPF = @CPF
        AND YEAR([NOTAS FISCAIS].DATA) = @ANO AND MONTH([NOTAS FISCAIS].DATA) = @MES;

    PRINT 'Vendas para ' + @CPF + ' - ' + @NOME + ' NO MÊS ' + CONVERT(VARCHAR(2), @MES) + 
        ' E ANO ' + CONVERT(VARCHAR(4), @ANO) + ' FOI DE ' +  TRIM(STR(@TOTAL_VENDAS, 15, 2));
    SET @I = @I + 1;
END;

--10) Vamos agora salvar o resultado usando uma tabela temporária

DECLARE @CPF VARCHAR(11);
DECLARE @NOME VARCHAR(100);
DECLARE @NUMERO_CLIENTES INT;
DECLARE @I INT;
DECLARE @MES INT, @ANO INT;
DECLARE @TOTAL_VENDAS FLOAT;
DECLARE @TABELA_FINAL TABLE (CPF VARCHAR(11), NOME VARCHAR(100), MES INT, ANO INT, VALOR_TOTAL FLOAT);

SET @MES = 2;
SET @ANO = 2015;
SELECT @NUMERO_CLIENTES = COUNT(*) FROM [TABELA DE CLIENTES];
SET @I = 1;
WHILE @I <= @NUMERO_CLIENTES
BEGIN
    SELECT @CPF = X.CPF, @NOME = X.NOME
        FROM ( SELECT Row_Number() Over (Order By CPF) as RowNum, * from [TABELA DE CLIENTES]) X
        WHERE X.RowNum = @I;

    SELECT
        @TOTAL_VENDAS = SUM([ITENS NOTAS FISCAIS].QUANTIDADE * [ITENS NOTAS FISCAIS].[PREÇO]) 
        FROM [NOTAS FISCAIS]
        INNER JOIN [ITENS NOTAS FISCAIS]
        ON [NOTAS FISCAIS].NUMERO = [ITENS NOTAS FISCAIS].NUMERO
        WHERE [NOTAS FISCAIS].CPF = @CPF
        AND YEAR([NOTAS FISCAIS].DATA) = @ANO AND MONTH([NOTAS FISCAIS].DATA) = @MES;

    INSERT INTO @TABELA_FINAL VALUES (@CPF, @NOME, @MES, @ANO, @TOTAL_VENDAS);

    PRINT 'Vendas para ' + @CPF + ' - ' + @NOME + ' NO MÊS ' + CONVERT(VARCHAR(2), @MES) + 
        ' E ANO ' + CONVERT(VARCHAR(4), @ANO) + ' FOI DE ' +  TRIM(STR(@TOTAL_VENDAS, 15, 2));
    SET @I = @I + 1;
END;