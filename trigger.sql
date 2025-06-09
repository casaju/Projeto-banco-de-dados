/* Atualiza uma tabela de log toda vez que acontece uma exclusão, alteração e inserção na tabela de funcionários*/

CREATE TABLE logf (id SERIAL PRIMARY KEY,date TIMESTAMP DEFAULT CURRENT_TIMESTAMP, table1 TEXT NOT NULL,dadoantigo TEXT DEFAULT '',dadonovo TEXT DEFAULT '');
CREATE OR REPLACE FUNCTION tabelaLOGfuncionario()
RETURNS trigger AS $$
DECLARE olddata TEXT; newdata TEXT; tabela TEXT;
BEGIN
	tabela := 'FUNCIONARIOS';
IF (TG_OP = 'UPDATE') THEN
		olddata := ROW(OLD.*);
		newdata := ROW(NEW.*);
		INSERT INTO logf (table1, dadonovo, dadoantigo) VALUES (tabela,olddata, newdata);
		RETURN NEW;
ELSEIF (TG_OP = 'DELETE') THEN
	olddata := ROW(OLD.*);
	INSERT INTO logf (table1, dadonovos, dadoantigo) VALUES (tabela, olddata, DEFAULT);
	RETURN OLD;
ELSEIF (TG_OP = 'INSERT') THEN
	newdata := ROW(NEW.*);
	INSERT INTO logf (table1,dadoantigo) VALUES (tabela, newdata);
	RETURN NEW;
	END IF;	
	RETURN NEW;
END;
$$ LANGUAGE 'plpgsql'

CREATE TRIGGER trigger_tabelaLOGfuncionario
BEFORE INSERT OR UPDATE OR DELETE ON funcionarios
FOR EACH ROW
EXECUTE FUNCTION tabelaLOGfuncionario();

UPDATE funcionarios 
SET cargo='Mecâncio de carros eletricos',salario=10500,id_setor=2
WHERE id_funcionario=2;


SELECT * FROM logf;

/* Cria um registro na tabela reparos toda vez que um veículo vai a manuntenção e atualiza a data da proxima manuntencao na tabela veiculos */
CREATE OR REPLACE FUNCTION atualizar_data_proxima_manutencao()
RETURNS TRIGGER AS $$ DECLARE newdata date;
BEGIN
	newdata = CURRENT_DATE + INTERVAL '6 months';
   UPDATE veiculos
   SET proxima_manutencao = newdata
   WHERE placa = NEW.placa;
   RETURN NEW;
END;
$$ LANGUAGE 'plpgsql';

CREATE OR REPLACE TRIGGER atualizacao_data_proxima_manutencao_trigger
AFTER INSERT OR UPDATE ON reparos
FOR EACH ROW
EXECUTE FUNCTION atualizar_data_proxima_manutencao();

INSERT INTO reparos (data, tipo_reparo,placa)
VALUES( DATE '2023-11-08',
		'Reparação na pintura',
		'RIO2A18'
);
SELECT * FROM veiculos;