CREATE OR REPLACE FUNCTION FUN_CALCULO(PAR1 IN NUMBER, 
                                      PAR2 IN NUMBER, 
                                      RES OUT NUMBER)

    RETURN NUMBER
    IS
    AUX NUMBER :=0;
    
    BEGIN
    RES := PAR1 + PAR2;
    AUX := RES +100;
    RETURN(AUX);
    EXCEPTION
        WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro: '||SQLERRM);
    END;

--testando 
DECLARE
res0 NUMBER := 0;
res1 NUMBER := 0;
BEGIN
res0 := fun_calculo(6, 14, res1);
    dbms_output.put_line('O resultado é: '||res0||' e '||res1);
END;