--1) Cria tabelas 
create table notas
(id_aluno int,
 nota1 number,
 peso1 number,
 nota2 number,
 peso2 number,
 media number
 );
 --2 inserindo dados
 
 insert into notas (id_aluno,nota1,peso1,nota2,peso2) values (1,8,4,6,6);
 insert into notas (id_aluno,nota1,peso1,nota2,peso2) values (2,10,4,10,6);
 insert into notas (id_aluno,nota1,peso1,nota2,peso2) values (3,5,4,5,6);
 
 --select
 select * from notas;
 --atualiza
 UPDATE notas SET media=FN_MEDIAPOND(nota1, peso1, nota2, peso2)
 where 1=1;
 
 --verifica

 select * from notas;

 