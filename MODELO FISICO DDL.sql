CREATE DOMAIN dominio_varchar_50 AS VARCHAR(50);
CREATE DOMAIN dominio_varchar_13 AS VARCHAR(13);
CREATE DOMAIN dominio_varchar_11 AS VARCHAR(11);
CREATE DOMAIN dominio_varchar_14 AS VARCHAR(14);
CREATE DOMAIN dominio_integer AS INTEGER;
CREATE DOMAIN dominio_cep AS VARCHAR(8);
CREATE DOMAIN dominio_varchar_7 AS VARCHAR(7);
CREATE DOMAIN dominio_date AS DATE;

CREATE TABLE mecanicas (
	id_mecanica SERIAL,
	CONSTRAINT pk_mecanicas PRIMARY KEY
	(id_mecanica)
)

CREATE TABLE empresas_pecas (
    cnpj dominio_varchar_14 NOT NULL,
    nome_empresa dominio_varchar_50 NOT NULL,
    telefone_01 dominio_varchar_13 NOT NULL,
    telefone_02 dominio_varchar_13,
    telefone_03 dominio_varchar_13,
    CONSTRAINT pk_empresas_pecas PRIMARY KEY (cnpj)
);

CREATE TABLE pecas (
	id_peca SERIAL,
	tipo dominio_varchar_50 NOT NULL,
	marca dominio_varchar_50 NOT NULL,
	valor REAL NOT NULL,
CONSTRAINT pk_pecas PRIMARY KEY (id_peca)
);

CREATE TABLE setores (
    id_setor SERIAL,
    tipo_veiculo dominio_varchar_50 NOT NULL,
    telefone_setor dominio_varchar_13 NOT NULL,
    CONSTRAINT pk_setores PRIMARY KEY (id_setor)
);

CREATE TABLE clientes (
    id_cliente SERIAL,
    nome dominio_varchar_50 NOT NULL,
    telefone_01 dominio_varchar_13 NOT NULL,
    telefone_02 dominio_varchar_13,
    telefone_03 dominio_varchar_13,
    rua dominio_varchar_50 NOT NULL,
    bairro dominio_varchar_50 NOT NULL,
    numero dominio_integer NOT NULL,
    complemento dominio_varchar_50,
    cidade dominio_varchar_50 NOT NULL,
    estado dominio_varchar_50 NOT NULL,
    cep dominio_cep NOT NULL,
    numeros_veiculos dominio_integer NOT NULL,
    tipo_cliente dominio_varchar_50 NOT NULL,
    CONSTRAINT pk_clientes PRIMARY KEY (id_cliente)
);

CREATE TABLE veiculos (
    placa dominio_varchar_7 NOT NULL,
    tipo_veiculo dominio_varchar_50 NOT NULL,
    modelo dominio_varchar_50 NOT NULL,
    ano dominio_integer NOT NULL,
    marca dominio_varchar_50 NOT NULL,
    proxima_manutencao dominio_date NOT NULL,
    id_cliente SERIAL,
    CONSTRAINT pk_veiculos PRIMARY KEY (placa),
    CONSTRAINT fk_veiculos_clientes FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

CREATE TABLE funcionarios (
    id_funcionario SERIAL,
    nome_funcionario dominio_varchar_50 NOT NULL,
    cpf dominio_varchar_11 NOT NULL,
    telefone_01 dominio_varchar_13 NOT NULL,
    telefone_02 dominio_varchar_13,
    telefone_03 dominio_varchar_13,
    email dominio_varchar_50 NOT NULL,
    data_nascimento dominio_date NOT NULL,
    data_inicio_empresa dominio_date NOT NULL,
    sexo dominio_varchar_50 NOT NULL,
    salario REAL NOT NULL,
    cargo dominio_varchar_50 NOT NULL,
    id_mecanica dominio_integer NOT NULL,
    id_setor dominio_integer NOT NULL,
    CONSTRAINT pk_funcionarios PRIMARY KEY (id_funcionario),
    CONSTRAINT fk_funcionarios_mecanicas FOREIGN KEY (id_mecanica) REFERENCES mecanicas(id_mecanica),
    CONSTRAINT fk_funcionarios_setores FOREIGN KEY (id_setor) REFERENCES setores(id_setor)
);

CREATE TABLE contratam (
    id_mecanica SERIAL,
    cnpj dominio_varchar_14 NOT NULL,
    CONSTRAINT pk_contratam PRIMARY KEY (id_mecanica),
    CONSTRAINT fk_contratam_mecanicas FOREIGN KEY (id_mecanica) REFERENCES mecanicas(id_mecanica),
    CONSTRAINT fk_contratam_empresas_pecas FOREIGN KEY (cnpj) REFERENCES empresas_pecas(cnpj)
);


CREATE TABLE fornecem (
    cnpj dominio_varchar_14 NOT NULL,
    id_peca SERIAL,
    CONSTRAINT fk_fornecem_empresas_pecas FOREIGN KEY (cnpj) REFERENCES empresas_pecas(cnpj),
    CONSTRAINT fk_fornecem_pecas FOREIGN KEY (id_peca) REFERENCES pecas(id_peca),
    CONSTRAINT pk_fornecem PRIMARY KEY (cnpj)
);


CREATE TABLE atendem (
id_mecanica SERIAL,
id_cliente SERIAL,
CONSTRAINT pk_atendem PRIMARY KEY (id_mecanica),
CONSTRAINT fk_atendem_mecanicas FOREIGN KEY (id_mecanica) REFERENCES mecanicas,
CONSTRAINT fk_atendem_clientes FOREIGN KEY (id_cliente) REFERENCES clientes
);

CREATE TABLE reparos (
id SERIAL PRIMARY KEY, 
data dominio_date NOT NULL,
tipo_reparo dominio_varchar_50 NOT NULL,
placa dominio_varchar_7 NOT NULL,
CONSTRAINT fk_reparos_veiculos FOREIGN KEY (placa) REFERENCES veiculos(placa)
);

CREATE TABLE realizam(
placa dominio_varchar_7 NOT NULL,
id SERIAL,
CONSTRAINT fk_realizam_reparos FOREIGN KEY (id) REFERENCES reparos,
CONSTRAINT fk_realizam_veiculos FOREIGN KEY (placa) REFERENCES veiculos);