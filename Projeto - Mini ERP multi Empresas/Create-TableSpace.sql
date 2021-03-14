CREATE TABLESPACE erp_mult_tst
            DATAFILE
            'C:\oraclexe\app\oracle\oradata\XE\erp_mult_tst.dbf'
            SIZE 100m AUTOEXTEND ON NEXT 50m MAXSIZE 500m
            ONLINE
            PERMANENT
            EXTENT MANAGEMENT LOCAL AUTOALLOCATE
            SEGMENT SPACE MANAGEMENT AUTO;
            
CREATE USER user_tst
            IDENTIFIED BY 123456
            DEFAULT TABLESPACE erp_mult_tst
            TEMPORARY TABLESPACE TEMP;
            
GRANT  ALL PRIVILEGES TO user_prd;            
            
            
ALTER USER  user_tst QUOTA UNLIMITED ON erp_mult_tst;            
            
------- produção

CREATE TABLESPACE erp_mult_prd
            DATAFILE
            'C:\oraclexe\app\oracle\oradata\XE\erp_mult_prd.dbf'
            SIZE 100m AUTOEXTEND ON NEXT 50m MAXSIZE 500m
            ONLINE
            PERMANENT
            EXTENT MANAGEMENT LOCAL AUTOALLOCATE
            SEGMENT SPACE MANAGEMENT AUTO;
            
CREATE USER user_prd
            IDENTIFIED BY 123456
            DEFAULT TABLESPACE erp_mult_prd
            TEMPORARY TABLESPACE TEMP;            
            
 GRANT  ALL PRIVILEGES TO user_prd;  
 
 
 ALTER USER  user_prd QUOTA UNLIMITED ON erp_mult_prd; 