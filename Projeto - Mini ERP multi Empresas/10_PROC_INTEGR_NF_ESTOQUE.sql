--@TIPO_MOV, COD_MAT,@LOTE, QTD_MOV
--EXEC PROC_GERA_ESTOQUE 
--CRIACAO PROC_INTEGR_NF_ESTOQUE
--EXECUTE PROC_INTEGR_NF_ESTOQUE 10,'2017-01-30'
--SELECT * FROM NOTA_FISCAL
--SELECT * FROM NOTA_FISCAL_ITENS
--UPDATE NOTA_FISCAL SET INTEGRADA_SUP='N' WHERE NUM_NF='2'
--SELECT * FROM ESTOQUE
--SELECT * FROM ESTOQUE_LOTE
--SELECT * FROM ESTOQUE_MOV
CREATE OR REPLACE PROCEDURE PROC_INTEGR_NF_ESTOQUE (P_EMP IN NUMBER,
                                                    P_NUM_NF NUMBER,
                                                    P_DATA_MOVTO DATE)

IS

        V_EXC_SALDO_INSUFICIENTE EXCEPTION;
        V_EXC_DOCT_NAO_EXISTE EXCEPTION;
        V_EXC_INTEGRADO EXCEPTION;
        
        V_QTD_AUX NUMBER(10,2);
        V_QTD_TOT NUMBER(10,2);
        V_TIP_OPER VARCHAR2(1);
        V_SITUA VARCHAR2(1);
        V_CONT INT;
        V_NUM_NF NUMBER;
        V_MAT_AUX NUMBER;
        V_SALDO_AUX NUMBER(10,2);

 BEGIN 
    
    --VERIFICANDO DE DOCTO EXISTE E JA JA ESTA INTEGRADO
