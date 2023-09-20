--4) Mostre a tabela de vendedores

SELECT * FROM TABELA_DE_VENDEDORES;
--5) Mostre a tabela de Notas Fiscais

SELECT * FROM NOTAS_FISCAIS;
--6) Conte o número de notas fiscais agrupados por matricula

SELECT MATRICULA, COUNT(*) AS NUMERO_NOTAS FROM NOTAS_FISCAIS GROUP BY MATRICULA;
--7) Mostre o nome do vendedor fazendo um JOIN entre as tabelas de vendedores e Notas Fiscais

SELECT NOTAS_FISCAIS.MATRICULA, TABELA_DE_VENDEDORES.NOME, COUNT(*) AS NUMERO_NOTAS 
FROM NOTAS_FISCAIS 
INNER JOIN TABELA_DE_VENDEDORES
ON NOTAS_FISCAIS.MATRICULA = TABELA_DE_VENDEDORES.MATRICULA
GROUP BY  NOTAS_FISCAIS.MATRICULA, TABELA_DE_VENDEDORES.NOME;
--8) Substituindo o nome da tabela pelo Alias

SELECT NF.MATRICULA, TV.NOME, COUNT(*) AS NUMERO_NOTAS 
FROM NOTAS_FISCAIS NF
INNER JOIN TABELA_DE_VENDEDORES TV
ON NF.MATRICULA = TV.MATRICULA
GROUP BY  NF.MATRICULA, TV.NOME;
--9) Podem inverter as tabelas no comando

SELECT NF.MATRICULA, TV.NOME, COUNT(*) AS NUMERO_NOTAS 
FROM TABELA_DE_VENDEDORES TV
INNER JOIN NOTAS_FISCAIS NF
ON NF.MATRICULA = TV.MATRICULA
GROUP BY  NF.MATRICULA, TV.NOME;
--10) Abra outra janela de consulta.

--11) Usando o JOIN nas tabela de clientes e notas fiscais usando CPF

SELECT 
TC.CPF AS CPF_DO_CADASTRO
, TC.NOME AS NOME_DO_CLIENTE
, NF.CPF AS CPF_DA_NOTA
FROM TABELA_DE_CLIENTES TC
INNER JOIN
NOTAS_FISCAIS NF
ON TC.CPF = NF.CPF
--12) Usando o DISTINCT para mostrar os clientes que compraram

SELECT DISTINCT
TC.CPF AS CPF_DO_CADASTRO
, TC.NOME AS NOME_DO_CLIENTE
, NF.CPF AS CPF_DA_NOTA
FROM TABELA_DE_CLIENTES TC
INNER JOIN
NOTAS_FISCAIS NF
ON TC.CPF = NF.CPF
--13) Para contar quantos clientes

SELECT COUNT(*) FROM TABELA_DE_CLIENTES;
--14) Para incluir um cliente novo use o comando INSERT

INSERT INTO TABELA_DE_CLIENTES
(CPF, NOME, ENDERECO_1, ENDERECO_2, BAIRRO, CIDADE, ESTADO, CEP, DATA_DE_NASCIMENTO, IDADE,
GENERO, LIMITE_DE_CREDITO, VOLUME_DE_COMPRA, PRIMEIRA_COMPRA)
VALUES ('23412632331', 'Juliana Silva', 'R. Tramandai','','Bangu','Rio de Janeiro','RJ','23400000',
'1989-02-04',33,'F',180000,24500, 0);
--15) Mostre quantos clientes cadastrados na tabela e quantos compraram

SELECT COUNT(*) FROM TABELA_DE_CLIENTES;
SELECT DISTINCT
TC.CPF AS CPF_DO_CADASTRO
, TC.NOME AS NOME_DO_CLIENTE
, NF.CPF AS CPF_DA_NOTA
FROM TABELA_DE_CLIENTES TC
INNER JOIN
NOTAS_FISCAIS NF
ON TC.CPF = NF.CPF
--16) Usando o LEFT JOIN para mostrar os clientes

