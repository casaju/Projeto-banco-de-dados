INSERT INTO clientes(id_cliente,nome,telefone_01,rua,bairro,numero,complemento,cidade,estado,cep,numeros_veiculos,tipo_cliente)
VALUES (01,'julia' , '(41)996541785', 'flores', 'Centro', 101, 'Ap 505', 'Itapema', 'Santa Catarina', '883300', 2, 'Pessoa fisica');

INSERT INTO clientes(id_cliente,nome,telefone_01,telefone_02,rua,bairro,numero,cidade,estado,cep,numeros_veiculos,tipo_cliente)
VALUES (03, 'Arthur', '(47)998705231','(47)998605256', 'Rua B', 'centro',55,'Itapema','Santa Catarina','883300', 2, 'Pessoa fisica');

INSERT INTO clientes(id_cliente,nome,telefone_01,rua,bairro,numero,complemento,cidade,estado,cep,numeros_veiculos,tipo_cliente)
VALUES (05, 'Nanda', '(47)987123475', 'Rua 123', 'Praia Brava', '156', 'Ap 02', 'Itajai', 'Santa Catarina', '367973', 1, 'Pessoa fisica');

INSERT INTO clientes(id_cliente,nome,telefone_01,telefone_02,rua,bairro,numero,cidade,estado,cep,numeros_veiculos,tipo_cliente)
VALUES (02, 'Transportes SA', '(41)998955231','(41)99754656', 'Jardins', 'Agua verde',23, 'Curitiba', 'Parana','8822000','75','Pessoa jurídica');

INSERT INTO clientes(id_cliente,nome,telefone_01,rua,bairro,numero,cidade,estado,cep,numeros_veiculos,tipo_cliente)
VALUES (04,'Fabio' , '(41)996548756', 'flores', 'Centro', 25, 'Itapema', 'Santa Catarina', '883300', 1, 'Pessoa fisica');

INSERT INTO clientes(id_cliente,nome,telefone_01,rua,bairro,numero,cidade,estado,cep,numeros_veiculos,tipo_cliente)
VALUES (06,'Guinchos SP' , '(11)992351785', 'Brasil', 'Centro', 559,  'Itajai', 'Santa Catarina ', '889500', 12, 'Pessoa jurídica');

INSERT INTO veiculos (placa,tipo_veiculo,modelo,ano,marca,proxima_manutencao,id_cliente)
VALUES ('RIO2A18', 'carro', 'Mini Cooper', 2023,'Mini', '03/04/2024', 01);

INSERT INTO veiculos (placa,tipo_veiculo,modelo,ano,marca,proxima_manutencao,id_cliente)
VALUES ('MAR2A18', 'Moto', 'BMW R 18', 2021,'BMW', '05/07/2023', 02);
UPDATE veiculos SET id_cliente = 3
WHERE placa='MAR2A18';

INSERT INTO veiculos (placa,tipo_veiculo,modelo,ano,marca,proxima_manutencao,id_cliente)
VALUES ('SAM8S89', 'caminhão', 'R440', 2023,'Scania', '12/05/2024', 02);

INSERT INTO veiculos (placa,tipo_veiculo,modelo,ano,marca,proxima_manutencao,id_cliente)
VALUES ('MAN9R87', 'caminhão', 'VM 330', 2023,'volvo', '05/12/2024', 02);

INSERT INTO veiculos (placa,tipo_veiculo,modelo,ano,marca,proxima_manutencao,id_cliente)
VALUES ('SOL5T69', 'carro', 'Nivus', 2022,'Nissan', '06/07/2023', 04);

INSERT INTO mecanicas (id_mecanica)
VALUES (01);

INSERT INTO atendem (id_mecanica,id_cliente)
VALUES (01,01);

INSERT INTO empresas_pecas (cnpj, nome_empresa, telefone_01)
VALUES ('004460005887', 'Peças Carros', '(47)985762492');

