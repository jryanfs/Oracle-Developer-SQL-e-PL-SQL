SET SERVEROUTPUT ON
DECLARE
-- Declaração de variáveis
viDFunc HR.EMPLOYEES.EMPLOYEE_ID%type;
vNome HR.EMPLOYEES.FIRST_NAME%type;
VSalario HR.EMPLOYEES.SALARY%type;
v_posicao int default 0;
-- Declaração de cursores
CURSOR cs_salario is
 SELECT a.EMPLOYEE_ID,a.FIRST_NAME,a.SALARY
FROM HR.EMPLOYEES a
order by a.salary desc;
BEGIN
-- Abre cursor se ainda não estiver aberto
IF NOT cs_salario%ISOPEN THEN
OPEN cs_salario;
END IF;
-- Executa um loop 
LOOP
-- Extrai dados o registro corrente do cursor e avança para o próximo
FETCH cs_salario INTO  viDFunc,vNome,VSalario;

-- Sai do Loop quando não houver mais registros para processar
EXIT WHEN cs_salario%NOTFOUND;
-- Imprime dados extraídos na tela
v_posicao:=v_posicao+1;
dbms_output.put_line(v_posicao||' - '||viDFunc||' - '||vNome||' - '||VSalario);
END LOOP;
-- Fechar cursor
CLOSE cs_salario;
END;