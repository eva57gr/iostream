CREATE OR REPLACE PACKAGE BODY USER_EREPORTING.PKG_EREPORTING_SOURCE AS

PROCEDURE WRITE_XML(
    pREPORT_ID NUMBER,      --> Id of report, commming from CTIF
    pXML CLOB,              --> XML with report data
    pTYPEFORM VARCHAR2,     --> Form type of report
    P_RESULT  OUT VARCHAR2  --> Error occured while selecting of data (NULL if none)
  ) AS
  
  V_CUIIO         NUMBER;
  V_REPORT_EXIST  NUMBER;
  V_ATTEMPTS      NUMBER;
  
BEGIN
  ------< Initialize parameter >---------------------------
  P_RESULT:= NULL;
  V_ATTEMPTS := 0;
  SELECT REGEXP_REPLACE(EXTRACT(XMLTYPE(pXML), '//CUIIO/text()', '').GETSTRINGVAL(), '[^0-9]') INTO V_CUIIO FROM DUAL;
  SELECT COUNT(FORMID) INTO V_REPORT_EXIST FROM F_XML_FORMS WHERE FORMID IN (pREPORT_ID);
  ---------------------------------------------------------
  IF V_REPORT_EXIST > 0 THEN
    SELECT SEND_ATTEMPTS INTO V_ATTEMPTS FROM F_XML_FORMS WHERE FORMID IN (pREPORT_ID);
    DELETE FROM F_XML_FORMS WHERE FORMID IN (pREPORT_ID);
    --P_RESULT := P_RESULT||'Delete reportId='||pREPORT_ID||' from F_XML_FORMS;';
  END IF;
  ------< Insert xml into DB >-----------------------------
  INSERT INTO F_XML_FORMS (
    FORMID, 
    XML, 
    STATUS, 
    FORM_TYPE,
    DATA_REG, 
    CUIIO,
    SEND_REQUEST,
    SEND_ATTEMPTS)
  VALUES(
    pREPORT_ID,
    pXML,
    2,
    pTYPEFORM,
    SYSDATE,
    V_CUIIO,
    1,
    (V_ATTEMPTS + 1)
  );
  P_RESULT := P_RESULT||'Insert reportId='||pREPORT_ID||' CUIIO='||V_CUIIO||' STATUS=2;';
  ---------------------------------------------------------
  EXCEPTION
    --< Any exception >--
    WHEN OTHERS THEN
      P_RESULT := 'Faild write xml in database reportId='||pREPORT_ID||' CUIIO='||V_CUIIO||' typeForm='||pTYPEFORM||' vattempts='||V_ATTEMPTS + 1||' exist='||V_REPORT_EXIST|| SUBSTRB(DBMS_UTILITY.FORMAT_ERROR_BACKTRACE||DBMS_UTILITY.FORMAT_ERROR_STACK||DBMS_UTILITY.FORMAT_CALL_STACK, 1, 400);
END WRITE_XML;


PROCEDURE MAPPING_REPORTS AS
  
  vFROMID        NUMBER;
  vTYPEFORM      VARCHAR2(50);
  vCONTROL       VARCHAR2(32767);
  vREZULTAT      VARCHAR2(32767);
  vCONTROL_MESS  VARCHAR2(32767);
  vFORM          NUMBER;
  vFORM_VERS     NUMBER;
  vTIP_PERIOADA  NUMBER;
  vPERIOADA      NUMBER;
  vCUIIO         NUMBER;
  vCUIIO_VERS    NUMBER;
  vCNT_CUIIO     NUMBER;
  vID_SCHEMA     NUMBER;
  vDYNAMIC_ROW_CAPI VARCHAR2(500);
  vDYNAMIC_ROW_CAPII VARCHAR2(500);
  vDYNAMIC_ROW_CAP VARCHAR2(500);
  vFILIAL_CAPI VARCHAR2(500);
  vFILIAL_CAPII VARCHAR2(500);
  vFILIAL_DYNAMIC_ROW_CAPI VARCHAR2(500);
  vFILIAL_DYNAMIC_ROW_CAPII VARCHAR2(500);
  vFILIAL_AGR       VARCHAR(500);
  pRESULT        SYS_REFCURSOR;
--------------------------------------------------------------------------------
  CURSOR cREPORTS IS
    SELECT
      F.FORMID,
      F.XML,
      F.STATUS,
      F.FORM_TYPE,
      F.DATA_REG,
      F.CUIIO,
      F.SEND_REQUEST,
      F.SEND_ATTEMPTS,
      F.PROCESSING_MESSAGE
    FROM
      F_XML_FORMS F
    WHERE
      F.STATUS IN (2)
--      AND F.FORMID IN (18851578)
      AND FORM_TYPE IN ('9_agr','m3','asa-21','1-inf.rev','65-auto-22','5-ci-22','ei-78','anc_conj','29_agr','24_agr','munca2_22','14_agr','15_agr','6_nr',
                        '5-con_22','16_agr','asa-22','1-inov','5-ci-23','4_agr','21_vinz','24_agr','1-turism_23','1-turism','1_chelt','1-ac','16_agr_23',
                        '3_agr','m1','29_agr24')
    AND ROWNUM < 13;
--      AND FORMID IN (20570853);
--------------------------------------------------------------------------------
  CURSOR cCHAPTER_NAME IS
    SELECT DISTINCT
      CHAPTER_NAME
    FROM
    (
    SELECT DISTINCT
              D1.XML_NODE_NAME AS CHAPTER_NAME,
              XML_NODE_ATTR
            FROM 
              XMLTABLE(
                DECODE(vTYPEFORM,'asa-21','/dec/DataSet/Data/*','65-auto-22','/dec/DataSet/Data/*','ei-78','/dec/DataSet/Data/*','asa-22','/dec/DataSet/Data/*',
                                 '1-turism_23','/dec/DataSet/Data/*','3_agr','/dec/DataSet/Data/*/*') PASSING   
                (SELECT  xmltype(XML) FROM F_XML_FORMS WHERE FORMID IN (vFROMID))
                 COLUMNS 
                 XML_NODE_NAME VARCHAR2(100) PATH 'name()',
                 XML_NODE_VALUE VARCHAR2(100) PATH 'text()',
                 XML_NODE_ATTR VARCHAR2(100) PATH '@line'
            ) D1
    )
    WHERE
      XML_NODE_ATTR IS NOT NULL
    ORDER BY
      CHAPTER_NAME; 
--------------------------------------------------------------------------------
  CURSOR cDYNAMIC_ROW_ALL(CHAPTER_PATH VARCHAR2) IS
    SELECT 
          D1.XML_NODE_ATTR AS LINES_NR
        FROM 
          XMLTABLE(CHAPTER_PATH PASSING   
            (SELECT  xmltype(XML) FROM F_XML_FORMS WHERE FORMID IN (vFROMID))
             COLUMNS 
             XML_NODE_NAME VARCHAR2(100) PATH 'name()',
             XML_NODE_VALUE VARCHAR2(100) PATH 'text()',
             XML_NODE_ATTR VARCHAR2(100) PATH '@line'
        ) D1
        ORDER BY ROWNUM;    
--------------------------------------------------------------------------------  
  CURSOR cDYNAMIC_ROW IS
    SELECT 
          D1.XML_NODE_ATTR AS LINES_NR
        FROM 
          XMLTABLE('/dec/DataSet/Data/CAPIa/CAPIa_R' PASSING   
            (SELECT  xmltype(XML) FROM F_XML_FORMS WHERE FORMID IN (vFROMID))
             COLUMNS 
             XML_NODE_NAME VARCHAR2(100) PATH 'name()',
             XML_NODE_VALUE VARCHAR2(100) PATH 'text()',
             XML_NODE_ATTR VARCHAR2(100) PATH '@line'
        ) D1
        ORDER BY ROWNUM;
--------------------------------------------------------------------------------
  CURSOR cFILIAL_CAPI IS
    SELECT
      C.XML_NODE_ATTR AS FILIAL_NR,
      CC.CODUL,
      CC.DENUMIRE
    FROM
    (
    SELECT 
              D1.XML_NODE_VALUE,
              D1.XML_NODE_ATTR
            FROM 
              XMLTABLE('/dec/DataSet/Data/CAPIa/CAPIa_CUATM_R' PASSING   
                (SELECT  xmltype(XML) FROM F_XML_FORMS WHERE FORMID IN (vFROMID))
                 COLUMNS 
                 XML_NODE_NAME VARCHAR2(100) PATH 'name()',
                 XML_NODE_VALUE VARCHAR2(100) PATH './CAPIa_CUATM_R',
                 XML_NODE_ATTR VARCHAR2(100) PATH '@line'
            ) D1
            ORDER BY ROWNUM
    ) C INNER JOIN VW_CL_CUATM CC ON (TRIM(TO_CHAR(C.XML_NODE_VALUE,'0000'))=SUBSTR(CC.CODUL,1,4));
--------------------------------------------------------------------------------
       
  CURSOR cFILIAL_DYNAMIC_ROW(FILIAL_NR NUMBER) IS
    SELECT DISTINCT
          D1.XML_NODE_ATTR AS LINES_NR
        FROM 
          XMLTABLE('/dec/DataSet/Data/CAPIa/CAPIa_FILIAL_R[@line=$LINE_NR]/CAPIa_R_INDEX' PASSING   
            (SELECT  xmltype(XML) FROM F_XML_FORMS WHERE FORMID IN (vFROMID)), FILIAL_NR AS "LINE_NR"
             COLUMNS 
             XML_NODE_NAME VARCHAR2(100) PATH 'name()',
             XML_NODE_VALUE VARCHAR2(100) PATH 'text()',
             XML_NODE_ATTR VARCHAR2(100) PATH '@line'
        ) D1
        ORDER BY D1.XML_NODE_ATTR ;
