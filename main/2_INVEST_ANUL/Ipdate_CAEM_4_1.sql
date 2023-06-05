--This is table in Oracle
CREATE TABLE CIS2.RENIM
(
  CUIIO           NUMBER                        NOT NULL,
  CUIIO_VERS      NUMBER                        NOT NULL,
  DENUMIRE        VARCHAR2(255 BYTE),
  EDIT_USER       NUMBER                        NOT NULL,
  STATUT          VARCHAR2(1 BYTE)              NOT NULL,
  CUATM           VARCHAR2(7 BYTE)              NOT NULL,
  CFP             VARCHAR2(2 BYTE),
  CFOJ            VARCHAR2(3 BYTE),
  COCM            VARCHAR2(4 BYTE),
  CAEM            VARCHAR2(6 BYTE),
  BUGET           VARCHAR2(1 BYTE)              DEFAULT 0                     NOT NULL,
  TIP             VARCHAR2(2 BYTE)              DEFAULT 0                     NOT NULL,
  PROD            VARCHAR2(2 BYTE),
  FOR_CUB         VARCHAR2(2 BYTE),
  GENMUZEE        VARCHAR2(2 BYTE),
  TIPMUZEE        VARCHAR2(2 BYTE),
  TIP_LOCAL       VARCHAR2(2 BYTE),
  TIP_INST        NUMBER,
  CAEM2           VARCHAR2(6 BYTE),
  N85_NTL         VARCHAR2(2 BYTE),
  N85_NTIIP       VARCHAR2(2 BYTE),
  N85_NDIIP       VARCHAR2(2 BYTE),
  N85_NPDS        VARCHAR2(2 BYTE),
  N85_NRIIP       VARCHAR2(2 BYTE),
  N85_NSIIP       VARCHAR2(2 BYTE),
  GENMUZEE2       VARCHAR2(2 BYTE),
  NFI             NUMBER,
  NTII            NUMBER,
  NPDS            NUMBER,
  ORGANE          VARCHAR2(5 BYTE),
  TIP_INV         VARCHAR2(2 BYTE),
  RENIM_PERS      NUMBER,
  ORGANE_COND     VARCHAR2(8 BYTE),
  GEN_INSTITUTIE  VARCHAR2(1 BYTE),
  IDNO            VARCHAR2(13 BYTE),
  ADDRESS1        VARCHAR2(500 BYTE)
)
TABLESPACE USERS
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


CREATE UNIQUE INDEX CIS2.PK_RENIM ON CIS2.RENIM
(CUIIO, CUIIO_VERS)
LOGGING
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );

--This is update 
DECLARE -- ====================================================================

  CURSOR C IS
        
        
  
 
        SELECT 
    CUIIO,
    CUIIO_VERS,
    2011 NEW_CUIIO_VERS,
    CAEM2
    
    FROM CIS2.RENIM 
    WHERE 


CUIIO  IN (

38416648,
40675512,
40418910,
41047025,
41261764,
37986823,
40712615,
40713313,
41392615,
37768351,
41073554,
41298508,
38852504,
41001796,
41048792,
41260492,
41262545,
41394198,
41404436,
41495918,
41536528,
41559682,
41559825,
41559908,
41560426,
41478110,
40672077,
40924429,
40964989,
40902161,
40802844,
41001359,
41033419,
40983165,
41069423,
41033307,
41125742,
41236022,
41236238,
41172581,
41154287,
41215630,
41316904,
41317766,
41296691,
41314874,
41315744,
41341233,
41391934,
41451252,
41451507,
41452211,
41384314,
41453587,
41417189,
41417195

)


AND 


CUIIO_VERS IN  (2010)
          
          ;

BEGIN -- ======================================================================
  FOR CR IN C
  LOOP
    UPDATE CIS2.RENIM SET 
      
        CAEM2 = CR.CAEM2
       
    
    
    WHERE 
      CUIIO  = CR.CUIIO 
      AND
      CUIIO_VERS = CR.NEW_CUIIO_VERS 
      
      
      
    ;
  END LOOP;
END; -- =======================================================================


--This is good variant ?