--CURSOR IMPLICITO ORACLE
BEGIN
-- Inicia o loop no conjunto ativo do cursor
FOR vFunc in (SELECT a.EMPLOYEE_ID,a.FIRST_NAME,a.SALARY
FROM HR.EMPLOYEES a
order by a.salary desc)
LOOP
-- Imprime dados extraídos na tela
dbms_output.put_line(VFunc.EMPLOYEE_ID||' - '||VFunc.FIRST_NAME||' - '||VFunc.SALARY);
END LOOP;
END;
/