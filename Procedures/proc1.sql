CREATE OR REPLACE
PROCEDURE PROC_DET_FUNC
IS
  CURSOR emp_cur
  IS
    SELECT first_name, last_name, salary FROM HR.EMPLOYEES;
    --RECEBENDO VALORES DO CURSOR
    emp_rec emp_cur%rowtype;
BEGIN
  FOR emp_rec IN emp_cur
  LOOP
    dbms_output.put_line('Nome do funcionario: ' || emp_rec.first_name);
    dbms_output.put_line('Sobrenome do funcionario: ' ||emp_rec.last_name);
    dbms_output.put_line('Salário do funcionario: ' ||emp_rec.salary);
    dbms_output.put_line('---------------------------------------------');
  END LOOP;
END;

--executando procedure
SET serveroutput on
begin
 PROC_DET_FUNC;
end;

--outra forma de execucao
EXECUTE PROC_DET_FUNC;

