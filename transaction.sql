-- MYSQL TRANSACTION ISLEMLERI BUYUK VERI TABANLARINDA ISLEMLER YAPILIRKEN DIKKAT EDILMESI GEREKIR
-- BIR HATA O VERININ KAYBINA YOL ACABILIR VE VERI KAYBINA SEBEP VEREBILIR
-- O YUZDEN YAPILAN ISLEMLERI GERI ALABILCEGIMIZ TRANSACTION ISLEMLER VARDIR
-- DIKKAT EDILMESI GEREKEN SEYLER ISE MYSQL DE INNODB MOTORUNDA CALISIR
-- VE SET AUTOCOMMIT=0 YAPMANIZ GEREKIR OTOMATIK EKLEME YAPMASIN DIYE

-- KULLANIMI
|-------------------------------------------------------------------------|
|AUTOCOMMIT=0;                                                            |
|START TRANSACTION /VEYA/BEGIN;                                           |
|                                                                         |
|SQL SORUGUNUZ                                                            |
|                                                                         |
|COMMIT VEYA ROLLBACK                                                     |
|-- COMMIT SORGUNUZDAN EMINSENIZ O TABLO UZERINDE ISLEMI UYGULAR          |
|-- SORGUNUZDAN EMIN DEGILSENIZ GERI ALABILIRSINIZ                        |
|                                                                         |
|-------------------------------------------------------------------------|

-- ORNEK TABLO UZERINDE VERELIM


CREATE TABLE PERSON(                  
ID INT PRIMARY KEY AUTO_INCERMENT,    
NAME VARCHAR(50)                      
                                      
)ENGINE=INNODB;                       


SET AUTOCOMMIT=0;
START TRANSACTION;
INSERT INTO PERSON VALUES("","IBRAHIM"); 
INSERT INTO PERSON VALUES("","DILARA"); 
INSERT INTO PERSON VALUES("","SUDE");
COMMIT;

SELECT*FROM PERSON --YAPTIGINIZDA

ID NAME 
1  IBRAHIM
2  DILARA
3  SUDE

-- EGER BIR SORUN OLUSTA YANLIS TABLOYA EKLEDIYSENIZ VS

SET AUTOCOMMIT=0;
START TRANSACTION;
INSERT INTO PERSON VALUES("","IBRAHIM"); 
INSERT INTO PERSON VALUES("","DILARA"); 
INSERT INTO PERSON VALUES("","SUDE");
ROLLBACK;

-- YAPARAK ISLEMINIZI GERI ALABILIRSINIZ


















