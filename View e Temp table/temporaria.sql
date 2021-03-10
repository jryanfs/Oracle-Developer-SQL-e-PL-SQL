-- Sequencia exemplo 1
--A cláusula indica que os dados devem ser excluídos no final da transação ou no final da sessão.
-- criando tabela temporaria
CREATE GLOBAL TEMPORARY TABLE minha_temp (
  id           NUMBER,
  nome  VARCHAR2(20)
)
ON COMMIT DELETE ROWS;

-- Inserindo, mas nao realizando commit, .
INSERT INTO minha_temp VALUES (1, 'Teste1');
INSERT INTO minha_temp VALUES (2, 'Teste2');
INSERT INTO minha_temp VALUES (3, 'Teste3');

-- analisando counteudo
SELECT COUNT(*) FROM minha_temp;
select * from minha_temp;

-- Commit and check contents.
COMMIT;

-- analisando counteudo
SELECT COUNT(*) FROM minha_temp;

-- sequencia exemplo 2
--A cláusula indica que as linhas devem persistir além do final da transação.
-- Eles serão removidos apenas no final da sessão.
CREATE GLOBAL TEMPORARY TABLE minha_temp (
  id           NUMBER,
  nome  VARCHAR2(20)
)
ON COMMIT PRESERVE ROWS;

-- Inserindo, realizando commit, .
INSERT INTO minha_temp VALUES (1, 'Teste1');
INSERT INTO minha_temp VALUES (2, 'Teste2');
INSERT INTO minha_temp VALUES (3, 'Teste3');
commit;
-- analisando counteudo
SELECT COUNT(*) FROM minha_temp;
-- desconecta
--reconecta

SELECT COUNT(*) FROM minha_temp;

--carregando uma tabela temp com dados de uma tabela normal
--criando tabela
CREATE global temporary TABLE empregados_temp
(
  EMPLOYEE_ID NUMBER(6, 0) NOT NULL 
, FIRST_NAME VARCHAR2(20 BYTE) 
, LAST_NAME VARCHAR2(25 BYTE) NOT NULL 
, COMMISSION_PCT NUMBER(2, 2) 
) ON COMMIT DELETE ROWS;

--inserindo registros na temp
insert into empregados_temp
select a.EMPLOYEE_ID,a.FIRST_NAME,a.LAST_NAME,a.COMMISSION_PCT
from HR.EMPLOYEES a;

--verificando dados antes do committ
select count(*) from empregados_temp;

commit;

--verificando dados apos do committ
select count(*) from empregados_temp;

drop table empregados_temp;
drop table minha_temp;
