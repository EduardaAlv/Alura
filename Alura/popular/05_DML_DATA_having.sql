--5) Mostre o conteúdo da tabela

SELECT * FROM TABELA_DE_PRODUTOS;COPIAR CÓDIGO
--6) Mostre os registros com o campo EMBALAGEM

SELECT EMBALAGEM FROM TABELA_DE_PRODUTOS;COPIAR CÓDIGO
--7) Usando o comando DISTINCT para juntar as linhas com mesmo tipo de embalagem

SELECT DISTINCT EMBALAGEM FROM TABELA_DE_PRODUTOS;COPIAR CÓDIGO
--8) Juntando o filtro WHERE para saber as embalagens dos produtos de Maçã

SELECT DISTINCT EMBALAGEM FROM TABELA_DE_PRODUTOS WHERE SABOR = 'Maca';COPIAR CÓDIGO
--9) Mostrando os produtos com as mesmas características em EMBALAGEM e SABOR

SELECT DISTINCT EMBALAGEM, SABOR FROM TABELA_DE_PRODUTOS;COPIAR CÓDIGO
--10) No SSMS verifique se está conectado na base de dados correta e abra uma nova janela de consulta

--11) Faça um select na tabela de produtos

SELECT * FROM TABELA_DE_PRODUTOS;COPIAR CÓDIGO
--12) Com o comando TOP são mostrados os primeiros registros

SELECT TOP 5 * FROM TABELA_DE_PRODUTOS;COPIAR CÓDIGO
--13) Mostre os cinco primeiros produtos com sabor Maca (Maçã)

SELECT TOP 5 * FROM TABELA_DE_PRODUTOS WHERE SABOR = 'Maca';COPIAR CÓDIGO
--14) Para ordenar a tabela por um campo use ORDER BY

SELECT * FROM TABELA_DE_PRODUTOS ORDER BY PRECO_DE_LISTA;COPIAR CÓDIGO
--15) Ordenando a resposta de forma ascendente

SELECT * FROM TABELA_DE_PRODUTOS ORDER BY PRECO_DE_LISTA ASC;COPIAR CÓDIGO
--16) Para mostrar de forma descendente use o comando

SELECT * FROM TABELA_DE_PRODUTOS ORDER BY PRECO_DE_LISTA DESC;COPIAR CÓDIGO
--17) Ordene a tabela de produtos pelo NOME_DO_PRODUTO

SELECT * FROM TABELA_DE_PRODUTOS ORDER BY NOME_DO_PRODUTO;COPIAR CÓDIGO
--18) Usando uma quebra sendo ordenado por EMBALAGEM e quebrado pelo NOME_DO_PRODUTO

SELECT * FROM TABELA_DE_PRODUTOS ORDER BY EMBALAGEM, NOME_DO_PRODUTO;COPIAR CÓDIGO
--19) É possível mostrar o resultado em ordem inversa

SELECT * FROM TABELA_DE_PRODUTOS ORDER BY EMBALAGEM DESC, NOME_DO_PRODUTO DESC;COPIAR CÓDIGO
--20) Usando a ordenação junto com a limitação de saída

SELECT TOP 5 * FROM TABELA_DE_PRODUTOS ORDER BY PRECO_DE_LISTA DESC;COPIAR CÓDIGO
--21) Usando a base SUCO_DE_FRUTAS crie uma nova janela de consulta

--22) Mostre a tabela de clientes

SELECT * FROM TABELA_DE_CLIENTES;COPIAR CÓDIGO
--23) Mostra a cidade e idade de cada cliente

SELECT CIDADE, IDADE FROM TABELA_DE_CLIENTES;COPIAR CÓDIGO
--24) Usando o ORDER BY para ordenar a saída

SELECT CIDADE, IDADE FROM TABELA_DE_CLIENTES ORDER BY CIDADE, IDADE;COPIAR CÓDIGO
--25) Para mostrar a soma das idades dos cliente como uma Alias e quiser agrupar pelo campo CIDADE use o código

SELECT CIDADE, SUM(IDADE) AS IDADE FROM TABELA_DE_CLIENTES GROUP BY CIDADE;COPIAR CÓDIGO
--26) Para mostrar a soma das idades e crédito dos cliente como uma Alias agrupado por cidade

SELECT CIDADE, SUM(IDADE) AS IDADE, SUM(LIMITE_DE_CREDITO) AS CREDITO FROM TABELA_DE_CLIENTES GROUP BY CIDADE;COPIAR CÓDIGO
--27) Para mostrar a média da idade dos cliente de cada cidade

SELECT CIDADE, AVG(IDADE) AS IDADE, SUM(LIMITE_DE_CREDITO) AS CREDITO FROM TABELA_DE_CLIENTES GROUP BY CIDADE;COPIAR CÓDIGO
--28) Para contar a quantidade de clientes por cidade

SELECT CIDADE, COUNT(*) AS NUMERO_DE_CLIENTES FROM TABELA_DE_CLIENTES GROUP BY CIDADE;COPIAR CÓDIGO
--29) Para mostrar quantos produtos tem com sabor Laranja e agrupados por embalagem

SELECT EMBALAGEM, COUNT(*) AS NUMERO_DE_CLIENTES FROM TABELA_DE_PRODUTOS 
WHERE SABOR = 'Laranja' GROUP BY EMBALAGEM;COPIAR CÓDIGO
--30) Em uma nova janela de consulta entre com