SELECT DISTINCT
TC.CPF AS CPF_DO_CADASTRO
, TC.NOME AS NOME_DO_CLIENTE
, NF.CPF AS CPF_DA_NOTA
FROM TABELA_DE_CLIENTES TC 
LEFT JOIN 
NOTAS_FISCAIS NF
ON TC.CPF = NF.CPF
--17) Mostre qual cliente não fez venda usando o LEFT JOIN e o filtro WHERE

SELECT DISTINCT
TC.CPF AS CPF_DO_CADASTRO
, TC.NOME AS NOME_DO_CLIENTE
FROM TABELA_DE_CLIENTES TC 
LEFT JOIN 
NOTAS_FISCAIS NF
ON TC.CPF = NF.CPF
WHERE NF.CPF IS NULL
--18) Para saber quantos clientes tem em cada bairro que tem vendedores

--19) Conte quantos clientes e vendedores tem nas tabelas

SELECT COUNT(*) FROM TABELA_DE_CLIENTES;
SELECT COUNT(*) FROM TABELA_DE_VENDEDORES;
--20) Faça um INNER JOIN nas tabelas para mostrar qual vendedor tem cliente no seu bairro

SELECT DISTINCT
TV.NOME AS NOME_DO_VENDEDOR
,TV.BAIRRO AS BAIRRO_DO_VENDEDOR
,TC.BAIRRO AS BAIRRO_DO_CLIENTE
,TC.NOME AS NOME_DO_CLIENTE
FROM
TABELA_DE_CLIENTES TC
INNER JOIN
TABELA_DE_VENDEDORES TV
ON TC.BAIRRO = TV.BAIRRO
--21) Usando o LEFT JOIN para mostrar qual vendedor não tem cliente no seu bairro

SELECT DISTINCT
TV.NOME AS NOME_DO_VENDEDOR
,TV.BAIRRO AS BAIRRO_DO_VENDEDOR
,TC.BAIRRO AS BAIRRO_DO_CLIENTE
,TC.NOME AS NOME_DO_CLIENTE
FROM
TABELA_DE_CLIENTES TC
LEFT JOIN
TABELA_DE_VENDEDORES TV
ON TC.BAIRRO = TV.BAIRRO
WHERE TV.NOME IS NULL
--22) Para mostrar qual cliente que não tem vendedor em seu bairro

SELECT DISTINCT
TV.NOME AS NOME_DO_VENDEDOR
,TV.BAIRRO AS BAIRRO_DO_VENDEDOR
,TC.BAIRRO AS BAIRRO_DO_CLIENTE
,TC.NOME AS NOME_DO_CLIENTE
FROM
TABELA_DE_CLIENTES TC
LEFT JOIN
TABELA_DE_VENDEDORES TV
ON TC.BAIRRO = TV.BAIRRO
WHERE TV.NOME IS NULL
--23) Agora usando o FULL JOIN para responder todas as perguntas

SELECT DISTINCT
TV.NOME AS NOME_DO_VENDEDOR
,TV.BAIRRO AS BAIRRO_DO_VENDEDOR
,TC.BAIRRO AS BAIRRO_DO_CLIENTE
,TC.NOME AS NOME_DO_CLIENTE
FROM
TABELA_DE_CLIENTES TC
FULL JOIN
TABELA_DE_VENDEDORES TV
ON TC.BAIRRO = TV.BAIRRO
--24) Crie uma nova janela de consulta

--25) Mostre quantos bairros tem na tabela de clientes

SELECT DISTINCT BAIRRO FROM TABELA_DE_CLIENTES;
--26) Mostre os bairros que tem na tabela de vendedores

SELECT DISTINCT BAIRRO FROM TABELA_DE_VENDEDORES;
--27) Mostre quantos bairros tem nas duas tabelas

