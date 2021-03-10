--usando cast
select cast(1932.450 as integer) conversao from dual;

select cast(1932.650 as integer) conversao from dual;



select cast(a.EMPLOYEE_ID as integer) teste
from HR.EMPLOYEES a;

select cast(a.EMPLOYEE_ID as varchar2(3)) teste
from HR.EMPLOYEES a;

--   A função TO_DATE() converte de cadeia de caracteres em data. À data resultante adicionamos um dia;
--  A data obtida pelo comando anterior é apresentada usando o formato definido pelo comando ALTER SESSION SET NLS_DATE_FORMAT;


--TO_DATE(string, máscara de data)
--alterar sessao
--verificar antes de alterar sessao
ALTER SESSION SET NLS_DATE_FORMAT='yyyy-mm-dd hh24:mi:ss';

ALTER SESSION SET NLS_DATE_FORMAT='yy-mm-dd hh24:mi:ss';


select
   a.hire_date,
   to_date(a.hire_date,'yyyy-mm-dd hh24:mi:ss')aaaammdd
from HR.EMPLOYEES a;

--
-- TO_CHAR(data)
--TO_CHAR(data, máscara_data, [nls_date_format] )

alter session set nls_territory='PORTUGAL';-- BRAZIL
alter session set nls_language='PORTUGUESE';
alter session set nls_date_format='yyyy-mm-dd hh24:mi:ss';
select
  a.first_name,
  a.hire_date,
   to_char(a.hire_date,'day, dd "de" Month "de" YYYY')Data_entenso
from HR.EMPLOYEES a;


SELECT  to_char(SYSDATE,'day, dd "de" Month "de" YYYY')Data_entenso FROM DUAL
--to_char

alter session set nls_territory='PORTUGAL'; --BRAZIL
alter session set nls_language='PORTUGUESE';
alter session set nls_date_format='yyyy-mm-dd hh24:mi:ss';


select 
  to_char(to_date('2018-07-17 14:15:45','yyyy-mm-dd hh24:mi:ss'), 'hh:mi:ss') "Hora Minutos Segundos",
  to_char(to_date('2018-07-17 14:15:45','yyyy-mm-dd hh24:mi:ss'), 'scc'     ) "Século",
  to_char(to_date('2018-07-17 14:15:45','yyyy-mm-dd hh24:mi:ss'), 'q'       ) "Trimestre",
  to_char(to_date('2018-07-17 14:15:45','yyyy-mm-dd hh24:mi:ss'), 'HH24'    ) "Hora em formato 24",
  to_char(to_date('2018-07-17 14:15:45','yyyy-mm-dd hh24:mi:ss'), 'HH'      ) "Hora formato 12"
from dual;
  
--TO_CHAR(número)

select 
  a.first_name,
  a.hire_date,
  to_char(a.SALARY,'$9999999')salario1,
  to_char(a.SALARY,'$999')salario2,
  '$'||a.SALARY valor
from HR.EMPLOYEES a;

--TO_NUMBER(string)

select to_number('5')+7 v
from dual;



select to_char(sysdate,'ddmmyyyyhh24miss') from dual;



--NVL( )

select 
  a.first_name,
  a.hire_date,
  a.COMMISSION_PCT,
   nvl(a.COMMISSION_PCT,0) c1
from HR.EMPLOYEES a;






