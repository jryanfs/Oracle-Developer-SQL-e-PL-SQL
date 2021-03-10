    
--exemplo case
SELECT A.FIRST_NAME,A.SALARY,
CASE WHEN A.SALARY<5000 THEN 'Baixo'
     WHEN A.SALARY<10000 THEN 'Medio'
      WHEN A.SALARY<15000 THEN 'Medio Alto'
      ELSE   'Alto' END FAIXA 
FROM HR.EMPLOYEES A
ORDER BY A.SALARY DESC;

SELECT A.FIRST_NAME,A.SALARY,
CASE WHEN A.SALARY<5000  THEN 'Baixo'
     WHEN A.SALARY>=5000 AND A.SALARY<10000 THEN 'Medio'
     WHEN A.SALARY>=10000 AND A.SALARY<15000 THEN 'Medio Alto'
      ELSE   'Alto' END FAIXA 
FROM HR.EMPLOYEES A
ORDER BY A.SALARY DESC;

    
--exemplo case
SELECT A.FIRST_NAME,A.MANAGER_ID,
    CASE WHEN A.MANAGER_ID IS NULL THEN 'Gerente' 
        ELSE 'Subordinado' END HIERARQ
    FROM HR.EMPLOYEES A;


--
SELECT A.employee_id,
       A.FIRST_NAME Colaborador,
       A.MANAGER_ID,
       b.FIRST_NAME   
    FROM HR.EMPLOYEES A
    left JOIN HR.EMPLOYEES B
    on a.manager_id=b.employee_id
    order by a.employee_id;

    
--exemplo case   
SELECT A.FIRST_NAME,A.MANAGER_ID,
    CASE WHEN A.MANAGER_ID IS NOT NULL THEN 'Subordinado' ELSE 'Gerente' END HIERARQ
    FROM HR.EMPLOYEES A;
    
--exemplo case
select * from hr.LOCATIONS

SELECT UNIQUE COUNTRY_ID ID,
       CASE COUNTRY_ID
         WHEN 'AU' THEN 'Australia'
         WHEN 'BR' THEN 'Brazil'
         WHEN 'CA' THEN 'Canada'
         WHEN 'CH' THEN 'Switzerland'
         WHEN 'CN' THEN 'China'
         WHEN 'DE' THEN 'Germany'
         WHEN 'IN' THEN 'India'
         WHEN 'IT' THEN 'Italy'
         WHEN 'JP' THEN 'Japan'
         WHEN 'MX' THEN 'Mexico'
         WHEN 'NL' THEN 'Netherlands'
         WHEN 'SG' THEN 'Singapore'
         WHEN 'UK' THEN 'United Kingdom'
         WHEN 'US' THEN 'United States'
       ELSE 'Outros'
       END COUNTRY
FROM hr.LOCATIONS
ORDER BY COUNTRY_ID;

    
--exemplo case
    
SELECT A.FIRST_NAME,A.COMMISSION_PCT,
    CASE WHEN A.COMMISSION_PCT IS NOT NULL THEN 'Vendedor' 
      ELSE 'Interno' END HIERARQ
    FROM HR.EMPLOYEES A;
    

--Exemplo NULLIF   
SELECT NULLIF(100,100) FROM DUAL;

--Exemplo NULLIF   

-- script 173
SELECT NULLIF(100,10) FROM DUAL;

--Exemplo NULLIF   
--nao serve pra tratar retorno NULL
SELECT A.FIRST_NAME,A.COMMISSION_PCT,NULLIF(A.COMMISSION_PCT,0)
 FROM HR.EMPLOYEES A;

    