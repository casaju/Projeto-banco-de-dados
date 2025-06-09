/* Criação de usuário e permissões */

CREATE USER adm PASSWORD '@Senhaadm';

CREATE USER cdstcliente PASSWORD '@Senhacli';

CREATE USER cdstpeca PASSWORD '@Senhapeca'

/* Permissão para o user cdstcliente */
GRANT INSERT ON clientes,veiculos TO cdstcliente;
GRANT UPDATE ON clientes,veiculos TO cdstcliente;

/* Permissão para o user cdstpeca */
GRANT INSERT ON empresas_pecas,pecas TO cdstpeca;
GRANT UPDATE ON empresas_pecas,pecas TO cdstpeca;








