-- criando uma procedure para retornar informações

CREATE OR REPLACE PROCEDURE PROC_INF_DEPTO
IS
  CURSOR FUN_CURSOR
  IS
    SELECT a.DEPARTMENT_ID,b.DEPARTMENT_NAME,SUM(salary)SALARIO FROM HR.EMPLOYEES a
    inner join HR.DEPARTMENTS b 
        on a.department_id=b.department_id
    group by a.DEPARTMENT_ID,b.DEPARTMENT_NAME;
    
    FUN_REC FUN_CURSOR%rowtype;
BEGIN
  FOR FUN_REC IN FUN_CURSOR
  LOOP
    dbms_output.put_line('Codigo Depto: ' || FUN_REC.DEPARTMENT_ID || 
     '. Nome Depto: ' ||FUN_REC.DEPARTMENT_NAME || '. Total Salário do Depto: ' ||FUN_REC.salario);
  END LOOP;
  exception
  when others then
  dbms_output.put_line('Erro: '||sqlerrm);
END;
/

--EXECUTANDO
EXECUTE PROC_INF_DEPTO;