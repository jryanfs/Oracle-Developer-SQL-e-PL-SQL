-- VERIFICANDO NUMERO PAR OU IMPAR
SET SERVEROUTPUT ON
DECLARE
    tipo_numero VARCHAR2(100);
    j INTEGER;
BEGIN 
    FOR j in 1..10 LOOP
      IF MOD(J,2) = 0 THEN
        tipo_numero := ' Numero par';
         GOTO mensagem;
        ELSE
        tipo_numero := ' Numero impar';
        GOTO mensagem;
      END IF;
    <<mensagem>>
    DBMS_OUTPUT.PUT_LINE(TO_CHAR(j) || tipo_numero);
    
     END LOOP;
  END;
  /

--ANALISE NUMERO PRIMO
/*
A definição mais comum é que "um número é primo se for divisível por 1 e por ele mesmo" ou então "é 
todo o número com dois e somente dois divisores, ele próprio e a unidade
*/
SET SERVEROUTPUT ON
DECLARE
    tipo_numero VARCHAR2(100);
    valor PLS_INTEGER := 12;
  BEGIN
    FOR j in 2..ROUND(SQRT(valor)) LOOP
      IF valor MOD j = 0 THEN
        tipo_numero := ' este não é um número primo';
        GOTO mensagem;
      END IF;
    END LOOP;
    tipo_numero := ' Este é um número primo';
    <<mensagem>>
    DBMS_OUTPUT.PUT_LINE(TO_CHAR(valor) || tipo_numero);
  END;
  /
  
 