INSERT INTO empresas_pecas (cnpj, nome_empresa, telefone_01, telefone_02)
VALUES ('001234005887', 'Peças Automotivas', '(47)985762859', '(47)325762859');

INSERT INTO empresas_pecas (cnpj, nome_empresa, telefone_01, telefone_02, telefone_03)
VALUES ('178960005887', 'Motor Premium', '(47)985762888','(47)333522888','(47)977762888');

INSERT INTO pecas (tipo,marca,valor)
VALUES ('Motor','Volvo',350.50);

INSERT INTO pecas (tipo,marca,valor)
VALUES ('Freio','Pegout',89.50);

INSERT INTO pecas (tipo,marca,valor)
VALUES ('Motor','Mini Cooper',350.50);

INSERT INTO pecas (tipo,marca,valor)
VALUES ('Ar condicionado','BMW',700.30);

INSERT INTO fornecem(cnpj,id_peca)
VALUES ('001234005887');

INSERT INTO fornecem(cnpj,id_peca)
VALUES ('004460005887');

INSERT INTO fornecem(cnpj,id_peca)
VALUES ('178960005887');


INSERT INTO contratam (cnpj,id_mecanica)
VALUES ('178960005887',01);

INSERT INTO setores (tipo_veiculo,telefone_setor)
VALUES('Motos','(47)999988333');

INSERT INTO setores (tipo_veiculo,telefone_setor)
VALUES('Caminhao','(47)999988555');

INSERT INTO setores (tipo_veiculo,telefone_setor)
VALUES('Onibus','(47)999988987');

INSERT INTO setores (tipo_veiculo,telefone_setor)
VALUES('Aviao','(47)999988557');

INSERT INTO setores (tipo_veiculo,telefone_setor)
VALUES('Carro','(47)912388987');

INSERT INTO funcionarios (nome_funcionario,cpf,telefone_01,email,data_nascimento,data_inicio_empresa,sexo,salario,cargo,id_mecanica,id_setor)
VALUES ('Ana Beatriz','03085525098','(47)888877495','ana@mecanica0.com','01/01/1989','05/07/2020','feminino','10000.00','Gerente',01,03);

INSERT INTO funcionarios (nome_funcionario,cpf,telefone_01,email,data_nascimento,data_inicio_empresa,sexo,salario,cargo,id_mecanica,id_setor)
VALUES ('Arthur Silva','0300000098','(47)975677495','arthur@mecanica0.com','01/05/1998','05/07/2020','feminino','5000.00','eletrica',01,03);
UPDATE funcionarios SET sexo = 'Masculino'
where id_funcionario=02

INSERT INTO funcionarios (nome_funcionario,cpf,telefone_01,email,data_nascimento,data_inicio_empresa,sexo,salario,cargo,id_mecanica,id_setor)
VALUES ('Laura Maria','05475525098','(47)881237495','laura@mecanica0.com','07/09/1995','03/12/2020','masculino','50000.00','montadora',01,04);

INSERT INTO funcionarios (nome_funcionario,cpf,telefone_01,email,data_nascimento,data_inicio_empresa,sexo,salario,cargo,id_mecanica,id_setor)
VALUES ('Morgana Rosa','03085123075','(47)988832595','morgana@mecanica0.com','05/05/2000','09/08/2018','feminino','10000.00','Gerente',01,01);

INSERT INTO funcionarios (nome_funcionario,cpf,telefone_01,email,data_nascimento,data_inicio_empresa,sexo,salario,cargo,id_mecanica,id_setor)
VALUES ('Sarah Flores','01245525098','(47)987654321','sarah@mecanica0.com','12/11/1989','05/08/2018','feminino','50000.00','eletrica',01,04);

INSERT INTO funcionarios (nome_funcionario,cpf,telefone_01,email,data_nascimento,data_inicio_empresa,sexo,salario,cargo,id_mecanica,id_setor)
VALUES ('Ana Beatriz','03082225098','(47)888877497','anal@mecanica0.com','01/10/1989','08/07/2021','feminino','1000.00','Auxiliar',01,04);