SELECT * FROM TABELA_DE_CLIENTES;COPIAR CÓDIGO
--31) Para fazer a consulta agregando limite de crédito

SELECT ESTADO, SUM(LIMITE_DE_CREDITO) AS CREDITO
FROM TABELA_DE_CLIENTES GROUP BY ESTADO;COPIAR CÓDIGO
--32) A seguinte consulta dá erro

SELECT ESTADO, SUM(LIMITE_DE_CREDITO) AS CREDITO
FROM TABELA_DE_CLIENTES 
WHERE  SUM(LIMITE_DE_CREDITO) >= 900000
GROUP BY ESTADO;COPIAR CÓDIGO
--33) Usando o comando HAVING funciona a consulta

SELECT ESTADO, SUM(LIMITE_DE_CREDITO) AS CREDITO
FROM TABELA_DE_CLIENTES 
GROUP BY ESTADO
HAVING SUM(LIMITE_DE_CREDITO) >= 900000;COPIAR CÓDIGO
--34) Melhorando as consultas vamos na tabela de produtos e buscamos o maior e o menor preço de lista para cada embalagem

SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS PRECO_MAX, MIN(PRECO_DE_LISTA) AS PRECO_MIN
FROM TABELA_DE_PRODUTOS GROUP BY  EMBALAGEM;COPIAR CÓDIGO
--35) Vamos ver somente o maior e menor preço de produtos que são mais caros que dez reais agrupado por embalagem

SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS PRECO_MAX, MIN(PRECO_DE_LISTA) AS PRECO_MIN
FROM TABELA_DE_PRODUTOS 
WHERE PRECO_DE_LISTA >= 10
GROUP BY  EMBALAGEM;COPIAR CÓDIGO
--36) Para ver produtos com preço maiores que vinte reais

SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS PRECO_MAX, MIN(PRECO_DE_LISTA) AS PRECO_MIN
FROM TABELA_DE_PRODUTOS 
WHERE PRECO_DE_LISTA >= 10
GROUP BY  EMBALAGEM
HAVING MAX(PRECO_DE_LISTA) >= 20;COPIAR CÓDIGO
--37) Criamos uma nova consulta e mostramos os produtos com sabor Manga

SELECT NOME_DO_PRODUTO, PRECO_DE_LISTA FROM TABELA_DE_PRODUTOS
WHERE SABOR = 'Manga';COPIAR CÓDIGO
--38) Para mostrar produtos divididos por faixa de preços aplicando CASE WHEN

    SELECT NOME_DO_PRODUTO, PRECO_DE_LISTA,
    (CASE WHEN PRECO_DE_LISTA >= 12 THEN 'PRODUTO CARO'
          WHEN PRECO_DE_LISTA >= 7 AND PRECO_DE_LISTA < 12 THEN 'PRODUTO EM CONTA'
          ELSE 'PRODUTO BARATO' END) AS CLASSIFICACAO
    FROM TABELA_DE_PRODUTOS
    WHERE SABOR = 'Manga'
    ORDER BY CLASSIFICACAO;COPIAR CÓDIGO
--39) Tirando o sabor para mostrar todos os produtos

    SELECT NOME_DO_PRODUTO, PRECO_DE_LISTA,
    (CASE WHEN PRECO_DE_LISTA >= 12 THEN 'PRODUTO CARO'
          WHEN PRECO_DE_LISTA >= 7 AND PRECO_DE_LISTA < 12 THEN 'PRODUTO EM CONTA'
          ELSE 'PRODUTO BARATO' END) AS CLASSIFICACAO
    FROM TABELA_DE_PRODUTOS
    ORDER BY CLASSIFICACAO;COPIAR CÓDIGO
--40) Mostrando a quantidade de produtos classificados por faixa. Mas usando desta maneira apresenta erro pois o GROUP BY não aceita Alias

    SELECT 
    (CASE WHEN PRECO_DE_LISTA >= 12 THEN 'PRODUTO CARO'
          WHEN PRECO_DE_LISTA >= 7 AND PRECO_DE_LISTA < 12 THEN 'PRODUTO EM CONTA'
          ELSE 'PRODUTO BARATO' END) AS CLASSIFICACAO, COUNT(*) AS NUMERO_DE_PRODUTOS
    FROM TABELA_DE_PRODUTOS
    GROUP BY CLASSIFICACAO;COPIAR CÓDIGO
--41) Repetindo a classificação

    SELECT 
    (CASE WHEN PRECO_DE_LISTA >= 12 THEN 'PRODUTO CARO'
          WHEN PRECO_DE_LISTA >= 7 AND PRECO_DE_LISTA < 12 THEN 'PRODUTO EM CONTA'
          ELSE 'PRODUTO BARATO' END) AS CLASSIFICACAO, COUNT(*) AS NUMERO_DE_PRODUTOS
    FROM TABELA_DE_PRODUTOS
    GROUP BY (CASE WHEN PRECO_DE_LISTA >= 12 THEN 'PRODUTO CARO'
          WHEN PRECO_DE_LISTA >= 7 AND PRECO_DE_LISTA < 12 THEN 'PRODUTO EM CONTA'
          ELSE 'PRODUTO BARATO' END);