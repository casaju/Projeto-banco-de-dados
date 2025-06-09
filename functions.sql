/* Função para declarar o valor do concerto do automovel */
CREATE OR REPLACE FUNCTION valor_concerto ( peca1 REAL, peca2 REAL, peca3 REAL, maodeobra REAL )
RETURNS REAL AS $$ 
DECLARE result REAL ;
BEGIN
	result := peca1+peca2+peca3+maodeobra ;
	RETURN result ;
END;
$$ LANGUAGE 'plpgsql';

SELECT * FROM valor_concerto(50.00,150.20,950.65,450.00);

CREATE TYPE dadofuncionarios AS(nome_funcionario VARCHAR(50),id_funcionario INTEGER, id_setor INTEGER);
/* Função para descobrir o setor e cargo do funcionario atraves do seu nome*/
CREATE OR REPLACE FUNCTION buscadefuncionario (nome VARCHAR)
RETURNS dadofuncionarios AS $$ 
DECLARE rdadofuncionarios dadofuncionarios ;
BEGIN
	SELECT nome_funcionario,id_funcionario,id_setor INTO STRICT rdadofuncionarios FROM funcionarios
		WHERE nome=nome_funcionario;
	RETURN rdadofuncionarios ;
EXCEPTION
	WHEN NO_DATA_FOUND THEN
	RAISE EXCEPTION 'funcionario % não encontrado', nome ;
	WHEN TOO_MANY_ROWS THEN
	RAISE EXCEPTION 'funcionario % não único', nome ;
END;
$$ LANGUAGE 'plpgsql';


SELECT * FROM buscadefuncionario('Ana Beatriz');






