CREATE TABLE USER_BANCU.KATALOG_45_1063_D
(
  CUIIO       NUMBER,
  CUIIO_VERS  NUMBER,
  DENUMIRE    VARCHAR2(1024 BYTE),
  CUATM       VARCHAR2(1024 BYTE),
  CFP         VARCHAR2(1024 BYTE),
  CFOJ        VARCHAR2(1024 BYTE),
  COCM        VARCHAR2(1024 BYTE),
  CAEM2       VARCHAR2(1024 BYTE),
  CAEM        VARCHAR2(1024 BYTE),
  IDNO        VARCHAR2(1024 BYTE)
)
TABLESPACE TBS_DTI_USERS
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE;


SELECT *
  FROM USER_BANCU.KATALOG_45_1063_D; 


INSERT INTO USER_BANCU.KATALOG_45_1063_D 
(
             CUIIO,
             CUIIO_VERS,
             DENUMIRE,
             CUATM,
             CFP,
             CFOJ,
             COCM,
             CAEM2,
             CAEM,
             IDNO
 
 )




           SELECT
             CUIIO,
             CUIIO_VERS,
             DENUMIRE,
             CUATM,
             CFP,
             CFOJ,
             COCM,
             CAEM2,
             CAEM,
             IDNO 
 FROM USER_BANCU.VW_45_AGRO_1063;

;
SELECT *

FROM VW_45_AGRO_1063 

;
CREATE OR REPLACE FORCE VIEW VW_45_AGRO_1063 
(
           CUIIO,
           CUIIO_VERS,
           DENUMIRE,
           CUATM,
           CFP,
           CFOJ,
           COCM,
           CAEM2,
           CAEM,
           IDNO
 
 )
AS 



SELECT
           DISTINCT R.CUIIO,
           R.CUIIO_VERS,
           R.DENUMIRE,
           R.CUATM,
           R.CFP,
           R.CFOJ,
           R.COCM,
           R.CAEM2,
           R.CAEM,
           R.IDNO

  
FROM 
  CIS2.VW_DATA_ALL D INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = D.CUATM
                INNER JOIN CIS2.RENIM  R  ON R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS
 
WHERE
  D.PERIOADA IN (1063) AND 


  D.FORM IN (45)    
 
GROUP BY
  R.CUIIO,
           R.CUIIO_VERS,
           R.DENUMIRE,
           R.CUATM,
           R.CFP,
           R.CFOJ,
           R.COCM,
           R.CAEM2,
           R.CAEM,
           R.IDNO
 
  
