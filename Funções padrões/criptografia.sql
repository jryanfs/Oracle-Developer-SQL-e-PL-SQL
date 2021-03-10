SET SERVEROUTPUT ON


DECLARE
     v_str VARCHAR2(100);
     v_frase VARCHAR2(100);
    BEGIN
     -- atribuindo valor
     v_frase:='Utilidades Oracle';
      --generate encoded value
      --1 PARAM BUF VALOR
      --2 PARAM ENCODE_CHARSET SAO TIPO WE8ISO8859P1 - AL32UTF8
      --3 PARAM ENCODING - BASE64
      v_str := utl_encode.text_encode(v_frase,'WE8ISO8859P1', UTL_ENCODE.BASE64);
      --imprimi valor
      dbms_output.put_line(v_str);
      
      --take the encoded value and decode it
      v_str := utl_encode.text_decode(v_str,'WE8ISO8859P1', UTL_ENCODE.BASE64);
      --imprimi valor
     dbms_output.put_line(v_str);
     
   END;


--exemplo 2   
   set serveroutput on
   DECLARE
   v_input varchar2(2000) := 'teste123';
   v_imput_cripto varchar2(32) := null;
   BEGIN
    v_imput_cripto := rawtohex(dbms_obfuscation_toolkit.md5(input => utl_raw.cast_to_raw(v_input)));
    dbms_output.put_line('O valor hash para "' || v_input || '" é "' || nvl(v_imput_cripto, '')||'".');
   end;
   
--exemplo 3

   --criando função para gerar senha
   create or replace function md5 (valor varchar) 
     return varchar2 is
     v_input varchar2(2000) := valor;
     v_imput_cripto varchar2(32) := null;
   begin
        v_imput_cripto := rawtohex(dbms_obfuscation_toolkit.md5(input => utl_raw.cast_to_raw(v_input)));
   return nvl(v_imput_cripto,'');
   end;
  
  -- testando retorno da função  
    select md5('minhasenha') from dual;
 --testando função com select comparando valores
    select 'TRUE' as retorno from dual
    where '7C67E713A4B4139702DE1A4FAC672344' = md5('minhasenha_errada'); 
 --testando função com select comparando valores
    select 'TRUE' as retorno from dual
   where '7C67E713A4B4139702DE1A4FAC672344' = md5('minhasenha');
   
    --testando função com select comparando valores
    select 'TRUE' as retorno from dual
   where '7C67E713A4B4139702DE1A4FAC672344' ='minhasenha';



   
   
   
