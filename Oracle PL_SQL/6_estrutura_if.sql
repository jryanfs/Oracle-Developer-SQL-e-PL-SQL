
-- Bloco if then comparando valores
SET SERVEROUTPUT ON
ACCEPT v_digitado PROMPT 'Digite o numero da sorte:'
DECLARE
      v_numero int;
      v_sorte int default 5;     
  BEGIN
      v_numero:=&v_digitado;
      IF v_numero = v_sorte THEN
        DBMS_OUTPUT.PUT_LINE('Parabens!!! Você acertou!!!');
      END IF;
  END;
  /
  
-- exemplo usando a estrutura IF - THEN - ELSE  
  SET SERVEROUTPUT ON
ACCEPT v_digitado PROMPT 'Digite o nuemero da sorte:'
DECLARE
      v_numero int;
      v_sorte int default 5;     
  BEGIN
      v_numero:=&v_digitado;
      IF v_numero = v_sorte THEN
        DBMS_OUTPUT.PUT_LINE('Parabens!!! Voce acertou');
        else
         DBMS_OUTPUT.PUT_LINE('oh oHH!! errou tente outra vez!');
   END IF;
  END;
  /
-- USANDO A ESTRUTURA IF THEN ELSEIF  
  SET SERVEROUTPUT ON
  ACCEPT v_digitado PROMPT 'Digite um numero de 0 a 100:'
  DECLARE
      v_numero int;     
  BEGIN
      v_numero:=&v_digitado;
      IF v_numero <=10 THEN
            DBMS_OUTPUT.PUT_LINE('seu numero esta entre 0 a 10');
        ELSIF  v_numero > 10 and v_numero<=30 THEN
            DBMS_OUTPUT.PUT_LINE('seu numero esta entre 11 a 30');
        ELSIF  v_numero > 30 and v_numero<=50 THEN
            DBMS_OUTPUT.PUT_LINE('seu numero esta entre 31 a 50');
        ELSIF  v_numero > 50 and v_numero<=100 THEN
            DBMS_OUTPUT.PUT_LINE('seu numero esta entre 51 a 100');
        else
            DBMS_OUTPUT.PUT_LINE('seu numero esta fora os limites');
   END IF;
  END;
  /