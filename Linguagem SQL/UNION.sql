--EXEMPLOS DE UNION ALL

SELECT EMPLOYEE_ID,FIRST_NAME,SALARY FROM HR.EMPLOYEES 
UNION ALL
SELECT EMPLOYEE_ID,FIRST_NAME,SALARY FROM HR.EMPLOYEES 
ORDER BY 1;


--EXEMPLOS DE UNION
SELECT EMPLOYEE_ID,FIRST_NAME,SALARY FROM HR.EMPLOYEES 
UNION
SELECT EMPLOYEE_ID,FIRST_NAME,SALARY FROM HR.EMPLOYEES 
ORDER BY 1

--SIMULANDO ERRO 1
SELECT EMPLOYEE_ID,FIRST_NAME,SALARY FROM HR.EMPLOYEES 
UNION
SELECT EMPLOYEE_ID,FIRST_NAME FROM HR.EMPLOYEES 
ORDER BY 1

--SIMULANDO ERRO 2
SELECT EMPLOYEE_ID,FIRST_NAME,SALARY FROM HR.EMPLOYEES 
UNION
SELECT EMPLOYEE_ID,SALARY,FIRST_NAME FROM HR.EMPLOYEES 
ORDER BY 1

--CAMPOS DIFERENTES MAS MESMOS TIPO

SELECT EMPLOYEE_ID,FIRST_NAME,SALARY FROM HR.EMPLOYEES 
UNION
SELECT EMPLOYEE_ID,LAST_NAME,SALARY FROM HR.EMPLOYEES 
ORDER BY 1;


	-- SIMULANDO ERRO UNION
	SELECT '1','1','ABC' FROM DUAL
		UNION
	SELECT 'A',2 FROM DUAL;
	
	-- exemplo union all
	select 'A' as campo1,'B'as campo2 FROM DUAL
	union all
	select 'A' as campo3,'B' as campo4 FROM DUAL;
	
	-- exemplo union
	select 'A' as campo1,'B'as campo2 FROM DUAL
	union 
   select 'A' as campo3,'B' as campo4 FROM DUAL;
	
   
	-- EXEMPLO USANDO UNION

	select ano,estado
	from senso
	where ano='2014'
	union 
	select ano,estado
	from senso
	where ano='2013';
	
    --UNION ALL
    
    select ano,estado
	from senso
	where ano='2014'
	union ALL
	select ano,estado
	from senso
	where ano='2013';
    
		-- EXEMPLO USANDO UNION ALL

	select estado
	from senso
	where ano='2014'
	union all
	select estado
	from senso
	where ano='2013';
	
	-- EXEMPLO USANDO UNION

	select estado
	from senso
	where ano='2014'
	union 
	select estado
	from senso
	where ano='2013';
	

		
	
	-- EXEMPLO COM UNION
  	select ano,estado,nome_mun,populacao
	from senso
	where ano='2014'
	and cod_uf='11'
	union 
	select ano,estado,nome_mun,populacao
	from senso
	where ano='2013'
	and cod_uf='11'
	order by nome_mun,ano;



