-- criando de teste

-- criando tabela de teste
create table cadastro
(
 nome varchar2(50) not null,
 docto varchar2(20) not null
 );
	

-- INSERE REGISTROS
INSERT INTO cadastro VALUES ('Andre','12341244');
INSERT INTO cadastro VALUES ('Joao','12341248');
INSERT INTO cadastro VALUES ('Pedro','12341246');

--VERIFICANDO REGISTROS
SELECT * FROM cadastro;
-- RETORNA O TABELA PARA ESTADO ANTERIOR DO BEGIN TRANSACTION
-- ROLLBACK;
ROLLBACK;
-- EFETIVA AS INFORMACOES NA TABELAS DO BANCO DE DADOS
 
COMMIT;

--DELETE FROM cadastro
-- SELECT * FROM CADASTRO
