CREATE TABLE USER_BANCU.AUTO_65
(
  CUIIO       NUMBER,
  CUIIO_VERS  NUMBER,
  DENUMIRE    VARCHAR2(1024 BYTE),
  CUATM       VARCHAR2(1024 BYTE),
  CFP         VARCHAR2(1024 BYTE),
  CFOJ        VARCHAR2(1024 BYTE),
  COCM        VARCHAR2(1024 BYTE),
  CAEM2       VARCHAR2(1024 BYTE),
  CAEM       VARCHAR2(1024 BYTE),
  IDNO        VARCHAR2(1024 BYTE),
  ETAPA_PROD  VARCHAR2(1024 BYTE)

)
TABLESPACE TBS_DTI_USERS
PCTUSED    0
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
NOCACHE
MONITORING;


---------------------------------------------




 SELECT 
 
        L.CUIIO,
        L.CUIIO_VERS,
        L.DENUMIRE,
        L.CUATM RSF_CUATM,
        R.CUATM M3_CUATM,
--        --SUBSTR(L.CUATM,1,2) AS SUBSTR_CUATM,
        
        L.CFP,
        L.CFOJ,
        L.CAEM2 RSF_CAEM2,
        R.CAEM2 M3_CAEM2,
        L.IDNO
        
        FROM  USER_BANCU.IDNO L 
           INNER JOIN ADD_NEW_SU_M3_2024 R 
        
        ON L.CUIIO =  R.CUIIO
        
        
        
        WHERE
--        
--        
        L.CUATM = R.CUATM
--        
--        
AND         TRIM(L.CAEM2) = TRIM(R.CAEM2)
        
       -- SUBSTR(L.CUATM,1,2) <> SUBSTR(R.CUATM,1,2)
        











