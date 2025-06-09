/* Procedure para cadastrar novos clientes */
CREATE OR REPLACE PROCEDURE p_cadastrocliente (a_id_cliente INTEGER,a_nome VARCHAR(50),a_telefone_01 VARCHAR(13),a_rua VARCHAR(50),a_bairro VARCHAR(50),a_numero INTEGER,a_complemento VARCHAR(50),a_cidade VARCHAR(50),a_estado VARCHAR(50),a_cep VARCHAR(8),a_numeroa_veiculos INTEGER,a_tipo_cliente VARCHAR(50))
LANGUAGE plpgsql AS $$
BEGIN 
	INSERT INTO clientes(id_cliente,nome,telefone_01,rua,bairro,numero,complemento,cidade,estado,cep,numeros_veiculos,tipo_cliente)
	VALUES (a_id_cliente,a_nome,a_telefone_01,a_rua,a_bairro,a_numero,a_complemento,a_cidade,a_estado,a_cep,a_numeroa_veiculos,a_tipo_cliente);
END ;
$$;

CALL p_cadastrocliente(14,'Paco rabane','(41)996058785','Nereu Ramos','praia',54,'ap 502','Itapema','Santa Catarina','88220000',4,'Pessoa fisica')

SELECT * FROM clientes;

/* Procedure para atualizar o cargo do funcionario */
CREATE OR REPLACE PROCEDURE p_alterarcargo (a_cargo VARCHAR(40),a_id_funcionario INTEGER)
LANGUAGE plpgsql AS $$
BEGIN 
	UPDATE funcionarios
	SET cargo=a_cargo
WHERE funcionarios.id_funcionario=a_id_funcionario;
END;
$$;
CALL  p_alterarcargo('gerente',3)

SELECT * FROM funcionarios;

/* Cadastrar nova peças */
CREATE OR REPLACE PROCEDURE p_novapeca (p_id_peca INTEGER, p_tipo VARCHAR(40), p_marca VARCHAR(40), p_valor REAL)
LANGUAGE plpgsql AS $$
BEGIN 
	INSERT INTO pecas(id_peca,tipo,marca,valor)
	VALUES (p_id_peca,p_tipo, p_marca, p_valor );
END;
$$;
CALL  p_novapeca(78,'freio','fiat',1500);

SELECT * FROM pecas;

/* Atualizar valor da peça*/
CREATE OR REPLACE PROCEDURE p_alterarvalor(a_valor REAL ,a_id_peca INTEGER)
LANGUAGE plpgsql AS $$
BEGIN 
	UPDATE pecas
	SET valor=p_valor
WHERE pecas.id_peca=p_id_peca;
END;
$$;
SELECT * FROM pecas;
CALL p_alterarvalor(500,2);

/* Cadastrar novo veiculo */
CREATE OR REPLACE PROCEDURE p_novoveiculo (p_placa VARCHAR(7), p_tipo_veiculo VARCHAR(30),p_ano INTEGER, p_modelo VARCHAR(30), p_marca VARCHAR(20), p_id_cliente INTEGER, p_proxima_manuntencao DATE)
LANGUAGE plpgsql AS $$
BEGIN 
INSERT INTO veiculos(placa,tipo_veiculo,ano,modelo,marca,id_cliente,proxima_manutencao)
VALUES(p_placa, p_tipo_veiculo,p_ano, p_modelo, p_marca,p_id_cliente, p_proxima_manuntencao);
END;
$$;
SELECT * FROM veiculos;
CALL p_novoveiculo('ABC123X','Carro',2020,'FIAT500','FIAT',1,'10-05-2024');

/* procedure para agendar novo reparo */
CREATE OR REPLACE PROCEDURE agendar_reparo(
    a_data dominio_date,
    a_placa dominio_varchar_7,
    a_tipo_reparo dominio_varchar_50
)
LANGUAGE plpgsql AS $$
BEGIN
	IF NOT EXISTS (SELECT 1 FROM veiculos WHERE placa = a_placa) THEN
        RAISE EXCEPTION 'Placa % não encontrada na tabela veiculos.', a_placa;
    END IF;
    INSERT INTO reparos (data, placa, tipo_reparo)
    VALUES (a_data, a_placa, a_tipo_reparo);
END;
$$;
CALL agendar_reparo(DATE '2023-12-01','RIO2018','Trocar o motor');