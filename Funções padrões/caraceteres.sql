-- Exemplos com ASCII
select ascii('ab')teste from SYS.DUAL
union all
select ascii('a') from SYS.DUAL
union all
select ascii('b') from SYS.DUAL;


-- Exemplos com LOWER( )
select a.DEPARTMENT_NAME nome_depto,
      LOWER(a.DEPARTMENT_NAME)nome_depto_l, 
      LOWER('Curso SQL')
from HR.DEPARTMENTS a;

-- Exemplos com UPPER( )
select a.DEPARTMENT_NAME nome_depto,  
       UPPER(a.DEPARTMENT_NAME)nome_depto_U, 
       UPPER('Curso SQL')
from HR.DEPARTMENTS a;

-- Exemplos com INITCAP( )
select a.DEPARTMENT_NAME nome_depto, 
         INITCAP(UPPER(a.DEPARTMENT_NAME))nome_depto_i, 
         INITCAP('curso SQL')
from HR.DEPARTMENTS a;

-- Exemplos com CONCAT( )

select a.FIRST_NAME,
       a.LAST_NAME,
       concat(a.FIRST_NAME,a.LAST_NAME) nome_completo
from HR.EMPLOYEES a;

--outra opcao concatenar
select a.FIRST_NAME,
       a.LAST_NAME,
       a.FIRST_NAME||' '||a.LAST_NAME as nome_completo,
       a.FIRST_NAME||' '||a.LAST_NAME||' '||a.salary as texto
from HR.EMPLOYEES a;


-- Exemplos com LPAD( )

select a.EMPLOYEE_ID,
       LPAD(a.EMPLOYEE_ID,10,'0')ID_LPAD,
       a.FIRST_NAME
from HR.EMPLOYEES a;


-- Exemplos com RPAD( )

select a.EMPLOYEE_ID,
       RPAD(a.EMPLOYEE_ID,10,'0')ID_LPAD,
       a.FIRST_NAME
from HR.EMPLOYEES a;
-- Exemplos com SUBSTR( )

select SUBSTR('ORACLE',2,4) FROM SYS.DUAL;

select a.FIRST_NAME,
       a.LAST_NAME,
       SUBSTR(a.FIRST_NAME,1,1)INI_1,
       SUBSTR(a.LAST_NAME,1,1)INI2,
       CONCAT(SUBSTR(a.FIRST_NAME,1,1),SUBSTR(a.LAST_NAME,1,1)) texto3
from HR.EMPLOYEES a;
--outro exemplo

select a.FIRST_NAME,
    SUBSTR(a.FIRST_NAME,1,3)PARTE1,
    SUBSTR(a.FIRST_NAME,4,10)PARTE2
from HR.EMPLOYEES a;

-- Exemplos com INSTR( )

SELECT a.JOB_TITLE,INSTR(a.JOB_TITLE,'r') posicao FROM HR.JOBS a;

SELECT a.JOB_TITLE,INSTR(a.JOB_TITLE,'es') posicao FROM HR.JOBS a;

SELECT a.JOB_TITLE,INSTR(a.JOB_TITLE,'re') posicao FROM HR.JOBS a;

SELECT a.JOB_TITLE,INSTR(a.JOB_TITLE,'t',12) posicao FROM HR.JOBS a;

-- Exemplos com LTRIM( )
SELECT a.JOB_TITLE,
       LTRIM(a.JOB_TITLE,'A') posicao FROM HR.JOBS a;

SELECT a.JOB_TITLE,LTRIM(a.JOB_TITLE,'AFPS') posicao FROM HR.JOBS a;

--exemplo ltrim
select   '       Andre' com_espaco,
         LTRIM('        Andre',' ') sem_espaco 
from dual;

--exemplo ltrim

select concat('    Andre',LTRIM('        Andre',' ')) sem_espaco from dual;


-- Exemplos com RTRIM( )
SELECT a.JOB_TITLE,RTRIM(a.JOB_TITLE,'tre') posicao FROM HR.JOBS a;
--exemplo
select 'Andre     ' com_espaco,'Andre'  sem_espaco from dual;

select concat(' Andre       ','Andre') espaco from dual;

select concat(RTRIM(' Andre       '),'Andre') sem_espaco from dual;

-- Exemplos com LENGTH( )
SELECT a.JOB_TITLE,
       LENGTH(a.JOB_TITLE) tamanho FROM HR.JOBS a;

-- Exemplos com TRANSLATE( )
SELECT a.JOB_TITLE,
      TRANSLATE(a.JOB_TITLE,'S','X') traducao 
FROM HR.JOBS a;

SELECT a.JOB_TITLE,TRANSLATE(a.JOB_TITLE,'PAF','XYZ') traducao FROM HR.JOBS a;

-- Exemplos com REPLACE( )
SELECT a.JOB_TITLE,
       REPLACE(a.JOB_TITLE,'Manager','Gerente') 
       traducao FROM HR.JOBS a;

-- Exemplos com DECODE( ) - Funções de conversão 

SELECT a.JOB_TITLE  FROM HR.JOBS a;

SELECT a.JOB_TITLE,
       decode(JOB_TITLE,
                            'President','Presidente',
                            'Administration Vice President','Vice Presiente ADM',
                            'Administration Assistant','Assist Adm',
                            'Finance Manager','Gerente Financ',
                            'Accountant','Contador',
                            'Accounting Manager','Gerente de contas',
                            'Public Accountant','Contas Publicas',
                            'Sales Manager','Gerente de vendas',
                            'Sales Representative','Repres. Vendas',
                            'Purchasing Manager','Gerente de compras',
                            'Purchasing Clerk','Aux Compras',
                            'Stock Manager','Gerente de estoque',
                            'Stock Clerk','Aux Estoque',
                            'Shipping Clerk','Aux de carregamento',
                            'Programmer','Programador',
                            'Marketing Manager','Gerente de MKT',
                            'Marketing Representative','Repres de Marketing',
                            'Human Resources Representative','Repres RH',
                            'Public Relations Representative','Relacoes Publicas') decodif
FROM HR.JOBS a;

-- Exemplos com REVERSE( ) - Funções de conversão 

SELECT a.JOB_TITLE,
       reverse(a.JOB_TITLE) revertido
FROM HR.JOBS a;

--outras funções
select (a.FIRST_NAME)nome,
        DUMP(a.FIRST_NAME)dump_nome,
        VSIZE(a.FIRST_NAME)size_nome 
        from hr.employees a;


