SET SERVEROUTPUT ON
DECLARE
-- Declara��o de vari�veis
viDFunc HR.EMPLOYEES.EMPLOYEE_ID%type;
vNome HR.EMPLOYEES.FIRST_NAME%type;
VSalario HR.EMPLOYEES.SALARY%type;
-- Declara��o de cursores
CURSOR cs_top_10 is
 SELECT a.EMPLOYEE_ID,a.FIRST_NAME,a.SALARY
FROM HR.EMPLOYEES a
order by a.salary desc;
BEGIN
-- Abre cursor se ainda n�o estiver aberto
IF NOT cs_top_10%ISOPEN THEN
OPEN cs_top_10;
END IF;
-- Executa um loop com 10 ciclos
FOR i IN 1..10 LOOP
-- Extrai dados o registro corrente do cursor e avan�a para o pr�ximo
FETCH cs_top_10 INTO  viDFunc,vNome,VSalario;
-- Imprime dados extra�dos na tela
dbms_output.put_line(i||'-'||viDFunc||' - '||vNome||' - '||VSalario);
END LOOP;
-- Fechar cursor
CLOSE cs_top_10;
END;
/