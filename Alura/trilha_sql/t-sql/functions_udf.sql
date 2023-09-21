CREATE FUNCTION CalculaDesconto (@CODIGO_PRODUTO VARCHAR(10), @DescontoPercentual INT)
RETURNS FLOAT
AS
BEGIN
   DECLARE @Desconto FLOAT
   DECLARE @PrecoComDesconto FLOAT
   DECLARE @Preco FLOAT
   SELECT @Preco = [PREÇO DE LISTA] FROM [TABELA DE PRODUTOS] WHERE [CODIGO DO PRODUTO] = @CODIGO_PRODUTO
   SET @Desconto = (@Preco * @DescontoPercentual) / 100
   SET @PrecoComDesconto = @Preco - @Desconto
   RETURN @PrecoComDesconto
END


