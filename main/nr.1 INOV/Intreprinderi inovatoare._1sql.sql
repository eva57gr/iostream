CREATE TABLE USER_BANCU.X_BAZA_SONDAJ_2022
( 
  caem2       VARCHAR2(1024 BYTE),
  denumire    VARCHAR2(1024 BYTE),
  CUIIO       NUMBER,
  idno        VARCHAR2(1024 BYTE),
  raion       VARCHAR2(1024 BYTE),
  cfoj        VARCHAR2(1024 BYTE),
  cfp         VARCHAR2(1024 BYTE),
  PERS        NUMBER,
  ca          NUMBER,
  adresa      VARCHAR2(1024 BYTE),
  telefon     VARCHAR2(1024 BYTE),
  ANUL     NUMBER
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
