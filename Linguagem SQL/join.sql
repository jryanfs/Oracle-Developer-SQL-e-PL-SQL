--drop tabelas
drop table matricula;
drop table disciplina;
drop table alunos;
-- CRIACAO DE TABELA ALUNOS


create table alunos
(id_aluno int not null,
 nome varchar(20) not null,
 primary key(id_aluno)
 );


-- criando a tabela disciplina
create table disciplina
(
 id_disciplina int not null,
 nome_disc varchar2(20),
 primary key(id_disciplina)
 );


-- criando a tabela matricula
	CREATE TABLE matricula
	 (
	 id_aluno INT NOT NULL,
	 id_disciplina INT not null,
	 periodo VARCHAR2(10), 
	 PRIMARY KEY (id_aluno,id_disciplina), 
	 FOREIGN KEY (id_aluno) REFERENCES alunos(id_aluno), 
	 FOREIGN KEY (id_disciplina) REFERENCES disciplina(id_disciplina)
	);


  -- INSERINDO REGISTRO ALUNOS
  insert into alunos (id_aluno,nome) values (1,'Joao');
  insert into alunos (id_aluno,nome) values (2,'Maria');
  insert into alunos (id_aluno,nome) values (3,'Pedro');
  insert into alunos (id_aluno,nome) values (4,'Tiago');
  insert into alunos (id_aluno,nome) values (5,'Henrique');
  
--  insert into alunos (id_aluno,nome) values (5,'Henrique');


-- evidencia do insert
  SELECT * FROM alunos;


  -- INSERINDO REGISTRO DISCIPLINAS
  insert into disciplina (id_disciplina,nome_disc) values  (1,'Fisica');
  insert into disciplina (id_disciplina,nome_disc) values  (2,'Quimica');
  insert into disciplina (id_disciplina,nome_disc) values  (3,'Matematica');
  insert into disciplina (id_disciplina,nome_disc) values  (4,'Banco de Dados');
  insert into disciplina (id_disciplina,nome_disc) values  (5,'Programacao');

-- evidencia insert
  SELECT * FROM disciplina

-
  -- INSERINDO MATRICULAS DE ALUNOS
  insert into matricula values ('1','1','Noturno');
  insert into matricula values ('1','2','Vespertino');
  insert into matricula values ('1','3','Matutino');

  insert into matricula values ('2','3','Noturno');
  insert into matricula values ('2','4','Noturno');

  insert into matricula values ('3','1','Noturno');
  insert into matricula values ('3','3','Noturno');
  insert into matricula values ('3','4','Noturno');

  insert into matricula values ('5','1','Matutino');
  insert into matricula values ('5','2','Vespertino');
  insert into matricula values ('5','4','Noturno');

-- evidencia
 select * from matricula;
 
  -- ALUNO CODIG 4 NAO TEM MATRICULA
  -- DISCIPLINA 5 NAO TEM ALUNOS


  -- INNER JOIN

  SELECT a.nome,c.nome_disc,b.periodo
    FROM alunos a
	INNER JOIN matricula b 
		ON a.id_aluno=b.id_aluno
	INNER JOIN disciplina c 
		ON b.id_disciplina=c.id_disciplina;


  -- LEFT JOIN
	SELECT a.nome,c.nome_disc,b.periodo
	FROM alunos a
	LEFT JOIN matricula b 
		ON a.id_aluno=b.id_aluno
	LEFT JOIN disciplina c 
		ON b.id_disciplina=c.id_disciplina;
  

 -- RIGHT JOIN
	SELECT a.nome,c.nome_disc,b.periodo
	FROM alunos a
	RIGHT JOIN matricula b 
		ON a.id_aluno=b.id_aluno
	RIGHT JOIN disciplina c 
		ON b.id_disciplina=c.id_disciplina;
		

 -- full JOIN
	SELECT a.nome,c.nome_disc,b.periodo
	FROM alunos a
	full JOIN matricula b 
		ON a.id_aluno=b.id_aluno
	full JOIN disciplina c 
		ON b.id_disciplina=c.id_disciplina;


-- INNER JOIN

select * from hr.employees;
select * from HR.DEPARTMENTS;
select * from hr.jobs;


SELECT a.employee_id,a.first_name,b.department_name,c.job_title 
 FROM HR.EMPLOYEES a
 inner join HR.DEPARTMENTS b
  on a.department_id=b.department_id
 inner join HR.JOBS c
 on a.job_id=c.job_id
 order by 1;


-- LEFT JOIN

SELECT a.employee_id,a.first_name,b.department_name,c.job_title 
 FROM HR.EMPLOYEES a
 left join HR.DEPARTMENTS b
  on a.department_id=b.department_id
 left join HR.JOBS c
 on a.job_id=c.job_id
 order by 1;


-- RIGHT JOIN
SELECT a.employee_id,a.first_name,b.department_name,c.job_title 
 FROM HR.EMPLOYEES a
 right join HR.DEPARTMENTS b
  on a.department_id=b.department_id
 right join HR.JOBS c
 on a.job_id=c.job_id
 order by 1;

