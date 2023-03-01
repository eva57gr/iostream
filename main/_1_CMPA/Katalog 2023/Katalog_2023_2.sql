CREATE TABLE USER_BANCU.REG_UNIT_GC
(
  UNIT_CODE       NUMBER                        ,
  UNIT_CODE_VERS  NUMBER                        ,
  NR_GOSP         NUMBER                        ,
  NR_MAPS         NUMBER                        ,
  SURNAME         VARCHAR2(100 BYTE),
  NAME            VARCHAR2(100 BYTE),
  PATRONIMIC      VARCHAR2(100 BYTE),
  CUATM           VARCHAR2(7 BYTE)              ,
  ADDRESS_1       VARCHAR2(100 BYTE),
  ADDRESS_2       VARCHAR2(10 BYTE),
  ADDRESS_3       VARCHAR2(10 BYTE),
  ADDRESS_4       VARCHAR2(10 BYTE),
  ENVIRONMENT     NUMBER,
  CSID            VARCHAR2(50 BYTE),
  EDIT_USER       NUMBER
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