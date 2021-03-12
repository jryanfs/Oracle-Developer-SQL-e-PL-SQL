SET SERVEROUTPUT ON
DECLARE
-- Declara��o de tipo registro
TYPE TFuncionario IS RECORD(
viDFunc HR.EMPLOYEES.EMPLOYEE_ID%type,
vNome HR.EMPLOYEES.FIRST_NAME%type,
VSalario HR.EMPLOYEES.SALARY%type);
-- Declara��o de vari�veis
VFunc TFuncionario;
-- Declara��o de cursores
CURSOR cs_func is
 SELECT a.EMPLOYEE_ID,a.FIRST_NAME,a.SALARY
FROM HR.EMPLOYEES a
order by a.salary desc;
BEGIN
-- Abre cursor se ainda n�o estiver aberto
IF NOT cs_func%ISOPEN THEN
OPEN cs_func;
END IF;
-- Executa um loop 
LOOP
-- Extrai dados o registro corrente do cursor e avan�a para o pr�ximo
FETCH cs_func INTO VFunc;
-- Sai do Loop quando n�o houver mais registros para processar
EXIT WHEN cs_func%NOTFOUND;
-- Imprime dados extra�dos na tela
dbms_output.put_line(VFunc.viDFunc||' - '||VFunc.vNome||' - '||VFunc.VSalario);
END LOOP;
-- Fechar cursor
CLOSE cs_func;
END;
/