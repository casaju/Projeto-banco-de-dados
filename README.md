# Projeto-banco-de-dados
Projeto desenvolvido para a disciplina de banco de dados 2, utilizando PostgreSQL
Levantamento de requisitos:
Uma mecânica atende seus clientes, tanto pessoa física, quanto pessoa jurídica. A mecânica
precisa guardar as informações relacionadas aos seus clientes, como: nome, código do cliente,
telefone e endereço. Relacionado a pessoa jurídica precisa-se armazenar o número de veículos
que a empresa possui.
A mecânica atende aos mais diversos tipos de veículos, portanto é necessário que se saiba, qual
o tipo de veículo, qual o modelo, o ano, a placa do veículo, a marca e data da próxima
manutenção, além do dono. Deve-se guardar as informações do reparo feito pelos veículo, como
a data, qual foi o reparo feito e o código do reparo.
Além disso, a mecânica também trabalha com as empresas que lhe fornecem peças, são várias
empresas e cada uma delas trabalha com um tipo de peça ou uma marca em específico. Sobre
as empresas de peças é necessário armazenar as informações do nome da empresa, o CNPJ e o
telefone, o banco de dados também deve guardar as informações sobre as peças que a empresa
fornece, como o código da peça, qual a sua marca, o valor e qual é o tipo de peça.
Os funcionários da mecânica são divididos em setores, cada setor é responsável por um tipo de
veículo, ex: carros, motos, caminhões ... , e possui um gerente, que coordena a equipe. Sobre os
funcionários deve-se saber o telefone, o código do funcionário, o nome, cpf, a data de
nascimento, quando ele começou a trabalhar na empresa, o seu salário, seu sexo e o email.
Sobre os setores deve-se saber qual é o código do setor, quais funcionários trabalham nele, o
tipo de veículo que o setor atende, o telefone e qual é o gerente responsável.
Considerações extra:
- Um cliente pessoa física pode ter mais de um veículo, mas o veículo só pode pertencer a um
dono.
-Um funcionário trabalha em apenas um setor, e um setor trabalha com apenas um tipo de
veículo.

- Um setor possui apenas um gerente, e um gerente não pode ser responsável por mais de um
setor.
Contextualizar a aplicação alvo:
A aplicação do banco de dados para uma mecânica foi projetada para gerenciar as informações
relacionadas às operações diárias de uma oficina. O banco de dados armazena dados sobre
clientes, veículos, reparos, funcionários ,fornecedores de peças, peças e setores. Os principais
componentes do banco de dados da mecânicas:
● Clientes:
Armazenar informações sobre clientes, incluindo nome, endereço, número de telefone e
identificação .
Distinção entre clientes pessoa física e jurídica.
● Veículos:
Registrar detalhes sobre os veículos como placa, tipo (carro, moto, caminhão), modelo,
ano, marca e data de manutenção.
Relacionar veículos aos seus respectivos proprietários.
● Reparos:
Registrar detalhes sobre reparos realizados, incluindo a data, o tipo de reparo e a placa
do veículo.
● Funcionários:
Manter informações sobre os funcionários da oficina, como nome, CPF, data de
nascimento, data de contratação, salário, cargo, sexo, telefone, email,código.
● Setores:
Dividir os funcionários em setores responsáveis por tipos específicos de veículos (carros,
motos, caminhões...).
Cada setor é liderado por um único gerente.
● Fornecedores de Peças:
Registrar dados sobre as empresas fornecedoras de peças, incluindo nome, CNPJ e
telefone.

2

● Peças:
Manter informações de peças fornecidas por diferentes empresas, como marca, tipo,
valor.
