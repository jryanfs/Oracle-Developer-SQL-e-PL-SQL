SET SERVEROUTPUT ON
DECLARE 
v_total_sal NUMBER(10,2);
v_depto NUMBER;
v_qtd INT;


BEGIN
v_depto:=100;
SELECT SUM(A.salary),COUNT(*) qtd
    INTO v_total_sal,v_qtd
    FROM hr.employees A WHERE A.department_id=v_depto;
        
        dbms_output.put_line('total de salario depto ' || ' é ' || v_total_sal );
        dbms_output.put_line('total de colaboradores é ' || v_qtd);
        dbms_output.put_line('Media de salário ' ||round(v_total_sal/v_qtd));
END;