--Filials on Agriculture--------------------------------------------------------
  CURSOR cFILIAL_AGR IS
    SELECT
      C.XML_NODE_ATTR AS FILIAL_NR,
      CC.CODUL,
      CC.DENUMIRE
    FROM
    (
    SELECT 
              TRIM(TO_CHAR(D1.XML_NODE_VALUE,'0000')) AS XML_NODE_VALUE,
              D1.XML_NODE_ATTR
            FROM 
              XMLTABLE('/dec/DataSet/Data/CAP/CAP_R' PASSING   
                (SELECT  xmltype(XML) FROM F_XML_FORMS WHERE FORMID IN (vFROMID))
                 COLUMNS 
                 XML_NODE_NAME VARCHAR2(100) PATH 'name()',
                 XML_NODE_VALUE VARCHAR2(100) PATH './CAP_CUATM_FILIAL',
                 XML_NODE_ATTR VARCHAR2(100) PATH '@line'
            ) D1
            ORDER BY ROWNUM
    ) C INNER JOIN VW_CL_CUATM CC ON (TRIM(TO_CHAR(C.XML_NODE_VALUE,'0000'))=SUBSTR(CC.CODUL,1,4));
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
BEGIN
----------------------------
  FOR R in cREPORTS
  LOOP
    ------< Initialize parameter >---------------------------
    ------< Get from type >----------------------------------
    vCONTROL_MESS := '';
    SELECT  EXTRACTVALUE(XMLTYPE(XML), '/dec/@TypeName') INTO vTYPEFORM FROM F_XML_FORMS WHERE FORMID IN (R.FORMID);
    SELECT CUIIO, COUNT(CUIIO) INTO vCUIIO, vCNT_CUIIO FROM F_XML_FORMS WHERE FORMID IN (R.FORMID) GROUP BY CUIIO;
    vFROMID := R.FORMID;
    ---------------------------------------------------------
    ------< Get from and form_vers >-------------------------
    SELECT
      F.FORM,
      F.FORM_VERS,
      F.TIP_PERIOADA,
      F.ID_SCHEMA
      INTO
      vFORM,
      vFORM_VERS,
      vTIP_PERIOADA,
      vID_SCHEMA
    FROM
      MD_FORM F
      INNER JOIN
    (SELECT 
      F.FORM,
      MAX(F.FORM_VERS) AS FORM_VERS
    FROM
      MD_FORM F
    WHERE
      F.DEN_SHORT IN (DECODE(vTYPEFORM,'9_agr','Nr.9-AGR','m3','M3','asa-21','ASA','1-inf.rev','1-TIC','65-auto-22','65-auto','5-ci-22','5-CI','ei-78','EI 7 EI  8',
                             'anc_conj','Ancheta de Conjuctura','29_agr','Nr.29-AGR','24_agr','24-AGR','munca2_22','MUNCA 2','14_agr','14-AGR','15_agr','15-AGR',
                             '6_nr','Forma Nr.6','5-con_22','5-CON','16_agr','16-AGR','asa-22','ASA','1-inov','Nr. 1-INOV','5-ci-23','5-C','4_agr','Nr.4-AGR','24_agr','24-AGR',
                             '21_vinz','21-VINZ','1-turism_23','1-turism','1_chelt','Nr. 1-cheltuieli','1-ac','1-AC','16_agr_23','16-AGR','3_agr','NR. 3-AGR','m1','M1',
                             '29_agr24','Nr.29-AGR')) AND
      F.FORM NOT IN (46,27,30)
    GROUP BY
      F.FORM
    ) FF ON (F.FORM=FF.FORM AND F.FORM_VERS=FF.FORM_VERS)
    WHERE
      F.STATUT <> '3' AND
      F.DEN_SHORT IN (DECODE(vTYPEFORM,'9_agr','Nr.9-AGR','m3','M3','asa-21','ASA','1-inf.rev','1-TIC','65-auto-22','65-auto','5-ci-22','5-CI','ei-78','EI 7 EI  8',
                             'anc_conj','Ancheta de Conjuctura','29_agr','Nr.29-AGR','24_agr','24-AGR','munca2_22','MUNCA 2','14_agr','14-AGR','15_agr','15-AGR',
                             '6_nr','Forma Nr.6','5-con_22','5-CON','16_agr','16-AGR','asa-22','ASA','1-inov','Nr. 1-INOV','5-ci-23','5-C','4_agr','Nr.4-AGR','24_agr','24-AGR',
                             '21_vinz','21-VINZ','1-turism_23','1-turism','1_chelt','Nr. 1-cheltuieli','1-ac','1-AC','16_agr_23','16-AGR','3_agr','NR. 3-AGR','m1','M1',
                             '29_agr24','Nr.29-AGR'));
    ---------------------------------------------------------
    ------< Get period for questionaire >--------------------
    IF vTIP_PERIOADA IN (7) THEN
        SELECT
          P.PERIOADA INTO vPERIOADA
        FROM
          MD_PERIOADA P
        WHERE
          P.TIP_PERIOADA IN (vTIP_PERIOADA) AND
          P.ANUL IN (SELECT TO_NUMBER(EXTRACT(XMLTYPE(XML), '/dec/DataSet/Header/YEAR/text()')) FROM F_XML_FORMS WHERE FORMID IN (R.FORMID));
    ELSIF vTIP_PERIOADA IN (5) THEN
        SELECT
          P.PERIOADA INTO vPERIOADA
        FROM
          MD_PERIOADA P
        WHERE
          P.TIP_PERIOADA IN (vTIP_PERIOADA) AND
          P.ANUL||'_'||P.NUM IN (SELECT  EXTRACT(XMLTYPE(XML), '/dec/DataSet/Header/YEAR/text()')||'_'||CASE WHEN FORM_TYPE IN ('29_agr24') THEN 4 ELSE
                             TO_NUMBER(EXTRACT(XMLTYPE(XML), '/dec/DataSet/Header/TRIM/text()')) END  FROM F_XML_FORMS WHERE FORMID IN (R.FORMID));
    ELSIF vTIP_PERIOADA IN (4) THEN
        SELECT
          P.PERIOADA INTO vPERIOADA
        FROM
          MD_PERIOADA P
        WHERE
          P.TIP_PERIOADA IN (vTIP_PERIOADA) AND
          P.ANUL||'_'||P.NUM IN (SELECT  EXTRACT(XMLTYPE(XML), '/dec/DataSet/Header/YEAR/text()')||'_'||
                             CASE WHEN FORM_TYPE IN ('munca2_22') THEN 9 ELSE TO_NUMBER(EXTRACT(XMLTYPE(XML), '/dec/DataSet/Header/MONTH/text()')) END FROM F_XML_FORMS WHERE FORMID IN (R.FORMID));
    END IF;
    ---------------------------------------------------------
    --------< check CUIIO of questionaire >------------------
    IF vCUIIO IS NULL THEN
      SELECT
        CUIIO,
        COUNT(CUIIO) INTO vCUIIO, vCNT_CUIIO
      FROM
        IDNO_CUIIO_CIS2
      WHERE
        IDNO LIKE (SELECT TO_NUMBER(EXTRACT(XMLTYPE(XML), '/dec/DataSet/Header/IDNO/text()')) FROM F_XML_FORMS WHERE FORMID IN (R.FORMID))
      GROUP BY
        CUIIO;
    ELSE
      SELECT
        COUNT(CUIIO) INTO vCNT_CUIIO
      FROM
        IDNO_CUIIO_CIS2
      WHERE
        IDNO||'_'||CUIIO LIKE (SELECT TO_NUMBER(EXTRACT(XMLTYPE(XML), '/dec/DataSet/Header/IDNO/text()'))||'_'||
                                    TO_NUMBER(EXTRACT(XMLTYPE(XML), '/dec/DataSet/Header/CUIIO/text()')) FROM F_XML_FORMS WHERE FORMID IN (R.FORMID));
    END IF;
    IF vCNT_CUIIO = 0 THEN
      UPDATE F_XML_FORMS SET STATUS=3, PROCESSING_MESSAGE = 'Intreprinderea dumneavoastra are CUIIO sau IDNO gresit' WHERE FORMID IN (vFROMID);
      CONTINUE;
    ELSE
        ----------Get CUIIO_VERS-----------------------------
        BEGIN
          SELECT
            DISTINCT
            R.CUIIO,
            FC.CUIIO_VERS INTO vCUIIO, vCUIIO_VERS
          FROM
            RENIM R
            INNER JOIN FORM_CUIIO FC ON (R.CUIIO=FC.CUIIO AND R.CUIIO_VERS=FC.CUIIO_VERS AND R.ID_SCHEMA=FC.ID_SCHEMA)
            INNER JOIN (
          SELECT
            DISTINCT
                R.CUIIO,
                MAX(R.CUIIO_VERS) AS CUIIO_VERS
              FROM
                RENIM R
                INNER JOIN FORM_CUIIO FC ON (R.CUIIO=FC.CUIIO AND R.CUIIO_VERS=FC.CUIIO_VERS AND R.ID_SCHEMA=FC.ID_SCHEMA)
              WHERE
                R.CUIIO_VERS <= vPERIOADA AND
                FC.FORM IN (vFORM) AND
                FC.ID_SCHEMA=vID_SCHEMA
              GROUP BY
                R.CUIIO) D ON (R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS)
          WHERE
            FC.FORM IN (vFORM) AND
            FC.STATUT <> '3' AND
            FC.CUIIO IN (vCUIIO) AND
            FC.ID_SCHEMA=vID_SCHEMA;
        EXCEPTION
          WHEN NO_DATA_FOUND THEN
            UPDATE F_XML_FORMS SET STATUS=3, PROCESSING_MESSAGE = 'Intreprinderea dumneavoastra nu a nimerit in esantion.' WHERE FORMID IN (vFROMID);
          CONTINUE;
        END;
        ------------------------------------------------------
        ------------< Delete data from FORMS >----------------
        DELETE FROM DATA_ALL_FOR_VALIDATE WHERE T_XML_FORM_ID IN (R.FORMID);
        ------------------------------------------------------
        ------------< Inser data >----------------------------
        IF (vFORM IN (3)) THEN
            --Insert main row exclude 02-12 from chapter I, II
            INSERT INTO DATA_ALL_FOR_VALIDATE(PERIOADA,FORM,FORM_VERS,CUIIO,CUIIO_VERS,ID_MD,DATA_REG,ID_USER,COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9,COL10,COL11,
                                              T_XML_FORM_ID,CREATED_DATE,ID_SCHEMA)
            SELECT
              vPERIOADA,
              vFORM,
              vFORM_VERS,
              vCUIIO,
              vCUIIO_VERS,
    --          RR.CAPITOL,
    --          RR.RIND,
              RR.ID_MD,
              SYSDATE AS DATA_REG,
              9999 AS ID_USER,
              D.COL1,D.COL2,D.COL3,D.COL4,D.COL5,D.COL6,D.COL7,D.COL8,D.COL9,D.COL10,D.COL11,
              R.FORMID,--T_XML_FORM_ID from F_XML_FORMS
              SYSDATE AS CREATED_DATE,
              vID_SCHEMA
            FROM
            (
            SELECT
              SUBSTR(D.XML_NODE_NAME,0, INSTR(D.XML_NODE_NAME,'_C')-1) AS NR_ROW,
              SUM(CASE WHEN INSTR(D.XML_NODE_NAME,'CAPIa_') > 0 OR INSTR(D.XML_NODE_NAME,'CAPII_') > 0 THEN 
                  /*SUBSTR(CASE WHEN D.XML_NODE_NAME LIKE '%_C1' THEN D.XML_NODE_VALUE END,2,4)*/ NULL ELSE 
                  CASE WHEN D.XML_NODE_NAME LIKE '%_C1' THEN D.XML_NODE_VALUE END 
              END) AS COL1,
              SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C2%' THEN D.XML_NODE_VALUE END) AS COL2,
              SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C3%' THEN D.XML_NODE_VALUE END) AS COL3,
              SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C4%' THEN D.XML_NODE_VALUE END) AS COL4,
              SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C5%' THEN D.XML_NODE_VALUE END) AS COL5,
              SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C6%' THEN D.XML_NODE_VALUE END) AS COL6,
              SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C7%' THEN D.XML_NODE_VALUE END) AS COL7,
              SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C8%' THEN D.XML_NODE_VALUE END) AS COL8,
              SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C9%' THEN D.XML_NODE_VALUE END) AS COL9,
              SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C10%' THEN D.XML_NODE_VALUE END) AS COL10,
              SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C11%' THEN D.XML_NODE_VALUE END) AS COL11
            FROM
            (
            SELECT 
              XML_NODE_NAME,
              XML_NODE_VALUE
            FROM 
              XMLTABLE('//dec/DataSet/Data/*' PASSING   
                (SELECT  xmltype(XML) FROM F_XML_FORMS WHERE FORMID IN (R.FORMID))
                 COLUMNS 
                 XML_NODE_NAME VARCHAR2(100) PATH 'name()',
                 XML_NODE_VALUE VARCHAR2(100) PATH 'text()' 
            )
            ) D
            GROUP BY
              SUBSTR(D.XML_NODE_NAME,0, INSTR(D.XML_NODE_NAME,'_C')-1)
            ORDER BY
              SUBSTR(D.XML_NODE_NAME,0, INSTR(D.XML_NODE_NAME,'_C')-1)
            ) D
            INNER JOIN
              (
                SELECT
                  R.FORM,
                  R.FORM_VERS,
                  C.DEN_SHORT,
                  C.CAPITOL,
                  C.CAPITOL_VERS,
                  R.RIND,
                  R.RIND_VERS,
                  R.ID_MD
                FROM
                  MD_RIND R
                  INNER JOIN MD_CAPITOL C ON (R.CAPITOL=C.CAPITOL AND R.CAPITOL_VERS=C.CAPITOL_VERS AND R.ID_SCHEMA=C.ID_SCHEMA)
                  INNER JOIN (
                     SELECT
                      R.CAPITOL,
                      MAX(R.CAPITOL_VERS) AS CAPITOL_VERS,
                      R.RIND,
                      MAX(R.RIND_VERS) AS RIND_VERS,
                      R.ID_SCHEMA
                    FROM
                      MD_RIND R
                      INNER JOIN (SELECT DISTINCT
                                  C.CAPITOL,
                                  MAX(C.CAPITOL_VERS)AS CAPITOL_VERS
                                FROM
                                  MD_CAPITOL C
                                  INNER JOIN MD_RIND R ON (R.CAPITOL=C.CAPITOL AND R.CAPITOL_VERS=C.CAPITOL_VERS AND C.ID_SCHEMA=R.ID_SCHEMA)
                                WHERE
                                  R.FORM IN (vFORM) AND
                                  R.ID_SCHEMA IN (vID_SCHEMA) AND
                                  C.CAPITOL_VERS <= (vPERIOADA)
                                GROUP BY
                                  C.CAPITOL) C ON (R.CAPITOL=C.CAPITOL AND R.CAPITOL_VERS=C.CAPITOL_VERS)
                    WHERE
                      R.FORM IN (vFORM) AND
                      R.ID_SCHEMA IN (vID_SCHEMA) AND
                      R.RIND_VERS <= (vPERIOADA)
                    GROUP BY
                      R.CAPITOL,
                      R.RIND,
                      R.ID_SCHEMA
                  ) RR ON (R.RIND=RR.RIND AND R.RIND_VERS=RR.RIND_VERS AND C.CAPITOL=RR.CAPITOL AND C.CAPITOL_VERS=RR.CAPITOL_VERS AND R.ID_SCHEMA=RR.ID_SCHEMA)
                WHERE
                  R.FORM IN (vFORM) AND
                  R.ID_SCHEMA IN (vID_SCHEMA) AND
                  R.STATUT <> '3' AND
                  C.STATUT <> '3' AND
                  C.CAPITOL NOT IN (100)
                ORDER BY
                  R.CAPITOL,
                  R.RIND) RR ON (D.NR_ROW = CASE WHEN RR.FORM IN (vFORM) THEN 
                  DECODE(RR.DEN_SHORT,'Cap. I-a','CAPIa','Cap. II','CAPII','Cap. III','CAPIII','Cap. V','CAPV')||'_R'||RR.RIND ELSE RR.DEN_SHORT||'_R'||RR.RIND END);
                
                --Insert row from 02 from chapter I, II----------------------------------------------------------------------
                FOR DYNAMIC_ROW IN cDYNAMIC_ROW
                  LOOP
                    vDYNAMIC_ROW_CAPI := '/dec/DataSet/Data/CAPIa/CAPIa_R[@line='||DYNAMIC_ROW.LINES_NR||']/*';
                    vDYNAMIC_ROW_CAPII := '/dec/DataSet/Data/CAPII/CAPII_R[@line='||DYNAMIC_ROW.LINES_NR||']/*';
                    INSERT INTO DATA_ALL_FOR_VALIDATE(PERIOADA,FORM,FORM_VERS,CUIIO,CUIIO_VERS,ID_MD,DATA_REG,ID_USER,COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9,COL10,COL11,
                                              T_XML_FORM_ID,CREATED_DATE,ID_SCHEMA)
                            SELECT
                              vPERIOADA,
                              vFORM,
                              vFORM_VERS,
                              vCUIIO,
                              vCUIIO_VERS,
                    --          RR.CAPITOL,
                    --          RR.RIND,
                              RR.ID_MD,
                              SYSDATE AS DATA_REG,
                              9999 AS ID_USER,
                              D.COL1,D.COL2,D.COL3,D.COL4,D.COL5,D.COL6,D.COL7,D.COL8,D.COL9,D.COL10,D.COL11,
                              R.FORMID,--T_XML_FORM_ID from F_XML_FORMS
                              SYSDATE AS CREATED_DATE,
                              vID_SCHEMA
                            FROM
                            (SELECT
                          SUBSTR(D.XML_NODE_NAME,0, INSTR(D.XML_NODE_NAME,'_C')-1) AS NR_ROW,
                          SUM(SUBSTR(CASE WHEN D.XML_NODE_NAME LIKE '%_C1' THEN D.XML_NODE_VALUE END,2,4)) AS COL1,
                          SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C2' THEN D.XML_NODE_VALUE END) AS COL2,
                          SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C3' THEN D.XML_NODE_VALUE END) AS COL3,
                          SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C4' THEN D.XML_NODE_VALUE END) AS COL4,
                          SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C5' THEN D.XML_NODE_VALUE END) AS COL5,
                          SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C6' THEN D.XML_NODE_VALUE END) AS COL6,
                          SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C7' THEN D.XML_NODE_VALUE END) AS COL7,
                          SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C8' THEN D.XML_NODE_VALUE END) AS COL8,
                          SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C9' THEN D.XML_NODE_VALUE END) AS COL9,
                          SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C10' THEN D.XML_NODE_VALUE END) AS COL10,
                          SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C11' THEN D.XML_NODE_VALUE END) AS COL11
                        FROM
                        (
                SELECT
                  REPLACE(NAME,'_R-','_R'||TRIM(TO_CHAR(NEW_NODE_VALUE,'00'))||'-') AS XML_NODE_NAME,
                  NODE_VALUE AS XML_NODE_VALUE,
                  ORDINE
                FROM
                (
                SELECT 
                          D1.XML_NODE_NAME AS NAME,
                          D1.XML_NODE_VALUE AS NODE_VALUE,
                          D2.XML_NODE_VALUE AS NEW_NODE_VALUE,
                          D1.XML_NODE_ATTR,
                          ROWNUM AS ORDINE
                        FROM 
                          XMLTABLE(vDYNAMIC_ROW_CAPI PASSING   
                            (SELECT  xmltype(XML) FROM F_XML_FORMS WHERE FORMID IN (R.FORMID))
                             COLUMNS 
                             XML_NODE_NAME VARCHAR2(100) PATH 'name()',
                             XML_NODE_VALUE VARCHAR2(100) PATH 'text()',
                             XML_NODE_ATTR VARCHAR2(100) PATH '@line'
                        ) D1 CROSS JOIN
                        XMLTABLE(REPLACE(vDYNAMIC_ROW_CAPI,'*','CAPIa_R_INDEX') PASSING   
                            (SELECT  xmltype(XML) FROM F_XML_FORMS WHERE FORMID IN (R.FORMID))
                             COLUMNS 
                             XML_NODE_NAME VARCHAR2(100) PATH 'name()',
                             XML_NODE_VALUE VARCHAR2(100) PATH 'text()',
                             XML_NODE_ATTR VARCHAR2(100) PATH '@line'
                        ) D2 --ON (D1.XML_NODE_VALUE=D2.XML_NODE_VALUE)
                        ORDER BY ROWNUM
                )
                )D
                WHERE
                  SUBSTR(D.XML_NODE_NAME,0, INSTR(D.XML_NODE_NAME,'_C')-1) IS NOT NULL
                GROUP BY
                  SUBSTR(D.XML_NODE_NAME,0, INSTR(D.XML_NODE_NAME,'_C')-1)
                UNION ALL
                SELECT
                          SUBSTR(D.XML_NODE_NAME,0, INSTR(D.XML_NODE_NAME,'_C')-1) AS NR_ROW,
                          SUM(SUBSTR(CASE WHEN D.XML_NODE_NAME LIKE '%_C1' THEN D.XML_NODE_VALUE END,2,4)) AS COL1,
                          SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C2' THEN D.XML_NODE_VALUE END) AS COL2,
                          SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C3' THEN D.XML_NODE_VALUE END) AS COL3,
                          SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C4' THEN D.XML_NODE_VALUE END) AS COL4,
                          SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C5' THEN D.XML_NODE_VALUE END) AS COL5,
                          SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C6' THEN D.XML_NODE_VALUE END) AS COL6,
                          SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C7' THEN D.XML_NODE_VALUE END) AS COL7,
                          SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C8' THEN D.XML_NODE_VALUE END) AS COL8,
                          SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C9' THEN D.XML_NODE_VALUE END) AS COL9,
                          SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C10' THEN D.XML_NODE_VALUE END) AS COL10,
                          SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C11' THEN D.XML_NODE_VALUE END) AS COL11
                        FROM
                        (
                SELECT
                  REPLACE(NAME,'_R-','_R'||TRIM(TO_CHAR(NEW_NODE_VALUE,'00'))||'-') AS XML_NODE_NAME,
                  NODE_VALUE AS XML_NODE_VALUE,
                  ORDINE
                FROM
                (
                SELECT 
                          D1.XML_NODE_NAME AS NAME,
                          D1.XML_NODE_VALUE AS NODE_VALUE,
                          D2.XML_NODE_VALUE AS NEW_NODE_VALUE,
                          D1.XML_NODE_ATTR,
                          ROWNUM AS ORDINE
                        FROM 
                          XMLTABLE(vDYNAMIC_ROW_CAPII PASSING   
                            (SELECT  xmltype(XML) FROM F_XML_FORMS WHERE FORMID IN (R.FORMID))
                             COLUMNS 
                             XML_NODE_NAME VARCHAR2(100) PATH 'name()',
                             XML_NODE_VALUE VARCHAR2(100) PATH 'text()',
                             XML_NODE_ATTR VARCHAR2(100) PATH '@line'
                        ) D1 CROSS JOIN
                        XMLTABLE(REPLACE(vDYNAMIC_ROW_CAPII,'*','CAPII_R_INDEX') PASSING   
                            (SELECT  xmltype(XML) FROM F_XML_FORMS WHERE FORMID IN (R.FORMID))
                             COLUMNS 
                             XML_NODE_NAME VARCHAR2(100) PATH 'name()',
                             XML_NODE_VALUE VARCHAR2(100) PATH 'text()',
                             XML_NODE_ATTR VARCHAR2(100) PATH '@line'
                        ) D2 --ON (D1.XML_NODE_VALUE=D2.XML_NODE_VALUE)
                        ORDER BY ROWNUM
                )
                )D
                WHERE
                  SUBSTR(D.XML_NODE_NAME,0, INSTR(D.XML_NODE_NAME,'_C')-1) IS NOT NULL
                GROUP BY
                  SUBSTR(D.XML_NODE_NAME,0, INSTR(D.XML_NODE_NAME,'_C')-1)
                ) D
                            INNER JOIN
                              (
                                SELECT
                                  R.FORM,
                                  R.FORM_VERS,
                                  C.DEN_SHORT,
                                  C.CAPITOL,
                                  C.CAPITOL_VERS,
                                  R.RIND,
                                  R.RIND_VERS,
                                  R.ID_MD
                                FROM
                                  MD_RIND R
                                  INNER JOIN MD_CAPITOL C ON (R.CAPITOL=C.CAPITOL AND R.CAPITOL_VERS=C.CAPITOL_VERS AND R.ID_SCHEMA=C.ID_SCHEMA)
                                  INNER JOIN (
                                     SELECT
                                      R.CAPITOL,
                                      MAX(R.CAPITOL_VERS) AS CAPITOL_VERS,
                                      R.RIND,
                                      MAX(R.RIND_VERS) AS RIND_VERS,
                                      R.ID_SCHEMA
                                    FROM
                                      MD_RIND R
                                      INNER JOIN (SELECT DISTINCT
                                                  C.CAPITOL,
                                                  MAX(C.CAPITOL_VERS)AS CAPITOL_VERS
                                                FROM
                                                  MD_CAPITOL C
                                                  INNER JOIN MD_RIND R ON (R.CAPITOL=C.CAPITOL AND R.CAPITOL_VERS=C.CAPITOL_VERS AND C.ID_SCHEMA=R.ID_SCHEMA)
                                                WHERE
                                                  R.FORM IN (vFORM) AND
                                                  R.ID_SCHEMA IN (vID_SCHEMA) AND
                                                  C.CAPITOL_VERS <= (vPERIOADA)
                                                GROUP BY
                                                  C.CAPITOL) C ON (R.CAPITOL=C.CAPITOL AND R.CAPITOL_VERS=C.CAPITOL_VERS)
                                    WHERE
                                      R.FORM IN (vFORM) AND
                                      R.ID_SCHEMA IN (vID_SCHEMA) AND
                                      R.RIND_VERS <= (vPERIOADA)
                                    GROUP BY
                                      R.CAPITOL,
                                      R.RIND,
                                      R.ID_SCHEMA
                                  ) RR ON (R.RIND=RR.RIND AND R.RIND_VERS=RR.RIND_VERS AND C.CAPITOL=RR.CAPITOL AND C.CAPITOL_VERS=RR.CAPITOL_VERS AND R.ID_SCHEMA=RR.ID_SCHEMA)
                                WHERE
                                  R.FORM IN (vFORM) AND
                                  R.ID_SCHEMA IN (vID_SCHEMA) AND
                                  R.STATUT <> '3' AND
                                  C.STATUT <> '3' AND
                                  C.CAPITOL NOT IN (100)
                                ORDER BY
                                  R.CAPITOL,
                                  R.RIND) RR ON (D.NR_ROW = CASE WHEN RR.FORM IN (vFORM) THEN 
                                  DECODE(RR.DEN_SHORT,'Cap. I-a','CAPIa','Cap. II','CAPII','Cap. III','CAPIII','Cap. V','CAPV')||'_R'||RR.RIND ELSE RR.DEN_SHORT||'_R'||RR.RIND END);
                  END LOOP;
                  
                  --Insert Filial -----------------------------------------------------
                  FOR FILIAL IN cFILIAL_CAPI
                  LOOP
                    vFILIAL_CAPI := '/dec/DataSet/Data/CAPIa/CAPIa_FILIAL_R[@line='||FILIAL.FILIAL_NR||']/*';
                    vFILIAL_CAPII := '/dec/DataSet/Data/CAPII/CAPII_FILIAL_R[@line='||FILIAL.FILIAL_NR||']/*';
                    --Insert row 00,01------------------------------------------
                    INSERT INTO DATA_ALL_FOR_VALIDATE(PERIOADA,FORM,FORM_VERS,CUIIO,CUIIO_VERS,ID_MD,DATA_REG,ID_USER,FILIAL,COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9,COL10,COL11,
                                              T_XML_FORM_ID,CREATED_DATE,ID_SCHEMA)
                    SELECT
                      vPERIOADA,
                      vFORM,
                      vFORM_VERS,
                      vCUIIO,
                      vCUIIO_VERS,
        --              RR.CAPITOL,
        --              RR.RIND,
                      RR.ID_MD,
                      SYSDATE AS DATA_REG,
                      9999 AS ID_USER,
                      FILIAL.CODUL,
                      D.COL1,D.COL2,D.COL3,D.COL4,D.COL5,D.COL6,D.COL7,D.COL8,D.COL9,D.COL10,D.COL11,
                      R.FORMID,--T_XML_FORM_ID from F_XML_FORMS
                      SYSDATE AS CREATED_DATE,
                      vID_SCHEMA
                    FROM
                    (
                    SELECT
                      SUBSTR(D.XML_NODE_NAME,0, INSTR(D.XML_NODE_NAME,'_C')-1) AS NR_ROW,
                      SUM(CASE WHEN INSTR(D.XML_NODE_NAME,'CAPIa_') > 0 OR INSTR(D.XML_NODE_NAME,'CAPII_') > 0 THEN 
                          /*SUBSTR(CASE WHEN D.XML_NODE_NAME LIKE '%_C1' THEN D.XML_NODE_VALUE END,2,4)*/ NULL ELSE 
                          CASE WHEN D.XML_NODE_NAME LIKE '%_C1' THEN D.XML_NODE_VALUE END 
                      END) AS COL1,
                      SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C2%' THEN D.XML_NODE_VALUE END) AS COL2,
                      SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C3%' THEN D.XML_NODE_VALUE END) AS COL3,
                      SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C4%' THEN D.XML_NODE_VALUE END) AS COL4,
                      SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C5%' THEN D.XML_NODE_VALUE END) AS COL5,
                      SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C6%' THEN D.XML_NODE_VALUE END) AS COL6,
                      SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C7%' THEN D.XML_NODE_VALUE END) AS COL7,
                      SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C8%' THEN D.XML_NODE_VALUE END) AS COL8,
                      SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C9%' THEN D.XML_NODE_VALUE END) AS COL9,
                      SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C10%' THEN D.XML_NODE_VALUE END) AS COL10,
                      SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C11%' THEN D.XML_NODE_VALUE END) AS COL11
                    FROM
                    (
                    SELECT 
                      XML_NODE_NAME,
                      XML_NODE_VALUE
                    FROM 
                      XMLTABLE(vFILIAL_CAPI PASSING   
                        (SELECT  xmltype(XML) FROM F_XML_FORMS WHERE FORMID IN (R.FORMID))
                         COLUMNS 
                         XML_NODE_NAME VARCHAR2(100) PATH 'name()',
                         XML_NODE_VALUE VARCHAR2(100) PATH 'text()' 
                    )
                    UNION
                    SELECT 
                      XML_NODE_NAME,
                      XML_NODE_VALUE
                    FROM 
                      XMLTABLE(vFILIAL_CAPII PASSING   
                        (SELECT  xmltype(XML) FROM F_XML_FORMS WHERE FORMID IN (R.FORMID))
                         COLUMNS 
                         XML_NODE_NAME VARCHAR2(100) PATH 'name()',
                         XML_NODE_VALUE VARCHAR2(100) PATH 'text()' 
                    )
                    ) D
                    GROUP BY
                      SUBSTR(D.XML_NODE_NAME,0, INSTR(D.XML_NODE_NAME,'_C')-1)
                    ORDER BY
                      SUBSTR(D.XML_NODE_NAME,0, INSTR(D.XML_NODE_NAME,'_C')-1)
                    ) D
                    INNER JOIN
                      (
                        SELECT
                          R.FORM,
                          R.FORM_VERS,
                          C.DEN_SHORT,
                          C.CAPITOL,
                          C.CAPITOL_VERS,
                          R.RIND,
                          R.RIND_VERS,
                          R.ID_MD
                        FROM
                          MD_RIND R
                          INNER JOIN MD_CAPITOL C ON (R.CAPITOL=C.CAPITOL AND R.CAPITOL_VERS=C.CAPITOL_VERS AND R.ID_SCHEMA=C.ID_SCHEMA)
                          INNER JOIN (
                             SELECT
                              R.CAPITOL,
                              MAX(R.CAPITOL_VERS) AS CAPITOL_VERS,
                              R.RIND,
                              MAX(R.RIND_VERS) AS RIND_VERS,
                              R.ID_SCHEMA
                            FROM
                              MD_RIND R
                              INNER JOIN (SELECT DISTINCT
                                          C.CAPITOL,
                                          MAX(C.CAPITOL_VERS)AS CAPITOL_VERS
                                        FROM
                                          MD_CAPITOL C
                                          INNER JOIN MD_RIND R ON (R.CAPITOL=C.CAPITOL AND R.CAPITOL_VERS=C.CAPITOL_VERS AND C.ID_SCHEMA=R.ID_SCHEMA)
                                        WHERE
                                          R.FORM IN (vFORM) AND
                                          R.ID_SCHEMA IN (vID_SCHEMA) AND
                                          C.CAPITOL_VERS <= (vPERIOADA)
                                        GROUP BY
                                          C.CAPITOL) C ON (R.CAPITOL=C.CAPITOL AND R.CAPITOL_VERS=C.CAPITOL_VERS)
                            WHERE
                              R.FORM IN (vFORM) AND
                              R.ID_SCHEMA IN (vID_SCHEMA) AND
                              R.RIND_VERS <= (vPERIOADA)
                            GROUP BY
                              R.CAPITOL,
                              R.RIND,
                              R.ID_SCHEMA
                          ) RR ON (R.RIND=RR.RIND AND R.RIND_VERS=RR.RIND_VERS AND C.CAPITOL=RR.CAPITOL AND C.CAPITOL_VERS=RR.CAPITOL_VERS AND R.ID_SCHEMA=RR.ID_SCHEMA)
                        WHERE
                          R.FORM IN (vFORM) AND
                          R.ID_SCHEMA IN (vID_SCHEMA) AND
                          R.STATUT <> '3' AND
                          C.STATUT <> '3' AND
                          C.CAPITOL NOT IN (100)
                        ORDER BY
                          R.CAPITOL,
                          R.RIND) RR ON (D.NR_ROW = CASE WHEN RR.FORM IN (vFORM) THEN 
                          DECODE(RR.DEN_SHORT,'Cap. I-a','CAPIa','Cap. II','CAPII','Cap. III','CAPIII','Cap. V','CAPV')||'_R'||RR.RIND ELSE RR.DEN_SHORT||'_R'||RR.RIND END);
                    
                    FOR FILIAL_DYNAMIC_ROW IN cFILIAL_DYNAMIC_ROW(FILIAL.FILIAL_NR)
                    LOOP
                        --Insert row after 01---------------------------------------
                        vFILIAL_DYNAMIC_ROW_CAPI := '/dec/DataSet/Data/CAPIa/CAPIa_FILIAL_R[@line='||FILIAL.FILIAL_NR||']/*[@line='||FILIAL_DYNAMIC_ROW.LINES_NR||']';
                        vFILIAL_DYNAMIC_ROW_CAPII := '/dec/DataSet/Data/CAPII/CAPII_FILIAL_R[@line='||FILIAL.FILIAL_NR||']/*[@line='||FILIAL_DYNAMIC_ROW.LINES_NR||']';
                        INSERT INTO DATA_ALL_FOR_VALIDATE(PERIOADA,FORM,FORM_VERS,CUIIO,CUIIO_VERS,ID_MD,DATA_REG,ID_USER,FILIAL,COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9,COL10,COL11,
                                                  T_XML_FORM_ID,CREATED_DATE,ID_SCHEMA)
                        SELECT
                                  vPERIOADA,
                                  vFORM,
                                  vFORM_VERS,
                                  vCUIIO,
                                  vCUIIO_VERS,
    --                              RR.CAPITOL,
    --                              RR.RIND,
                                  RR.ID_MD,
                                  SYSDATE AS DATA_REG,
                                  9999 AS ID_USER,
                                  FILIAL.CODUL,
                                  D.COL1,D.COL2,D.COL3,D.COL4,D.COL5,D.COL6,D.COL7,D.COL8,D.COL9,D.COL10,D.COL11,
                                  R.FORMID,--T_XML_FORM_ID from F_XML_FORMS
                                  SYSDATE AS CREATED_DATE,
                                  vID_SCHEMA
                                FROM
                                (SELECT
                              SUBSTR(D.XML_NODE_NAME,0, INSTR(D.XML_NODE_NAME,'_C')-1) AS NR_ROW,
                              SUM(SUBSTR(CASE WHEN D.XML_NODE_NAME LIKE '%_C1_FILIAL' THEN D.XML_NODE_VALUE END,2,4)) AS COL1,
                              SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C2_FILIAL' THEN D.XML_NODE_VALUE END) AS COL2,
                              SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C3_FILIAL' THEN D.XML_NODE_VALUE END) AS COL3,
                              SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C4_FILIAL' THEN D.XML_NODE_VALUE END) AS COL4,
                              SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C5_FILIAL' THEN D.XML_NODE_VALUE END) AS COL5,
                              SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C6_FILIAL' THEN D.XML_NODE_VALUE END) AS COL6,
                              SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C7_FILIAL' THEN D.XML_NODE_VALUE END) AS COL7,
                              SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C8_FILIAL' THEN D.XML_NODE_VALUE END) AS COL8,
                              SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C9_FILIAL' THEN D.XML_NODE_VALUE END) AS COL9,
                              SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C10_FILIAL' THEN D.XML_NODE_VALUE END) AS COL10,
                              SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C11_FILIAL' THEN D.XML_NODE_VALUE END) AS COL11
                            FROM
                            (
                                    SELECT
                                      REPLACE(NAME,'_R-','_R'||TRIM(TO_CHAR(NEW_NODE_VALUE,'00'))||'-') AS XML_NODE_NAME,
                                      NODE_VALUE AS XML_NODE_VALUE,
                                      ORDINE
                                    FROM
                                    (
                                    SELECT 
                                              D1.XML_NODE_NAME AS NAME,
                                              D1.XML_NODE_VALUE AS NODE_VALUE,
                                              D2.XML_NODE_VALUE AS NEW_NODE_VALUE,
                                              D1.XML_NODE_ATTR,
                                              ROWNUM AS ORDINE
                                            FROM 
                                              XMLTABLE(vFILIAL_DYNAMIC_ROW_CAPI PASSING   
                                                (SELECT  xmltype(XML) FROM F_XML_FORMS WHERE FORMID IN (R.FORMID))
                                                 COLUMNS 
                                                 XML_NODE_NAME VARCHAR2(100) PATH './*/name()',
                                                 XML_NODE_VALUE VARCHAR2(100) PATH './*/text()',
                                                 XML_NODE_ATTR VARCHAR2(100) PATH './@line'
                                            ) D1 CROSS JOIN
                                            XMLTABLE(REPLACE(vFILIAL_DYNAMIC_ROW_CAPI,'*','CAPIa_R_INDEX') PASSING   
                                                (SELECT  xmltype(XML) FROM F_XML_FORMS WHERE FORMID IN (R.FORMID))
                                                 COLUMNS 
                                                 XML_NODE_NAME VARCHAR2(100) PATH './*/name()',
                                                 XML_NODE_VALUE VARCHAR2(100) PATH './*/text()',
                                                 XML_NODE_ATTR VARCHAR2(100) PATH './@line'
                                            ) D2 --ON (D1.XML_NODE_VALUE=D2.XML_NODE_VALUE)
                                            
                            WHERE
                              D1.XML_NODE_ATTR IS NOT NULL
                                            ORDER BY ROWNUM
                                    )
                                    )D
                                    WHERE
                                      SUBSTR(D.XML_NODE_NAME,0, INSTR(D.XML_NODE_NAME,'_C')-1) IS NOT NULL
                                    GROUP BY
                                      SUBSTR(D.XML_NODE_NAME,0, INSTR(D.XML_NODE_NAME,'_C')-1)
                                    UNION ALL
                                    SELECT
                                              SUBSTR(D.XML_NODE_NAME,0, INSTR(D.XML_NODE_NAME,'_C')-1) AS NR_ROW,
                                              SUM(SUBSTR(CASE WHEN D.XML_NODE_NAME LIKE '%_C1_FILIAL' THEN D.XML_NODE_VALUE END,2,4)) AS COL1,
                                              SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C2_FILIAL' THEN D.XML_NODE_VALUE END) AS COL2,
                                              SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C3_FILIAL' THEN D.XML_NODE_VALUE END) AS COL3,
                                              SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C4_FILIAL' THEN D.XML_NODE_VALUE END) AS COL4,
                                              SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C5_FILIAL' THEN D.XML_NODE_VALUE END) AS COL5,
                                              SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C6_FILIAL' THEN D.XML_NODE_VALUE END) AS COL6,
                                              SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C7_FILIAL' THEN D.XML_NODE_VALUE END) AS COL7,
                                              SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C8_FILIAL' THEN D.XML_NODE_VALUE END) AS COL8,
                                              SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C9_FILIAL' THEN D.XML_NODE_VALUE END) AS COL9,
                                              SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C10_FILIAL' THEN D.XML_NODE_VALUE END) AS COL10,
                                              SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C11_FILIAL' THEN D.XML_NODE_VALUE END) AS COL11
                                            FROM
                                            (
                                    SELECT
                                      REPLACE(NAME,'_R-','_R'||TRIM(TO_CHAR(NEW_NODE_VALUE,'00'))||'-') AS XML_NODE_NAME,
                                      NODE_VALUE AS XML_NODE_VALUE,
                                      ORDINE
                                    FROM
                                    (
                                    SELECT 
                                              D1.XML_NODE_NAME AS NAME,
                                              D1.XML_NODE_VALUE AS NODE_VALUE,
                                              D2.XML_NODE_VALUE AS NEW_NODE_VALUE,
                                              D1.XML_NODE_ATTR,
                                              ROWNUM AS ORDINE
                                            FROM 
                                              XMLTABLE(vFILIAL_DYNAMIC_ROW_CAPII PASSING   
                                                (SELECT  xmltype(XML) FROM F_XML_FORMS WHERE FORMID IN (R.FORMID))
                                                 COLUMNS 
                                                 XML_NODE_NAME VARCHAR2(100) PATH './*/name()',
                                                 XML_NODE_VALUE VARCHAR2(100) PATH './*/text()',
                                                 XML_NODE_ATTR VARCHAR2(100) PATH './@line'
                                            ) D1 CROSS JOIN
                                            XMLTABLE(REPLACE(vFILIAL_DYNAMIC_ROW_CAPII,'*','CAPII_R_INDEX') PASSING   
                                                (SELECT  xmltype(XML) FROM F_XML_FORMS WHERE FORMID IN (R.FORMID))
                                                 COLUMNS 
                                                 XML_NODE_NAME VARCHAR2(100) PATH './*/name()',
                                                 XML_NODE_VALUE VARCHAR2(100) PATH './*/text()',
                                                 XML_NODE_ATTR VARCHAR2(100) PATH './@line'
                                            ) D2 --ON (D1.XML_NODE_VALUE=D2.XML_NODE_VALUE)
                                            
                            WHERE
                              D1.XML_NODE_ATTR IS NOT NULL
                                            ORDER BY ROWNUM
                                    )
                                    )D
                                    WHERE
                                      SUBSTR(D.XML_NODE_NAME,0, INSTR(D.XML_NODE_NAME,'_C')-1) IS NOT NULL
                                    GROUP BY
                                      SUBSTR(D.XML_NODE_NAME,0, INSTR(D.XML_NODE_NAME,'_C')-1)
                                    ) D
                                INNER JOIN
                                  (
                                    SELECT
                                      R.FORM,
                                      R.FORM_VERS,
                                      C.DEN_SHORT,
                                      C.CAPITOL,
                                      C.CAPITOL_VERS,
                                      R.RIND,
                                      R.RIND_VERS,
                                      R.ID_MD
                                    FROM
                                      MD_RIND R
                                      INNER JOIN MD_CAPITOL C ON (R.CAPITOL=C.CAPITOL AND R.CAPITOL_VERS=C.CAPITOL_VERS AND R.ID_SCHEMA=C.ID_SCHEMA)
                                      INNER JOIN (
                                         SELECT
                                          R.CAPITOL,
                                          MAX(R.CAPITOL_VERS) AS CAPITOL_VERS,
                                          R.RIND,
                                          MAX(R.RIND_VERS) AS RIND_VERS,
                                          R.ID_SCHEMA
                                        FROM
                                          MD_RIND R
                                          INNER JOIN (SELECT DISTINCT
                                                      C.CAPITOL,
                                                      MAX(C.CAPITOL_VERS)AS CAPITOL_VERS
                                                    FROM
                                                      MD_CAPITOL C
                                                      INNER JOIN MD_RIND R ON (R.CAPITOL=C.CAPITOL AND R.CAPITOL_VERS=C.CAPITOL_VERS AND C.ID_SCHEMA=R.ID_SCHEMA)
                                                    WHERE
                                                      R.FORM IN (vFORM) AND
                                                      R.ID_SCHEMA IN (vID_SCHEMA) AND
                                                      C.CAPITOL_VERS <= (vPERIOADA)
                                                    GROUP BY
                                                      C.CAPITOL) C ON (R.CAPITOL=C.CAPITOL AND R.CAPITOL_VERS=C.CAPITOL_VERS)
                                        WHERE
                                          R.FORM IN (vFORM) AND
                                          R.ID_SCHEMA IN (vID_SCHEMA) AND
                                          R.RIND_VERS <= (vPERIOADA)
                                        GROUP BY
                                          R.CAPITOL,
                                          R.RIND,
                                          R.ID_SCHEMA
                                      ) RR ON (R.RIND=RR.RIND AND R.RIND_VERS=RR.RIND_VERS AND C.CAPITOL=RR.CAPITOL AND C.CAPITOL_VERS=RR.CAPITOL_VERS AND R.ID_SCHEMA=RR.ID_SCHEMA)
                                    WHERE
                                      R.FORM IN (vFORM) AND
                                      R.ID_SCHEMA IN (vID_SCHEMA) AND
                                      R.STATUT <> '3' AND
                                      C.STATUT <> '3' AND
                                      C.CAPITOL NOT IN (100)
                                    ORDER BY
                                      R.CAPITOL,
                                      R.RIND) RR ON (D.NR_ROW = CASE WHEN RR.FORM IN (vFORM) THEN 
                                      DECODE(RR.DEN_SHORT,'Cap. I-a','CAPIa','Cap. II','CAPII','Cap. III','CAPIII','Cap. V','CAPV')||'_R'||RR.RIND ELSE RR.DEN_SHORT||'_R'||RR.RIND END);
                    END LOOP; 
                  END LOOP;
        ELSIF (vFORM IN (48)) THEN -- Mapping 1-INOV    
              INSERT INTO DATA_ALL_FOR_VALIDATE(PERIOADA,FORM,FORM_VERS,CUIIO,CUIIO_VERS,ID_MD,DATA_REG,ID_USER,COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9,COL10,
                                              COL11,COL12,COL13,COL14,COL15,COL16,COL31,COL32,COL33,COL34,COL35,COL36,COL37,COL38,COL39,COL40,
                                              T_XML_FORM_ID,CREATED_DATE,ID_SCHEMA)
            SELECT
              vPERIOADA,
              vFORM,
              vFORM_VERS,
              vCUIIO,
              vCUIIO_VERS,
              RR.ID_MD,
              SYSDATE AS DATA_REG,
              9999 AS ID_USER,
              D.COL1,D.COL2,D.COL3,D.COL4,D.COL5,D.COL6,D.COL7,D.COL8,D.COL9,D.COL10,D.COL11,D.COL12,D.COL13,D.COL14,D.COL15,D.COL16,
              D.COL31,D.COL32,D.COL33,D.COL34,D.COL35,D.COL36,D.COL37,D.COL38,D.COL39,D.COL40,R.FORMID,--T_XML_FORM_ID from F_XML_FORMS
              SYSDATE AS CREATED_DATE,
              vID_SCHEMA
            FROM
            (
            SELECT
              REPLACE(REPLACE(REPLACE(REPLACE(
                SUBSTR(D.XML_NODE_NAME,0, INSTR(D.XML_NODE_NAME,'_C')-1),
                'CAPITOL6_R612','CAPITOL6_R611'),
                'CAPITOL3_R331','CAPITOL3_R33'),
                'CAPITOL3_R332','CAPITOL3_R33'),
                'CAPITOL3_R333','CAPITOL3_R33') AS NR_ROW,
              SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C1' THEN CASE WHEN D.XML_NODE_NAME LIKE '%_RCAEM_%' THEN SUBSTR(D.XML_NODE_VALUE,2,4) ELSE 
                CASE 
                  WHEN SUBSTR(D.XML_NODE_NAME,0, INSTR(D.XML_NODE_NAME,'_C')-1) IN ('CAPITOL6_R611') AND D.XML_NODE_VALUE IN (1) THEN '1' 
                  WHEN SUBSTR(D.XML_NODE_NAME,0, INSTR(D.XML_NODE_NAME,'_C')-1) IN ('CAPITOL6_R612') AND D.XML_NODE_VALUE IN (1) THEN '2'  
                  WHEN SUBSTR(D.XML_NODE_NAME,0, INSTR(D.XML_NODE_NAME,'_C')-1) IN ('CAPITOL3_R331') AND D.XML_NODE_VALUE IN (1) THEN '1' 
                  WHEN SUBSTR(D.XML_NODE_NAME,0, INSTR(D.XML_NODE_NAME,'_C')-1) IN ('CAPITOL3_R332') AND D.XML_NODE_VALUE IN (1) THEN '2'  
                  WHEN SUBSTR(D.XML_NODE_NAME,0, INSTR(D.XML_NODE_NAME,'_C')-1) IN ('CAPITOL3_R333') AND D.XML_NODE_VALUE IN (1) THEN '3'               
                ELSE D.XML_NODE_VALUE END 
              END END) AS COL1,
              SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C2' THEN CASE WHEN D.XML_NODE_NAME LIKE '%_RCAEM_%' THEN SUBSTR(D.XML_NODE_VALUE,2,4) ELSE D.XML_NODE_VALUE END END) AS COL2,
              SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C3' THEN CASE WHEN D.XML_NODE_NAME LIKE '%_RCAEM_%' THEN SUBSTR(D.XML_NODE_VALUE,2,4) ELSE D.XML_NODE_VALUE END END) AS COL3,
              SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C4' THEN CASE WHEN D.XML_NODE_NAME LIKE '%_RCAEM_%' THEN SUBSTR(D.XML_NODE_VALUE,2,4) ELSE D.XML_NODE_VALUE END END) AS COL4,
              SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C5' THEN CASE WHEN D.XML_NODE_NAME LIKE '%_RCAEM_%' THEN SUBSTR(D.XML_NODE_VALUE,2,4) ELSE D.XML_NODE_VALUE END END) AS COL5,
              SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C6' THEN CASE WHEN D.XML_NODE_NAME LIKE '%_RCAEM_%' THEN SUBSTR(D.XML_NODE_VALUE,2,4) ELSE D.XML_NODE_VALUE END END) AS COL6,
              SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C7' THEN CASE WHEN D.XML_NODE_NAME LIKE '%_RCAEM_%' THEN SUBSTR(D.XML_NODE_VALUE,2,4) ELSE D.XML_NODE_VALUE END END) AS COL7,
              SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C8' THEN CASE WHEN D.XML_NODE_NAME LIKE '%_RCAEM_%' THEN SUBSTR(D.XML_NODE_VALUE,2,4) ELSE D.XML_NODE_VALUE END END) AS COL8,
              SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C9' THEN CASE WHEN D.XML_NODE_NAME LIKE '%_RCAEM_%' THEN SUBSTR(D.XML_NODE_VALUE,2,4) ELSE D.XML_NODE_VALUE END END) AS COL9,
              SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C10' THEN CASE WHEN D.XML_NODE_NAME LIKE '%_RCAEM_%' THEN SUBSTR(D.XML_NODE_VALUE,2,4) ELSE D.XML_NODE_VALUE END END) AS COL10,
              SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C11' THEN CASE WHEN D.XML_NODE_NAME LIKE '%_RCAEM_%' THEN SUBSTR(D.XML_NODE_VALUE,2,4) ELSE D.XML_NODE_VALUE END END) AS COL11,
              SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C12' THEN CASE WHEN D.XML_NODE_NAME LIKE '%_RCAEM_%' THEN SUBSTR(D.XML_NODE_VALUE,2,4) ELSE D.XML_NODE_VALUE END END) AS COL12,
              SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C13' THEN CASE WHEN D.XML_NODE_NAME LIKE '%_RCAEM_%' THEN SUBSTR(D.XML_NODE_VALUE,2,4) ELSE D.XML_NODE_VALUE END END) AS COL13,
              SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C14' THEN CASE WHEN D.XML_NODE_NAME LIKE '%_RCAEM_%' THEN SUBSTR(D.XML_NODE_VALUE,2,4) ELSE D.XML_NODE_VALUE END END) AS COL14,
              SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C15' THEN CASE WHEN D.XML_NODE_NAME LIKE '%_RCAEM_%' THEN SUBSTR(D.XML_NODE_VALUE,2,4) ELSE D.XML_NODE_VALUE END END) AS COL15,
              SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C16' THEN CASE WHEN D.XML_NODE_NAME LIKE '%_RCAEM_%' THEN SUBSTR(D.XML_NODE_VALUE,2,4) ELSE D.XML_NODE_VALUE END END) AS COL16,
              MAX(CASE WHEN D.XML_NODE_NAME LIKE '%_C31' THEN CASE WHEN D.XML_NODE_NAME LIKE '%_RCAEM_%' THEN SUBSTR(D.XML_NODE_VALUE,2,4) ELSE D.XML_NODE_VALUE END END) AS COL31,
              MAX(CASE WHEN D.XML_NODE_NAME LIKE '%_C32' THEN CASE WHEN D.XML_NODE_NAME LIKE '%_RCAEM_%' THEN SUBSTR(D.XML_NODE_VALUE,2,4) ELSE D.XML_NODE_VALUE END END) AS COL32,
              MAX(CASE WHEN D.XML_NODE_NAME LIKE '%_C33' THEN CASE WHEN D.XML_NODE_NAME LIKE '%_RCAEM_%' THEN SUBSTR(D.XML_NODE_VALUE,2,4) ELSE D.XML_NODE_VALUE END END) AS COL33,
              MAX(CASE WHEN D.XML_NODE_NAME LIKE '%_C34' THEN CASE WHEN D.XML_NODE_NAME LIKE '%_RCAEM_%' THEN SUBSTR(D.XML_NODE_VALUE,2,4) ELSE D.XML_NODE_VALUE END END) AS COL34,
              MAX(CASE WHEN D.XML_NODE_NAME LIKE '%_C35' THEN CASE WHEN D.XML_NODE_NAME LIKE '%_RCAEM_%' THEN SUBSTR(D.XML_NODE_VALUE,2,4) ELSE D.XML_NODE_VALUE END END) AS COL35,
              MAX(CASE WHEN D.XML_NODE_NAME LIKE '%_C36' THEN CASE WHEN D.XML_NODE_NAME LIKE '%_RCAEM_%' THEN SUBSTR(D.XML_NODE_VALUE,2,4) ELSE D.XML_NODE_VALUE END END) AS COL36,
              MAX(CASE WHEN D.XML_NODE_NAME LIKE '%_C37' THEN CASE WHEN D.XML_NODE_NAME LIKE '%_RCAEM_%' THEN SUBSTR(D.XML_NODE_VALUE,2,4) ELSE D.XML_NODE_VALUE END END) AS COL37,
              MAX(CASE WHEN D.XML_NODE_NAME LIKE '%_C38' THEN CASE WHEN D.XML_NODE_NAME LIKE '%_RCAEM_%' THEN SUBSTR(D.XML_NODE_VALUE,2,4) ELSE D.XML_NODE_VALUE END END) AS COL38,
              MAX(CASE WHEN D.XML_NODE_NAME LIKE '%_C39' THEN CASE WHEN D.XML_NODE_NAME LIKE '%_RCAEM_%' THEN SUBSTR(D.XML_NODE_VALUE,2,4) ELSE D.XML_NODE_VALUE END END) AS COL39,
              MAX(CASE WHEN D.XML_NODE_NAME LIKE '%_C40' THEN CASE WHEN D.XML_NODE_NAME LIKE '%_RCAEM_%' THEN SUBSTR(D.XML_NODE_VALUE,2,4) ELSE D.XML_NODE_VALUE END END) AS COL40
            FROM
            (
            SELECT  
              CASE
                --1-INOV REPLACE
                WHEN XML_NODE_NAME IN (
                                       'CAPITOL2_R211_C2','CAPITOL2_R212_C2','CAPITOL2_R221_C2','CAPITOL2_R222_C2','CAPITOL2_R223_C2','CAPITOL2_R224_C2',
                                       'CAPITOL2_R231_C2','CAPITOL2_R232_C2','CAPITOL2_R241_C2','CAPITOL2_R242_C2','CAPITOL2_R243_C2','CAPITOL3_R311_C2',
                                       'CAPITOL3_R312_C2','CAPITOL3_R313_C2','CAPITOL4_R411_C2','CAPITOL4_R412_C2','CAPITOL5_R511_C2','CAPITOL5_R514_C2',
                                       'CAPITOL5_R515_C2','CAPITOL5_R516_C2','CAPITOL5_R517_C2','CAPITOL5_R518_C2','CAPITOL5_R519_C2','CAPITOL5_R5110_C2',
                                       'CAPITOL5_R531_C2','CAPITOL5_R532_C2','CAPITOL5_R533_C2','CAPITOL7_R711_C2','CAPITOL7_R712_C2','CAPITOL7_R713_C2',
                                       'CAPITOL8_R811_C2','CAPITOL8_R812_C2','CAPITOL8_R813_C2','CAPITOL8_R814_C2',
                                       -- col3
                                       'CAPITOL2_R241_C3','CAPITOL2_R242_C3','CAPITOL2_R243_C3') THEN REPLACE(REPLACE(XML_NODE_NAME,'C2','C1'),'C3','C1')
                WHEN XML_NODE_NAME IN ('CAPITOL9_R92_C1') THEN REPLACE(XML_NODE_NAME,'C1','C31')
              ELSE 
                XML_NODE_NAME
              END AS XML_NODE_NAME,
              CASE 
                --1-INOV REPLACE
                WHEN XML_NODE_NAME IN ('CAPITOL2_R211_C2','CAPITOL2_R212_C2','CAPITOL2_R221_C2','CAPITOL2_R222_C2','CAPITOL2_R223_C2','CAPITOL2_R224_C2',
                                       'CAPITOL2_R231_C2','CAPITOL2_R232_C2','CAPITOL2_R241_C2','CAPITOL2_R242_C2','CAPITOL2_R243_C2','CAPITOL3_R311_C2',
                                       'CAPITOL3_R312_C2','CAPITOL3_R313_C2','CAPITOL4_R411_C2','CAPITOL4_R412_C2','CAPITOL5_R511_C2','CAPITOL5_R514_C2',
                                       'CAPITOL5_R515_C2','CAPITOL5_R516_C2','CAPITOL5_R517_C2','CAPITOL5_R518_C2','CAPITOL5_R519_C2','CAPITOL5_R5110_C2',
                                       'CAPITOL5_R531_C2','CAPITOL5_R532_C2','CAPITOL5_R533_C2','CAPITOL7_R711_C2','CAPITOL7_R712_C2','CAPITOL7_R713_C2',
                                       'CAPITOL8_R811_C2','CAPITOL8_R812_C2','CAPITOL8_R813_C2','CAPITOL8_R814_C2') AND XML_NODE_VALUE IN (1) THEN '2' 
                WHEN XML_NODE_NAME IN ('CAPITOL2_R241_C3','CAPITOL2_R242_C3','CAPITOL2_R243_C3') AND XML_NODE_VALUE IN (1) THEN '3' 
              ELSE 
                XML_NODE_VALUE 
              END AS XML_NODE_VALUE
            FROM 
              XMLTABLE('//dec/DataSet/Data/*' PASSING   
                (SELECT  xmltype(XML) FROM F_XML_FORMS WHERE FORMID IN (R.FORMID))
                 COLUMNS 
                 XML_NODE_NAME VARCHAR2(100) PATH 'name()',
                 XML_NODE_VALUE VARCHAR2(100) PATH 'text()' 
            )
            ) D
            GROUP BY
              REPLACE(REPLACE(REPLACE(REPLACE(
                SUBSTR(D.XML_NODE_NAME,0, INSTR(D.XML_NODE_NAME,'_C')-1),
                'CAPITOL6_R612','CAPITOL6_R611'),
                'CAPITOL3_R331','CAPITOL3_R33'),
                'CAPITOL3_R332','CAPITOL3_R33'),
                'CAPITOL3_R333','CAPITOL3_R33')
            ORDER BY
              REPLACE(REPLACE(REPLACE(REPLACE(
                SUBSTR(D.XML_NODE_NAME,0, INSTR(D.XML_NODE_NAME,'_C')-1),
                'CAPITOL6_R612','CAPITOL6_R611'),
                'CAPITOL3_R331','CAPITOL3_R33'),
                'CAPITOL3_R332','CAPITOL3_R33'),
                'CAPITOL3_R333','CAPITOL3_R33')
            ) D
            INNER JOIN
              (
                SELECT
                  R.FORM,
                  R.FORM_VERS,
                  C.DEN_SHORT,
                  R.CAPITOL,
                  R.CAPITOL_VERS,
                  R.RIND,
                  R.RIND_VERS,
                  R.ID_MD
                FROM
                  MD_RIND R
                  INNER JOIN MD_CAPITOL C ON (R.CAPITOL=C.CAPITOL AND R.CAPITOL_VERS=C.CAPITOL_VERS)
                  INNER JOIN (
                    SELECT
                      R.CAPITOL,
                      R.RIND,
                      MAX(R.RIND_VERS) AS RIND_VERS
                    FROM
                      MD_RIND R
                    WHERE
                      R.FORM IN (vFORM) AND
                      R.ID_SCHEMA IN (vID_SCHEMA) AND
                      R.RIND_VERS <= (vPERIOADA)
                    GROUP BY
                      R.CAPITOL,
                      R.RIND
                  ) RR ON (R.RIND=RR.RIND AND R.RIND_VERS=RR.RIND_VERS AND R.CAPITOL=RR.CAPITOL)
                WHERE
                  R.FORM IN (vFORM) AND
                  R.ID_SCHEMA IN (vID_SCHEMA) AND
                  R.STATUT <> '3'
                ORDER BY
                  R.RIND) RR ON (CASE WHEN RR.FORM IN (1) THEN REPLACE(D.NR_ROW,'CAP3','CAP2') ELSE D.NR_ROW END
                                                 = CASE WHEN RR.FORM IN (39) THEN DECODE(RR.DEN_SHORT,'Cap.I','CAP1','Cap.II','CAP2')||'_R'||RR.RIND 
                                                 WHEN RR.FORM IN (5) THEN DECODE(RR.DEN_SHORT,'Cap. I','CAP1','Cap. II','CAP2','Cap. III','CAP3')||'_R'||RR.RIND 
                                                 WHEN RR.FORM IN (1) THEN DECODE(RR.DEN_SHORT,'Cap. Stocuri','CAP1','Cap. COSTURI','CAP2','Subcap. AGR','CAP3')||'_R'||RR.RIND 
                                                 WHEN RR.FORM IN (44) THEN DECODE(RR.DEN_SHORT,'Export de servicii','CAP1','Import de servicii','CAP2') ||'_R'||RR.RIND 
                                                 WHEN RR.FORM IN (74) THEN REPLACE(UPPER(RR.DEN_SHORT),'.','')||'_R'||REPLACE(RR.RIND,'.','_')
                                                 WHEN RR.FORM IN (45,33) THEN DECODE(RR.DEN_SHORT,'Cap.I','CAP1','Cap.I-a','CAP1A','Cap.II','CAP2','Cap.III','CAP3')||'_R'||RR.RIND
                                                 WHEN RR.FORM IN (7) THEN DECODE(RR.DEN_SHORT,'CAPITOLUL I','CAP1')||'_R'||RR.RIND
                                                 WHEN RR.FORM IN (34,35,29) THEN DECODE(RR.DEN_SHORT,'Cap.I','CAP1','Informativ','CAP2')||'_R'||RR.RIND
                                                 WHEN RR.FORM IN (18,36) THEN DECODE(RR.DEN_SHORT,'Cap.I','CAP1')||'_R'||RR.RIND 
                                                 WHEN RR.FORM IN (48) THEN DECODE(RR.DEN_SHORT,'Cap.1','CAPITOL1','Cap.2','CAPITOL2','Cap.3','CAPITOL3','Cap.4','CAPITOL4','Cap.5','CAPITOL5',
                                                                                               'Cap.6','CAPITOL6','Cap.7','CAPITOL7','Cap.8','CAPITOL8','Cap.9','CAPITOL9')||'_R'||REPLACE(RR.RIND,'.','')
                                            ELSE REPLACE(UPPER(REPLACE((RR.DEN_SHORT),'TITLUL','TITLU')),'.','')||'_R'||RR.RIND END);
        ELSE 
            INSERT INTO DATA_ALL_FOR_VALIDATE(PERIOADA,FORM,FORM_VERS,CUIIO,CUIIO_VERS,ID_MD,DATA_REG,ID_USER,COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9,COL10,
                                              COL11,COL12,COL13,COL14,COL15,COL16,COL31,COL32,COL33,COL34,COL35,COL36,COL37,COL38,COL39,COL40,
                                              T_XML_FORM_ID,CREATED_DATE,ID_SCHEMA)
            SELECT
              vPERIOADA,
              vFORM,
              vFORM_VERS,
              vCUIIO,
              vCUIIO_VERS,
              RR.ID_MD,
              SYSDATE AS DATA_REG,
              9999 AS ID_USER,
              D.COL1,D.COL2,D.COL3,D.COL4,D.COL5,D.COL6,D.COL7,D.COL8,D.COL9,D.COL10,D.COL11,D.COL12,D.COL13,D.COL14,D.COL15,D.COL16,
              D.COL31,D.COL32,D.COL33,D.COL34,D.COL35,D.COL36,D.COL37,D.COL38,D.COL39,D.COL40,R.FORMID,--T_XML_FORM_ID from F_XML_FORMS
              SYSDATE AS CREATED_DATE,
              vID_SCHEMA
            FROM
            (
            SELECT
              REPLACE(REPLACE(REPLACE(REPLACE(
                SUBSTR(D.XML_NODE_NAME,0, INSTR(D.XML_NODE_NAME,'_C')-1),
                'CAPITOL6_R612','CAPITOL6_R611'),
                'CAPITOL3_R331','CAPITOL3_R33'),
                'CAPITOL3_R332','CAPITOL3_R33'),
                'CAPITOL3_R333','CAPITOL3_R33') AS NR_ROW,
              SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C1' THEN CASE WHEN D.XML_NODE_NAME LIKE '%_RCAEM_%' THEN SUBSTR(D.XML_NODE_VALUE,2,4) ELSE 
                CASE 
                  WHEN SUBSTR(D.XML_NODE_NAME,0, INSTR(D.XML_NODE_NAME,'_C')-1) IN ('CAPITOL6_R611') AND D.XML_NODE_VALUE IN (1) THEN '1' 
                  WHEN SUBSTR(D.XML_NODE_NAME,0, INSTR(D.XML_NODE_NAME,'_C')-1) IN ('CAPITOL6_R612') AND D.XML_NODE_VALUE IN (1) THEN '2'  
                  WHEN SUBSTR(D.XML_NODE_NAME,0, INSTR(D.XML_NODE_NAME,'_C')-1) IN ('CAPITOL3_R331') AND D.XML_NODE_VALUE IN (1) THEN '1' 
                  WHEN SUBSTR(D.XML_NODE_NAME,0, INSTR(D.XML_NODE_NAME,'_C')-1) IN ('CAPITOL3_R332') AND D.XML_NODE_VALUE IN (1) THEN '2'  
                  WHEN SUBSTR(D.XML_NODE_NAME,0, INSTR(D.XML_NODE_NAME,'_C')-1) IN ('CAPITOL3_R333') AND D.XML_NODE_VALUE IN (1) THEN '3'               
                ELSE D.XML_NODE_VALUE END 
              END END) AS COL1,
              SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C2' THEN CASE WHEN D.XML_NODE_NAME LIKE '%_RCAEM_%' THEN SUBSTR(D.XML_NODE_VALUE,2,4) ELSE D.XML_NODE_VALUE END END) AS COL2,
              SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C3' THEN CASE WHEN D.XML_NODE_NAME LIKE '%_RCAEM_%' THEN SUBSTR(D.XML_NODE_VALUE,2,4) ELSE D.XML_NODE_VALUE END END) AS COL3,
              SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C4' THEN CASE WHEN D.XML_NODE_NAME LIKE '%_RCAEM_%' THEN SUBSTR(D.XML_NODE_VALUE,2,4) ELSE D.XML_NODE_VALUE END END) AS COL4,
              SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C5' THEN CASE WHEN D.XML_NODE_NAME LIKE '%_RCAEM_%' THEN SUBSTR(D.XML_NODE_VALUE,2,4) ELSE D.XML_NODE_VALUE END END) AS COL5,
              SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C6' THEN CASE WHEN D.XML_NODE_NAME LIKE '%_RCAEM_%' THEN SUBSTR(D.XML_NODE_VALUE,2,4) ELSE D.XML_NODE_VALUE END END) AS COL6,
              SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C7' THEN CASE WHEN D.XML_NODE_NAME LIKE '%_RCAEM_%' THEN SUBSTR(D.XML_NODE_VALUE,2,4) ELSE D.XML_NODE_VALUE END END) AS COL7,
              SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C8' THEN CASE WHEN D.XML_NODE_NAME LIKE '%_RCAEM_%' THEN SUBSTR(D.XML_NODE_VALUE,2,4) ELSE D.XML_NODE_VALUE END END) AS COL8,
              SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C9' THEN CASE WHEN D.XML_NODE_NAME LIKE '%_RCAEM_%' THEN SUBSTR(D.XML_NODE_VALUE,2,4) ELSE D.XML_NODE_VALUE END END) AS COL9,
              SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C10' THEN CASE WHEN D.XML_NODE_NAME LIKE '%_RCAEM_%' THEN SUBSTR(D.XML_NODE_VALUE,2,4) ELSE D.XML_NODE_VALUE END END) AS COL10,
              SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C11' THEN CASE WHEN D.XML_NODE_NAME LIKE '%_RCAEM_%' THEN SUBSTR(D.XML_NODE_VALUE,2,4) ELSE D.XML_NODE_VALUE END END) AS COL11,
              SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C12' THEN CASE WHEN D.XML_NODE_NAME LIKE '%_RCAEM_%' THEN SUBSTR(D.XML_NODE_VALUE,2,4) ELSE D.XML_NODE_VALUE END END) AS COL12,
              SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C13' THEN CASE WHEN D.XML_NODE_NAME LIKE '%_RCAEM_%' THEN SUBSTR(D.XML_NODE_VALUE,2,4) ELSE D.XML_NODE_VALUE END END) AS COL13,
              SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C14' THEN CASE WHEN D.XML_NODE_NAME LIKE '%_RCAEM_%' THEN SUBSTR(D.XML_NODE_VALUE,2,4) ELSE D.XML_NODE_VALUE END END) AS COL14,
              SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C15' THEN CASE WHEN D.XML_NODE_NAME LIKE '%_RCAEM_%' THEN SUBSTR(D.XML_NODE_VALUE,2,4) ELSE D.XML_NODE_VALUE END END) AS COL15,
              SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C16' THEN CASE WHEN D.XML_NODE_NAME LIKE '%_RCAEM_%' THEN SUBSTR(D.XML_NODE_VALUE,2,4) ELSE D.XML_NODE_VALUE END END) AS COL16,
              MAX(CASE WHEN D.XML_NODE_NAME LIKE '%_C31' THEN CASE WHEN D.XML_NODE_NAME LIKE '%_RCAEM_%' THEN SUBSTR(D.XML_NODE_VALUE,2,4) ELSE D.XML_NODE_VALUE END END) AS COL31,
              MAX(CASE WHEN D.XML_NODE_NAME LIKE '%_C32' THEN CASE WHEN D.XML_NODE_NAME LIKE '%_RCAEM_%' THEN SUBSTR(D.XML_NODE_VALUE,2,4) ELSE D.XML_NODE_VALUE END END) AS COL32,
              MAX(CASE WHEN D.XML_NODE_NAME LIKE '%_C33' THEN CASE WHEN D.XML_NODE_NAME LIKE '%_RCAEM_%' THEN SUBSTR(D.XML_NODE_VALUE,2,4) ELSE D.XML_NODE_VALUE END END) AS COL33,
              MAX(CASE WHEN D.XML_NODE_NAME LIKE '%_C34' THEN CASE WHEN D.XML_NODE_NAME LIKE '%_RCAEM_%' THEN SUBSTR(D.XML_NODE_VALUE,2,4) ELSE D.XML_NODE_VALUE END END) AS COL34,
              MAX(CASE WHEN D.XML_NODE_NAME LIKE '%_C35' THEN CASE WHEN D.XML_NODE_NAME LIKE '%_RCAEM_%' THEN SUBSTR(D.XML_NODE_VALUE,2,4) ELSE D.XML_NODE_VALUE END END) AS COL35,
              MAX(CASE WHEN D.XML_NODE_NAME LIKE '%_C36' THEN CASE WHEN D.XML_NODE_NAME LIKE '%_RCAEM_%' THEN SUBSTR(D.XML_NODE_VALUE,2,4) ELSE D.XML_NODE_VALUE END END) AS COL36,
              MAX(CASE WHEN D.XML_NODE_NAME LIKE '%_C37' THEN CASE WHEN D.XML_NODE_NAME LIKE '%_RCAEM_%' THEN SUBSTR(D.XML_NODE_VALUE,2,4) ELSE D.XML_NODE_VALUE END END) AS COL37,
              MAX(CASE WHEN D.XML_NODE_NAME LIKE '%_C38' THEN CASE WHEN D.XML_NODE_NAME LIKE '%_RCAEM_%' THEN SUBSTR(D.XML_NODE_VALUE,2,4) ELSE D.XML_NODE_VALUE END END) AS COL38,
              MAX(CASE WHEN D.XML_NODE_NAME LIKE '%_C39' THEN CASE WHEN D.XML_NODE_NAME LIKE '%_RCAEM_%' THEN SUBSTR(D.XML_NODE_VALUE,2,4) ELSE D.XML_NODE_VALUE END END) AS COL39,
              MAX(CASE WHEN D.XML_NODE_NAME LIKE '%_C40' THEN CASE WHEN D.XML_NODE_NAME LIKE '%_RCAEM_%' THEN SUBSTR(D.XML_NODE_VALUE,2,4) ELSE D.XML_NODE_VALUE END END) AS COL40
            FROM
            (
            SELECT
              CASE 
                WHEN (SELECT  F.FORM_TYPE FROM F_XML_FORMS F WHERE FORMID IN (R.FORMID)) IN ('3_agr') THEN 
                  CASE 
                    WHEN XML_NODE_NAME LIKE 'CAP1_R%' AND XML_NODE_NAME LIKE '%_C1' THEN REPLACE(XML_NODE_NAME,'_C1','_C3')
                    WHEN XML_NODE_NAME LIKE 'CAP1_R%' AND XML_NODE_NAME LIKE '%_C2' THEN REPLACE(XML_NODE_NAME,'_C2','_C4')
                    WHEN XML_NODE_NAME LIKE 'CAP1_R%' AND XML_NODE_NAME LIKE '%_C3' THEN REPLACE(XML_NODE_NAME,'_C3','_C5')
                    WHEN XML_NODE_NAME LIKE 'CAP1_R%' AND XML_NODE_NAME LIKE '%_C4' THEN REPLACE(XML_NODE_NAME,'_C4','_C6')
                    WHEN XML_NODE_NAME LIKE 'CAP1_R%' AND XML_NODE_NAME LIKE '%_C5' THEN REPLACE(XML_NODE_NAME,'_C5','_C7')
                    --REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(XML_NODE_NAME,'_C1','_C3'),'_C2','_C4'),'_C3','_C5'),'_C4','_C6'),'_C5','_C7')
                  ELSE
                    XML_NODE_NAME
                  END
                ELSE 
                  XML_NODE_NAME 
                END AS XML_NODE_NAME, 
