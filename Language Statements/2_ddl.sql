
-- DDL CRIANDO TABELA

CREATE TABLE funcionario   
(		 matricula INT not null primary key,      
	     nome      VARCHAR2(50) NOT NULL,      
		 sobrenome VARCHAR2(50) NOT NULL,      
		 endereco  VARCHAR2(50),      
		 cidade    VARCHAR2(50),      
		 pais      VARCHAR2(25),      
		 data_nasc DATE   --TIMESTAMP POSSIVEL TAMBEM 
		);

-- DDL SEQUENCIA FUNCIONARIO
CREATE SEQUENCE ID_FUNC2
 START WITH     1
 INCREMENT BY   1
 NOCACHE;
-- DDL CRIANDO TABELA COM CHAVE ESTRANGEIRA
CREATE TABLE salario   
(      
	matricula INT not null,      
	salario   DECIMAL(10,2) NOT NULL, 
    FOREIGN KEY(matricula) REFERENCES funcionario(matricula)
  );

-
-- DDL CRIACAO DE TABELA COM CHAVE PRIMARIA
CREATE TABLE audit_salario   
	(  
		transacao int not null,    
		matricula  INT NOT NULL,      
		data_trans TIMESTAMP NOT NULL,      
		sal_antigo DECIMAL(10,2),      
		sal_novo   DECIMAL(10,2), 
		Usuario    VARCHAR2(20)not null,
		primary key(transacao),
		FOREIGN KEY(matricula) REFERENCES funcionario(matricula) 
		);

-- DDL SEQUENCIA TRANSACACAO
CREATE SEQUENCE ID_TRAN
 START WITH     1
 INCREMENT BY   1
 NOCACHE;

-- DDL CRIACAO DE INDEX
 CREATE INDEX ix_func1   ON funcionario(data_nasc);
 

-- DDL CRIACAO DE INDEX
 CREATE INDEX ix_func2   ON funcionario(cidade,pais);


 -- Adicionando novo campo na tabela 
ALTER TABLE funcionario ADD genero CHAR(1);
 
-- SELECT * FROM funcionario

 -- Renomeando campo/colunas da tabela
 alter table funcionario RENAME COLUMN  genero TO sexo;
 -- Modifcando tipo de campo
 alter table funcionario MODIFY  sexo VARCHAR2(1);

 
 -- Renomeando  tabela
ALTER TABLE funcionario
RENAME TO  pessoa; 
 --  retornando situaacao anterior
ALTER TABLE pessoa
RENAME TO  funcionario; 
 

-- DDL PARA ADICIONAR COLUNA NA TAB SENSO 
  ALTER TABLE SENSO ADD ID INT;


-- DDL PARA REMOVER CAMPO ID DA TABELA SENSO 
ALTER TABLE SENSO 
DROP COLUMN ID;

-- SELECT * FROM SENSO;

-- Alterando tipo da coluna
ALTER TABLE funcionario MODIFY  endereco VARCHAR2(30);

  
-- Excluindo campo da coluna
ALTER TABLE funcionario DROP COLUMN sexo; 
 
 
-- DDL CRIACAO DE DATABASE
CREATE DATABASE TESTE;


-- Excluindo database
DROP DATABASE TESTE; 


-- Excluindo table
DROP TABLE SALARIO;


-- CRIACAO DE VIEW
CREATE VIEW v_funcionario
	AS
	SELECT * FROM FUNCIONARIOS


SELECT * FROM v_funcionario;

-- MODIFICANDO VIEW DE VIEW
-- ALTER VIEW
	create or replace VIEW v_funcionario
	AS 
	SELECT ID,NOME FROM FUNCIONARIOS;


-- 
-- Excluindo VIEW
DROP VIEW v_funcionario; 


-- Excluindo index
DROP index ix_func1;


-- CRIANDO INDEX
CREATE INDEX IX_FUNC1 ON FUNCIONARIOS (NOME)


-- CRIANDO PROCEDURvE procedure

CREATE OR REPLACE PROCEDURE proc_quadrado (v_mum1 number)
is
v_mum2 number;
BEGIN
	 v_mum2:= v_mum1 * v_mum1;
     DBMS_OUTPUT.put_line('Retorno: '||v_mum2);
END;



-- EXECUTANDO PROCEDURE
SET SERVEROUTPUT ON;
execute proc_quadrado (10);



-- EXCLUINDO PROCEDURE 
DROP PROCEDURE proc_quadrado; 


-- Excluindo Função exemplo
DROP function func_salario;


-- Excluindo Trigger
DROP trigger trig_func_salario;


-- DDL TRUNCATE
TRUNCATE TABLE SENSO;

-- DDL TRUNCATE VERIFICANDO REGISTROS

SELECT * FROM FUNCIONARIOS;


-- CRIANDO TABELA TEMPORARIA BK EM TABELA TEMPORARIA
CREATE GLOBAL  TEMPORARY TABLE TMP_FUNCIONARIOS
(
 ID INT,
 NOME VARCHAR2(50),
 SALARIO DECIMAL(10,2),
 SETOR VARCHAR2(30)
 );


-- FAZENDO BK NA TABELAS TEMPORARIA
INSERT INTO TMP_FUNCIONARIOS
SELECT * FROM FUNCIONARIOS;


-- VERIFACANDO BK NA TABELA TEMPORARIA
SELECT * FROM TMP_FUNCIONARIOS;


