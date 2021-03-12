-- criando tabelas para procedure atualiza estoque

CREATE TABLE MATERIAL (
    COD_MAT INT PRIMARY KEY,
    DESCRICAO VARCHAR2(50) NOT NULL,
    PRECO_UNIT NUMBER(10,2)
);

 CREATE SEQUENCE  SEQ_COD_MAT
	INCREMENT BY 1
	START WITH 1
	ORDER
	CACHE 10;
 
CREATE TABLE ESTOQUE 
  ( 
     COD_MAT INT  PRIMARY KEY NOT NULL, 
     SALDO   DECIMAL (10, 2) NULL 
  ) ;
  

CREATE TABLE ESTOQUE_LOTE 
  ( 
     COD_MAT INT NOT NULL,
     LOTE    VARCHAR (15) NOT NULL, 
     SALDO   DECIMAL (10, 2) NULL, 
     FOREIGN KEY (COD_MAT) REFERENCES MATERIAL(COD_MAT), 
	 PRIMARY KEY (COD_MAT, LOTE) 
  ) ;

CREATE TABLE mov_estoque 
  ( 
     transacao  INT PRIMARY KEY NOT NULL,
     mov        VARCHAR2 (1) NOT NULL, 
     cod_mat    INT NOT NULL, 
     lote       VARCHAR (15) NOT NULL, 
     qtd        INT NOT NULL, 
     usuario    VARCHAR2 (30) NOT NULL, 
     dt_hor_mov DATE NOT NULL 
  ) ;
  
    CREATE SEQUENCE  seq_mov_estoque
	INCREMENT BY 1
	START WITH 1
	ORDER
	CACHE 10;



ALTER TABLE estoque 
  ADD FOREIGN KEY (cod_mat) REFERENCES material(cod_mat); 


ALTER TABLE mov_estoque 
  ADD FOREIGN KEY (cod_mat) REFERENCES material(cod_mat); 
  
 --inserindo dados 
  INSERT INTO material   (cod_mat,descricao,preco_unit) VALUES
        (seq_cod_mat.NEXTVAL,'SMART TV 40',2200.99);
  INSERT INTO material   (cod_mat,descricao,preco_unit) VALUES
        (seq_cod_mat.NEXTVAL,'SMARTPHONE',1990.99);
  INSERT INTO material   (cod_mat,descricao,preco_unit) VALUES
        (seq_cod_mat.NEXTVAL,'HOME THEATER',999.99);  
        


SELECT * FROM MATERIAL;
