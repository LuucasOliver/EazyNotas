-- /#######################################FUNCTIONS#############################################
DELIMITER $$
CREATE FUNCTION maior_preco_produto(
)
RETURNS FLOAT
DETERMINISTIC

BEGIN

DECLARE maior_preco FLOAT; 
SET @maior_preco = (SELECT MAX(preco_venda) FROM produto);

RETURN(@maior_preco);
END $$
DELIMITER ;

SELECT * FROM produto;
SELECT maior_preco_produto();

-- /##############################################################################################

DELIMITER $$
CREATE FUNCTION menor_preco_produto(
)
RETURNS FLOAT
DETERMINISTIC

BEGIN

DECLARE menor_preco FLOAT; 
SET @menor_preco = (SELECT MIN(preco_venda) FROM produto);

RETURN(@menor_preco);
END $$
DELIMITER ;

SELECT * FROM produto;
SELECT menor_preco_produto();

-- /##############################################################################################

DELIMITER $$
CREATE FUNCTION id_novo_produto(
)
RETURNS FLOAT
DETERMINISTIC

BEGIN
DECLARE novo_produto FLOAT;
SET @novo_produto = (SELECT id FROM produto ORDER BY id DESC LIMIT 1);

RETURN(@novo_produto);
END $$
DELIMITER ;

SELECT * FROM produto;
SELECT id_novo_produto();