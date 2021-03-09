-- criando tablespace
create tablespace curso
 datafile
   'C:\oraclexe\app\oracle\oradata\XE\curso.dbf' 
		size 100m autoextend on next 50m maxsize 500m
   online
   permanent
   extent management local autoallocate
   segment space management auto;
   
   -- criando usuario 
   create user aluno
          identified by aluno
          default tablespace curso
          temporary tablespace TEMP;
  -- permissao para aluno        
  grant create session, connect, resource to aluno;
  
  alter user aluno quota unlimited on curso;
  
  
  --deletar user
  drop user aluno;
  --deletar tablespace
DROP TABLESPACE curso
  INCLUDING CONTENTS and  DATAFILES
    CASCADE CONSTRAINTS;