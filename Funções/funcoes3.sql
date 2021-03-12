-- funcão como  bloco anônimo concluído
--PEGAR DOIS NUMEROS A DIZER QUAL É O MAIOR
SET serveroutput ON;
 
DECLARE
  PNUM1 NUMBER;
  PNUM2 NUMBER;
  PNUM_AUX NUMBER;
 
  FUNCTION FN_MAX_VAL(
      PNUM1 IN NUMBER,
      PNUM2 IN NUMBER)
    RETURN NUMBER
  AS
    PNUM_AUX NUMBER;
  BEGIN
    IF PNUM1 > PNUM2 THEN
      PNUM_AUX := PNUM1;
    ELSE
      PNUM_AUX:= PNUM2;
    END IF;
    RETURN PNUM_AUX;
  END;
  
  BEGIN
    PNUM1 := 122;
    PNUM2 := 99;
    PNUM_AUX := FN_MAX_VAL (PNUM1, PNUM2);
    dbms_output.put_line('O maior valor entre ' || PNUM1 ||' e ' || PNUM2 || ' é=>> ' || PNUM_AUX);  
END;
  / 