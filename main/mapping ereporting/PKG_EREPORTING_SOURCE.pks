CREATE OR REPLACE PACKAGE STAT.PKG_EREPORTING_SOURCE AS

  PROCEDURE WRITE_XML(
    pREPORT_ID NUMBER,      --> Id of report, commming from CTIF
    pXML CLOB,              --> XML with report data
    pTYPEFORM VARCHAR2,     --> Form type of report
    P_RESULT  OUT VARCHAR2  --> Error occured while selecting of data (NULL if none)
  );
  
  PROCEDURE MAPPING_REPORTS;
  PROCEDURE LIST_FOR_REQUEST(
    value_get      OUT sys_refcursor
  );
  
END PKG_EREPORTING_SOURCE;
/