--criando especificação do package
--criando a package com 2 funções e uma procedure
CREATE OR REPLACE PACKAGE PKG_FUNC AS
  
    ---PROCEDURE SIMULA SALARIO AUMENTO
    PROCEDURE PROC_SIMULA(n_func_id NUMBER);
  -- get nome completo do funcionario
    FUNCTION get_nomeCompleto(n_func_id NUMBER)
      RETURN VARCHAR2;
   --  get salario do funcionario
    FUNCTION get_salario(n_func_id NUMBER)
      RETURN NUMBER;

  END PKG_FUNC;

--criando o boby
/*
    Package PKG_FUNC body
  */
  CREATE OR REPLACE PACKAGE BODY PKG_FUNC AS
  --get funcionario nomeCompleto
    FUNCTION get_nomeCompleto(n_func_id NUMBER) RETURN VARCHAR2 IS
        v_nomeCompleto VARCHAR2(50);
    BEGIN
      SELECT a.FIRST_NAME || ',' ||  a.LAST_NAME
      INTO v_nomeCompleto
      FROM HR.EMPLOYEES a
      WHERE a.employee_id = n_func_id;
      
      RETURN v_nomeCompleto;
   
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RETURN NULL;
    WHEN TOO_MANY_ROWS THEN
      RETURN NULL;
    END; 
    --end get_nomeCompleto
   
    -- get salario
    FUNCTION get_salario(n_func_id NUMBER) RETURN NUMBER IS
      n_salario NUMBER(8,2);
    BEGIN
      SELECT a.SALARY
      INTO n_salario
      FROM HR.EMPLOYEES a
      WHERE a.EMPLOYEE_ID = n_func_id;
   
      RETURN n_salario;
   
      EXCEPTION
        WHEN NO_DATA_FOUND THEN
          RETURN NULL;
        WHEN TOO_MANY_ROWS THEN
          RETURN NULL;
    END;
-- END get_salario
--PROCEDURE

  PROCEDURE PROC_SIMULA(n_func_id NUMBER) IS
    V_SAL_NOVO NUMBER(8,2);
    BEGIN
        SELECT a.SALARY*1.10 INTO V_SAL_NOVO FROM HR.EMPLOYEES a
        where a.EMPLOYEE_ID=n_func_id;
        dbms_output.put_line('O Novo salario é->> '||V_SAL_NOVO);
    END;
    --fim PROCEDURE
  END PKG_FUNC;
/

--Chamada do package
--package_name.package_element
--Executando pkg

SET SERVEROUTPUT ON SIZE 1000000;
  DECLARE
    n_salario NUMBER(8,2);
    v_nome   VARCHAR2(50);
    n_func_id NUMBER := &ID_FUNC;
  BEGIN
        v_nome    := PKG_FUNC.get_nomeCompleto(n_func_id);
        n_salario := PKG_FUNC.get_salario(n_func_id);
 
    IF v_nome  IS NOT NULL AND n_salario IS NOT NULL
    THEN
      dbms_output.put_line('Funcionário: ' || v_nome);
      dbms_output.put_line('Recebe salário = ' || n_salario);
      PKG_FUNC.PROC_SIMULA(n_func_id);
    END IF;
  END;
  
--executando um objeto
SET SERVEROUTPUT ON SIZE 1000000;
  DECLARE
    n_salario NUMBER(8,2);
    v_nome   VARCHAR2(50);
    n_func_id NUMBER := &empresa_id;
  BEGIN
   
    v_nome   := PKG_FUNC.get_nomeCompleto(n_func_id);
   
    IF v_nome  IS NOT NULL 
    THEN
      
      dbms_output.put_line('Funcionário: '|| v_nome);
     
    END IF;
  END;


--EXCUTANDO SO A PROCEDURE

  SET SERVEROUTPUT ON SIZE 1000000;
  DECLARE
   
    n_func_id NUMBER := &ID_FUNC;
  BEGIN
    PKG_FUNC.PROC_SIMULA(n_func_id);
  END;
  
