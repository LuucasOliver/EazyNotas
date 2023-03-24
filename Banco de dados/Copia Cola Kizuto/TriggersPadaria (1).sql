DELIMITER $$
CREATE TRIGGER after_funcionarios_update -- /Trigger que é acionada a cada Update de Cargo na tabela funcionario/
    AFTER UPDATE ON funcionario
    FOR EACH ROW 
    BEGIN
    IF old.cargo <> new.cargo then
     INSERT INTO log_funcionario
        (id_funcionario, cargo_anterior, cargo_atual , data_alteracao)
        VALUES 
        (old.id, old.cargo, new.cargo, now());
        END IF;
    END $$
DELIMITER ;

SELECT * FROM funcionario;

UPDATE funcionario SET cargo = "Engenheiro" WHERE id = 1;

SELECT * FROM log_funcionario;

-- /######################################################################################################

DELIMITER $$
CREATE TRIGGER after_estoque_update -- /Trigger que é acionada a cada venda realizada./
    AFTER INSERT ON venda
    FOR EACH ROW 
    BEGIN
     UPDATE estoque SET estoque.quantidade = estoque.quantidade - new.quantidade WHERE estoque.id_produto = new.id_produto;
    END $$
DELIMITER ;

INSERT INTO estoque (id_produto, quantidade) VALUES (1, 100);
SELECT * FROM estoque;
SELECT * FROM produto;
INSERT INTO venda (id_produto, valor, quantidade) VALUES (1, 2.80, 20);

-- /######################################################################################################

DELIMITER $$
CREATE TRIGGER after_bit_ativo_update -- /Trigger que que valida se a quantidade é igual a zero./
    AFTER INSERT ON venda
    FOR EACH ROW 
    BEGIN
    IF new.quantidade <= 0 then
     UPDATE produto SET produto.bit_ativo = 0 WHERE produto.id = new.id_produto;
        END IF;
    END $$
DELIMITER ;

SELECT * FROM produto;