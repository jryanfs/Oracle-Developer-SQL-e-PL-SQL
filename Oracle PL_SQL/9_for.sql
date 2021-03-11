-- Laço for para tabuada

--CRIANDO SET SERVEROUTPUT ON
ACCEPT V_Digitado PROMPT 'Digite a tabuada:'
DECLARE
 
 V_TAB INT;
 
 BEGIN
    V_TAB:=&V_Digitado;
    FOR  SEQ IN 1..10 LOOP
         DBMS_OUTPUT.PUT_LINE (SEQ||' X '||V_TAB||' = '||SEQ*V_TAB);
     END LOOP;
 END;
 
 
--TABELA DE TESTE
CREATE TABLE TESTE_FOR
(
NUMERO1 INT,
NUMERO2 INT
);

--LOOP PARA INSERT

 BEGIN  
    FOR  VALOR IN 1..10 LOOP
         INSERT INTO TESTE_FOR (NUMERO1) VALUES (VALOR);
     END LOOP;
     COMMIT;
 END;
 
 --VERIFCANDO
 SELECT * FROM TESTE_FOR;

--EXEMPLO UPDATE

 BEGIN  
    FOR  VALOR IN 1..10 LOOP
         UPDATE TESTE_FOR SET NUMERO2=NUMERO1*VALOR
         WHERE numero1=VALOR;
     END LOOP;
     COMMIT;
 END;

--
 --VERIFCANDO
 SELECT * FROM TESTE_FOR;
 
 
 --LOOP REVERSE
 BEGIN
   
       FOR x IN 1..5 LOOP
          dbms_output.put_line('Contador crescente : '|| TO_CHAR(x) );
       END LOOP;
   
       dbms_output.put_line(' - ');
       
       FOR x IN REVERSE 1..5 LOOP
        dbms_output.put_line('Contador decrescente : '|| TO_CHAR(x) );
       END LOOP;
 
  END;
  
  
