/* Seleciona os clientes e seus veiculo*/
SELECT cl.id_cliente,nome, tipo_veiculo, modelo
FROM clientes cl
	JOIN veiculos v 
	ON cl.id_cliente= v.id_cliente;

/*Mostra a qual setor cada funcionari9o trabalha*/
SELECT id_funcionario,nome_funcionario, salario, f.id_setor
FROM funcionarios f
	 LEFT JOIN setores s 
	ON f.id_setor=s.id_setor


/*Mostra quais as empresas que fornecem peças a  mecanica*/
SELECT e.cnpj,e.nome_empresa, c.id_mecanica
FROM fornecem f, contratam c
	FULL JOIN empresas_pecas e
	ON c.cnpj = e.cnpj
WHERE c.id_mecanica=01;


/*Mostra quais peças são fornecidas por quais empresas*/
SELECT p.id_peca,p.tipo,p.marca,p.valor,f.cnpj
FROM fornecem f
	 FULL JOIN pecas p
	ON f.id_peca = p.id_peca;


/*Mostra quais clientes moram em quais cidadades e quais tipos de veiculos elas possuem*/
SELECT m.id_mecanica,c.cidade,c.tipo_cliente,v.tipo_veiculo
FROM veiculos v, atendem a
	NATURAL JOIN mecanicas m 
	 FULL JOIN clientes c 
	ON a.id_cliente=c.id_cliente
WHERE v.id_cliente=c.id_cliente;