--              XML_NODE_NAME,
              XML_NODE_VALUE
            FROM 
              XMLTABLE('//dec/DataSet/Data/*' PASSING   
                (SELECT  xmltype(CASE WHEN FORM_TYPE IN ('m1') THEN REPLACE(XML,'_CAEM_','_RCAEM_') ELSE XML END) FROM F_XML_FORMS WHERE FORMID IN (R.FORMID))
                 COLUMNS 
                 XML_NODE_NAME VARCHAR2(100) PATH 'name()',
                 XML_NODE_VALUE VARCHAR2(100) PATH 'text()' 
            )
            ) D
            GROUP BY
              REPLACE(REPLACE(REPLACE(REPLACE(
                SUBSTR(D.XML_NODE_NAME,0, INSTR(D.XML_NODE_NAME,'_C')-1),
                'CAPITOL6_R612','CAPITOL6_R611'),
                'CAPITOL3_R331','CAPITOL3_R33'),
                'CAPITOL3_R332','CAPITOL3_R33'),
                'CAPITOL3_R333','CAPITOL3_R33')
            ORDER BY
              REPLACE(REPLACE(REPLACE(REPLACE(
                SUBSTR(D.XML_NODE_NAME,0, INSTR(D.XML_NODE_NAME,'_C')-1),
                'CAPITOL6_R612','CAPITOL6_R611'),
                'CAPITOL3_R331','CAPITOL3_R33'),
                'CAPITOL3_R332','CAPITOL3_R33'),
                'CAPITOL3_R333','CAPITOL3_R33')
            ) D
            INNER JOIN
              (
                SELECT
                  R.FORM,
                  R.FORM_VERS,
                  C.DEN_SHORT,
                  R.CAPITOL,
                  R.CAPITOL_VERS,
                  R.RIND,
                  R.RIND_VERS,
                  R.ID_MD
                FROM
                  MD_RIND R
                  INNER JOIN MD_CAPITOL C ON (R.CAPITOL=C.CAPITOL AND R.CAPITOL_VERS=C.CAPITOL_VERS)
                  INNER JOIN (
                    SELECT
                      R.CAPITOL,
                      R.RIND,
                      MAX(R.RIND_VERS) AS RIND_VERS
                    FROM
                      MD_RIND R
                    WHERE
                      R.FORM IN (vFORM) AND
                      R.ID_SCHEMA IN (vID_SCHEMA) AND
                      R.RIND_VERS <= (vPERIOADA)
                    GROUP BY
                      R.CAPITOL,
                      R.RIND
                  ) RR ON (R.RIND=RR.RIND AND R.RIND_VERS=RR.RIND_VERS AND R.CAPITOL=RR.CAPITOL)
                WHERE
                  R.FORM IN (vFORM) AND
                  R.ID_SCHEMA IN (vID_SCHEMA) AND
                  R.STATUT <> '3'
                ORDER BY
                  R.RIND) RR ON (CASE WHEN RR.FORM IN (1) THEN REPLACE(D.NR_ROW,'CAP3','CAP2') ELSE D.NR_ROW END
                                                 = CASE WHEN RR.FORM IN (39) THEN DECODE(RR.DEN_SHORT,'Cap.I','CAP1','Cap.II','CAP2')||'_R'||RR.RIND 
                                                 WHEN RR.FORM IN (1) THEN DECODE(RR.DEN_SHORT,'Cap. Stocuri','CAP1','Cap. COSTURI','CAP2','Subcap. AGR','CAP3')||'_R'||RR.RIND 
                                                 WHEN RR.FORM IN (5) THEN DECODE(RR.DEN_SHORT,'Cap. I','CAP1','Cap. II','CAP2','Cap. III','CAP3')||'_R'||RR.RIND 
                                                 WHEN RR.FORM IN (6) THEN DECODE(RR.DEN_SHORT,'Cap. I','CAP1','Cap.II','CAP2')||'_R'||RR.RIND 
                                                 WHEN RR.FORM IN (7) THEN DECODE(RR.DEN_SHORT,'CAPITOLUL I','CAP1')||'_R'||RR.RIND
                                                 WHEN RR.FORM IN (15) THEN DECODE(RR.DEN_SHORT,'Cap.I','CAP1')||'_R'||RR.RIND
                                                 WHEN RR.FORM IN (18) THEN DECODE(RR.DEN_SHORT,'Cap.I','CAP1')||'_R'||RR.RIND 
                                                 WHEN RR.FORM IN (36) THEN DECODE(RR.DEN_SHORT,'Cap.I','CAP1','CAP.I-Inf','CAP11','Cap.II','CAP2','Cap.II-Inf','CAP22','Cap.III','CAP3')||'_R'||RR.RIND 
                                                 WHEN RR.FORM IN (26,43,60) THEN DECODE(RR.DEN_SHORT,'Cap.I','CAP1','Cap.I-a','CAP1A','Cap.II','CAP2','Cap.III','CAP3')||'_R'||RR.RIND 
                                                 WHEN RR.FORM IN (45) THEN DECODE(RR.DEN_SHORT,'Cap.I','CAP1','Cap.I-a','CAP1','Cap.II','CAP2','Cap.III','CAP3','Cap.IV','CAP4','Cap.V','CAP5','Cap.VI','CAP6')||'_R'||RR.RIND
                                                 WHEN RR.FORM IN (33) THEN DECODE(RR.DEN_SHORT,'Cap.1.1','CAP11','Cap.1.1.1','CAP111','Cap.1.2','CAP12')||'_R'||RR.RIND
                                                 WHEN RR.FORM IN (34,35,29) THEN DECODE(RR.DEN_SHORT,'Cap.I','CAP1','Informativ','CAP2')||'_R'||RR.RIND
                                                 WHEN RR.FORM IN (44) THEN DECODE(RR.DEN_SHORT,'Export de servicii','CAP1','Import de servicii','CAP2') ||'_R'||RR.RIND 
                                                 WHEN RR.FORM IN (74) THEN REPLACE(UPPER(RR.DEN_SHORT),'.','')||'_R'||REPLACE(RR.RIND,'.','_')
                                                 WHEN RR.FORM IN (48) THEN DECODE(RR.DEN_SHORT,'Cap.1','CAPITOL1','Cap.2','CAPITOL2','Cap.3','CAPITOL3','Cap.4','CAPITOL4','Cap.5','CAPITOL5',
                                                                                               'Cap.6','CAPITOL6','Cap.7','CAPITOL7','Cap.8','CAPITOL8','Cap.9','CAPITOL9')||'_R'||REPLACE(RR.RIND,'.','')
                                                 WHEN RR.FORM IN (73) THEN DECODE(RR.DEN_SHORT,'Cap. I','CAP1','Cap. II','CAP2')||'_R'||RR.RIND
                                                 WHEN RR.FORM IN (76) THEN DECODE(RR.DEN_SHORT,'Capitolul I','CAP1','Capitolul II','CAP2') ||'_R'||RR.RIND
                                            ELSE REPLACE(UPPER(REPLACE((RR.DEN_SHORT),'TITLUL','TITLU')),'.','')||'_R'||RR.RIND END);
            -- INSERT PHONE in SR chapter --------------------------------------
