SET SERVEROUTPUT ON;
DECLARE 

TYPE Tfuncionario IS RECORD(
Nome VARCHAR2(40),
Depto VARCHAR2(20),
Salario NUMBER(10,2)
);

vFunc Tfuncionario;
BEGIN
    SELECT a.FIRST_NAME,a.DEPARTMENT_ID,a.SALARY
    INTO vFunc.nome,vFunc.Depto, vFunc.Salario
    FROM hr.employees a
    WHERE a.EMPLOYEE_ID = 102;

    DBMS_OUTPUT.PUT_LINE('----------');
    DBMS_OUTPUT.PUT_LINE('Nome : ' || vFunc.nome);
    DBMS_OUTPUT.PUT_LINE('Depto : ' || vFunc.Depto);
    DBMS_OUTPUT.PUT_LINE('Salario : ' || vFunc.Salario );
    DBMS_OUTPUT.PUT_LINE('----------');
END; 