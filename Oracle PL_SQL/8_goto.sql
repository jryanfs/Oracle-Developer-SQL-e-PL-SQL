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
A defini��o mais comum � que "um n�mero � primo se for divis�vel por 1 e por ele mesmo" ou ent�o "� 
todo o n�mero com dois e somente dois divisores, ele pr�prio e a unidade
*/
SET SERVEROUTPUT ON
DECLARE
    tipo_numero VARCHAR2(100);
    valor PLS_INTEGER := 12;
  BEGIN
    FOR j in 2..ROUND(SQRT(valor)) LOOP
      IF valor MOD j = 0 THEN
        tipo_numero := ' este n�o � um n�mero primo';
        GOTO mensagem;
      END IF;
    END LOOP;
    tipo_numero := ' Este � um n�mero primo';
    <<mensagem>>
    DBMS_OUTPUT.PUT_LINE(TO_CHAR(valor) || tipo_numero);
  END;
  /
  
 