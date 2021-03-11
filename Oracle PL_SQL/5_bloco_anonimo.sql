-- Exemplo mostras quantidade de  funcionarios na tabela EMPLOYEES
set SERVEROUTPUT ON;
DECLARE
-- Declara��o de vari�veis
vCount INTEGER;
BEGIN
-- Recuperar quantidade de Funcionarios cadastrados
SELECT count(*)
INTO vCount
FROM HR.EMPLOYEES;
-- Imprimir, na tela, a quantidade de Funcionarios cadastrados
dbms_output.put_line('Existem '||to_char(vCount)||' Funcionarios cadastrados.');
EXCEPTION
/* Se ocorrer qualquer erro, informar o usu�rio que n�o foi poss�vel
verificar a quantidade de produtos cadastrados */
WHEN OTHERS THEN
dbms_output.put_line('N�o foi poss�vel verificar a quantidade de'||
'Funcionarios cadastrados.');
END;
/

-- Exemplo print de data

DECLARE
    V_HOJE date default sysdate;
BEGIN
    -- IMPRIME A DATA
    DBMS_OUTPUT.PUT_LINE('HOJE � '||V_HOJE);
END;

--CONTANDO DIAS DE VIDA
DECLARE
  V_DATA_NASC DATE :='05/11/77';
  V_HOJE DATE default sysdate;
  V_DIAS INT;
  BEGIN
    V_DIAS:=V_HOJE-V_DATA_NASC;
    DBMS_OUTPUT.PUT_LINE('ESTOU VIVO A  '||V_DIAS||' DIAS');
  END;
  

    
    
  