SELECT NUM_NF,TIP_NF,INTEGRADA_SUP, COUNT(*) QTD INTO V_NUM_NF,V_TIP_OPER,V_SITUA,V_CONT FROM NOTA_FISCAL
  WHERE COD_EMPRESA=P_EMP AND NUM_NF=P_NUM_NF
  GROUP BY NUM_NF,TIP_NF,INTEGRADA_SUP;
  --VERIFICA SE EXISTE DOCTO
  IF V_CONT=0 THEN
  RAISE V_EXC_DOCT_NAO_EXISTE;
  END IF;
  --VERIFICA DE ESTA INTEGRADO
  IF V_CONT=1 AND V_SITUA='S' THEN
    RAISE V_EXC_INTEGRADO;
  END IF;
  
  --VERIFCANDO SE NOTA DE ENTRADA PARA DAR ENTRADA EM ESTOQUE;
  IF V_TIP_OPER='E' THEN
  
  FOR C_NF_IT IN (
  SELECT A.COD_EMPRESA,A.TIP_NF,B.COD_MAT,
			TO_CHAR(SYSDATE,'DD-MM')||'-'||A.NUM_NF LOTE,
			--COMPOSICAO CAMPO LOTE (DIA MES + NUMERO DA NF)
			B.QTD 
			FROM NOTA_FISCAL A
			
            INNER JOIN NOTA_FISCAL_ITENS B
			ON A.COD_EMPRESA=B.COD_EMPRESA
            AND A.NUM_NF=B.NUM_NF
            
			WHERE A.NUM_NF=P_NUM_NF --PARAMETRO
            AND A.COD_EMPRESA=P_EMP --PARAMENTO
            AND A.TIP_NF='E'
			AND A.INTEGRADA_SUP='N') LOOP
            
            --EXECUTANDO PROCEDURE QUE MOVIMENTA ESTOQUE PARA DAR ENTRADA NO MATERIAL
            PRC_MOV_ESTOQUE (C_NF_IT.TIP_NF,P_EMP,C_NF_IT.COD_MAT,C_NF_IT.LOTE,C_NF_IT.QTD,P_DATA_MOVTO);
            
    END LOOP;
    
     UPDATE NOTA_FISCAL SET INTEGRADA_SUP='S'  WHERE NUM_NF=P_NUM_NF AND COD_EMPRESA=P_EMP;
     COMMIT;
		    DBMS_OUTPUT.PUT_LINE ('ENTRADA CONCLUIDA!');
    
    --OPERACAO DE SAIDA /REGRA NAO PODE SAIR MAIS QUE O SALDO
    ELSIF V_TIP_OPER='S' THEN
    --ABRINDO CURSOR DOS ITENS DA NF
     FOR C_NF_IT IN (SELECT A.COD_EMPRESA,A.TIP_NF,B.COD_MAT,
			--TO_CHAR(SYSDATE,'DD-MM')||'-'||A.NUM_NF LOTE,
			--COMPOSICAO CAMPO LOTE (DIA MES + NUMERO DA NF)
			B.QTD 
			FROM NOTA_FISCAL A
			INNER JOIN NOTA_FISCAL_ITENS B
			ON A.COD_EMPRESA=B.COD_EMPRESA
            AND A.NUM_NF=B.NUM_NF
            AND A.COD_EMPRESA=P_EMP --PARAMENTO
			WHERE A.NUM_NF=P_NUM_NF --PARAMETRO
            AND A.TIP_NF='S'
			AND A.INTEGRADA_SUP='N') LOOP 
     
     --ABRINDO CURSOR DO MATERIAIS EM ESTQUE DOS ITENS DA NF
     FOR C_ESTOQUE IN (SELECT A.COD_EMPRESA,A.COD_MAT,A.QTD_SALDO FROM ESTOQUE A
                        WHERE A.COD_EMPRESA=P_EMP AND A.COD_MAT=C_NF_IT.COD_MAT) LOOP
        --VERIFICA SE SALDO DISPONIVEL PARA SAIDA                
        IF (C_NF_IT.QTD>C_ESTOQUE.QTD_SALDO) THEN
        
            RAISE V_EXC_SALDO_INSUFICIENTE;
            
        END IF;
        
        END LOOP; --LOOP C_ESTOQUE
        
        END LOOP; --LOOP C_NF_IT
        
    END IF;  
    
    --GERANDO MOVIMENTAÇÃO DE SAIDA
    IF V_TIP_OPER='S' THEN
    --ABRINDO CURSOR DOS ITENS DA NF
     
     FOR C_NF_IT IN (SELECT A.COD_EMPRESA,A.TIP_NF,B.COD_MAT,
			--TO_CHAR(SYSDATE,'DD-MM')||'-'||A.NUM_NF LOTE,
			--COMPOSICAO CAMPO LOTE (DIA MES + NUMERO DA NF)
			B.QTD 
			FROM NOTA_FISCAL A
			INNER JOIN NOTA_FISCAL_ITENS B
			ON A.COD_EMPRESA=B.COD_EMPRESA
            AND A.NUM_NF=B.NUM_NF
            AND A.COD_EMPRESA=P_EMP --PARAMENTO
			WHERE A.NUM_NF=P_NUM_NF --PARAMETRO
            AND A.TIP_NF='S'
			AND A.INTEGRADA_SUP='N') LOOP
            
           -- <<PROXIMO_MAT>>
        
        --ATRIBUINDO A QUANTIDADE NECESSARIA PARA BAIXA EM ESTOQUE
        V_SALDO_AUX:=C_NF_IT.QTD;
    
   FOR C_EST_LOTE IN (SELECT A.COD_EMPRESA,A.COD_MAT,A.LOTE,A.QTD_LOTE FROM ESTOQUE_LOTE A
    WHERE A.COD_EMPRESA=P_EMP 
     AND A.COD_MAT=C_NF_IT.COD_MAT 
     ORDER BY A.COD_MAT,A.LOTE ) LOOP
        
        --SE SALDO IGUAL A ZERO LER PROXIMO MATERIAL
        IF V_SALDO_AUX=0 THEN
        
            EXIT;
        
        END IF;
        
        IF (V_SALDO_AUX<=C_EST_LOTE.QTD_LOTE) THEN
        --EXECUTANDO PROCEDURE QUE MOVIMENTA ESTOQUE PARA DAR ENTRADA NO MATERIAL
        PRC_MOV_ESTOQUE (C_NF_IT.TIP_NF,P_EMP,C_EST_LOTE.COD_MAT,C_EST_LOTE.LOTE,V_SALDO_AUX,P_DATA_MOVTO);
        --SUBSTRAINDO QTD BAIXADA
        V_SALDO_AUX:=V_SALDO_AUX-V_SALDO_AUX;
        
        ELSIF (V_SALDO_AUX>C_EST_LOTE.QTD_LOTE) THEN
         --EXECUTANDO PROCEDURE QUE MOVIMENTA ESTOQUE PARA DAR ENTRADA NO MATERIAL
        PRC_MOV_ESTOQUE (C_NF_IT.TIP_NF,P_EMP,C_EST_LOTE.COD_MAT,C_EST_LOTE.LOTE,C_EST_LOTE.QTD_LOTE,P_DATA_MOVTO);
            
        V_SALDO_AUX:=V_SALDO_AUX-C_EST_LOTE.QTD_LOTE;
        END IF;
    
       
    
    END LOOP; --C_EST_LOTE
    END LOOP; --C_NF_IT
    
    UPDATE NOTA_FISCAL SET INTEGRADA_SUP='S'  WHERE NUM_NF=P_NUM_NF AND COD_EMPRESA=P_EMP;
     COMMIT;
		    DBMS_OUTPUT.PUT_LINE ('SAIDA CONCLUIDA!');
    END IF;
    

 --VALIDACOES FINAIS
    EXCEPTION
    WHEN V_EXC_SALDO_INSUFICIENTE THEN
        DBMS_OUTPUT.PUT_LINE('SALDO INSUFICIENTE!'); 
        ROLLBACK;
    
      WHEN V_EXC_DOCT_NAO_EXISTE THEN
        DBMS_OUTPUT.PUT_LINE('DOCUMENTO NAO EXISTE!');
        ROLLBACK;
        
        
    WHEN  V_EXC_INTEGRADO THEN
        DBMS_OUTPUT.PUT_LINE('DOCTO JA INTEGRADO!');     
        ROLLBACK;
        
     WHEN  NO_DATA_FOUND  THEN
        DBMS_OUTPUT.PUT_LINE('NAO EXISTE DADOS!');
        ROLLBACK;
        
     WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('OUTROS CODIGO DO ERRO '||SQLCODE||' MSG '||SQLERRM);
        DBMS_OUTPUT.PUT_LINE('Linha: ' || DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
        ROLLBACK;

END; --END PROCEDURE      
        
        

--SELECT * FROM NOTA_FISCAL
--UPDATE NOTA_FISCAL SET INTEGRADA_SUP='N'
/*
SELECT * FROM ESTOQUE
SELECT * FROM ESTOQUE_MOV
SELECT * FROM ESTOQUE_LOTE
*/

/*
DELETE FROM ESTOQUE;
DELETE FROM ESTOQUE_MOV;
DELETE FROM ESTOQUE_LOTE;
*/
--SELECT * FROM PED_VENDAS_ITENS
--SELECT * FROM PED_VENDAS
--SELECT * FROM PED_COMPRAS
--SELECT * FROM NOTA_FISCAL ORDER BY NUM_NF;
--SELECT * FROM NOTA_FISCAL_ITENS WHERE COD_EMPRESA=1 AND NUM_NF='12' ORDER BY NUM_NF;

--PARAMENTROS (P_EMP IN NUMBER, P_NUM_NF NUMBER, P_DATA_MOVT
--SIMULANDO ENTRADA
EXECUTE PROC_INTEGR_NF_ESTOQUE (1,15,'15/01/2018');

--ALIMENTANDO ESTOQUE PARA NOTA DE SAIDA]
--SAIDA
EXECUTE PRC_MOV_ESTOQUE ('E',1,1,'AB',20,SYSDATE);
EXECUTE PRC_MOV_ESTOQUE ('E',1,1,'CD',30,SYSDATE);
EXECUTE PRC_MOV_ESTOQUE ('E',1,2,'EF',20,SYSDATE);
EXECUTE PRC_MOV_ESTOQUE ('E',1,2,'GH',15,SYSDATE);

--PARAMENTROS (P_EMP IN NUMBER, P_NUM_NF NUMBER, P_DATA_MOVT
SET SERVEROUTPUT ON
EXECUTE PROC_INTEGR_NF_ESTOQUE (1,12,'15/01/2018');

--SELECT * FROM ESTOQUE WHERE COD_MAT IN (1,2) AND COD_EMPRESA=1;
--SELECT * FROM ESTOQUE_LOTE WHERE COD_MAT IN (1,2) AND COD_EMPRESA=1;
--SELECT * FROM ESTOQUE_MOV ORDER BY ID_MOV