SELECT DISTINCT BAIRRO FROM TABELA_DE_CLIENTES
UNION
SELECT DISTINCT BAIRRO FROM TABELA_DE_VENDEDORES;
--28) Usando o UNION ALL mostra os bairros repetidos

SELECT DISTINCT BAIRRO FROM TABELA_DE_CLIENTES
UNION ALL
SELECT DISTINCT BAIRRO FROM TABELA_DE_VENDEDORES;
--29) Mostre de que tabela veio o dado

SELECT DISTINCT BAIRRO, 'CLIENTE' AS ORIGEM FROM TABELA_DE_CLIENTES
UNION ALL
SELECT DISTINCT BAIRRO, 'FORNECEDOR' AS ORIGEM FROM TABELA_DE_VENDEDORES;
--30) Aplicando o UNION o resultado será o mesmo

SELECT DISTINCT BAIRRO, 'CLIENTE' AS ORIGEM FROM TABELA_DE_CLIENTES
UNION
SELECT DISTINCT BAIRRO, 'FORNECEDOR' AS ORIGEM FROM TABELA_DE_VENDEDORES;
--31) Crie uma nova janela de consulta

--32) Mostre os bairros dos vendedores

SELECT DISTINCT BAIRRO FROM TABELA_DE_VENDEDORES;
--33) Mostre os clientes que tem vendedores

SELECT * FROM TABELA_DE_CLIENTES
WHERE BAIRRO IN ('Copacabana', 'Jardins','Santo Amaro','Tijuca');
--34) Usando as duas consultas juntas

SELECT * FROM TABELA_DE_CLIENTES
WHERE BAIRRO IN (SELECT DISTINCT BAIRRO FROM TABELA_DE_VENDEDORES);
--35) Crie mais uma janela de consulta

--36) Mostre os preços médios das embalagens

SELECT EMBALAGEM, AVG(PRECO_DE_LISTA) AS PRECO_MEDIO
FROM TABELA_DE_PRODUTOS GROUP BY EMBALAGEM;
--37) Se quiser mostrar somente as embalagens com preços menores que 10 usando HAVING

SELECT EMBALAGEM, AVG(PRECO_DE_LISTA) AS PRECO_MEDIO
FROM TABELA_DE_PRODUTOS GROUP BY EMBALAGEM
HAVING AVG(PRECO_DE_LISTA) <= 10;
--38) Usando uma sub query

SELECT MEDIA_EMBALAGENS.EMBALAGEM, 
MEDIA_EMBALAGENS.PRECO_MEDIO FROM
(SELECT EMBALAGEM, AVG(PRECO_DE_LISTA) AS PRECO_MEDIO
FROM TABELA_DE_PRODUTOS GROUP BY EMBALAGEM) MEDIA_EMBALAGENS
WHERE MEDIA_EMBALAGENS.PRECO_MEDIO <= 10;
--39) Crie as visão MEDIA_EMBALAGENS

CREATE VIEW MEDIA_EMBALAGENS AS
SELECT EMBALAGEM, AVG(PRECO_DE_LISTA) AS PRECO_MEDIO
FROM TABELA_DE_PRODUTOS GROUP BY EMBALAGEM;
--40) Mostre o conteúdo da visão MEDIA_EMBALAGENS

SELECT * FROM MEDIA_EMBALAGENS;
--41) Usando a visão nas querys

SELECT MEDIA_EMBALAGENS.EMBALAGEM, 
MEDIA_EMBALAGENS.PRECO_MEDIO FROM
(SELECT EMBALAGEM, AVG(PRECO_DE_LISTA) AS PRECO_MEDIO
FROM TABELA_DE_PRODUTOS GROUP BY EMBALAGEM) MEDIA_EMBALAGENS
WHERE MEDIA_EMBALAGENS.PRECO_MEDIO <= 10;
SELECT EMBALAGEM, PRECO_MEDIO
FROM MEDIA_EMBALAGENS
WHERE PRECO_MEDIO <= 10;