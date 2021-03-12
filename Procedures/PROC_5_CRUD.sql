
--DROP TABLE CAD_PESSOA;
CREATE TABLE CAD_PESSOA 
(
    ID_PESSOA INT NOT NULL PRIMARY KEY,
    NOME VARCHAR2(50),
    EMAIL VARCHAR(30),
    SITUACAO CHAR(1),
    CONSTRAINT CK_SITUA CHECK(SITUACAO IN('B','A'))
    );

--PROCEDURE DE CADASTRO
CREATE OR REPLACE PROCEDURE SP_CRUD (
                                  V_OPER       CHAR, --I INSERIR --A -ATUALIZA --S SELECIONA - D--DELETE
                                  V_ID_PESSOA  INTEGER,
                                  V_NOME       VARCHAR2,
                                  V_EMAIL      VARCHAR2,
                                  V_SITUACAO   CHAR)
IS
 --declarando variaveis
  V_SID_PESSOA INTEGER;
  V_SNOME VARCHAR2(50);
  V_SEMAIL VARCHAR2(30);
  V_SSITUACAO CHAR(1);
--declarando except
  v_EXCEPTION EXCEPTION;
  v_FALTA_CPO_INSERT EXCEPTION;
  v_FALTA_ID_DELETE EXCEPTION;
  v_FALTA_ID_UPDATE EXCEPTION;
BEGIN   
--verifica operacao de insert
  IF (V_OPER = 'I') THEN
    IF (V_ID_PESSOA is null or   V_ID_PESSOA='' or V_NOME is null OR V_NOME='' or  V_EMAIL is null or V_EMAIL='')
        then 
            ROLLBACK;
            RAISE v_FALTA_CPO_INSERT;
        else
        INSERT INTO CAD_PESSOA(ID_PESSOA, NOME,EMAIL, SITUACAO) VALUES (v_id_pessoa, v_NOME, v_email,'A');
    end if;
--verifica operacao de atualização
  ELSIF (V_OPER = 'A') THEN
     IF (V_ID_PESSOA is null or   V_ID_PESSOA='') 
     THEN
        ROLLBACK;
        RAISE v_FALTA_ID_UPDATE;
        ELSE
            UPDATE CAD_PESSOA SET NOME =NVL(V_NOME,NOME), EMAIL=NVL(V_EMAIL,EMAIL),SITUACAO=NVL(V_SITUACAO,SITUACAO)
           WHERE ID_PESSOA = V_ID_PESSOA;
      end if;  
  --verifica operacao de delete
  ELSIF(V_OPER = 'D')THEN
     IF (V_ID_PESSOA is null or V_ID_PESSOA='') 
       THEN
        ROLLBACK;
        RAISE v_FALTA_ID_DELETE;
        ELSE
            DELETE FROM CAD_PESSOA WHERE ID_PESSOA = V_ID_PESSOA;
     END IF;
 --verifica operacao de select
   ELSIF(V_OPER = 'S')THEN
    SELECT * INTO  V_SID_PESSOA,V_SNOME,V_SEMAIL,V_SSITUACAO 
    FROM CAD_PESSOA WHERE ID_PESSOA = V_ID_PESSOA;
    
     dbms_output.put_line('ID: '||V_SID_PESSOA); 
     dbms_output.put_line('Nome: '||V_SNOME); 
     dbms_output.put_line('e-mail: '||V_SEMAIL); 
     dbms_output.put_line('Situacao: '||V_SSITUACAO); 
    ELSE
    RAISE v_EXCEPTION;
  END IF;
    
 COMMIT;
    dbms_output.put_line('DADOS SELECIONADOS,INSERIDOS OU ATUALIZADO COM SUCESSO'); 
 --execpt   
  EXCEPTION
   
    WHEN v_EXCEPTION THEN 
      RAISE_APPLICATION_ERROR(-20999,'ATENÇÃO! Operação diferente de I, D, A OU S', FALSE);
    
    WHEN v_FALTA_CPO_INSERT THEN    
      dbms_output.put_line('FALHA NO INSERT, CAMPOS NAO PREENCHIDOS CORRETAMENTE!'); 
    
    WHEN v_FALTA_ID_UPDATE THEN  
      dbms_output.put_line('FALHA NO UPDATE, INFORME O ID!'); 
   
    WHEN v_FALTA_ID_DELETE THEN   
      dbms_output.put_line('FALHA NO DELETE, INFORME O ID!'); 
     
     WHEN OTHERS THEN
        IF SQLCODE='-00001' THEN
             DBMS_OUTPUT.PUT_LINE('ERRO: CODIGO JA EXISTE! ');
             DBMS_OUTPUT.PUT_LINE('ERRO: '||SQLERRM);
        ELSE
            DBMS_OUTPUT.PUT_LINE('CODIGO: '||SQLCODE);
            DBMS_OUTPUT.PUT_LINE('ERRO: '||SQLERRM);
            RAISE;
        END IF;
    ROLLBACK;
      
END ;
/
----I INSERIR --A -ATUALIZA --S SELECIONA - D--DELETE
--EXECUTANDO 
--REALIZANDO INSERT PARAM V_OPER,V_ID_PESSOA,V_NOME,V_EMAIL,V_SITUACAO

SET SERVEROUTPUT ON
DECLARE
    P_OPER CHAR(1);
    P_ID INT;
    P_NOME VARCHAR2(50);
    P_EMAIL VARCHAR2(30);
    P_SIT CHAR(1);
    BEGIN
      P_OPER:='S';
      P_ID:=1;
      P_NOME:='JEFF';
      P_EMAIL:=NULL;
      P_SIT:='B';
    
        SP_CRUD(P_OPER,P_ID,P_NOME,P_EMAIL,P_SIT);
    END;

