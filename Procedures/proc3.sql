--PROCEDURE CALCULADORA
CREATE OR replace PROCEDURE proc_calc(operacao IN VARCHAR, --A ADICAO --D DIVISAO --S -SUBTR M --MULTIPL
                                      pnum1    IN NUMBER, 
                                      pnum2    IN NUMBER, 
                                      retorno OUT NUMBER) 

IS 
MSG_OUTRAS EXCEPTION;
BEGIN 

 IF operacao='A' THEN 
    retorno := pnum1 + pnum2; 
  ELSIF operacao='S' THEN 
    retorno := pnum1 - pnum2; 
  ELSIF operacao='M' THEN 
    retorno := pnum1*pnum2; 
  ELSIF operacao='D' THEN 
    retorno := pnum1/pnum2; 
    else
    raise MSG_OUTRAS;
END IF; 
  EXCEPTION 
  WHEN MSG_OUTRAS THEN 
    dbms_output.put_line('Erro nao catalogado'); 
 
  WHEN OTHERS THEN 
    dbms_output.put_line('erro: '||SQLERRM); 
  END;
  /
  
  --EXECUTANDO PROCEDURE
  DECLARE
  retorno number:=0;
  BEGIN
    proc_calc ('x',10,3,retorno);
    dbms_output.put_line(retorno);
  END;
  /
  
  
--OUTRO EXEMPLO

