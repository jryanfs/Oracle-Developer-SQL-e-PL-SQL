DECLARE
    P_VALOR NUMBER := 0;
  BEGIN
    LOOP
      DBMS_OUTPUT.PUT_LINE ('Dentro do Loop o valor e igual a: '||TO_CHAR(P_VALOR));
      P_VALOR := P_VALOR + 1;
      CONTINUE WHEN P_VALOR < 5;
      DBMS_OUTPUT.PUT_LINE ('Apos a cláusula CONTINUE, o valor e igual a: '||TO_CHAR(P_VALOR));
      EXIT WHEN P_VALOR = 5;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE ('Apos o loop, o valor e igual a:' || TO_CHAR(P_VALOR));
  END;
  /
  
 -- outro exemplo 
  
  DECLARE
   valor NUMBER := 0;
  BEGIN
    LOOP -- Após a declaração CONTINUE
      DBMS_OUTPUT.PUT_LINE ('Valor apresentado no interior do loop é igual a: ' || TO_CHAR(valor));
      valor := valor + 1;
      IF valor < 15 THEN
        CONTINUE;
      END IF;
      DBMS_OUTPUT.PUT_LINE ('No interior do loop, após a cláusula IF-CONTINUE, o valor é igual a: ' || TO_CHAR(valor));
      EXIT WHEN valor > 15;
    END LOOP;
     DBMS_OUTPUT.PUT_LINE ('Após o loop, o valor é igual a: ' || TO_CHAR(valor));
  END;
  /