--            INSERT INTO DATA_ALL_FOR_VALIDATE(PERIOADA,FORM,FORM_VERS,CUIIO,CUIIO_VERS,ID_MD,DATA_REG,ID_USER,COL31,T_XML_FORM_ID,CREATED_DATE,ID_SCHEMA)
--            SELECT
--              vPERIOADA,
--              vFORM,
--              vFORM_VERS,
--              vCUIIO,
--              vCUIIO_VERS,
--              RR.ID_MD,
--              SYSDATE AS DATA_REG,
--              9999 AS ID_USER,
--              D.COL31,R.FORMID,--T_XML_FORM_ID from F_XML_FORMS
--              SYSDATE AS CREATED_DATE,
--              vID_SCHEMA
--            FROM
--            (
--            SELECT
--              D.XML_NODE_NAME AS NR_ROW,
--              MAX(CASE WHEN D.XML_NODE_NAME LIKE 'PHONE' THEN D.XML_NODE_VALUE END) AS COL31
--            FROM
--            (
--            SELECT 
--              XML_NODE_NAME,
--              XML_NODE_VALUE
--            FROM 
--              XMLTABLE('//dec/DataSet/Header/*' PASSING   
--                (SELECT  xmltype(XML) FROM F_XML_FORMS WHERE FORMID IN (R.FORMID))
--                 COLUMNS 
--                 XML_NODE_NAME VARCHAR2(100) PATH 'name()',
--                 XML_NODE_VALUE VARCHAR2(100) PATH 'text()' 
--            )
--            ) D
--            GROUP BY
--              SUBSTR(D.XML_NODE_NAME,0, INSTR(D.XML_NODE_NAME,'_C')-1)
--            ORDER BY
--              SUBSTR(D.XML_NODE_NAME,0, INSTR(D.XML_NODE_NAME,'_C')-1)
--            ) D
--            INNER JOIN
--              (
--                SELECT
--                  R.FORM,
--                  R.FORM_VERS,
--                  C.DEN_SHORT,
--                  R.CAPITOL,
--                  R.CAPITOL_VERS,
--                  R.RIND,
--                  R.RIND_VERS,
--                  R.ID_MD
--                FROM
--                  MD_RIND R
--                  INNER JOIN MD_CAPITOL C ON (R.CAPITOL=C.CAPITOL AND R.CAPITOL_VERS=C.CAPITOL_VERS)
--                  INNER JOIN (
--                    SELECT
--                      R.CAPITOL,
--                      R.RIND,
--                      MAX(R.RIND_VERS) AS RIND_VERS
--                    FROM
--                      MD_RIND R
--                    WHERE
--                      R.FORM IN (vFORM) AND
--                      R.ID_SCHEMA IN (vID_SCHEMA) AND
--                      R.RIND_VERS <= (vPERIOADA)
--                    GROUP BY
--                      R.CAPITOL,
--                      R.RIND
--                  ) RR ON (R.RIND=RR.RIND AND R.RIND_VERS=RR.RIND_VERS AND R.CAPITOL=RR.CAPITOL)
--                WHERE
--                  R.FORM IN (vFORM) AND
--                  R.ID_SCHEMA IN (vID_SCHEMA) AND
--                  R.STATUT <> '3'
--                ORDER BY
--                  R.RIND) RR ON (D.NR_ROW = CASE WHEN RR.FORM IN (74) THEN RR.RIND END);
              -- End inserting header ------------------------------------------    
          --Insert Agriculture Filial ------------------------------------------
          IF(vFORM IN (33,43,45,60) AND vID_SCHEMA IN (2)) THEN --if form is Agriculture insert FILIAL 4-AGR, 24-AGR, 29-AGR
              FOR FILIAL_AGR IN cFILIAL_AGR
              LOOP
                vFILIAL_AGR := '/dec/DataSet/Data/CAP/CAP_R[@line='||FILIAL_AGR.FILIAL_NR||']/*';
                INSERT INTO DATA_ALL_FOR_VALIDATE(PERIOADA,FORM,FORM_VERS,CUIIO,CUIIO_VERS,ID_MD,DATA_REG,ID_USER,COL1,COL2,COL3,COL4,COL5,COL6,COL7,
                                                  T_XML_FORM_ID,CREATED_DATE,ID_SCHEMA)
                SELECT
                  vPERIOADA,
                  vFORM,
                  vFORM_VERS,
                  vCUIIO||SUBSTR(FILIAL_AGR.CODUL,0,2),
                  vCUIIO_VERS,
                  RR.ID_MD,
                  SYSDATE AS DATA_REG,
                  9999 AS ID_USER,
                  D.COL1,D.COL2,D.COL3,D.COL4,D.COL5,D.COL6,D.COL7,
                  R.FORMID,
                  --T_XML_FORM_ID from F_XML_FORMS
                  SYSDATE AS CREATED_DATE,
                  vID_SCHEMA
                FROM
                (
                SELECT
                  SUBSTR(D.XML_NODE_NAME,0, INSTR(D.XML_NODE_NAME,'_C')-1) AS NR_ROW,
                  SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C1' THEN CASE WHEN D.XML_NODE_NAME LIKE '%_RCAEM_%' THEN SUBSTR(D.XML_NODE_VALUE,2,4) ELSE D.XML_NODE_VALUE END END) AS COL1,
                  SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C2' THEN CASE WHEN D.XML_NODE_NAME LIKE '%_RCAEM_%' THEN SUBSTR(D.XML_NODE_VALUE,2,4) ELSE D.XML_NODE_VALUE END END) AS COL2,
                  SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C3' THEN CASE WHEN D.XML_NODE_NAME LIKE '%_RCAEM_%' THEN SUBSTR(D.XML_NODE_VALUE,2,4) ELSE D.XML_NODE_VALUE END END) AS COL3,
                  SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C4' THEN CASE WHEN D.XML_NODE_NAME LIKE '%_RCAEM_%' THEN SUBSTR(D.XML_NODE_VALUE,2,4) ELSE D.XML_NODE_VALUE END END) AS COL4,
                  SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C5' THEN CASE WHEN D.XML_NODE_NAME LIKE '%_RCAEM_%' THEN SUBSTR(D.XML_NODE_VALUE,2,4) ELSE D.XML_NODE_VALUE END END) AS COL5,
                  SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C6' THEN CASE WHEN D.XML_NODE_NAME LIKE '%_RCAEM_%' THEN SUBSTR(D.XML_NODE_VALUE,2,4) ELSE D.XML_NODE_VALUE END END) AS COL6,
                  SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C7' THEN CASE WHEN D.XML_NODE_NAME LIKE '%_RCAEM_%' THEN SUBSTR(D.XML_NODE_VALUE,2,4) ELSE D.XML_NODE_VALUE END END) AS COL7
                FROM
                (
                SELECT 
                  REPLACE(XML_NODE_NAME,'_FILIAL','') AS XML_NODE_NAME,
                  XML_NODE_VALUE
                FROM 
                  XMLTABLE(vFILIAL_AGR PASSING   
                    (SELECT  xmltype(XML) FROM F_XML_FORMS WHERE FORMID IN (R.FORMID))
                     COLUMNS 
                     XML_NODE_NAME VARCHAR2(100) PATH 'name()',
                     XML_NODE_VALUE VARCHAR2(100) PATH 'text()' 
                )
                ) D
                GROUP BY
                  SUBSTR(D.XML_NODE_NAME,0, INSTR(D.XML_NODE_NAME,'_C')-1)
                ORDER BY
                  SUBSTR(D.XML_NODE_NAME,0, INSTR(D.XML_NODE_NAME,'_C')-1)
                ) D
                INNER JOIN
                  (
                    SELECT
                      R.FORM,
                      R.FORM_VERS,
                      C.DEN_SHORT,
                      R.CAPITOL,
                      R.CAPITOL_VERS,
                      R.RIND,
                      R.RIND_VERS,
                      R.ID_MD
                    FROM
                      MD_RIND R
                      INNER JOIN MD_CAPITOL C ON (R.CAPITOL=C.CAPITOL AND R.CAPITOL_VERS=C.CAPITOL_VERS)
                      INNER JOIN (
                        SELECT
                          R.CAPITOL,
                          R.RIND,
                          MAX(R.RIND_VERS) AS RIND_VERS
                        FROM
                          MD_RIND R
                        WHERE
                          R.FORM IN (vFORM) AND
                          R.ID_SCHEMA IN (vID_SCHEMA) AND
                          R.RIND_VERS <= (vPERIOADA)
                        GROUP BY
                          R.CAPITOL,
                          R.RIND
                      ) RR ON (R.RIND=RR.RIND AND R.RIND_VERS=RR.RIND_VERS AND R.CAPITOL=RR.CAPITOL)
                    WHERE
                      R.FORM IN (vFORM) AND
                      R.ID_SCHEMA IN (vID_SCHEMA) AND
                      R.STATUT <> '3'
                    ORDER BY
                      R.RIND) RR ON (D.NR_ROW = CASE WHEN RR.FORM IN (26,43,60) THEN DECODE(RR.DEN_SHORT,'Cap.I','CAP1','Cap.I-a','CAP1A','Cap.II','CAP2','Cap.III','CAP3')||'_R'||RR.RIND
                                                     WHEN RR.FORM IN (33) THEN DECODE(RR.DEN_SHORT,'Cap.1.1','CAP11','Cap.1.1.1','CAP111','Cap.1.2','CAP12')||'_R'||RR.RIND
                                                     WHEN RR.FORM IN (45) THEN DECODE(RR.DEN_SHORT,'Cap.I','CAP1','Cap.I-a','CAP1','Cap.II','CAP2','Cap.III','CAP3','Cap.IV','CAP4','Cap.V','CAP5','Cap.VI','CAP6')||'_R'||RR.RIND
                                                ELSE REPLACE(UPPER(REPLACE((RR.DEN_SHORT),'TITLUL','TITLU')),'.','')||'_R'||RR.RIND END);
              END LOOP;
          END IF;
          --End Insert Agriculture Filial --------------------------------------
          IF(vFORM IN (44) AND vID_SCHEMA IN (2)) THEN --if form is ei-78 insert dynamic row
            FOR CHAPTER_NAME IN cCHAPTER_NAME
              LOOP
                FOR DYNAMIC_ROW_ALL IN cDYNAMIC_ROW_ALL('/dec/DataSet/Data/'||CHAPTER_NAME.CHAPTER_NAME)
                  LOOP
                    vDYNAMIC_ROW_CAP := '/dec/DataSet/Data/'||CHAPTER_NAME.CHAPTER_NAME||'[@line='||DYNAMIC_ROW_ALL.LINES_NR||']/*';
                    INSERT INTO DATA_ALL_FOR_VALIDATE(PERIOADA,FORM,FORM_VERS,CUIIO,CUIIO_VERS,ID_MD,DATA_REG,ID_USER,COL31,COL33,COL4,T_XML_FORM_ID,CREATED_DATE,ID_SCHEMA)
                    SELECT
                              vPERIOADA,
                              vFORM,
                              vFORM_VERS,
                              vCUIIO,
                              vCUIIO_VERS,
                    --          RR.CAPITOL,
                    --          RR.RIND,
                              RR.ID_MD,
                              SYSDATE AS DATA_REG,
                              9999 AS ID_USER,
                              D.COL31,D.COL33,D.COL4,
                              R.FORMID,--T_XML_FORM_ID from F_XML_FORMS
                              SYSDATE AS CREATED_DATE,
                              vID_SCHEMA
                            FROM
                            (SELECT
                          SUBSTR(D.XML_NODE_NAME,0, INSTR(D.XML_NODE_NAME,'_C')-1) AS NR_ROW,
                          MAX(CASE WHEN D.XML_NODE_NAME LIKE '%_C31' THEN D.XML_NODE_VALUE END) AS COL31,
                          MAX(CASE WHEN D.XML_NODE_NAME LIKE '%_C33' THEN D.XML_NODE_VALUE END) AS COL33,
                          SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C4' THEN D.XML_NODE_VALUE END) AS COL4
                        FROM
                        (
                        SELECT
                          REPLACE(NAME,'_R','_R'||TO_NUMBER(NEW_NODE_VALUE+1)) AS XML_NODE_NAME,
                          NODE_VALUE AS XML_NODE_VALUE,
                          ORDINE
                        FROM
                        (
                        SELECT 
                                  D1.XML_NODE_NAME AS NAME,
                                  D1.XML_NODE_VALUE AS NODE_VALUE,
                                  D2.XML_NODE_VALUE AS NEW_NODE_VALUE,
                                  D1.XML_NODE_ATTR,
                                  ROWNUM AS ORDINE
                                FROM 
                                  XMLTABLE(vDYNAMIC_ROW_CAP PASSING   
                                    (SELECT  xmltype(XML) FROM F_XML_FORMS WHERE FORMID IN (R.FORMID))
                                     COLUMNS 
                                     XML_NODE_NAME VARCHAR2(100) PATH 'name()',
                                     XML_NODE_VALUE VARCHAR2(100) PATH 'text()',
                                     XML_NODE_ATTR VARCHAR2(100) PATH '@line'
                                ) D1 CROSS JOIN
                                XMLTABLE(REPLACE(vDYNAMIC_ROW_CAP,'*',CHAPTER_NAME.CHAPTER_NAME||'_CI') PASSING   
                                    (SELECT  xmltype(XML) FROM F_XML_FORMS WHERE FORMID IN (R.FORMID))
                                     COLUMNS 
                                     XML_NODE_NAME VARCHAR2(100) PATH 'name()',
                                     XML_NODE_VALUE VARCHAR2(100) PATH 'text()',
                                     XML_NODE_ATTR VARCHAR2(100) PATH '@line'
                                ) D2 --ON (D1.XML_NODE_VALUE=D2.XML_NODE_VALUE)
                                ORDER BY ROWNUM
                        )
                )D
                WHERE
                  SUBSTR(D.XML_NODE_NAME,0, INSTR(D.XML_NODE_NAME,'_C')-1) IS NOT NULL
                GROUP BY
                  SUBSTR(D.XML_NODE_NAME,0, INSTR(D.XML_NODE_NAME,'_C')-1)
                ) D
                            INNER JOIN
                              (
                                SELECT
                                  R.FORM,
                                  R.FORM_VERS,
                                  C.DEN_SHORT,
                                  C.CAPITOL,
                                  C.CAPITOL_VERS,
                                  R.RIND,
                                  R.RIND_VERS,
                                  R.ID_MD
                                FROM
                                  MD_RIND R
                                  INNER JOIN MD_CAPITOL C ON (R.CAPITOL=C.CAPITOL AND R.CAPITOL_VERS=C.CAPITOL_VERS AND R.ID_SCHEMA=C.ID_SCHEMA)
                                  INNER JOIN (
                                     SELECT
                                      R.CAPITOL,
                                      MAX(R.CAPITOL_VERS) AS CAPITOL_VERS,
                                      R.RIND,
                                      MAX(R.RIND_VERS) AS RIND_VERS,
                                      R.ID_SCHEMA
                                    FROM
                                      MD_RIND R
                                      INNER JOIN (SELECT DISTINCT
                                                  C.CAPITOL,
                                                  MAX(C.CAPITOL_VERS)AS CAPITOL_VERS
                                                FROM
                                                  MD_CAPITOL C
                                                  INNER JOIN MD_RIND R ON (R.CAPITOL=C.CAPITOL AND R.CAPITOL_VERS=C.CAPITOL_VERS AND C.ID_SCHEMA=R.ID_SCHEMA)
                                                WHERE
                                                  R.FORM IN (vFORM) AND
                                                  R.ID_SCHEMA IN (vID_SCHEMA) AND
                                                  C.CAPITOL_VERS <= (vPERIOADA)
                                                GROUP BY
                                                  C.CAPITOL) C ON (R.CAPITOL=C.CAPITOL AND R.CAPITOL_VERS=C.CAPITOL_VERS)
                                    WHERE
                                      R.FORM IN (vFORM) AND
                                      R.ID_SCHEMA IN (vID_SCHEMA) AND
                                      R.RIND_VERS <= (vPERIOADA)
                                    GROUP BY
                                      R.CAPITOL,
                                      R.RIND,
                                      R.ID_SCHEMA
                                  ) RR ON (R.RIND=RR.RIND AND R.RIND_VERS=RR.RIND_VERS AND C.CAPITOL=RR.CAPITOL AND C.CAPITOL_VERS=RR.CAPITOL_VERS AND R.ID_SCHEMA=RR.ID_SCHEMA)
                                WHERE
                                  R.FORM IN (vFORM) AND
                                  R.ID_SCHEMA IN (vID_SCHEMA) AND
                                  R.STATUT <> '3' AND
                                  C.STATUT <> '3' AND
                                  C.CAPITOL NOT IN (100)
                                ORDER BY
                                  R.CAPITOL,
                                  R.RIND) RR ON (D.NR_ROW = CASE 
                                                              WHEN RR.FORM IN (vFORM) THEN DECODE(RR.DEN_SHORT,'Export de servicii','CAP1','Import de servicii','CAP2')||'_R'||RR.RIND
                                                            ELSE RR.DEN_SHORT||'_R'||RR.RIND  END);
                  END LOOP;
              END LOOP;
              
          END IF;
          
          IF(vFORM IN (73) AND vID_SCHEMA IN (2)) THEN --if from is 3-AGR insert dynamic row
            FOR CHAPTER_NAME IN cCHAPTER_NAME
              LOOP
                FOR DYNAMIC_ROW_ALL IN cDYNAMIC_ROW_ALL('/dec/DataSet/Data/'||SUBSTR(CHAPTER_NAME.CHAPTER_NAME,1,7)||'/'||CHAPTER_NAME.CHAPTER_NAME)
                  LOOP
                    vDYNAMIC_ROW_CAP := '/dec/DataSet/Data/'||SUBSTR(CHAPTER_NAME.CHAPTER_NAME,1,7)||'/'||CHAPTER_NAME.CHAPTER_NAME||'[@line='||DYNAMIC_ROW_ALL.LINES_NR||']/*';
                    INSERT INTO DATA_ALL_FOR_VALIDATE(PERIOADA,FORM,FORM_VERS,CUIIO,CUIIO_VERS,ID_MD,DATA_REG,ID_USER,COL1,COL32,COL3,COL4,COL5,COL6,COL7,T_XML_FORM_ID,CREATED_DATE,ID_SCHEMA)
                    SELECT
                              vPERIOADA,
                              vFORM,
                              vFORM_VERS,
                              vCUIIO,
                              vCUIIO_VERS,
                    --          RR.CAPITOL,
                    --          RR.RIND,
                              RR.ID_MD,
                              SYSDATE AS DATA_REG,
                              9999 AS ID_USER,
                              D.COL1,D.COL32,D.COL3,D.COL4,D.COL5,D.COL6,D.COL7,
                              R.FORMID,--T_XML_FORM_ID from F_XML_FORMS
                              SYSDATE AS CREATED_DATE,
                              vID_SCHEMA
                            FROM
                            (SELECT
                          SUBSTR(D.XML_NODE_NAME,0, INSTR(D.XML_NODE_NAME,'_C')-1)||'-'||DYNAMIC_ROW_ALL.LINES_NR AS NR_ROW,
                          SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C1' THEN D.XML_NODE_VALUE END) AS COL1,
                          MAX(CASE WHEN D.XML_NODE_NAME LIKE '%_C32' THEN D.XML_NODE_VALUE END) AS COL32,
                          SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C3' THEN D.XML_NODE_VALUE END) AS COL3,
                          SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C4' THEN D.XML_NODE_VALUE END) AS COL4,
                          SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C5' THEN D.XML_NODE_VALUE END) AS COL5,
                          SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C6' THEN D.XML_NODE_VALUE END) AS COL6,
                          SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C7' THEN D.XML_NODE_VALUE END) AS COL7
                        FROM
                        (
                        SELECT
--                          REPLACE(NAME,'_R','_R'||NEW_NODE_VALUE) AS XML_NODE_NAME,
                          NAME AS XML_NODE_NAME,
                          NODE_VALUE AS XML_NODE_VALUE,
                          ORDINE
                        FROM
                        (
                        SELECT 
                                  D1.XML_NODE_NAME AS NAME,
                                  D1.XML_NODE_VALUE AS NODE_VALUE,
                                  D2.XML_NODE_VALUE AS NEW_NODE_VALUE,
                                  D1.XML_NODE_ATTR,
                                  ROWNUM AS ORDINE
                                FROM 
                                  XMLTABLE(vDYNAMIC_ROW_CAP PASSING   
                                    (SELECT  xmltype(XML) FROM F_XML_FORMS WHERE FORMID IN (R.FORMID))
                                     COLUMNS 
                                     XML_NODE_NAME VARCHAR2(100) PATH 'name()',
                                     XML_NODE_VALUE VARCHAR2(100) PATH 'text()',
                                     XML_NODE_ATTR VARCHAR2(100) PATH '@line'
                                ) D1 CROSS JOIN
                                XMLTABLE(REPLACE(vDYNAMIC_ROW_CAP,'*',REPLACE(CHAPTER_NAME.CHAPTER_NAME,SUBSTR(CHAPTER_NAME.CHAPTER_NAME,6,4),'R'||TRIM(TO_CHAR(SUBSTR(CHAPTER_NAME.CHAPTER_NAME,7,1),'00')||'0'))||'_CA') PASSING   
                                    (SELECT  xmltype(XML) FROM F_XML_FORMS WHERE FORMID IN (R.FORMID))
                                     COLUMNS 
                                     XML_NODE_NAME VARCHAR2(100) PATH 'name()',
                                     XML_NODE_VALUE VARCHAR2(100) PATH 'text()',
                                     XML_NODE_ATTR VARCHAR2(100) PATH '@line'
                                ) D2 --ON (D1.XML_NODE_VALUE=D2.XML_NODE_VALUE)
                                ORDER BY ROWNUM
                        )
                )D
                WHERE
                  SUBSTR(D.XML_NODE_NAME,0, INSTR(D.XML_NODE_NAME,'_C')-1) IS NOT NULL
                GROUP BY
                  SUBSTR(D.XML_NODE_NAME,0, INSTR(D.XML_NODE_NAME,'_C')-1)
                ) D
                            INNER JOIN
                              (
                                SELECT
                                  R.FORM,
                                  R.FORM_VERS,
                                  C.DEN_SHORT,
                                  C.CAPITOL,
                                  C.CAPITOL_VERS,
                                  R.RIND,
                                  R.RIND_VERS,
                                  R.ID_MD
                                FROM
                                  MD_RIND R
                                  INNER JOIN MD_CAPITOL C ON (R.CAPITOL=C.CAPITOL AND R.CAPITOL_VERS=C.CAPITOL_VERS AND R.ID_SCHEMA=C.ID_SCHEMA)
                                  INNER JOIN (
                                     SELECT
                                      R.CAPITOL,
                                      MAX(R.CAPITOL_VERS) AS CAPITOL_VERS,
                                      R.RIND,
                                      MAX(R.RIND_VERS) AS RIND_VERS,
                                      R.ID_SCHEMA
                                    FROM
                                      MD_RIND R
                                      INNER JOIN (SELECT DISTINCT
                                                  C.CAPITOL,
                                                  MAX(C.CAPITOL_VERS)AS CAPITOL_VERS
                                                FROM
                                                  MD_CAPITOL C
                                                  INNER JOIN MD_RIND R ON (R.CAPITOL=C.CAPITOL AND R.CAPITOL_VERS=C.CAPITOL_VERS AND C.ID_SCHEMA=R.ID_SCHEMA)
                                                WHERE
                                                  R.FORM IN (vFORM) AND
                                                  R.ID_SCHEMA IN (vID_SCHEMA) AND
                                                  C.CAPITOL_VERS <= (vPERIOADA)
                                                GROUP BY
                                                  C.CAPITOL) C ON (R.CAPITOL=C.CAPITOL AND R.CAPITOL_VERS=C.CAPITOL_VERS)
                                    WHERE
                                      R.FORM IN (vFORM) AND
                                      R.ID_SCHEMA IN (vID_SCHEMA) AND
                                      R.RIND_VERS <= (vPERIOADA)
                                    GROUP BY
                                      R.CAPITOL,
                                      R.RIND,
                                      R.ID_SCHEMA
                                  ) RR ON (R.RIND=RR.RIND AND R.RIND_VERS=RR.RIND_VERS AND C.CAPITOL=RR.CAPITOL AND C.CAPITOL_VERS=RR.CAPITOL_VERS AND R.ID_SCHEMA=RR.ID_SCHEMA)
                                WHERE
                                  R.FORM IN (vFORM) AND
                                  R.ID_SCHEMA IN (vID_SCHEMA) AND
                                  R.STATUT <> '3' AND
                                  C.STATUT <> '3' AND
                                  C.CAPITOL NOT IN (100)
                                ORDER BY
                                  R.CAPITOL,
                                  R.RIND) RR ON (D.NR_ROW = CASE WHEN RR.FORM IN (vFORM) THEN 
                                  DECODE(RR.DEN_SHORT,'Cap. I','CAP1','CAP. II','CAP2')||'_R'||RR.RIND ELSE RR.DEN_SHORT||'_R'||RR.RIND END);
                  END LOOP;
              END LOOP;
            END IF;
            
          IF(vFORM IN (5) AND vID_SCHEMA IN (2)) THEN --if from is 65-Auto insert dynamic row
            FOR CHAPTER_NAME IN cCHAPTER_NAME
              LOOP
                FOR DYNAMIC_ROW_ALL IN cDYNAMIC_ROW_ALL('/dec/DataSet/Data/'||CHAPTER_NAME.CHAPTER_NAME)
                  LOOP
                    vDYNAMIC_ROW_CAP := '/dec/DataSet/Data/'||CHAPTER_NAME.CHAPTER_NAME||'[@line='||DYNAMIC_ROW_ALL.LINES_NR||']/*';
                    INSERT INTO DATA_ALL_FOR_VALIDATE(PERIOADA,FORM,FORM_VERS,CUIIO,CUIIO_VERS,ID_MD,DATA_REG,ID_USER,COL1,COL2,T_XML_FORM_ID,CREATED_DATE,ID_SCHEMA)
                    SELECT
                              vPERIOADA,
                              vFORM,
                              vFORM_VERS,
                              vCUIIO,
                              vCUIIO_VERS,
                    --          RR.CAPITOL,
                    --          RR.RIND,
                              RR.ID_MD,
                              SYSDATE AS DATA_REG,
                              9999 AS ID_USER,
                              D.COL1,D.COL2,
                              R.FORMID,--T_XML_FORM_ID from F_XML_FORMS
                              SYSDATE AS CREATED_DATE,
                              vID_SCHEMA
                            FROM
                            (SELECT
                          SUBSTR(D.XML_NODE_NAME,0, INSTR(D.XML_NODE_NAME,'_C')-1) AS NR_ROW,
                          SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C1' THEN D.XML_NODE_VALUE END) AS COL1,
                          SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C2' THEN D.XML_NODE_VALUE END) AS COL2
                        FROM
                        (
                        SELECT
                          REPLACE(NAME,'_R','_R'||NEW_NODE_VALUE) AS XML_NODE_NAME,
                          NODE_VALUE AS XML_NODE_VALUE,
                          ORDINE
                        FROM
                        (
                        SELECT 
                                  D1.XML_NODE_NAME AS NAME,
                                  D1.XML_NODE_VALUE AS NODE_VALUE,
                                  D2.XML_NODE_VALUE AS NEW_NODE_VALUE,
                                  D1.XML_NODE_ATTR,
                                  ROWNUM AS ORDINE
                                FROM 
                                  XMLTABLE(vDYNAMIC_ROW_CAP PASSING   
                                    (SELECT  xmltype(XML) FROM F_XML_FORMS WHERE FORMID IN (R.FORMID))
                                     COLUMNS 
                                     XML_NODE_NAME VARCHAR2(100) PATH 'name()',
                                     XML_NODE_VALUE VARCHAR2(100) PATH 'text()',
                                     XML_NODE_ATTR VARCHAR2(100) PATH '@line'
                                ) D1 CROSS JOIN
                                XMLTABLE(REPLACE(vDYNAMIC_ROW_CAP,'*',CHAPTER_NAME.CHAPTER_NAME||'_CB') PASSING   
                                    (SELECT  xmltype(XML) FROM F_XML_FORMS WHERE FORMID IN (R.FORMID))
                                     COLUMNS 
                                     XML_NODE_NAME VARCHAR2(100) PATH 'name()',
                                     XML_NODE_VALUE VARCHAR2(100) PATH 'text()',
                                     XML_NODE_ATTR VARCHAR2(100) PATH '@line'
                                ) D2 --ON (D1.XML_NODE_VALUE=D2.XML_NODE_VALUE)
                                ORDER BY ROWNUM
                        )
                )D
                WHERE
                  SUBSTR(D.XML_NODE_NAME,0, INSTR(D.XML_NODE_NAME,'_C')-1) IS NOT NULL
                GROUP BY
                  SUBSTR(D.XML_NODE_NAME,0, INSTR(D.XML_NODE_NAME,'_C')-1)
                ) D
                            INNER JOIN
                              (
                                SELECT
                                  R.FORM,
                                  R.FORM_VERS,
                                  C.DEN_SHORT,
                                  C.CAPITOL,
                                  C.CAPITOL_VERS,
                                  R.RIND,
                                  R.RIND_VERS,
                                  R.ID_MD
                                FROM
                                  MD_RIND R
                                  INNER JOIN MD_CAPITOL C ON (R.CAPITOL=C.CAPITOL AND R.CAPITOL_VERS=C.CAPITOL_VERS AND R.ID_SCHEMA=C.ID_SCHEMA)
                                  INNER JOIN (
                                     SELECT
                                      R.CAPITOL,
                                      MAX(R.CAPITOL_VERS) AS CAPITOL_VERS,
                                      R.RIND,
                                      MAX(R.RIND_VERS) AS RIND_VERS,
                                      R.ID_SCHEMA
                                    FROM
                                      MD_RIND R
                                      INNER JOIN (SELECT DISTINCT
                                                  C.CAPITOL,
                                                  MAX(C.CAPITOL_VERS)AS CAPITOL_VERS
                                                FROM
                                                  MD_CAPITOL C
                                                  INNER JOIN MD_RIND R ON (R.CAPITOL=C.CAPITOL AND R.CAPITOL_VERS=C.CAPITOL_VERS AND C.ID_SCHEMA=R.ID_SCHEMA)
                                                WHERE
                                                  R.FORM IN (vFORM) AND
                                                  R.ID_SCHEMA IN (vID_SCHEMA) AND
                                                  C.CAPITOL_VERS <= (vPERIOADA)
                                                GROUP BY
                                                  C.CAPITOL) C ON (R.CAPITOL=C.CAPITOL AND R.CAPITOL_VERS=C.CAPITOL_VERS)
                                    WHERE
                                      R.FORM IN (vFORM) AND
                                      R.ID_SCHEMA IN (vID_SCHEMA) AND
                                      R.RIND_VERS <= (vPERIOADA)
                                    GROUP BY
                                      R.CAPITOL,
                                      R.RIND,
                                      R.ID_SCHEMA
                                  ) RR ON (R.RIND=RR.RIND AND R.RIND_VERS=RR.RIND_VERS AND C.CAPITOL=RR.CAPITOL AND C.CAPITOL_VERS=RR.CAPITOL_VERS AND R.ID_SCHEMA=RR.ID_SCHEMA)
                                WHERE
                                  R.FORM IN (vFORM) AND
                                  R.ID_SCHEMA IN (vID_SCHEMA) AND
                                  R.STATUT <> '3' AND
                                  C.STATUT <> '3' AND
                                  C.CAPITOL NOT IN (100)
                                ORDER BY
                                  R.CAPITOL,
                                  R.RIND) RR ON (D.NR_ROW = CASE WHEN RR.FORM IN (vFORM) THEN 
                                  DECODE(RR.DEN_SHORT,'Cap. III','CAP3','CAP.4','CAP4','CAP.5','CAP5')||'_R'||RR.RIND ELSE RR.DEN_SHORT||'_R'||RR.RIND END);
                  END LOOP;
              END LOOP;
            END IF;
          IF(vFORM IN (6) AND vID_SCHEMA IN (2)) THEN --if from is 1-turism insert dynamic row
            FOR CHAPTER_NAME IN cCHAPTER_NAME
              LOOP
                FOR DYNAMIC_ROW_ALL IN cDYNAMIC_ROW_ALL('/dec/DataSet/Data/'||CHAPTER_NAME.CHAPTER_NAME)
                  LOOP
                    vDYNAMIC_ROW_CAP := '/dec/DataSet/Data/'||CHAPTER_NAME.CHAPTER_NAME||'[@line='||DYNAMIC_ROW_ALL.LINES_NR||']/*';
                    INSERT INTO DATA_ALL_FOR_VALIDATE(PERIOADA,FORM,FORM_VERS,CUIIO,CUIIO_VERS,ID_MD,DATA_REG,ID_USER,COL1,COL2,T_XML_FORM_ID,CREATED_DATE,ID_SCHEMA)
                    SELECT
                              vPERIOADA,
                              vFORM,
                              vFORM_VERS,
                              vCUIIO,
                              vCUIIO_VERS,
                    --          RR.CAPITOL,
                    --          RR.RIND,
                              RR.ID_MD,
                              SYSDATE AS DATA_REG,
                              9999 AS ID_USER,
                              D.COL1,D.COL2,
                              R.FORMID,--T_XML_FORM_ID from F_XML_FORMS
                              SYSDATE AS CREATED_DATE,
                              vID_SCHEMA
                            FROM
                            (SELECT
                          SUBSTR(D.XML_NODE_NAME,0, INSTR(D.XML_NODE_NAME,'_C')-1) AS NR_ROW,
                          SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C1' THEN D.XML_NODE_VALUE END) AS COL1,
                          SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C2' THEN D.XML_NODE_VALUE END) AS COL2
                        FROM
                        (
                        SELECT
                          REPLACE(NAME,'_R','_R'||NEW_NODE_VALUE) AS XML_NODE_NAME,
                          NODE_VALUE AS XML_NODE_VALUE,
                          ORDINE
                        FROM
                        (
                        SELECT 
                                  D1.XML_NODE_NAME AS NAME,
                                  D1.XML_NODE_VALUE AS NODE_VALUE,
                                  D2.XML_NODE_VALUE AS NEW_NODE_VALUE,
                                  D1.XML_NODE_ATTR,
                                  ROWNUM AS ORDINE
                                FROM 
                                  XMLTABLE(vDYNAMIC_ROW_CAP PASSING   
                                    (SELECT  xmltype(XML) FROM F_XML_FORMS WHERE FORMID IN (R.FORMID))
                                     COLUMNS 
                                     XML_NODE_NAME VARCHAR2(100) PATH 'name()',
                                     XML_NODE_VALUE VARCHAR2(100) PATH 'text()',
                                     XML_NODE_ATTR VARCHAR2(100) PATH '@line'
                                ) D1 CROSS JOIN
                                XMLTABLE(REPLACE(vDYNAMIC_ROW_CAP,'*',CHAPTER_NAME.CHAPTER_NAME||'_CB') PASSING   
                                    (SELECT  xmltype(XML) FROM F_XML_FORMS WHERE FORMID IN (R.FORMID))
                                     COLUMNS 
                                     XML_NODE_NAME VARCHAR2(100) PATH 'name()',
                                     XML_NODE_VALUE VARCHAR2(100) PATH 'text()',
                                     XML_NODE_ATTR VARCHAR2(100) PATH '@line'
                                ) D2 --ON (D1.XML_NODE_VALUE=D2.XML_NODE_VALUE)
                                ORDER BY ROWNUM
                        )
                )D
                WHERE
                  SUBSTR(D.XML_NODE_NAME,0, INSTR(D.XML_NODE_NAME,'_C')-1) IS NOT NULL
                GROUP BY
                  SUBSTR(D.XML_NODE_NAME,0, INSTR(D.XML_NODE_NAME,'_C')-1)
                ) D
                            INNER JOIN
                              (
                                SELECT
                                  R.FORM,
                                  R.FORM_VERS,
                                  C.DEN_SHORT,
                                  C.CAPITOL,
                                  C.CAPITOL_VERS,
                                  R.RIND,
                                  R.RIND_VERS,
                                  R.ID_MD
                                FROM
                                  MD_RIND R
                                  INNER JOIN MD_CAPITOL C ON (R.CAPITOL=C.CAPITOL AND R.CAPITOL_VERS=C.CAPITOL_VERS AND R.ID_SCHEMA=C.ID_SCHEMA)
                                  INNER JOIN (
                                     SELECT
                                      R.CAPITOL,
                                      MAX(R.CAPITOL_VERS) AS CAPITOL_VERS,
                                      R.RIND,
                                      MAX(R.RIND_VERS) AS RIND_VERS,
                                      R.ID_SCHEMA
                                    FROM
                                      MD_RIND R
                                      INNER JOIN (SELECT DISTINCT
                                                  C.CAPITOL,
                                                  MAX(C.CAPITOL_VERS)AS CAPITOL_VERS
                                                FROM
                                                  MD_CAPITOL C
                                                  INNER JOIN MD_RIND R ON (R.CAPITOL=C.CAPITOL AND R.CAPITOL_VERS=C.CAPITOL_VERS AND C.ID_SCHEMA=R.ID_SCHEMA)
                                                WHERE
                                                  R.FORM IN (vFORM) AND
                                                  R.ID_SCHEMA IN (vID_SCHEMA) AND
                                                  C.CAPITOL_VERS <= (vPERIOADA)
                                                GROUP BY
                                                  C.CAPITOL) C ON (R.CAPITOL=C.CAPITOL AND R.CAPITOL_VERS=C.CAPITOL_VERS)
                                    WHERE
                                      R.FORM IN (vFORM) AND
                                      R.ID_SCHEMA IN (vID_SCHEMA) AND
                                      R.RIND_VERS <= (vPERIOADA)
                                    GROUP BY
                                      R.CAPITOL,
                                      R.RIND,
                                      R.ID_SCHEMA
                                  ) RR ON (R.RIND=RR.RIND AND R.RIND_VERS=RR.RIND_VERS AND C.CAPITOL=RR.CAPITOL AND C.CAPITOL_VERS=RR.CAPITOL_VERS AND R.ID_SCHEMA=RR.ID_SCHEMA)
                                WHERE
                                  R.FORM IN (vFORM) AND
                                  R.ID_SCHEMA IN (vID_SCHEMA) AND
                                  R.STATUT <> '3' AND
                                  C.STATUT <> '3' AND
                                  C.CAPITOL NOT IN (100)
                                ORDER BY
                                  R.CAPITOL,
                                  R.RIND) RR ON (D.NR_ROW = CASE WHEN RR.FORM IN (vFORM) THEN 
                                  DECODE(RR.DEN_SHORT,'Cap.II','CAP2')||'_R'||RR.RIND ELSE RR.DEN_SHORT||'_R'||RR.RIND END);
                  END LOOP;
              END LOOP;
              
            END IF;
          IF(vFORM IN (64)) THEN --if from is ASA insert dynamic row
            FOR CHAPTER_NAME IN cCHAPTER_NAME
              LOOP
                FOR DYNAMIC_ROW_ALL IN cDYNAMIC_ROW_ALL('/dec/DataSet/Data/'||CHAPTER_NAME.CHAPTER_NAME)
                  LOOP
                    vDYNAMIC_ROW_CAP := '/dec/DataSet/Data/'||CHAPTER_NAME.CHAPTER_NAME||'[@line='||DYNAMIC_ROW_ALL.LINES_NR||']/*';
                    INSERT INTO DATA_ALL_FOR_VALIDATE(PERIOADA,FORM,FORM_VERS,CUIIO,CUIIO_VERS,ID_MD,DATA_REG,ID_USER,COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9,COL10,COL31,
                                COL32,COL33,COL34,COL35,COL36,COL37,COL38,COL39,COL40,T_XML_FORM_ID,CREATED_DATE,ID_SCHEMA)
                    SELECT
                              vPERIOADA,
                              vFORM,
                              vFORM_VERS,
                              vCUIIO,
                              vCUIIO_VERS,
                    --          RR.CAPITOL,
                    --          RR.RIND,
                              RR.ID_MD,
                              SYSDATE AS DATA_REG,
                              9999 AS ID_USER,
                              D.COL1,D.COL2,D.COL3,D.COL4,D.COL5,D.COL6,D.COL7,D.COL8,D.COL9,D.COL10,D.COL31,D.COL32,D.COL33,D.COL34,D.COL35,D.COL36,D.COL37,D.COL38,D.COL39,D.COL40,
                              R.FORMID,--T_XML_FORM_ID from F_XML_FORMS
                              SYSDATE AS CREATED_DATE,
                              vID_SCHEMA
                            FROM
                            (SELECT
                          SUBSTR(D.XML_NODE_NAME,0, INSTR(D.XML_NODE_NAME,'_C')-1) AS NR_ROW,
                          SUM(SUBSTR(CASE WHEN D.XML_NODE_NAME LIKE '%_C1' THEN D.XML_NODE_VALUE END,2,4)) AS COL1,
                          SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C2' THEN D.XML_NODE_VALUE END) AS COL2,
                          SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C3' THEN D.XML_NODE_VALUE END) AS COL3,
                          SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C4' THEN D.XML_NODE_VALUE END) AS COL4,
                          SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C5' THEN D.XML_NODE_VALUE END) AS COL5,
                          SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C6' THEN D.XML_NODE_VALUE END) AS COL6,
                          SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C7' THEN D.XML_NODE_VALUE END) AS COL7,
                          SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C8' THEN D.XML_NODE_VALUE END) AS COL8,
                          SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C9' THEN D.XML_NODE_VALUE END) AS COL9,
                          SUM(CASE WHEN D.XML_NODE_NAME LIKE '%_C10' THEN D.XML_NODE_VALUE END) AS COL10,
                          MAX(CASE WHEN D.XML_NODE_NAME LIKE '%_C31' THEN D.XML_NODE_VALUE END) AS COL31,
                          MAX(CASE WHEN D.XML_NODE_NAME LIKE '%_C32' THEN D.XML_NODE_VALUE END) AS COL32,
                          MAX(CASE WHEN D.XML_NODE_NAME LIKE '%_C33' THEN D.XML_NODE_VALUE END) AS COL33,
                          MAX(CASE WHEN D.XML_NODE_NAME LIKE '%_C34' THEN D.XML_NODE_VALUE END) AS COL34,
                          MAX(CASE WHEN D.XML_NODE_NAME LIKE '%_C35' THEN D.XML_NODE_VALUE END) AS COL35,
                          MAX(CASE WHEN D.XML_NODE_NAME LIKE '%_C36' THEN D.XML_NODE_VALUE END) AS COL36,
                          MAX(CASE WHEN D.XML_NODE_NAME LIKE '%_C37' THEN D.XML_NODE_VALUE END) AS COL37,
                          MAX(CASE WHEN D.XML_NODE_NAME LIKE '%_C38' THEN D.XML_NODE_VALUE END) AS COL38,
                          MAX(CASE WHEN D.XML_NODE_NAME LIKE '%_C39' THEN D.XML_NODE_VALUE END) AS COL39,
                          MAX(CASE WHEN D.XML_NODE_NAME LIKE '%_C40' THEN D.XML_NODE_VALUE END) AS COL40
                        FROM
                        (
                        SELECT
                          REPLACE(NAME,'_R','_R'||NEW_NODE_VALUE) AS XML_NODE_NAME,
                          NODE_VALUE AS XML_NODE_VALUE,
                          ORDINE
                        FROM
                        (
                        SELECT 
                                  D1.XML_NODE_NAME AS NAME,
                                  D1.XML_NODE_VALUE AS NODE_VALUE,
                                  D2.XML_NODE_VALUE AS NEW_NODE_VALUE,
                                  D1.XML_NODE_ATTR,
                                  ROWNUM AS ORDINE
                                FROM 
                                  XMLTABLE(vDYNAMIC_ROW_CAP PASSING   
                                    (SELECT  xmltype(XML) FROM F_XML_FORMS WHERE FORMID IN (R.FORMID))
                                     COLUMNS 
                                     XML_NODE_NAME VARCHAR2(100) PATH 'name()',
                                     XML_NODE_VALUE VARCHAR2(100) PATH 'text()',
                                     XML_NODE_ATTR VARCHAR2(100) PATH '@line'
                                ) D1 CROSS JOIN
                                XMLTABLE(REPLACE(vDYNAMIC_ROW_CAP,'*',CHAPTER_NAME.CHAPTER_NAME||'_CA') PASSING   
                                    (SELECT  xmltype(XML) FROM F_XML_FORMS WHERE FORMID IN (R.FORMID))
                                     COLUMNS 
                                     XML_NODE_NAME VARCHAR2(100) PATH 'name()',
                                     XML_NODE_VALUE VARCHAR2(100) PATH 'text()',
                                     XML_NODE_ATTR VARCHAR2(100) PATH '@line'
                                ) D2 --ON (D1.XML_NODE_VALUE=D2.XML_NODE_VALUE)
                                ORDER BY ROWNUM
                        )
                )D
                WHERE
                  SUBSTR(D.XML_NODE_NAME,0, INSTR(D.XML_NODE_NAME,'_C')-1) IS NOT NULL
                GROUP BY
                  SUBSTR(D.XML_NODE_NAME,0, INSTR(D.XML_NODE_NAME,'_C')-1)
                ) D
                            INNER JOIN
                              (
                                SELECT
                                  R.FORM,
                                  R.FORM_VERS,
                                  C.DEN_SHORT,
                                  C.CAPITOL,
                                  C.CAPITOL_VERS,
                                  R.RIND,
                                  R.RIND_VERS,
                                  R.ID_MD
                                FROM
                                  MD_RIND R
                                  INNER JOIN MD_CAPITOL C ON (R.CAPITOL=C.CAPITOL AND R.CAPITOL_VERS=C.CAPITOL_VERS AND R.ID_SCHEMA=C.ID_SCHEMA)
                                  INNER JOIN (
                                     SELECT
                                      R.CAPITOL,
                                      MAX(R.CAPITOL_VERS) AS CAPITOL_VERS,
                                      R.RIND,
                                      MAX(R.RIND_VERS) AS RIND_VERS,
                                      R.ID_SCHEMA
                                    FROM
                                      MD_RIND R
                                      INNER JOIN (SELECT DISTINCT
                                                  C.CAPITOL,
                                                  MAX(C.CAPITOL_VERS)AS CAPITOL_VERS
                                                FROM
                                                  MD_CAPITOL C
                                                  INNER JOIN MD_RIND R ON (R.CAPITOL=C.CAPITOL AND R.CAPITOL_VERS=C.CAPITOL_VERS AND C.ID_SCHEMA=R.ID_SCHEMA)
                                                WHERE
                                                  R.FORM IN (vFORM) AND
                                                  R.ID_SCHEMA IN (vID_SCHEMA) AND
                                                  C.CAPITOL_VERS <= (vPERIOADA)
                                                GROUP BY
                                                  C.CAPITOL) C ON (R.CAPITOL=C.CAPITOL AND R.CAPITOL_VERS=C.CAPITOL_VERS)
                                    WHERE
                                      R.FORM IN (vFORM) AND
                                      R.ID_SCHEMA IN (vID_SCHEMA) AND
                                      R.RIND_VERS <= (vPERIOADA)
                                    GROUP BY
                                      R.CAPITOL,
                                      R.RIND,
                                      R.ID_SCHEMA
                                  ) RR ON (R.RIND=RR.RIND AND R.RIND_VERS=RR.RIND_VERS AND C.CAPITOL=RR.CAPITOL AND C.CAPITOL_VERS=RR.CAPITOL_VERS AND R.ID_SCHEMA=RR.ID_SCHEMA)
                                WHERE
                                  R.FORM IN (vFORM) AND
                                  R.ID_SCHEMA IN (vID_SCHEMA) AND
                                  R.STATUT <> '3' AND
                                  C.STATUT <> '3' AND
                                  C.CAPITOL NOT IN (100)
                                ORDER BY
                                  R.CAPITOL,
                                  R.RIND) RR ON (D.NR_ROW = CASE WHEN RR.FORM IN (vFORM) THEN 
                                  DECODE(RR.DEN_SHORT,'CAP.4','CAP4','CAP.5','CAP5')||'_R'||RR.RIND ELSE RR.DEN_SHORT||'_R'||RR.RIND END);
                  END LOOP;
              END LOOP;
              INSERT INTO DATA_ALL_FOR_VALIDATE(PERIOADA,FORM,FORM_VERS,CUIIO,CUIIO_VERS,ID_MD,DATA_REG,ID_USER,COL31,T_XML_FORM_ID,CREATED_DATE,ID_SCHEMA)
                    SELECT
                              vPERIOADA,
                              vFORM,
                              vFORM_VERS,
                              vCUIIO,
                              vCUIIO_VERS,
                    --          RR.CAPITOL,
                    --          RR.RIND,
                              RR.ID_MD,
                              SYSDATE AS DATA_REG,
                              9999 AS ID_USER,
                              D.COL31,
                              R.FORMID,--T_XML_FORM_ID from F_XML_FORMS
                              SYSDATE AS CREATED_DATE,
                              vID_SCHEMA
                            FROM
                            (SELECT
                          SUBSTR(D.XML_NODE_NAME,0, INSTR(D.XML_NODE_NAME,'_C')-1) AS NR_ROW,
                          MAX(CASE WHEN D.XML_NODE_NAME LIKE '%_C31' THEN D.XML_NODE_VALUE END) AS COL31
                        FROM
                        (
                        SELECT 
                                  D1.XML_NODE_NAME,
                                  D1.XML_NODE_VALUE,
                                  D1.XML_NODE_ATTR,
                                  ROWNUM AS ORDINE
                                FROM 
                                  XMLTABLE('/dec/DataSet/Header/*' PASSING   
                                    (SELECT  xmltype(XML) FROM F_XML_FORMS WHERE FORMID IN (R.FORMID))
                                     COLUMNS 
                                     XML_NODE_NAME VARCHAR2(100) PATH 'name()',
                                     XML_NODE_VALUE VARCHAR2(100) PATH 'text()',
                                     XML_NODE_ATTR VARCHAR2(100) PATH '@line'
                                ) D1
                                ORDER BY ROWNUM
                )D
                WHERE
                  SUBSTR(D.XML_NODE_NAME,0, INSTR(D.XML_NODE_NAME,'_C')-1) IS NOT NULL
                GROUP BY
                  SUBSTR(D.XML_NODE_NAME,0, INSTR(D.XML_NODE_NAME,'_C')-1)
                ) D
                            INNER JOIN
                              (
                                SELECT
                                  R.FORM,
                                  R.FORM_VERS,
                                  C.DEN_SHORT,
                                  C.CAPITOL,
                                  C.CAPITOL_VERS,
                                  R.RIND,
                                  R.RIND_VERS,
                                  R.ID_MD
                                FROM
                                  MD_RIND R
                                  INNER JOIN MD_CAPITOL C ON (R.CAPITOL=C.CAPITOL AND R.CAPITOL_VERS=C.CAPITOL_VERS AND R.ID_SCHEMA=C.ID_SCHEMA)
                                  INNER JOIN (
                                     SELECT
                                      R.CAPITOL,
                                      MAX(R.CAPITOL_VERS) AS CAPITOL_VERS,
                                      R.RIND,
                                      MAX(R.RIND_VERS) AS RIND_VERS,
                                      R.ID_SCHEMA
                                    FROM
                                      MD_RIND R
                                      INNER JOIN (SELECT DISTINCT
                                                  C.CAPITOL,
                                                  MAX(C.CAPITOL_VERS)AS CAPITOL_VERS
                                                FROM
                                                  MD_CAPITOL C
                                                  INNER JOIN MD_RIND R ON (R.CAPITOL=C.CAPITOL AND R.CAPITOL_VERS=C.CAPITOL_VERS AND C.ID_SCHEMA=R.ID_SCHEMA)
                                                WHERE
                                                  R.FORM IN (vFORM) AND
                                                  R.ID_SCHEMA IN (vID_SCHEMA) AND
                                                  C.CAPITOL_VERS <= (vPERIOADA)
                                                GROUP BY
                                                  C.CAPITOL) C ON (R.CAPITOL=C.CAPITOL AND R.CAPITOL_VERS=C.CAPITOL_VERS)
                                    WHERE
                                      R.FORM IN (vFORM) AND
                                      R.ID_SCHEMA IN (vID_SCHEMA) AND
                                      R.RIND_VERS <= (vPERIOADA)
                                    GROUP BY
                                      R.CAPITOL,
                                      R.RIND,
                                      R.ID_SCHEMA
                                  ) RR ON (R.RIND=RR.RIND AND R.RIND_VERS=RR.RIND_VERS AND C.CAPITOL=RR.CAPITOL AND C.CAPITOL_VERS=RR.CAPITOL_VERS AND R.ID_SCHEMA=RR.ID_SCHEMA)
                                WHERE
                                  R.FORM IN (vFORM) AND
                                  R.ID_SCHEMA IN (vID_SCHEMA) AND
                                  C.CAPITOL IN (1129)
                                ORDER BY
                                  R.CAPITOL,
                                  R.RIND) RR ON (D.NR_ROW = RR.DEN_SHORT||'_R'||RR.RIND);
            END IF;
          END IF; 
            
            -------< Control report >-------------------------
            PKG_CONTROL_EREPORTING.GET_CONTROL_RESULT_FISC(R.FORMID, pRESULT);
            
            LOOP
                FETCH pRESULT INTO vCONTROL, vREZULTAT;
                EXIT WHEN pRESULT%NOTFOUND;
                IF vREZULTAT = 'OK' THEN
                  vCONTROL_MESS := vREZULTAT;
                ELSE
                  vCONTROL_MESS := vCONTROL_MESS||vCONTROL||', '||vREZULTAT||'; ';
                END IF;
            END LOOP;
            IF vREZULTAT='OK' THEN
              UPDATE F_XML_FORMS SET STATUS=5, PROCESSING_MESSAGE = vCONTROL_MESS WHERE FORMID IN (vFROMID);
            ELSE
              UPDATE F_XML_FORMS SET STATUS=4, PROCESSING_MESSAGE = vCONTROL_MESS WHERE FORMID IN (vFROMID);
            END IF;
            /*UPDATE F_XML_FORMS SET STATUS=5, PROCESSING_MESSAGE = (--de vazut 
                            SELECT
                              UTL_I18N.UNESCAPE_REFERENCE(rtrim (xmlagg (xmlelement (e, REZULTAT || '; ')).extract ('//text()').GETCLOBVAL(), '; ')) REZULTAT
                            FROM
                            (
                            SELECT
                              ROWNUM||'. '||C.CONTROL||': '||CC.FORMULA||', '||C.REZULTAT AS REZULTAT
                            FROM
                              CONTROL C
                              INNER JOIN MD_CONTROL CC ON (C.CONTROL=CC.CONTROL AND C.CONTROL_VERS=CC.CONTROL_VERS AND C.FORM=CC.FORM)
                            WHERE
                              C.PERIOADA IN (vPERIOADA) AND
                              C.FORM IN (vFORM) AND
                              C.CUIIO IN (vCUIIO)
                            )
            );*/
        ------------------------------------------------------
    END IF;
    ----------------------------------------------------------
    
  END LOOP;

