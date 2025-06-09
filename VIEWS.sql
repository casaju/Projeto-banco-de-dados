/* View que visualiza a qual cada veiculo pertence a qual cliente*/
CREATE OR REPLACE VIEW Veiculo
	AS SELECT cl.id_cliente,nome, tipo_veiculo, modelo id_mecanica
FROM clientes cl
	JOIN veiculos v 
	ON cl.id_cliente= v.id_cliente;	
SELECT * FROM Veiculo;

/* View que visualiza cada funcionario em cada setor */
CREATE OR REPLACE VIEW funcionario_setor
	AS SELECT id_funcionario,nome_funcionario, salario, f.id_setor
FROM funcionarios f
	 LEFT JOIN setores s 
	ON f.id_setor=s.id_setor
WHERE salario>=10000;

SELECT * FROM funcionario_setor;

/* View que visualiza o nome da empresa que fornece as peças*/
CREATE OR REPLACE VIEW fornecedores
	AS SELECT e.cnpj,e.nome_empresa
FROM fornecem f, contratam c
	FULL JOIN empresas_pecas e
	ON c.cnpj = e.cnpj
WHERE c.id_mecanica=01;

SELECT * FROM fornecedores;

/* View que visualiza quais peças são fornecidas pelas empresas*/
	AS SELECT p.id_peca,p.tipo,p.marca,p.valor,f.cnpj
FROM fornecem f
	 FULL JOIN pecas p
	ON f.id_peca = p.id_peca;

SELECT * FROM pecas_fornecidas;

/* View que visualiza quais cidades a mecânica possue clientes*/
CREATE OR REPLACE VIEW cidades_atendidas
AS SELECT c.cidade,c.tipo_cliente,v.tipo_veiculo
FROM veiculos v, atendem a
	NATURAL JOIN mecanicas m 
	 FULL JOIN clientes c 
	ON a.id_cliente=c.id_cliente
WHERE v.id_cliente=c.id_cliente;

SELECT * FROM cidades_atendidas;

/* View que mostra os ultimo reparos feito por um veículo*/
CREATE VIEW ultimosReparos AS
SELECT r.*, v.modelo, v.ano, v.marca
FROM reparos r
	JOIN veiculos v ON r.placa = v.placa
	ORDER BY r.data DESC
	LIMIT 5;
	
SELECT * FROM ultimosreparos WHERE placa='RIO2A18';