--2) Mostre os registros da tabela de clientes

SELECT * FROM TABELA_DE_CLIENTES;
--3) Para converter os nomes para caracteres minúsculos use a função LOWER

SELECT NOME, LOWER(NOME) AS NOME_MINUSCULO FROM TABELA_DE_CLIENTES;
--4) Pode usar função UPPER para usar somente caracteres maiúsculos

SELECT NOME, LOWER(NOME) AS NOME_MINUSCULO, UPPER(NOME) AS NOME_MAIUSCULO FROM TABELA_DE_CLIENTES;
--5) Usando a função CONCAT para concatenar os campos de endereço

SELECT NOME, CONCAT(ENDERECO_1, ' ', BAIRRO, ' ', CIDADE, ' ', ESTADO, ' - ', CEP) AS ENDERECO_COMPLETO
FROM TABELA_DE_CLIENTES;
--6) Pode usar o + para concatenar os campos de endereço

SELECT NOME , ENDERECO_1 +  ' ' + BAIRRO + ' ' + CIDADE + ' ' + ESTADO + ' - ' + CEP AS ENDERECO_COMPLETO
FROM TABELA_DE_CLIENTES;
--7) Mostre a tabela de produtos

SELECT * FROM TABELA_DE_PRODUTOS;
---8) Mostre os três primeiros caracteres do nome do produto com a função LEFT

SELECT NOME_DO_PRODUTO, LEFT(NOME_DO_PRODUTO,3) AS TRES_PRIMEIROS_CHAR FROM TABELA_DE_PRODUTOS
--9) Troque os textos Litro e Litros para L com a função REPLACE

SELECT TAMANHO, REPLACE((REPLACE(TAMANHO, 'Litros', 'L')),'Litro','L') AS TAMANHO_MODIFICADO FROM TABELA_DE_PRODUTOS;
--10) Em uma nova consulta vamos treinar funções de data

SELECT GETDATE()
--11) Mostre qual será o dia depois de dez dias a partir do dia de hoje

SELECT GETDATE() AS DATA_HOJE, DATEADD(DAY, 10, GETDATE()) AS DATA_DAQUI_10_DIAS
--12) Qual foi o dia quarenta e oito dias atrás?

SELECT GETDATE() AS DATA_HOJE, DATEADD(DAY, 10, GETDATE()) AS DATA_DAQUI_10_DIAS
, DATEADD(DAY, -48, GETDATE()) AS DATA_48_DIAS_ATRAS
--13) Quantos dias se passaram depois do primeiro dia do ano?

SELECT GETDATE() AS DATA_HOJE, DATEADD(DAY, 10, GETDATE()) AS DATA_DAQUI_10_DIAS
, DATEADD(DAY, -48, GETDATE()) AS DATA_48_DIAS_ATRAS, DATEDIFF (DAY, '2022-01-01', GETDATE()) AS DIAS_DESDE_INICIO_ANO
--14) Se eu quiser ver quantas horas desde o início do ano

SELECT GETDATE() AS DATA_HOJE, DATEADD(DAY, 10, GETDATE()) AS DATA_DAQUI_10_DIAS
, DATEADD(DAY, -48, GETDATE()) AS DATA_48_DIAS_ATRAS, DATEDIFF (HOUR, '2022-01-01', GETDATE()) AS DIAS_DESDE_INICIO_ANO
--15) Quantos meses desde o início do ano?

SELECT GETDATE() AS DATA_HOJE, DATEADD(DAY, 10, GETDATE()) AS DATA_DAQUI_10_DIAS
, DATEADD(DAY, -48, GETDATE()) AS DATA_48_DIAS_ATRAS, DATEDIFF (MONTH, '2022-01-01', GETDATE()) AS DIAS_DESDE_INICIO_ANO
--16) Outra maneira de mostrar o dia de hoje

SELECT GETDATE() DATA_HOJE, DATEPART(DAY, GETDATE()) AS DIA_DE_HOJE
--17) Testar se uma data é valida ou não

SELECT ISDATE('2020-02-29')

--18) Teste se a data é válida

SELECT ISDATE(DATETIMEFROMPARTS(2020,02,29,00,00,00,00))
--19) Crie mais uma janela de consulta para praticar as funções numéricas

--20) Use a função ROUND para arredondar um número

SELECT ROUND(3.437, 2),  ROUND(3.433, 2)
--21) Usando CEILING para dar o próximo número inteiro

SELECT ROUND(3.437, 2),  ROUND(3.433, 2), CEILING(3.433)
--22) O FLOOR mostra o número inteiro anterior

SELECT ROUND(3.437, 2),  ROUND(3.433, 2), CEILING(3.433), FLOOR(3.433)
--23) O POWER serve para elevar um número

SELECT ROUND(3.437, 2),  ROUND(3.433, 2), CEILING(3.433), FLOOR(3.433), POWER (12, 2)
--24) A função EXP é usada para retornar um valor que é e elevado à enésima potência, onde n é um número especificado.

SELECT ROUND(3.437, 2),  ROUND(3.433, 2), CEILING(3.433), FLOOR(3.433), POWER (12, 2), EXP(3)
--25) SQRT é a função que retorna a raiz quadrada de um número

SELECT ROUND(3.437, 2),  ROUND(3.433, 2), CEILING(3.433), FLOOR(3.433), POWER (12, 2), EXP(3),
SQRT(300)
--26) A função ABS é usada para retornar o valor absoluto de um número especificado

SELECT ROUND(3.437, 2),  ROUND(3.433, 2), CEILING(3.433), FLOOR(3.433), POWER (12, 2), EXP(3),
SQRT(300), ABS(10), ABS(-10)
--27) Crie uma nova janela de consulta

--28) Para converter data em texto usando o CONVERT

SELECT CONVERT(VARCHAR(10), GETDATE(), 121)
--29) Mostre a tabela de clientes

SELECT * FROM TABELA_DE_CLIENTES
--30) Converter DATA_DE_NASCIMENTO em texto.

SELECT DATA_DE_NASCIMENTO, CONVERT(VARCHAR(25), DATA_DE_NASCIMENTO, 121)
FROM TABELA_DE_CLIENTES;
--31) Para converter a data usando a máscara 106

SELECT DATA_DE_NASCIMENTO, CONVERT(VARCHAR(25), DATA_DE_NASCIMENTO, 106)
FROM TABELA_DE_CLIENTES;
--32) Mostre a seguinte seleção:

SELECT NOME_DO_PRODUTO, PRECO_DE_LISTA FROM TABELA_DE_PRODUTOS;

--33) Para escrever um texto junto ao conteúdo de um campo use o CONCAT

SELECT NOME_DO_PRODUTO, CONCAT('O preço de lista é: ', PRECO_DE_LISTA) as PRECO 
FROM TABELA_DE_PRODUTOS;