--------------------------------------------------------------
  EXCEPTION
    --< Any exception >--
    WHEN OTHERS THEN
      UPDATE F_XML_FORMS SET STATUS=6, PROCESSING_MESSAGE = 'Eroare la procesarea raportului'||SUBSTRB(DBMS_UTILITY.FORMAT_ERROR_BACKTRACE||DBMS_UTILITY.FORMAT_ERROR_STACK||DBMS_UTILITY.FORMAT_CALL_STACK, 1, 4000) WHERE FORMID IN (vFROMID);
END MAPPING_REPORTS;

PROCEDURE LIST_FOR_REQUEST (
    value_get      OUT SYS_REFCURSOR
  ) IS
    vsqltmp    varchar2(10000);    
  BEGIN
  
    vsqltmp:= 
    ' SELECT '||
    '      F.FORMID, '||
    '      F.STATUS,'||
    '      F.FORM_TYPE,'||
    '      F.CUIIO,'||
    '      F.SEND_REQUEST,'||
    '      F.SEND_ATTEMPTS,'||
    '      F.PROCESSING_MESSAGE '||
    '    FROM '||
    '      F_XML_FORMS F '||
    '    WHERE '||
    '      F.STATUS <> 2 AND  '||
    '      F.SEND_REQUEST = 1';
      
              
   ---------------------
       OPEN value_get FOR vsqltmp;
   ---------------------    
    
   END LIST_FOR_REQUEST;
   
END PKG_EREPORTING_SOURCE;
/
