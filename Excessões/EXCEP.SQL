-- TRATANDO EXCESSOES 1
SET SERVEROUTPUT ON
DECLARE
lv_excessao EXCEPTION;
PRAGMA exception_init (lv_excessao,-6502);

BEGIN
   
    RAISE lv_excessao;
    EXCEPTION
    WHEN OTHERS THEN
    IF SQLCODE=1 THEN
        dbms_output.put_line('Erro que usuario tratou linha 1'||SQLCODE||' - '||sqlerrm);
        ELSE 
        dbms_output.put_line('Erro que usuario tratou linha 2'||SQLCODE||' - '||sqlerrm);
    END IF;
END;

-- TRATANDO EXCESSOES 2
set SERVEROUTPUT ON
declare
lv_excessao exception;
pragma EXCEPTION_INIT (lv_excessao,-20000);
begin
   
    RAISE_APPLICATION_ERROR(-20000, 'Mensagem Tratada');
    exception
    when lv_excessao then
        dbms_output.put_line(SQLCODE);
        dbms_output.put_line(SQLERRM);
end;


-- TRATANDO EXCESSOES 3
-- TRATAR NUMEROS INTERVALOS ENTRE 50 E 100
set SERVEROUTPUT ON
declare
    P_NUM INT DEFAULT 75;
    EXC_MENOR exception;
    EXC_MAIOR exception;
   
BEGIN
    IF P_NUM>100 THEN
    RAISE EXC_MAIOR;
    ELSIF P_NUM<50 THEN
    RAISE EXC_MENOR;
    ELSE
     dbms_output.put_line('OK!!!!');
    END IF;
    
    EXCEPTION
    when EXC_MENOR THEN
        dbms_output.put_line('Numero menor que 50 digite um entre 50 e 100');
    when EXC_MAIOR THEN
        dbms_output.put_line('Numero maior que 100 digite um entre 50 e 100'); 
    WHEN OTHERS THEN
        dbms_output.put_line('CODIGO E ERRO '||SQLCODE||'MSG '||SQLERRM);
         
end;

-- TRATANDO EXCESSOES 4
--divide por zero
DECLARE
v_num  NUMBER;
BEGIN

   v_num := 1/1;

    EXCEPTION
      WHEN ZERO_DIVIDE THEN -- este é o “rótulo” dado pelo Oracle
                            -- para o tipo de erro disparado
                            -- quando ocorre a divisão por zero.
 
         DBMS_OUTPUT.PUT_LINE('----------------------------------');
         DBMS_OUTPUT.PUT_LINE('Erro: divisão por ZERO.');
         DBMS_OUTPUT.PUT_LINE('Não é possível obter ov_num = 1/0.');
         DBMS_OUTPUT.PUT_LINE('----------------------------------');
         DBMS_OUTPUT.PUT_LINE('Código Oracle: ' || SQLCODE);
         DBMS_OUTPUT.PUT_LINE('Mensagem Oracle: ' || SQLERRM);        
         
END ;

-- TRATANDO EXCESSOES 5
--tratando outros erros
DECLARE
v_num  NUMBER;
BEGIN

   v_num := 1/0;
EXCEPTION
WHEN OTHERS THEN
    IF     sqlcode ='-12170' THEN --> Erro de CONEXÃO 
    dbms_output.put_line('Erro de conexão! Verifique se a maquina esta ligada!');
   ELSE
     dbms_output.put_line('Erro na integração!'||SQLERRM);
   END IF;                     
  END;