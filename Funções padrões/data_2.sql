-- SUBTRAINDO DIAS
ALTER SESSION SET nls_date_format = 'yyyy-mm-dd hh24:mi:ss';
--ALTER SESSION SET nls_date_format = 'dd-mm-yyyy hh24:mi:ss';




--ADICIONANDO DIAS 
SELECT SYSDATE+5 FROM DUAL;

--DIFERENCA ENTRE OS DIAS

SELECT TO_DATE(SYSDATE)-TO_DATE('2018-01-01') DIF_DIAS FROM DUAL;


--ADICIONANDO HORAS
ALTER SESSION SET nls_date_format = 'yyyy-mm-dd hh24:mi:ss';

SELECT SYSDATE, SYSDATE+5/24 DATA_HORA_ADD FROM DUAL

--ADICIONAR MESES


SELECT SYSDATE DATA_ATUAL, ADD_MONTHS(SYSDATE,2)ADD_MESES FROM DUAL;

--SUBTRAIR MESES
SELECT SYSDATE DATA_ATUAL, ADD_MONTHS(SYSDATE,-2)ADD_MESES FROM DUAL;

-- QTD DE MESES ENTRE DATAS

SELECT  first_name,a.hire_date,
         sysdate,
         trunc(months_between(sysdate,a.hire_date)) Meses
FROM HR.EMPLOYEES a;

--Ultimo dia mes


SELECT  sysdate hoje,last_day(sysdate)Ult_dia from dual;

SELECT  a.hire_date,last_day(a.hire_date)Ult_dia from  HR.EMPLOYEES a;

--next day
--cenario para descobrir um data que acontece toda segunda quinta de cada cada mes;
-- descobrindo data da proxima segunda feira
-- 1 – Domingo 2 – Segunda-Feira 3 – Terça-Feira 4 – Quarta-Feira 5 – Quinta-Feira 6 – Sexta-Feira 7 – Sábado.

select NEXT_DAY(TRUNC(SYSDATE), 2) from dual;

select NEXT_DAY(NEXT_DAY(TRUNC(SYSDATE), 2),2) from dual;

--

SELECT TRUNC((MONTHS_BETWEEN(SYSDATE, TO_DATE('05/11/1977','dd/mm/yyyy')))/12) AS idade FROM DUAL;

SELECT TRUNC((MONTHS_BETWEEN(SYSDATE, TO_DATE('05/11/1977','dd/mm/yyyy')))) AS idade_MESES FROM DUAL

--DIAS DE VIDA

SELECT SYSDATE-TO_DATE('05/11/1977','dd/mm/yyyy') FROM DUAL;

--DUAS DE VIDA
SELECT TRUNC(SYSDATE-TO_DATE('05/11/1977','dd/mm/yyyy')) DIAS FROM DUAL;
