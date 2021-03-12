-- sem paramentros
CREATE OR REPLACE FUNCTION FnNome
   RETURN varchar IS
   v_nome varchar(20);
BEGIN
   SELECT a.FIRST_NAME
   INTO   v_nome
   FROM   hr.EMPLOYEES a WHERE a.EMPLOYEE_ID=100;

   RETURN v_nome;
END;
/

select FnNome from DUAL;

--com paramentros

CREATE OR REPLACE FUNCTION FnNome2(p_id in number)
   RETURN varchar IS
   v_nome varchar(20);
BEGIN
   SELECT a.FIRST_NAME
   INTO   v_nome
   FROM   hr.EMPLOYEES a WHERE a.EMPLOYEE_ID=p_id;

   RETURN v_nome;
END;
/

select FnNome2(103) from DUAL;


--function simula aumento

CREATE OR REPLACE FUNCTION FnAumento(p_pct in number,p_id_func in number)
   RETURN number IS
   v_Sal_novo number(20);
BEGIN
   SELECT ((a.SALARY/100)*p_pct)+a.SALARY
   INTO   v_Sal_novo
   FROM   hr.EMPLOYEES a where a.EMPLOYEE_ID=p_id_func;

   RETURN v_Sal_novo;
END;
/

--EXEC DA FUNÇÃO.
select a.FIRST_NAME,
       a.SALARY as sal_antigo, 
       FnAumento(10,a.EMPLOYEE_ID) as sal_novo
from  hr.EMPLOYEES a;
