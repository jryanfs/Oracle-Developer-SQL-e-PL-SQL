-- DDL  CRIACAO DA TABELA PARA EXERCICIOS


CREATE TABLE FUNCIONARIOS
(
 ID INT NOT NULL,
 NOME VARCHAR2(50) NOT NULL,
 SALARIO DECIMAL(10,2),
 SETOR VARCHAR2(30), 
 PRIMARY KEY (id)
);

CREATE SEQUENCE ID_FUNC
 START WITH     1
 INCREMENT BY   1
 NOCACHE;


-- DML SELECT
-- EXEMPLO SELECT
SELECT * FROM funcionarios;


-- EXEMPLO SELECT
SELECT id,nome,salario,setor AS depto
FROM funcionarios;


-- DML INSERT
INSERT INTO funcionarios (ID,nome,salario) VALUES (ID_FUNC.NEXTVAL,'Pedro',1000);
INSERT INTO funcionarios (ID,nome,salario) VALUES (ID_FUNC.NEXTVAL,'Cleiton',1080);
INSERT INTO funcionarios (ID,nome,salario,setor) VALUES (ID_FUNC.NEXTVAL,'Joao',1000,'');
INSERT INTO funcionarios (ID,nome,salario,setor) VALUES (ID_FUNC.NEXTVAL,'Alexandre',3000,'');
INSERT INTO funcionarios (ID,nome,salario,setor) VALUES (ID_FUNC.NEXTVAL,'Jose',2000,'');


-- simulando erro
INSERT INTO funcionarios (ID,nome,salario) VALUES (ID_FUNC.NEXT_VAL,'Pedro','asasaasas');


-- DML UPDATE
UPDATE funcionarios SET salario = 1500
WHERE id=1;


-- OU Aumento de 50% sobre Salário atual.
UPDATE funcionarios SET salario=salario*1.5
WHERE id='2';


-- exemplo update com mais de um campo
UPDATE funcionarios SET salario=salario*1.5,setor='TI'
WHERE id<>'1';


-- DML DELETE
DELETE
FROM funcionarios
WHERE id='1';


-- DML SELECT EVIDENCIA DA EXCLUSAO
SELECT *
FROM funcionarios;
-- WHERE id='1';