-- /#######################################VIEWS#############################################
CREATE VIEW vw_cargos_funcionarios
AS SELECT f.id, f.nome AS funcionario, lf.cargo_atual, lf.data_alteracao AS log_funcionario
FROM funcionario f LEFT JOIN log_funcionario lf ON f.id = lf.id_funcionario;

SELECT * FROM vw_cargos_funcionarios;

-- /##############################################################################################

CREATE VIEW vw_cargos_anteriores_funcionarios
AS SELECT f.id, f.nome AS funcionario, lf.cargo_anterior, lf.data_alteracao AS log_funcionario
FROM funcionario f LEFT JOIN log_funcionario lf ON f.id = lf.id_funcionario;

SELECT * FROM vw_cargos_anteriores_funcionarios;

-- /##############################################################################################

CREATE VIEW vw_produtos_estoque
AS SELECT p.nome, p.marca AS produto, e.quantidade AS quantidade
FROM produto p LEFT JOIN estoque e ON p.id = e.id_produto;

SELECT * FROM vw_produtos_estoque;

-- /##############################################################################################

CREATE VIEW vw_historico_vendas
AS SELECT p.nome, p.marca AS produto, v.valor, v.quantidade AS venda
FROM produto p LEFT JOIN venda v ON p.id = v.id_produto;

SELECT * FROM vw_historico_vendas;

-- /##############################################################################################

CREATE VIEW vw_poder_funcionarios
AS SELECT f.nome, f.nivel_acesso AS funcionario, lf.cargo_atual AS log_funcionario
FROM funcionario f RIGHT JOIN log_funcionario lf ON f.id = lf.id_funcionario;

SELECT * FROM vw_poder_funcionarios;