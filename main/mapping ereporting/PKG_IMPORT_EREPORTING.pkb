CREATE OR REPLACE PACKAGE BODY CIS2.PKG_IMPORT_EREPORTING AS
  FUNCTION GET_PERIOADA_LUNARA
  RETURN NUMBER AS
    tmpVar   NUMBER;
  BEGIN
    tmpVar := 0;

    SELECT
      P.PERIOADA INTO tmpVar
    FROM
      MD_PERIOADA P INNER JOIN
    (
    SELECT
      CASE WHEN EXTRACT(MONTH FROM SYSDATE)-1 = 0 THEN 12 ELSE EXTRACT(MONTH FROM SYSDATE)-1 END AS PERIOADA_MONTH,
      CASE WHEN EXTRACT(MONTH FROM SYSDATE)-1 = 0 THEN EXTRACT(YEAR FROM SYSDATE)-1 ELSE EXTRACT(YEAR FROM SYSDATE) END AS PERIOADA_YEAR
    FROM
      DUAL) PP ON (P.NUM=PP.PERIOADA_MONTH AND P.ANUL=PP.PERIOADA_YEAR)
    WHERE
      P.TIP_PERIOADA IN (4);

    IF tmpVar IS NULL THEN tmpVar:=-1; END IF;
    RETURN tmpVar;
  EXCEPTION
    WHEN NO_DATA_FOUND
    THEN
      RETURN -1;
  END GET_PERIOADA_LUNARA;

FUNCTION GET_PERIOADA_TRIMESTRIALA
  RETURN NUMBER AS
    tmpVar   NUMBER;
  BEGIN
    tmpVar := 0;

    SELECT
      P.PERIOADA INTO tmpVar
    FROM
      MD_PERIOADA P INNER JOIN
    (
    SELECT
      CASE 
        WHEN EXTRACT(MONTH FROM SYSDATE)-3 <= 3 AND EXTRACT(MONTH FROM SYSDATE)-3 > 0 THEN 1
        WHEN EXTRACT(MONTH FROM SYSDATE)-3 > 3 AND EXTRACT(MONTH FROM SYSDATE)-3 <= 6 THEN 2
        WHEN EXTRACT(MONTH FROM SYSDATE)-3 > 6 AND EXTRACT(MONTH FROM SYSDATE)-3 <= 9 THEN 3
        WHEN (EXTRACT(MONTH FROM SYSDATE)-3 > 9 AND EXTRACT(MONTH FROM SYSDATE)-3 <= 12) OR EXTRACT(MONTH FROM SYSDATE)-3 <= 0 THEN 4
      END AS PERIOADA_TRIMESTER,
      CASE 
        WHEN EXTRACT(MONTH FROM SYSDATE) IN (1,2,3) THEN EXTRACT(YEAR FROM SYSDATE)-1 ELSE EXTRACT(YEAR FROM SYSDATE)
      END AS PERIOADA_YEAR
    FROM
      DUAL) PP ON (P.NUM=PP.PERIOADA_TRIMESTER AND P.ANUL=PP.PERIOADA_YEAR)
    WHERE
      P.TIP_PERIOADA IN (5);

    IF tmpVar IS NULL THEN tmpVar:=-1; END IF;
    RETURN tmpVar;
  EXCEPTION
    WHEN NO_DATA_FOUND
    THEN
      RETURN -1;
  END GET_PERIOADA_TRIMESTRIALA;
  
FUNCTION GET_PERIOADA_TRIMESTRIALA_AGR
  RETURN NUMBER AS
    tmpVar   NUMBER;
  BEGIN
    tmpVar := 0;

    SELECT
      P.PERIOADA INTO tmpVar
    FROM
      MD_PERIOADA P INNER JOIN
    (
    SELECT
      CASE 
        WHEN EXTRACT(MONTH FROM SYSDATE)-2 <= 3 AND EXTRACT(MONTH FROM SYSDATE)-2 > 0 THEN 1
        WHEN EXTRACT(MONTH FROM SYSDATE)-2 > 3 AND EXTRACT(MONTH FROM SYSDATE)-2 <= 6 THEN 2
        WHEN EXTRACT(MONTH FROM SYSDATE)-2 > 6 AND EXTRACT(MONTH FROM SYSDATE)-2 <= 9 THEN 3
        WHEN (EXTRACT(MONTH FROM SYSDATE)-2 > 9 AND EXTRACT(MONTH FROM SYSDATE)-2 <= 12) OR EXTRACT(MONTH FROM SYSDATE)-3 <= 0 THEN 4
      END AS PERIOADA_TRIMESTER,
      CASE 
        WHEN EXTRACT(MONTH FROM SYSDATE) IN (1,2) THEN EXTRACT(YEAR FROM SYSDATE)-1 ELSE EXTRACT(YEAR FROM SYSDATE)
      END AS PERIOADA_YEAR
    FROM
      DUAL) PP ON (P.NUM=PP.PERIOADA_TRIMESTER AND P.ANUL=PP.PERIOADA_YEAR)
    WHERE
      P.TIP_PERIOADA IN (5);

    IF tmpVar IS NULL THEN tmpVar:=-1; END IF;
    RETURN tmpVar;
  EXCEPTION
    WHEN NO_DATA_FOUND
    THEN
      RETURN -1;
  END GET_PERIOADA_TRIMESTRIALA_AGR;
  
FUNCTION GET_PERIOADA_ANUALA
  RETURN NUMBER AS
    tmpVar   NUMBER;
  BEGIN
    tmpVar := 0;

    SELECT
      P.PERIOADA INTO tmpVar
    FROM
      MD_PERIOADA P INNER JOIN
    (
    SELECT
      --EXTRACT(YEAR FROM SYSDATE)-1 AS PERIOADA_YEAR
      CASE WHEN EXTRACT(MONTH FROM SYSDATE) < 12 THEN EXTRACT(YEAR FROM SYSDATE)-1 ELSE EXTRACT(YEAR FROM SYSDATE) END AS PERIOADA_YEAR
    FROM
      DUAL) PP ON (P.NUM=10 AND P.ANUL=PP.PERIOADA_YEAR)
    WHERE
      P.TIP_PERIOADA IN (7);

    IF tmpVar IS NULL THEN tmpVar:=-1; END IF;
    RETURN tmpVar;
  EXCEPTION
    WHEN NO_DATA_FOUND
    THEN
      RETURN -1;
  END GET_PERIOADA_ANUALA;

  PROCEDURE IMPORT_EREPORTING AS
  pPERIOADA NUMBER;
    vCURRENT_DAY NUMBER;
    vT_XML_FORM_ID NUMBER;
  -- Importarea rapoartelor din e-reporting in CIS2 ------------------------------
      CURSOR C IS
      SELECT
        PERIOADA,
        FORM,
        FORM_VERS,
        CUIIO,
        CUIIO_VERS,
        ID_MD,
        DATA_REG,
        ID_USER,
        T_XML_FORM_ID,
        ID_SCHEMA,
        COL1, COL2, COL3, COL4, COL5, COL6, COL7, COL8,
        COL9, COL10, COL11, COL12, COL13, COL14, COL15
      FROM
        (
          SELECT DISTINCT
            DE.PERIOADA,
            DE.FORM,
            DE.FORM_VERS,
            DE.CUIIO,
            DE.CUIIO_VERS,
            DE.ID_MD,
            DE.DATA_REG,
            9999 AS ID_USER,
            DE.T_XML_FORM_ID,
            DE.ID_SCHEMA,
            DE.COL1, DE.COL2, DE.COL3, DE.COL4, DE.COL5, DE.COL6, DE.COL7, DE.COL8,
            DE.COL9, DE.COL10, DE.COL11, DE.COL12, DE.COL13, DE.COL14, DE.COL15
          FROM
            USER_EREPORTING.DATA_ALL DE INNER JOIN
            USER_EREPORTING.FORM_CUIIO FC ON (DE.CUIIO=FC.CUIIO AND DE.CUIIO_VERS=FC.CUIIO_VERS AND DE.FORM=FC.FORM AND DE.FORM_VERS=FC.FORM_VERS AND FC.STATUT <> '3' AND DE.ID_SCHEMA=FC.ID_SCHEMA)
    --        LEFT JOIN
    --        (
    --          SELECT DISTINCT D.FORM, D.PERIOADA, D.CUIIO FROM CIS2.DATA_ALL D
    --        ) DC ON(DC.FORM = DE.FORM AND DC.PERIOADA=DE.PERIOADA AND DC.CUIIO=DE.CUIIO)
          WHERE
    --        DC.CUIIO IS NULL   -- Exclude rapoarte existente in CIS2 -- AND 
              DE.ID_MD <> -1 -- Exclude rinduri cu identificatori eronate --
--              AND DE.CUIIO IN (7028639)
            /* ----------------------------------------------------------------- */
            AND DE.PERIOADA = pPERIOADA
    --        AND DE.FORM     = :IMPORT_FORM
            AND (DE.COL1 <> 0 OR DE.COL2 <> 0 OR DE.COL3 <> 0 OR DE.COL4 <> 0 OR DE.COL5 <> 0 OR DE.COL6 <> 0 OR DE.COL7 <> 0 OR DE.COL8 <> 0 OR DE.COL9 <> 0 OR DE.COL10 <> 0 OR 
                 DE.COL11 <> 0 OR DE.COL12 <> 0 OR DE.COL13 <> 0 OR DE.COL14 <> 0 OR DE.COL15 <> 0)
            /* ----------------------------------------------------------------- */
    --      ORDER BY
    --        DE.PERIOADA,
    --        DE.FORM,
    --        DE.CUIIO,
    --        DE.ID_MD
            
          UNION
         SELECT DISTINCT
                DE.PERIOADA,
                DE.FORM,
                DE.FORM_VERS,
                DE.CUIIO,
                DE.CUIIO_VERS,
                R.ID_MD,
                SYSDATE AS DATA_REG,
                9999 AS ID_USER,
                DE.T_XML_FORM_ID,
                DE.ID_SCHEMA,
                1 AS COL1, NULL AS COL2, NULL AS COL3, NULL AS COL4, NULL AS COL5, NULL AS COL6, NULL AS COL7, NULL AS COL8,
                NULL AS COL9, NULL AS COL10, NULL AS COL11, NULL AS COL12, NULL AS COL13, NULL AS COL14, NULL AS COL15
        FROM
          USER_EREPORTING.DATA_ALL DE INNER JOIN
          USER_EREPORTING.FORM_CUIIO FC ON (DE.CUIIO=FC.CUIIO AND DE.CUIIO_VERS=FC.CUIIO_VERS AND DE.FORM=FC.FORM AND DE.FORM_VERS=FC.FORM_VERS AND FC.STATUT <> '3' AND DE.ID_SCHEMA=FC.ID_SCHEMA) 
    --      LEFT JOIN
    --      (
    --        SELECT DISTINCT D.FORM, D.PERIOADA, D.CUIIO FROM CIS2.DATA_ALL D
    --      ) DC ON(DC.FORM = DE.FORM AND DC.PERIOADA=DE.PERIOADA AND DC.CUIIO=DE.CUIIO)
          RIGHT JOIN CIS2.MD_RIND R ON (DE.FORM=R.FORM)
          INNER JOIN (SELECT
                    --  ID_MD,
                      FORM,
                      FORM_VERS,
                      CAPITOL,
                      MAX(CAPITOL_VERS) AS CAPITOL_VERS,
                      RIND,
                      MAX(RIND_VERS) AS RIND_VERS
                    FROM
                      MD_RIND R
                    WHERE
                      R.RIND_VERS <= pPERIOADA AND
                      R.CAPITOL_VERS <= pPERIOADA AND
                      R.CAPITOL IN (0,1)
                    GROUP BY
                    --  ID_MD,
                      FORM,
                      FORM_VERS,
                      CAPITOL,
                      RIND
                    ORDER BY
                      FORM) RR ON (R.FORM=RR.FORM AND R.CAPITOL=RR.CAPITOL AND R.CAPITOL_VERS=RR.CAPITOL_VERS AND R.RIND=RR.RIND AND R.RIND_VERS=RR.RIND_VERS)
        WHERE
    --      DC.CUIIO IS NULL AND
          DE.PERIOADA = pPERIOADA AND 
    --      R.FORM = :IMPORT_FORM AND
          R.CAPITOL IN (0,1) AND
          R.RIND IN ('01')
--              AND DE.CUIIO IN (7028639)
        ) D
        ORDER BY
          PERIOADA,
          FORM,
          CUIIO,
          DATA_REG,
          T_XML_FORM_ID,
          ID_MD;

  BEGIN
    pPERIOADA := GET_PERIOADA_LUNARA;
    vT_XML_FORM_ID := 0;
    SELECT
      EXTRACT(DAY FROM SYSDATE) AS CURRENT_DAY INTO vCURRENT_DAY
    FROM
      DUAL;
    
      FOR CR IN C
      LOOP
        IF CR.ID_SCHEMA = 2 THEN -- Identificam daca raport este in CIS2
        
            IF CR.FORM = 7 AND vCURRENT_DAY <= 28 THEN
                -- 0. Inscriem ID in variabila si apoi il stergem din CIS2
                --vT_XML_FORM_ID := CR.T_XML_FORM_ID;
                IF vT_XML_FORM_ID = 0 OR vT_XML_FORM_ID <> CR.T_XML_FORM_ID THEN
                    -- 0. Sterge rapoartele daca exista in CIS2.DATA_ALL
                    DELETE FROM CIS2.DATA_ALL
                    WHERE
                      PERIOADA=CR.PERIOADA AND FORM=CR.FORM AND CUIIO=CR.CUIIO; --AND ID_MD=CR.ID_MD;
                    vT_XML_FORM_ID := CR.T_XML_FORM_ID;
                END IF;
                -- 0. Sterge rapoartele daca exista in CIS2.CONTROL
                DELETE FROM CIS2.CONTROL
                WHERE
                  PERIOADA=CR.PERIOADA AND FORM=CR.FORM AND CUIIO=CR.CUIIO;
               
                -- 1. Se insereaza rapoarte noi in CIS2
                INSERT INTO CIS2.DATA_ALL
                (
                  PERIOADA,
                  FORM,
                  FORM_VERS,
                  CUIIO,
                  CUIIO_VERS,
                  ID_MD,
                  DATA_REG,
                  ID_USER,
                  COL1, COL2, COL3, COL4, COL5, COL6, COL7, COL8,
                  COL9, COL10, COL11, COL12, COL13, COL14, COL15
                )
                VALUES
                (
                  CR.PERIOADA,
                  CR.FORM,
                  CR.FORM_VERS,
                  CR.CUIIO,
                  CR.CUIIO_VERS,
                  CR.ID_MD,
                  CR.DATA_REG,
                  CR.ID_USER,
                  CR.COL1, CR.COL2, CR.COL3, CR.COL4, CR.COL5, CR.COL6, CR.COL7, CR.COL8,
                  CR.COL9, CR.COL10, CR.COL11, CR.COL12, CR.COL13, CR.COL14, CR.COL15
                );
                
                -- 2. Fiecare rapoart importat se insereaza in tabela DATA_ALL_PRIMIT
                INSERT INTO USER_EREPORTING.DATA_ALL_PRIMIT
                (
                  PERIOADA,
                  FORM,
                  FORM_VERS,
                  CUIIO,
                  CUIIO_VERS,
                  ID_MD,
                  DATA_REG,
                  ID_USER,
                  T_XML_FORM_ID,
                  ID_SCHEMA,
                  COL1, COL2, COL3, COL4, COL5, COL6, COL7, COL8,
                  COL9, COL10, COL11, COL12, COL13, COL14, COL15
                )
                VALUES
                (
                  CR.PERIOADA,
                  CR.FORM,
                  CR.FORM_VERS,
                  CR.CUIIO,
                  CR.CUIIO_VERS,
                  CR.ID_MD,
                  CR.DATA_REG,
                  CR.ID_USER,
                  CR.T_XML_FORM_ID,
                  CR.ID_SCHEMA,
                  CR.COL1, CR.COL2, CR.COL3, CR.COL4, CR.COL5, CR.COL6, CR.COL7, CR.COL8,
                  CR.COL9, CR.COL10, CR.COL11, CR.COL12, CR.COL13, CR.COL14, CR.COL15
                );
                
                -- 3. Fiecare rapoart importat se sterge din tabela DATA_ALL
                DELETE FROM USER_EREPORTING.DATA_ALL
                WHERE
                  PERIOADA = CR.PERIOADA
                  AND FORM = CR.FORM
                  AND CUIIO = CR.CUIIO
                  AND ID_MD <> -1 -- Nu sterge rinduri gresite
                ;
            END IF;
            
--            IF CR.FORM IN (2,4,5) AND vCURRENT_DAY <= 25 THEN
--            
--                -- 0. Sterge rapoartele daca exista in CIS2.DATA_ALL
--                DELETE FROM CIS2.DATA_ALL
--                WHERE
--                  PERIOADA=CR.PERIOADA AND FORM=CR.FORM AND CUIIO=CR.CUIIO AND ID_MD=CR.ID_MD;
--                -- 1. Se insereaza rapoarte noi in CIS2
--                INSERT INTO CIS2.DATA_ALL
--                (
--                  PERIOADA,
--                  FORM,
--                  FORM_VERS,
--                  CUIIO,
--                  CUIIO_VERS,
--                  ID_MD,
--                  DATA_REG,
--                  ID_USER,
--                  COL1, COL2, COL3, COL4, COL5, COL6, COL7, COL8,
--                  COL9, COL10, COL11, COL12, COL13, COL14, COL15
--                )
--                VALUES
--                (
--                  CR.PERIOADA,
--                  CR.FORM,
--                  CR.FORM_VERS,
--                  CR.CUIIO,
--                  CR.CUIIO_VERS,
--                  CR.ID_MD,
--                  CR.DATA_REG,
--                  CR.ID_USER,
--                  CR.COL1, CR.COL2, CR.COL3, CR.COL4, CR.COL5, CR.COL6, CR.COL7, CR.COL8,
--                  CR.COL9, CR.COL10, CR.COL11, CR.COL12, CR.COL13, CR.COL14, CR.COL15
--                );
--                
--                -- 2. Fiecare rapoart importat se insereaza in tabela DATA_ALL_PRIMIT
--                INSERT INTO USER_EREPORTING.DATA_ALL_PRIMIT
--                (
--                  PERIOADA,
--                  FORM,
--                  FORM_VERS,
--                  CUIIO,
--                  CUIIO_VERS,
--                  ID_MD,
--                  DATA_REG,
--                  ID_USER,
--                  T_XML_FORM_ID,
--                  ID_SCHEMA,
--                  COL1, COL2, COL3, COL4, COL5, COL6, COL7, COL8,
--                  COL9, COL10, COL11, COL12, COL13, COL14, COL15
--                )
--                VALUES
--                (
--                  CR.PERIOADA,
--                  CR.FORM,
--                  CR.FORM_VERS,
--                  CR.CUIIO,
--                  CR.CUIIO_VERS,
--                  CR.ID_MD,
--                  CR.DATA_REG,
--                  CR.ID_USER,
--                  CR.T_XML_FORM_ID,
--                  CR.ID_SCHEMA,
--                  CR.COL1, CR.COL2, CR.COL3, CR.COL4, CR.COL5, CR.COL6, CR.COL7, CR.COL8,
--                  CR.COL9, CR.COL10, CR.COL11, CR.COL12, CR.COL13, CR.COL14, CR.COL15
--                );
--                
--                -- 3. Fiecare rapoart importat se sterge din tabela DATA_ALL
--                DELETE FROM USER_EREPORTING.DATA_ALL
--                WHERE
--                  PERIOADA = CR.PERIOADA
--                  AND FORM = CR.FORM
--                  AND CUIIO = CR.CUIIO
--                  AND ID_MD <> -1 -- Nu sterge rinduri gresite
--                ;
--            END IF;
        END IF;
      END LOOP;
      
      EXCEPTION 
        WHEN DUP_VAL_ON_INDEX THEN RETURN; 
    -------------------------------------------------------------------------------

  END IMPORT_EREPORTING;
  
PROCEDURE IMPORT_EREPORTING_TRIMESTRIAL AS
  pPERIOADA NUMBER;
    vCURRENT_DAY NUMBER;
    vCURRENT_MONTH NUMBER;
  -- Importarea rapoartelor din e-reporting in CIS2 ------------------------------
      CURSOR C IS
      SELECT
        PERIOADA,
        FORM,
        FORM_VERS,
        CUIIO,
        CUIIO_VERS,
        ID_MD,
        DATA_REG,
        ID_USER,
        T_XML_FORM_ID,
        ID_SCHEMA,
        COL1, COL2, COL3, COL4, COL5, COL6, COL7, COL8,
        COL9, COL10, COL11, COL12, COL13, COL14, COL15,
        COL31, COL32, COL33, COL34, COL35
      FROM
        (
          SELECT DISTINCT
            DE.PERIOADA,
            DE.FORM,
            DE.FORM_VERS,
            DE.CUIIO,
            DE.CUIIO_VERS,
            DE.ID_MD,
            DE.DATA_REG,
            9999 AS ID_USER,
            DE.T_XML_FORM_ID,
            DE.ID_SCHEMA,
            DE.COL1, DE.COL2, DE.COL3, DE.COL4, DE.COL5, DE.COL6, DE.COL7, DE.COL8,
            DE.COL9, DE.COL10, DE.COL11, DE.COL12, DE.COL13, DE.COL14, DE.COL15,
            DE.COL31, DE.COL32, DE.COL33, DE.COL34, DE.COL35
          FROM
            USER_EREPORTING.DATA_ALL DE INNER JOIN
            USER_EREPORTING.FORM_CUIIO FC ON (DE.CUIIO=FC.CUIIO AND DE.CUIIO_VERS=FC.CUIIO_VERS AND DE.FORM=FC.FORM AND DE.FORM_VERS=FC.FORM_VERS AND FC.STATUT <> '3' AND DE.ID_SCHEMA=FC.ID_SCHEMA)
    --        LEFT JOIN
    --        (
    --          SELECT DISTINCT D.FORM, D.PERIOADA, D.CUIIO FROM CIS2.DATA_ALL D
    --        ) DC ON(DC.FORM = DE.FORM AND DC.PERIOADA=DE.PERIOADA AND DC.CUIIO=DE.CUIIO)
          WHERE
    --        DC.CUIIO IS NULL   -- Exclude rapoarte existente in CIS2 -- AND 
              DE.ID_MD <> -1 -- Exclude rinduri cu identificatori eronate --
--              AND DE.CUIIO IN (7028639)
            /* ----------------------------------------------------------------- */
            AND DE.PERIOADA = pPERIOADA
    --        AND DE.FORM     = :IMPORT_FORM
            AND (DE.COL1 <> 0 OR DE.COL2 <> 0 OR DE.COL3 <> 0 OR DE.COL4 <> 0 OR DE.COL5 <> 0 OR DE.COL6 <> 0 OR DE.COL7 <> 0 OR DE.COL8 <> 0 OR DE.COL9 <> 0 OR DE.COL10 <> 0 OR 
                 DE.COL11 <> 0 OR DE.COL12 <> 0 OR DE.COL13 <> 0 OR DE.COL14 <> 0 OR DE.COL15 <> 0)
            /* ----------------------------------------------------------------- */
    --      ORDER BY
    --        DE.PERIOADA,
    --        DE.FORM,
    --        DE.CUIIO,
    --        DE.ID_MD
            
          UNION
         SELECT DISTINCT
                DE.PERIOADA,
                DE.FORM,
                DE.FORM_VERS,
                DE.CUIIO,
                DE.CUIIO_VERS,
                R.ID_MD,
                SYSDATE AS DATA_REG,
                9999 AS ID_USER,
                DE.T_XML_FORM_ID,
                DE.ID_SCHEMA,
                CASE 
                  WHEN R.RIND IN ('002') THEN SUM( CASE WHEN DE.ID_MD IN (
                    SELECT R.ID_MD FROM MD_RIND R WHERE R.RIND_VERS <= pPERIOADA AND R.CAPITOL_VERS <= pPERIOADA AND R.CAPITOL IN (312) AND R.RIND IN ('051','031','112','398','417','643','762','795','804','860')) 
                  THEN DE.COL1 END) 
                  WHEN R.RIND IN ('999') THEN SUM( CASE WHEN DE.ID_MD IN (
                    SELECT R.ID_MD FROM MD_RIND R WHERE R.RIND_VERS <= pPERIOADA AND R.CAPITOL_VERS <= pPERIOADA AND R.CAPITOL IN (312) AND R.RIND NOT IN ('051','031','112','398','417','643','762','795','804','860','001','002','999')) 
                  THEN DE.COL1 END) 
                ELSE 1 
                END AS COL1, 
                CASE 
                  WHEN R.RIND IN ('002') THEN SUM( CASE WHEN DE.ID_MD IN (
                    SELECT R.ID_MD FROM MD_RIND R WHERE R.RIND_VERS <= pPERIOADA AND R.CAPITOL_VERS <= pPERIOADA AND R.CAPITOL IN (312) AND R.RIND IN ('051','031','112','398','417','643','762','795','804','860')) 
                  THEN DE.COL2 END) 
                  WHEN R.RIND IN ('999') THEN SUM( CASE WHEN DE.ID_MD IN (
                    SELECT R.ID_MD FROM MD_RIND R WHERE R.RIND_VERS <= pPERIOADA AND R.CAPITOL_VERS <= pPERIOADA AND R.CAPITOL IN (312) AND R.RIND NOT IN ('051','031','112','398','417','643','762','795','804','860','001','002','999')) 
                  THEN DE.COL2 END) 
                ELSE NULL 
                END AS COL2, NULL AS COL3, NULL AS COL4, NULL AS COL5, NULL AS COL6, NULL AS COL7, NULL AS COL8,
                NULL AS COL9, NULL AS COL10, NULL AS COL11, NULL AS COL12, NULL AS COL13, NULL AS COL14, NULL AS COL15,
                NULL AS COL31, NULL AS COL32, NULL AS COL33, NULL AS COL34, NULL AS COL35
        FROM
          USER_EREPORTING.DATA_ALL DE INNER JOIN
          USER_EREPORTING.FORM_CUIIO FC ON (DE.CUIIO=FC.CUIIO AND DE.CUIIO_VERS=FC.CUIIO_VERS AND DE.FORM=FC.FORM AND DE.FORM_VERS=FC.FORM_VERS AND FC.STATUT <> '3' AND DE.ID_SCHEMA=FC.ID_SCHEMA) 
    --      LEFT JOIN
    --      (
    --        SELECT DISTINCT D.FORM, D.PERIOADA, D.CUIIO FROM CIS2.DATA_ALL D
    --      ) DC ON(DC.FORM = DE.FORM AND DC.PERIOADA=DE.PERIOADA AND DC.CUIIO=DE.CUIIO)
          RIGHT JOIN CIS2.MD_RIND R ON (DE.FORM=R.FORM)
          INNER JOIN (SELECT
                    --  ID_MD,
                      FORM,
                      FORM_VERS,
                      CAPITOL,
                      MAX(CAPITOL_VERS) AS CAPITOL_VERS,
                      RIND,
                      MAX(RIND_VERS) AS RIND_VERS
                    FROM
                      MD_RIND R
                    WHERE
                      R.RIND_VERS <= pPERIOADA AND
                      R.CAPITOL_VERS <= pPERIOADA AND
                      R.CAPITOL IN (0,1,2,14,412,312)
                    GROUP BY
                    --  ID_MD,
                      FORM,
                      FORM_VERS,
                      CAPITOL,
                      RIND
                    ORDER BY
                      FORM) RR ON (R.FORM=RR.FORM AND R.CAPITOL=RR.CAPITOL AND R.CAPITOL_VERS=RR.CAPITOL_VERS AND R.RIND=RR.RIND AND R.RIND_VERS=RR.RIND_VERS)
        WHERE
    --      DC.CUIIO IS NULL AND
          DE.PERIOADA = pPERIOADA AND 
    --      R.FORM = :IMPORT_FORM AND
          R.CAPITOL IN (0,1,2,14,412,312) AND
          R.RIND IN ('01','002','999')
--              AND DE.CUIIO IN (7028639)
        GROUP BY
          DE.PERIOADA,
                DE.FORM,
                DE.FORM_VERS,
                DE.CUIIO,
                DE.CUIIO_VERS,
                R.ID_MD,
                R.RIND,
                SYSDATE,
                DE.T_XML_FORM_ID,
                DE.ID_SCHEMA
        ) D;

  BEGIN
    pPERIOADA := GET_PERIOADA_TRIMESTRIALA;
    SELECT
      EXTRACT(DAY FROM SYSDATE) AS CURRENT_DAY, EXTRACT(MONTH FROM SYSDATE) AS CURRENT_MONTH INTO vCURRENT_DAY, vCURRENT_MONTH
    FROM
      DUAL;
    
      FOR CR IN C
      LOOP
        IF CR.ID_SCHEMA = 2 THEN -- Identificam daca raport este in CIS2
            IF CR.FORM IN (74) AND ((vCURRENT_MONTH IN (4,6) AND vCURRENT_DAY <= 31) OR (vCURRENT_MONTH IN (7,10) AND vCURRENT_DAY <= 15) OR 
                                    (vCURRENT_MONTH IN (1) AND vCURRENT_DAY <= 23))  THEN -- Ancheta de Conjuctura
            
                -- 0. Sterge rapoartele daca exista in CIS2.DATA_ALL
                DELETE FROM CIS2.DATA_ALL
                WHERE
                  PERIOADA=CR.PERIOADA AND FORM=CR.FORM AND CUIIO=CR.CUIIO AND ID_MD=CR.ID_MD;
                
                -- 0. Sterge rapoartele daca exista in CIS2.CONTROL
                DELETE FROM CIS2.CONTROL
                WHERE
                  PERIOADA=CR.PERIOADA AND FORM=CR.FORM AND CUIIO=CR.CUIIO;
                  
                -- 1. Se insereaza rapoarte noi in CIS2
                INSERT INTO CIS2.DATA_ALL
                (
                  PERIOADA,
                  FORM,
                  FORM_VERS,
                  CUIIO,
                  CUIIO_VERS,
                  ID_MD,
                  DATA_REG,
                  ID_USER,
                  COL1, COL2, COL3, COL4, COL5, COL6, COL7, COL8,
                  COL9, COL10, COL11, COL12, COL13, COL14, COL15
                )
                VALUES
                (
                  CR.PERIOADA,
                  CR.FORM,
                  CR.FORM_VERS,
                  CR.CUIIO,
                  CR.CUIIO_VERS,
                  CR.ID_MD,
                  CR.DATA_REG,
                  CR.ID_USER,
                  CR.COL1, CR.COL2, CR.COL3, CR.COL4, CR.COL5, CR.COL6, CR.COL7, CR.COL8,
                  CR.COL9, CR.COL10, CR.COL11, CR.COL12, CR.COL13, CR.COL14, CR.COL15
                );
                
                -- 2. Fiecare rapoart importat se insereaza in tabela DATA_ALL_PRIMIT
                INSERT INTO USER_EREPORTING.DATA_ALL_PRIMIT
                (
                  PERIOADA,
                  FORM,
                  FORM_VERS,
                  CUIIO,
                  CUIIO_VERS,
                  ID_MD,
                  DATA_REG,
                  ID_USER,
                  T_XML_FORM_ID,
                  ID_SCHEMA,
                  COL1, COL2, COL3, COL4, COL5, COL6, COL7, COL8,
                  COL9, COL10, COL11, COL12, COL13, COL14, COL15
                )
                VALUES
                (
                  CR.PERIOADA,
                  CR.FORM,
                  CR.FORM_VERS,
                  CR.CUIIO,
                  CR.CUIIO_VERS,
                  CR.ID_MD,
                  CR.DATA_REG,
                  CR.ID_USER,
                  CR.T_XML_FORM_ID,
                  CR.ID_SCHEMA,
                  CR.COL1, CR.COL2, CR.COL3, CR.COL4, CR.COL5, CR.COL6, CR.COL7, CR.COL8,
                  CR.COL9, CR.COL10, CR.COL11, CR.COL12, CR.COL13, CR.COL14, CR.COL15
                );
                
                -- 3. Fiecare rapoart importat se sterge din tabela DATA_ALL
                DELETE FROM USER_EREPORTING.DATA_ALL
                WHERE
                  PERIOADA = CR.PERIOADA
                  AND FORM = CR.FORM
                  AND CUIIO = CR.CUIIO
                  AND ID_MD <> -1 -- Nu sterge rinduri gresite
                ;
            END IF;
            IF CR.FORM IN (44) AND ((vCURRENT_MONTH IN (1,4,6,7,10) AND vCURRENT_DAY <= 31) OR (vCURRENT_MONTH IN (8,11) AND vCURRENT_DAY <= 2) OR 
                                    (vCURRENT_MONTH IN (2) AND vCURRENT_DAY <= 1) OR (vCURRENT_MONTH IN (5) AND vCURRENT_DAY <= 3))  THEN -- EI-78
            
                -- 0. Sterge rapoartele daca exista in CIS2.DATA_ALL
                DELETE FROM CIS2.DATA_ALL
                WHERE
                  PERIOADA=CR.PERIOADA AND FORM=CR.FORM AND CUIIO=CR.CUIIO AND ID_MD=CR.ID_MD;
                
                -- 0. Sterge rapoartele daca exista in CIS2.CONTROL
                DELETE FROM CIS2.CONTROL
                WHERE
                  PERIOADA=CR.PERIOADA AND FORM=CR.FORM AND CUIIO=CR.CUIIO;
                  
                -- 1. Se insereaza rapoarte noi in CIS2
                INSERT INTO CIS2.DATA_ALL
                (
                  PERIOADA,
                  FORM,
                  FORM_VERS,
                  CUIIO,
                  CUIIO_VERS,
                  ID_MD,
                  DATA_REG,
                  ID_USER,
                  COL1, COL2, COL3, COL4, COL5, COL6, COL7, COL8,
                  COL9, COL10, COL11, COL12, COL13, COL14, COL15,
                  COL31, COL33
                )
                VALUES
                (
                  CR.PERIOADA,
                  CR.FORM,
                  CR.FORM_VERS,
                  CR.CUIIO,
                  CR.CUIIO_VERS,
                  CR.ID_MD,
                  CR.DATA_REG,
                  CR.ID_USER,
                  CR.COL1, CR.COL2, CR.COL3, CR.COL4, CR.COL5, CR.COL6, CR.COL7, CR.COL8,
                  CR.COL9, CR.COL10, CR.COL11, CR.COL12, CR.COL13, CR.COL14, CR.COL15,
                  CR.COL31, CR.COL33
                );
                
                -- 2. Fiecare rapoart importat se insereaza in tabela DATA_ALL_PRIMIT
                INSERT INTO USER_EREPORTING.DATA_ALL_PRIMIT
                (
                  PERIOADA,
                  FORM,
                  FORM_VERS,
                  CUIIO,
                  CUIIO_VERS,
                  ID_MD,
                  DATA_REG,
                  ID_USER,
                  T_XML_FORM_ID,
                  ID_SCHEMA,
                  COL1, COL2, COL3, COL4, COL5, COL6, COL7, COL8,
                  COL9, COL10, COL11, COL12, COL13, COL14, COL15,
                  COL31, COL33
                )
                VALUES
                (
                  CR.PERIOADA,
                  CR.FORM,
                  CR.FORM_VERS,
                  CR.CUIIO,
                  CR.CUIIO_VERS,
                  CR.ID_MD,
                  CR.DATA_REG,
                  CR.ID_USER,
                  CR.T_XML_FORM_ID,
                  CR.ID_SCHEMA,
                  CR.COL1, CR.COL2, CR.COL3, CR.COL4, CR.COL5, CR.COL6, CR.COL7, CR.COL8,
                  CR.COL9, CR.COL10, CR.COL11, CR.COL12, CR.COL13, CR.COL14, CR.COL15,
                  CR.COL31, CR.COL33
                );
                
                -- 3. Fiecare rapoart importat se sterge din tabela DATA_ALL
                DELETE FROM USER_EREPORTING.DATA_ALL
                WHERE
                  PERIOADA = CR.PERIOADA
                  AND FORM = CR.FORM
                  AND CUIIO = CR.CUIIO
                  AND ID_MD <> -1 -- Nu sterge rinduri gresite
                ;
            END IF;
        
            IF CR.FORM IN (19) AND ((vCURRENT_MONTH IN (1,4,7) AND vCURRENT_DAY <= 31) OR (vCURRENT_MONTH IN (10) AND vCURRENT_DAY <= 31))  THEN -- 1-B-SC
            
                -- 0. Sterge rapoartele daca exista in CIS2.DATA_ALL
                DELETE FROM CIS2.DATA_ALL
                WHERE
                  PERIOADA=CR.PERIOADA AND FORM=CR.FORM AND CUIIO=CR.CUIIO AND ID_MD=CR.ID_MD;
                
                -- 0. Sterge rapoartele daca exista in CIS2.CONTROL
                DELETE FROM CIS2.CONTROL
                WHERE
                  PERIOADA=CR.PERIOADA AND FORM=CR.FORM AND CUIIO=CR.CUIIO;
                  
                -- 1. Se insereaza rapoarte noi in CIS2
                INSERT INTO CIS2.DATA_ALL
                (
                  PERIOADA,
                  FORM,
                  FORM_VERS,
                  CUIIO,
                  CUIIO_VERS,
                  ID_MD,
                  DATA_REG,
                  ID_USER,
                  COL1, COL2, COL3, COL4, COL5, COL6, COL7, COL8,
                  COL9, COL10, COL11, COL12, COL13, COL14, COL15
                )
                VALUES
                (
                  CR.PERIOADA,
                  CR.FORM,
                  CR.FORM_VERS,
                  CR.CUIIO,
                  CR.CUIIO_VERS,
                  CR.ID_MD,
                  CR.DATA_REG,
                  CR.ID_USER,
                  CR.COL1, CR.COL2, CR.COL3, CR.COL4, CR.COL5, CR.COL6, CR.COL7, CR.COL8,
                  CR.COL9, CR.COL10, CR.COL11, CR.COL12, CR.COL13, CR.COL14, CR.COL15
                );
                
                -- 2. Fiecare rapoart importat se insereaza in tabela DATA_ALL_PRIMIT
                INSERT INTO USER_EREPORTING.DATA_ALL_PRIMIT
                (
                  PERIOADA,
                  FORM,
                  FORM_VERS,
                  CUIIO,
                  CUIIO_VERS,
                  ID_MD,
                  DATA_REG,
                  ID_USER,
                  T_XML_FORM_ID,
                  ID_SCHEMA,
                  COL1, COL2, COL3, COL4, COL5, COL6, COL7, COL8,
                  COL9, COL10, COL11, COL12, COL13, COL14, COL15
                )
                VALUES
                (
                  CR.PERIOADA,
                  CR.FORM,
                  CR.FORM_VERS,
                  CR.CUIIO,
                  CR.CUIIO_VERS,
                  CR.ID_MD,
                  CR.DATA_REG,
                  CR.ID_USER,
                  CR.T_XML_FORM_ID,
                  CR.ID_SCHEMA,
                  CR.COL1, CR.COL2, CR.COL3, CR.COL4, CR.COL5, CR.COL6, CR.COL7, CR.COL8,
                  CR.COL9, CR.COL10, CR.COL11, CR.COL12, CR.COL13, CR.COL14, CR.COL15
                );
                
                -- 3. Fiecare rapoart importat se sterge din tabela DATA_ALL
                DELETE FROM USER_EREPORTING.DATA_ALL
                WHERE
                  PERIOADA = CR.PERIOADA
                  AND FORM = CR.FORM
                  AND CUIIO = CR.CUIIO
                  AND ID_MD <> -1 -- Nu sterge rinduri gresite
                ;
            END IF;
            IF CR.FORM IN (5,6) AND (vCURRENT_MONTH IN (1,4,7,10) AND vCURRENT_DAY <= 31 OR (vCURRENT_MONTH IN (11) AND vCURRENT_DAY <= 4))  THEN -- 65-AUTO, 1-turism
            
                -- 0. Sterge rapoartele daca exista in CIS2.DATA_ALL
                DELETE FROM CIS2.DATA_ALL
                WHERE
                  PERIOADA=CR.PERIOADA AND FORM=CR.FORM AND CUIIO=CR.CUIIO AND ID_MD=CR.ID_MD;
                
                -- 0. Sterge rapoartele daca exista in CIS2.CONTROL
                DELETE FROM CIS2.CONTROL
                WHERE
                  PERIOADA=CR.PERIOADA AND FORM=CR.FORM AND CUIIO=CR.CUIIO;
                  
                -- 1. Se insereaza rapoarte noi in CIS2
                INSERT INTO CIS2.DATA_ALL
                (
                  PERIOADA,
                  FORM,
                  FORM_VERS,
                  CUIIO,
                  CUIIO_VERS,
                  ID_MD,
                  DATA_REG,
                  ID_USER,
                  COL1, COL2, COL3, COL4, COL5, COL6, COL7, COL8,
                  COL9, COL10, COL11, COL12, COL13, COL14, COL15
                )
                VALUES
                (
                  CR.PERIOADA,
                  CR.FORM,
                  CR.FORM_VERS,
                  CR.CUIIO,
                  CR.CUIIO_VERS,
                  CR.ID_MD,
                  CR.DATA_REG,
                  CR.ID_USER,
                  CR.COL1, CR.COL2, CR.COL3, CR.COL4, CR.COL5, CR.COL6, CR.COL7, CR.COL8,
                  CR.COL9, CR.COL10, CR.COL11, CR.COL12, CR.COL13, CR.COL14, CR.COL15
                );
                
                -- 2. Fiecare rapoart importat se insereaza in tabela DATA_ALL_PRIMIT
                INSERT INTO USER_EREPORTING.DATA_ALL_PRIMIT
                (
                  PERIOADA,
                  FORM,
                  FORM_VERS,
                  CUIIO,
                  CUIIO_VERS,
                  ID_MD,
                  DATA_REG,
                  ID_USER,
                  T_XML_FORM_ID,
                  ID_SCHEMA,
                  COL1, COL2, COL3, COL4, COL5, COL6, COL7, COL8,
                  COL9, COL10, COL11, COL12, COL13, COL14, COL15
                )
                VALUES
                (
                  CR.PERIOADA,
                  CR.FORM,
                  CR.FORM_VERS,
                  CR.CUIIO,
                  CR.CUIIO_VERS,
                  CR.ID_MD,
                  CR.DATA_REG,
                  CR.ID_USER,
                  CR.T_XML_FORM_ID,
                  CR.ID_SCHEMA,
                  CR.COL1, CR.COL2, CR.COL3, CR.COL4, CR.COL5, CR.COL6, CR.COL7, CR.COL8,
                  CR.COL9, CR.COL10, CR.COL11, CR.COL12, CR.COL13, CR.COL14, CR.COL15
                );
                
                -- 3. Fiecare rapoart importat se sterge din tabela DATA_ALL
                DELETE FROM USER_EREPORTING.DATA_ALL
                WHERE
                  PERIOADA = CR.PERIOADA
                  AND FORM = CR.FORM
                  AND CUIIO = CR.CUIIO
                  AND ID_MD <> -1 -- Nu sterge rinduri gresite
                ;
            END IF;
            
            IF CR.FORM IN (18) AND ((vCURRENT_MONTH IN (1,3,4,7,10) AND vCURRENT_DAY <= 31) OR (vCURRENT_MONTH IN (2) AND vCURRENT_DAY <= 5) OR 
                                    (vCURRENT_MONTH IN (5) AND vCURRENT_DAY <= 6) OR (vCURRENT_MONTH IN (8,11) AND vCURRENT_DAY <= 8))  THEN -- 5-CON
            
                -- 0. Sterge rapoartele daca exista in CIS2.DATA_ALL
                DELETE FROM CIS2.DATA_ALL
                WHERE
                  PERIOADA=CR.PERIOADA AND FORM=CR.FORM AND CUIIO=CR.CUIIO AND ID_MD=CR.ID_MD;
                
                -- 0. Sterge rapoartele daca exista in CIS2.CONTROL
                DELETE FROM CIS2.CONTROL
                WHERE
                  PERIOADA=CR.PERIOADA AND FORM=CR.FORM AND CUIIO=CR.CUIIO;
                  
                -- 1. Se insereaza rapoarte noi in CIS2
                INSERT INTO CIS2.DATA_ALL
                (
                  PERIOADA,
                  FORM,
                  FORM_VERS,
                  CUIIO,
                  CUIIO_VERS,
                  ID_MD,
                  DATA_REG,
                  ID_USER,
                  COL1, COL2, COL3, COL4, COL5, COL6, COL7, COL8,
                  COL9, COL10, COL11, COL12, COL13, COL14, COL15
                )
                VALUES
                (
                  CR.PERIOADA,
                  CR.FORM,
                  CR.FORM_VERS,
                  CR.CUIIO,
                  CR.CUIIO_VERS,
                  CR.ID_MD,
                  CR.DATA_REG,
                  CR.ID_USER,
                  CR.COL1, CR.COL2, CR.COL3, CR.COL4, CR.COL5, CR.COL6, CR.COL7, CR.COL8,
                  CR.COL9, CR.COL10, CR.COL11, CR.COL12, CR.COL13, CR.COL14, CR.COL15
                );
                
                -- 2. Fiecare rapoart importat se insereaza in tabela DATA_ALL_PRIMIT
                INSERT INTO USER_EREPORTING.DATA_ALL_PRIMIT
                (
                  PERIOADA,
                  FORM,
                  FORM_VERS,
                  CUIIO,
                  CUIIO_VERS,
                  ID_MD,
                  DATA_REG,
                  ID_USER,
                  T_XML_FORM_ID,
                  ID_SCHEMA,
                  COL1, COL2, COL3, COL4, COL5, COL6, COL7, COL8,
                  COL9, COL10, COL11, COL12, COL13, COL14, COL15
                )
                VALUES
                (
                  CR.PERIOADA,
                  CR.FORM,
                  CR.FORM_VERS,
                  CR.CUIIO,
                  CR.CUIIO_VERS,
                  CR.ID_MD,
                  CR.DATA_REG,
                  CR.ID_USER,
                  CR.T_XML_FORM_ID,
                  CR.ID_SCHEMA,
                  CR.COL1, CR.COL2, CR.COL3, CR.COL4, CR.COL5, CR.COL6, CR.COL7, CR.COL8,
                  CR.COL9, CR.COL10, CR.COL11, CR.COL12, CR.COL13, CR.COL14, CR.COL15
                );
                
                -- 3. Fiecare rapoart importat se sterge din tabela DATA_ALL
                DELETE FROM USER_EREPORTING.DATA_ALL
                WHERE
                  PERIOADA = CR.PERIOADA
                  AND FORM = CR.FORM
                  AND CUIIO = CR.CUIIO
                  AND ID_MD <> -1 -- Nu sterge rinduri gresite
                ;
            END IF;
            IF CR.FORM IN (13) AND ((vCURRENT_MONTH IN (1,2,3,4,7,10) AND vCURRENT_DAY <= 31) OR 
                                    (vCURRENT_MONTH IN (5) AND vCURRENT_DAY <= 6) OR (vCURRENT_MONTH IN (8,11) AND vCURRENT_DAY <= 8))  THEN -- 1-INVEST
            
                -- 0. Sterge rapoartele daca exista in CIS2.DATA_ALL
                DELETE FROM CIS2.DATA_ALL
                WHERE
                  PERIOADA=CR.PERIOADA AND FORM=CR.FORM AND CUIIO=CR.CUIIO AND ID_MD=CR.ID_MD;
                
                -- 0. Sterge rapoartele daca exista in CIS2.CONTROL
                DELETE FROM CIS2.CONTROL
                WHERE
                  PERIOADA=CR.PERIOADA AND FORM=CR.FORM AND CUIIO=CR.CUIIO;
                  
                -- 1. Se insereaza rapoarte noi in CIS2
                INSERT INTO CIS2.DATA_ALL
                (
                  PERIOADA,
                  FORM,
                  FORM_VERS,
                  CUIIO,
                  CUIIO_VERS,
                  ID_MD,
                  DATA_REG,
                  ID_USER,
                  COL1, COL2, COL3, COL4, COL5, COL6, COL7, COL8,
                  COL9, COL10, COL11, COL12, COL13, COL14, COL15
                )
                VALUES
                (
                  CR.PERIOADA,
                  CR.FORM,
                  CR.FORM_VERS,
                  CR.CUIIO,
                  CR.CUIIO_VERS,
                  CR.ID_MD,
                  CR.DATA_REG,
                  CR.ID_USER,
                  CR.COL1, CR.COL2, CR.COL3, CR.COL4, CR.COL5, CR.COL6, CR.COL7, CR.COL8,
                  CR.COL9, CR.COL10, CR.COL11, CR.COL12, CR.COL13, CR.COL14, CR.COL15
                );
                
                -- 2. Fiecare rapoart importat se insereaza in tabela DATA_ALL_PRIMIT
                INSERT INTO USER_EREPORTING.DATA_ALL_PRIMIT
                (
                  PERIOADA,
                  FORM,
                  FORM_VERS,
                  CUIIO,
                  CUIIO_VERS,
                  ID_MD,
                  DATA_REG,
                  ID_USER,
                  T_XML_FORM_ID,
                  ID_SCHEMA,
                  COL1, COL2, COL3, COL4, COL5, COL6, COL7, COL8,
                  COL9, COL10, COL11, COL12, COL13, COL14, COL15
                )
                VALUES
                (
                  CR.PERIOADA,
                  CR.FORM,
                  CR.FORM_VERS,
                  CR.CUIIO,
                  CR.CUIIO_VERS,
                  CR.ID_MD,
                  CR.DATA_REG,
                  CR.ID_USER,
                  CR.T_XML_FORM_ID,
                  CR.ID_SCHEMA,
                  CR.COL1, CR.COL2, CR.COL3, CR.COL4, CR.COL5, CR.COL6, CR.COL7, CR.COL8,
                  CR.COL9, CR.COL10, CR.COL11, CR.COL12, CR.COL13, CR.COL14, CR.COL15
                );
                
                -- 3. Fiecare rapoart importat se sterge din tabela DATA_ALL
                DELETE FROM USER_EREPORTING.DATA_ALL
                WHERE
                  PERIOADA = CR.PERIOADA
                  AND FORM = CR.FORM
                  AND CUIIO = CR.CUIIO
                  AND ID_MD <> -1 -- Nu sterge rinduri gresite
                ;
            END IF;
            
            IF CR.FORM IN (26) AND ((vCURRENT_MONTH IN (7) AND vCURRENT_DAY <= 13) OR 
                                    (vCURRENT_MONTH IN (10) AND vCURRENT_DAY <= 13) OR (vCURRENT_MONTH IN (1) AND vCURRENT_DAY <= 13)
                                    )  THEN -- 21-VINZ
            
                -- 0. Sterge rapoartele daca exista in CIS2.DATA_ALL
                DELETE FROM CIS2.DATA_ALL
                WHERE
                  PERIOADA=CR.PERIOADA AND FORM=CR.FORM AND CUIIO=CR.CUIIO AND ID_MD=CR.ID_MD;
                
                -- 0. Sterge rapoartele daca exista in CIS2.CONTROL
                DELETE FROM CIS2.CONTROL
                WHERE
                  PERIOADA=CR.PERIOADA AND FORM=CR.FORM AND CUIIO=CR.CUIIO;
                  
                -- 1. Se insereaza rapoarte noi in CIS2
                INSERT INTO CIS2.DATA_ALL
                (
                  PERIOADA,
                  FORM,
                  FORM_VERS,
                  CUIIO,
                  CUIIO_VERS,
                  ID_MD,
                  DATA_REG,
                  ID_USER,
                  COL1, COL2, COL3, COL4, COL5, COL6, COL7, COL8,
                  COL9, COL10, COL11, COL12, COL13, COL14, COL15
                )
                VALUES
                (
                  CR.PERIOADA,
                  CR.FORM,
                  CR.FORM_VERS,
                  CR.CUIIO,
                  CR.CUIIO_VERS,
                  CR.ID_MD,
                  CR.DATA_REG,
                  CR.ID_USER,
                  CR.COL1, CR.COL2, CR.COL3, CR.COL4, CR.COL5, CR.COL6, CR.COL7, CR.COL8,
                  CR.COL9, CR.COL10, CR.COL11, CR.COL12, CR.COL13, CR.COL14, CR.COL15
                );
                
                -- 2. Fiecare rapoart importat se insereaza in tabela DATA_ALL_PRIMIT
                INSERT INTO USER_EREPORTING.DATA_ALL_PRIMIT
                (
                  PERIOADA,
                  FORM,
                  FORM_VERS,
                  CUIIO,
                  CUIIO_VERS,
                  ID_MD,
                  DATA_REG,
                  ID_USER,
                  T_XML_FORM_ID,
                  ID_SCHEMA,
                  COL1, COL2, COL3, COL4, COL5, COL6, COL7, COL8,
                  COL9, COL10, COL11, COL12, COL13, COL14, COL15
                )
                VALUES
                (
                  CR.PERIOADA,
                  CR.FORM,
                  CR.FORM_VERS,
                  CR.CUIIO,
                  CR.CUIIO_VERS,
                  CR.ID_MD,
                  CR.DATA_REG,
                  CR.ID_USER,
                  CR.T_XML_FORM_ID,
                  CR.ID_SCHEMA,
                  CR.COL1, CR.COL2, CR.COL3, CR.COL4, CR.COL5, CR.COL6, CR.COL7, CR.COL8,
                  CR.COL9, CR.COL10, CR.COL11, CR.COL12, CR.COL13, CR.COL14, CR.COL15
                );
                
                -- 3. Fiecare rapoart importat se sterge din tabela DATA_ALL
                DELETE FROM USER_EREPORTING.DATA_ALL
                WHERE
                  PERIOADA = CR.PERIOADA
                  AND FORM = CR.FORM
                  AND CUIIO = CR.CUIIO
                  AND ID_MD <> -1 -- Nu sterge rinduri gresite
                ;
            END IF;
            
            IF CR.FORM IN (33) AND ((vCURRENT_MONTH IN (7) AND vCURRENT_DAY <= 10) OR 
                                    (vCURRENT_MONTH IN (10) AND vCURRENT_DAY <= 6) OR (vCURRENT_MONTH IN (12) AND vCURRENT_DAY <= 24)
                                    )  THEN -- 24-AGR
            
                -- 0. Sterge rapoartele daca exista in CIS2.DATA_ALL
                DELETE FROM CIS2.DATA_ALL
                WHERE
                  PERIOADA=CR.PERIOADA AND FORM=CR.FORM AND CUIIO=CR.CUIIO AND ID_MD=CR.ID_MD;
                
                -- 0. Sterge rapoartele daca exista in CIS2.CONTROL
                DELETE FROM CIS2.CONTROL
                WHERE
                  PERIOADA=CR.PERIOADA AND FORM=CR.FORM AND CUIIO=CR.CUIIO;
                  
                -- 1. Se insereaza rapoarte noi in CIS2
                INSERT INTO CIS2.DATA_ALL
                (
                  PERIOADA,
                  FORM,
                  FORM_VERS,
                  CUIIO,
                  CUIIO_VERS,
                  ID_MD,
                  DATA_REG,
                  ID_USER,
                  COL1, COL2, COL3, COL4, COL5, COL6, COL7, COL8,
                  COL9, COL10, COL11, COL12, COL13, COL14, COL15
                )
                VALUES
                (
                  CR.PERIOADA,
                  CR.FORM,
                  CR.FORM_VERS,
                  CR.CUIIO,
                  CR.CUIIO_VERS,
                  CR.ID_MD,
                  CR.DATA_REG,
                  CR.ID_USER,
                  CR.COL1, CR.COL2, CR.COL3, CR.COL4, CR.COL5, CR.COL6, CR.COL7, CR.COL8,
                  CR.COL9, CR.COL10, CR.COL11, CR.COL12, CR.COL13, CR.COL14, CR.COL15
                );
                
                -- 2. Fiecare rapoart importat se insereaza in tabela DATA_ALL_PRIMIT
                INSERT INTO USER_EREPORTING.DATA_ALL_PRIMIT
                (
                  PERIOADA,
                  FORM,
                  FORM_VERS,
                  CUIIO,
                  CUIIO_VERS,
                  ID_MD,
                  DATA_REG,
                  ID_USER,
                  T_XML_FORM_ID,
                  ID_SCHEMA,
                  COL1, COL2, COL3, COL4, COL5, COL6, COL7, COL8,
                  COL9, COL10, COL11, COL12, COL13, COL14, COL15
                )
                VALUES
                (
                  CR.PERIOADA,
                  CR.FORM,
                  CR.FORM_VERS,
                  CR.CUIIO,
                  CR.CUIIO_VERS,
                  CR.ID_MD,
                  CR.DATA_REG,
                  CR.ID_USER,
                  CR.T_XML_FORM_ID,
                  CR.ID_SCHEMA,
                  CR.COL1, CR.COL2, CR.COL3, CR.COL4, CR.COL5, CR.COL6, CR.COL7, CR.COL8,
                  CR.COL9, CR.COL10, CR.COL11, CR.COL12, CR.COL13, CR.COL14, CR.COL15
                );
                
                -- 3. Fiecare rapoart importat se sterge din tabela DATA_ALL
                DELETE FROM USER_EREPORTING.DATA_ALL
                WHERE
                  PERIOADA = CR.PERIOADA
                  AND FORM = CR.FORM
                  AND CUIIO = CR.CUIIO
                  AND ID_MD <> -1 -- Nu sterge rinduri gresite
                ;
            END IF;
            
            IF CR.FORM IN (45) AND ((vCURRENT_MONTH IN (7) AND vCURRENT_DAY <= 6) OR 
                                    (vCURRENT_MONTH IN (10) AND vCURRENT_DAY <= 6) OR (vCURRENT_MONTH IN (12) AND vCURRENT_DAY <= 24)
                                    )  THEN -- 29-AGR
            
                -- 0. Sterge rapoartele daca exista in CIS2.DATA_ALL
                DELETE FROM CIS2.DATA_ALL
                WHERE
                  PERIOADA=CR.PERIOADA AND FORM=CR.FORM AND CUIIO=CR.CUIIO AND ID_MD=CR.ID_MD;
                
                -- 0. Sterge rapoartele daca exista in CIS2.CONTROL
                DELETE FROM CIS2.CONTROL
                WHERE
                  PERIOADA=CR.PERIOADA AND FORM=CR.FORM AND CUIIO=CR.CUIIO;
                  
                -- 1. Se insereaza rapoarte noi in CIS2
                INSERT INTO CIS2.DATA_ALL
                (
                  PERIOADA,
                  FORM,
                  FORM_VERS,
                  CUIIO,
                  CUIIO_VERS,
                  ID_MD,
                  DATA_REG,
                  ID_USER,
                  COL1, COL2, COL3, COL4, COL5, COL6, COL7, COL8,
                  COL9, COL10, COL11, COL12, COL13, COL14, COL15
                )
                VALUES
                (
                  CR.PERIOADA,
                  CR.FORM,
                  CR.FORM_VERS,
                  CR.CUIIO,
                  CR.CUIIO_VERS,
                  CR.ID_MD,
                  CR.DATA_REG,
                  CR.ID_USER,
                  CR.COL1, CR.COL2, CR.COL3, CR.COL4, CR.COL5, CR.COL6, CR.COL7, CR.COL8,
                  CR.COL9, CR.COL10, CR.COL11, CR.COL12, CR.COL13, CR.COL14, CR.COL15
                );
                
                -- 2. Fiecare rapoart importat se insereaza in tabela DATA_ALL_PRIMIT
                INSERT INTO USER_EREPORTING.DATA_ALL_PRIMIT
                (
                  PERIOADA,
                  FORM,
                  FORM_VERS,
                  CUIIO,
                  CUIIO_VERS,
                  ID_MD,
                  DATA_REG,
                  ID_USER,
                  T_XML_FORM_ID,
                  ID_SCHEMA,
                  COL1, COL2, COL3, COL4, COL5, COL6, COL7, COL8,
                  COL9, COL10, COL11, COL12, COL13, COL14, COL15
                )
                VALUES
                (
                  CR.PERIOADA,
                  CR.FORM,
                  CR.FORM_VERS,
                  CR.CUIIO,
                  CR.CUIIO_VERS,
                  CR.ID_MD,
                  CR.DATA_REG,
                  CR.ID_USER,
                  CR.T_XML_FORM_ID,
                  CR.ID_SCHEMA,
                  CR.COL1, CR.COL2, CR.COL3, CR.COL4, CR.COL5, CR.COL6, CR.COL7, CR.COL8,
                  CR.COL9, CR.COL10, CR.COL11, CR.COL12, CR.COL13, CR.COL14, CR.COL15
                );
                
                -- 3. Fiecare rapoart importat se sterge din tabela DATA_ALL
                DELETE FROM USER_EREPORTING.DATA_ALL
                WHERE
                  PERIOADA = CR.PERIOADA
                  AND FORM = CR.FORM
                  AND CUIIO = CR.CUIIO
                  AND ID_MD <> -1 -- Nu sterge rinduri gresite
                ;
            END IF;
            
        END IF;
      END LOOP;
      
      EXCEPTION 
        WHEN DUP_VAL_ON_INDEX THEN RETURN; 
    -------------------------------------------------------------------------------

  END IMPORT_EREPORTING_TRIMESTRIAL;


---Import agriculture form with current period
PROCEDURE IMPORT_EREPORTING_TRIM_AGR AS
  pPERIOADA NUMBER;
    vCURRENT_DAY NUMBER;
    vCURRENT_MONTH NUMBER;
  -- Importarea rapoartelor din e-reporting in CIS2 ------------------------------
      CURSOR C IS
      SELECT
        PERIOADA,
        FORM,
        FORM_VERS,
        CUIIO,
        CUIIO_VERS,
        ID_MD,
        DATA_REG,
        ID_USER,
        T_XML_FORM_ID,
        ID_SCHEMA,
        COL1, COL2, COL3, COL4, COL5, COL6, COL7, COL8,
        COL9, COL10, COL11, COL12, COL13, COL14, COL15,
        COL31, COL32, COL33, COL34, COL35
      FROM
        (
          SELECT DISTINCT
            DE.PERIOADA,
            DE.FORM,
            DE.FORM_VERS,
            DE.CUIIO,
            DE.CUIIO_VERS,
            DE.ID_MD,
            DE.DATA_REG,
            9999 AS ID_USER,
            DE.T_XML_FORM_ID,
            DE.ID_SCHEMA,
            DE.COL1, DE.COL2, DE.COL3, DE.COL4, DE.COL5, DE.COL6, DE.COL7, DE.COL8,
            DE.COL9, DE.COL10, DE.COL11, DE.COL12, DE.COL13, DE.COL14, DE.COL15,
            DE.COL31, DE.COL32, DE.COL33, DE.COL34, DE.COL35
          FROM
            USER_EREPORTING.DATA_ALL DE INNER JOIN
            USER_EREPORTING.FORM_CUIIO FC ON (DE.CUIIO=FC.CUIIO AND DE.CUIIO_VERS=FC.CUIIO_VERS AND DE.FORM=FC.FORM AND DE.FORM_VERS=FC.FORM_VERS AND FC.STATUT <> '3' AND DE.ID_SCHEMA=FC.ID_SCHEMA)
    --        LEFT JOIN
    --        (
    --          SELECT DISTINCT D.FORM, D.PERIOADA, D.CUIIO FROM CIS2.DATA_ALL D
    --        ) DC ON(DC.FORM = DE.FORM AND DC.PERIOADA=DE.PERIOADA AND DC.CUIIO=DE.CUIIO)
          WHERE
    --        DC.CUIIO IS NULL   -- Exclude rapoarte existente in CIS2 -- AND 
              DE.ID_MD <> -1 -- Exclude rinduri cu identificatori eronate --
--              AND DE.CUIIO IN (7028639)
            /* ----------------------------------------------------------------- */
            AND DE.PERIOADA = pPERIOADA
    --        AND DE.FORM     = :IMPORT_FORM
            AND (DE.COL1 <> 0 OR DE.COL2 <> 0 OR DE.COL3 <> 0 OR DE.COL4 <> 0 OR DE.COL5 <> 0 OR DE.COL6 <> 0 OR DE.COL7 <> 0 OR DE.COL8 <> 0 OR DE.COL9 <> 0 OR DE.COL10 <> 0 OR 
                 DE.COL11 <> 0 OR DE.COL12 <> 0 OR DE.COL13 <> 0 OR DE.COL14 <> 0 OR DE.COL15 <> 0)
            /* ----------------------------------------------------------------- */
    --      ORDER BY
    --        DE.PERIOADA,
    --        DE.FORM,
    --        DE.CUIIO,
    --        DE.ID_MD
            
          UNION
         SELECT DISTINCT
                DE.PERIOADA,
                DE.FORM,
                DE.FORM_VERS,
                DE.CUIIO,
                DE.CUIIO_VERS,
                R.ID_MD,
                SYSDATE AS DATA_REG,
                9999 AS ID_USER,
                DE.T_XML_FORM_ID,
                DE.ID_SCHEMA,
                CASE 
                  WHEN R.RIND IN ('002') THEN SUM( CASE WHEN DE.ID_MD IN (
                    SELECT R.ID_MD FROM MD_RIND R WHERE R.RIND_VERS <= pPERIOADA AND R.CAPITOL_VERS <= pPERIOADA AND R.CAPITOL IN (312) AND R.RIND IN ('051','031','112','398','417','643','762','795','804','860')) 
                  THEN DE.COL1 END) 
                  WHEN R.RIND IN ('999') THEN SUM( CASE WHEN DE.ID_MD IN (
                    SELECT R.ID_MD FROM MD_RIND R WHERE R.RIND_VERS <= pPERIOADA AND R.CAPITOL_VERS <= pPERIOADA AND R.CAPITOL IN (312) AND R.RIND NOT IN ('051','031','112','398','417','643','762','795','804','860','001','002','999')) 
                  THEN DE.COL1 END) 
                ELSE 1 
                END AS COL1, 
                CASE 
                  WHEN R.RIND IN ('002') THEN SUM( CASE WHEN DE.ID_MD IN (
                    SELECT R.ID_MD FROM MD_RIND R WHERE R.RIND_VERS <= pPERIOADA AND R.CAPITOL_VERS <= pPERIOADA AND R.CAPITOL IN (312) AND R.RIND IN ('051','031','112','398','417','643','762','795','804','860')) 
                  THEN DE.COL2 END) 
                  WHEN R.RIND IN ('999') THEN SUM( CASE WHEN DE.ID_MD IN (
                    SELECT R.ID_MD FROM MD_RIND R WHERE R.RIND_VERS <= pPERIOADA AND R.CAPITOL_VERS <= pPERIOADA AND R.CAPITOL IN (312) AND R.RIND NOT IN ('051','031','112','398','417','643','762','795','804','860','001','002','999')) 
                  THEN DE.COL2 END) 
                ELSE NULL 
                END AS COL2, NULL AS COL3, NULL AS COL4, NULL AS COL5, NULL AS COL6, NULL AS COL7, NULL AS COL8,
                NULL AS COL9, NULL AS COL10, NULL AS COL11, NULL AS COL12, NULL AS COL13, NULL AS COL14, NULL AS COL15,
                NULL AS COL31, NULL AS COL32, NULL AS COL33, NULL AS COL34, NULL AS COL35
        FROM
          USER_EREPORTING.DATA_ALL DE INNER JOIN
          USER_EREPORTING.FORM_CUIIO FC ON (DE.CUIIO=FC.CUIIO AND DE.CUIIO_VERS=FC.CUIIO_VERS AND DE.FORM=FC.FORM AND DE.FORM_VERS=FC.FORM_VERS AND FC.STATUT <> '3' AND DE.ID_SCHEMA=FC.ID_SCHEMA) 
    --      LEFT JOIN
    --      (
    --        SELECT DISTINCT D.FORM, D.PERIOADA, D.CUIIO FROM CIS2.DATA_ALL D
    --      ) DC ON(DC.FORM = DE.FORM AND DC.PERIOADA=DE.PERIOADA AND DC.CUIIO=DE.CUIIO)
          RIGHT JOIN CIS2.MD_RIND R ON (DE.FORM=R.FORM)
          INNER JOIN (SELECT
                    --  ID_MD,
                      FORM,
                      FORM_VERS,
                      CAPITOL,
                      MAX(CAPITOL_VERS) AS CAPITOL_VERS,
                      RIND,
                      MAX(RIND_VERS) AS RIND_VERS
                    FROM
                      MD_RIND R
                    WHERE
                      R.RIND_VERS <= pPERIOADA AND
                      R.CAPITOL_VERS <= pPERIOADA AND
                      R.CAPITOL IN (0,1,2,14,412,312)
                    GROUP BY
                    --  ID_MD,
                      FORM,
                      FORM_VERS,
                      CAPITOL,
                      RIND
                    ORDER BY
                      FORM) RR ON (R.FORM=RR.FORM AND R.CAPITOL=RR.CAPITOL AND R.CAPITOL_VERS=RR.CAPITOL_VERS AND R.RIND=RR.RIND AND R.RIND_VERS=RR.RIND_VERS)
        WHERE
    --      DC.CUIIO IS NULL AND
          DE.PERIOADA = pPERIOADA AND 
    --      R.FORM = :IMPORT_FORM AND
          R.CAPITOL IN (0,1,2,14,412,312) AND
          R.RIND IN ('01','002','999')
--              AND DE.CUIIO IN (7028639)
        GROUP BY
          DE.PERIOADA,
                DE.FORM,
                DE.FORM_VERS,
                DE.CUIIO,
                DE.CUIIO_VERS,
                R.ID_MD,
                R.RIND,
                SYSDATE,
                DE.T_XML_FORM_ID,
                DE.ID_SCHEMA
        ) D;

  BEGIN
    pPERIOADA := GET_PERIOADA_TRIMESTRIALA_AGR;
    SELECT
      EXTRACT(DAY FROM SYSDATE) AS CURRENT_DAY, EXTRACT(MONTH FROM SYSDATE) AS CURRENT_MONTH INTO vCURRENT_DAY, vCURRENT_MONTH
    FROM
      DUAL;
    
      FOR CR IN C
      LOOP
        IF CR.ID_SCHEMA = 2 THEN -- Identificam daca raport este in CIS2
            
            IF CR.FORM IN (29) AND ((vCURRENT_MONTH IN (1,2,3,4,5,7,10) AND vCURRENT_DAY <= 31) OR 
                                    (vCURRENT_MONTH IN (6) AND vCURRENT_DAY <= 23) OR (vCURRENT_MONTH IN (8,11) AND vCURRENT_DAY <= 8) OR 
                                    (vCURRENT_MONTH IN (9) AND vCURRENT_DAY <= 20))  THEN -- Forma Nr.6
            
                -- 0. Sterge rapoartele daca exista in CIS2.DATA_ALL
                DELETE FROM CIS2.DATA_ALL
                WHERE
                  PERIOADA=CR.PERIOADA AND FORM=CR.FORM AND CUIIO=CR.CUIIO AND ID_MD=CR.ID_MD;
                
                -- 0. Sterge rapoartele daca exista in CIS2.CONTROL
                DELETE FROM CIS2.CONTROL
                WHERE
                  PERIOADA=CR.PERIOADA AND FORM=CR.FORM AND CUIIO=CR.CUIIO;
                  
                -- 1. Se insereaza rapoarte noi in CIS2
                INSERT INTO CIS2.DATA_ALL
                (
                  PERIOADA,
                  FORM,
                  FORM_VERS,
                  CUIIO,
                  CUIIO_VERS,
                  ID_MD,
                  DATA_REG,
                  ID_USER,
                  COL1, COL2, COL3, COL4, COL5, COL6, COL7, COL8,
                  COL9, COL10, COL11, COL12, COL13, COL14, COL15
                )
                VALUES
                (
                  CR.PERIOADA,
                  CR.FORM,
                  CR.FORM_VERS,
                  CR.CUIIO,
                  CR.CUIIO_VERS,
                  CR.ID_MD,
                  CR.DATA_REG,
                  CR.ID_USER,
                  CR.COL1, CR.COL2, CR.COL3, CR.COL4, CR.COL5, CR.COL6, CR.COL7, CR.COL8,
                  CR.COL9, CR.COL10, CR.COL11, CR.COL12, CR.COL13, CR.COL14, CR.COL15
                );
                
                -- 2. Fiecare rapoart importat se insereaza in tabela DATA_ALL_PRIMIT
                INSERT INTO USER_EREPORTING.DATA_ALL_PRIMIT
                (
                  PERIOADA,
                  FORM,
                  FORM_VERS,
                  CUIIO,
                  CUIIO_VERS,
                  ID_MD,
                  DATA_REG,
                  ID_USER,
                  T_XML_FORM_ID,
                  ID_SCHEMA,
                  COL1, COL2, COL3, COL4, COL5, COL6, COL7, COL8,
                  COL9, COL10, COL11, COL12, COL13, COL14, COL15
                )
                VALUES
                (
                  CR.PERIOADA,
                  CR.FORM,
                  CR.FORM_VERS,
                  CR.CUIIO,
                  CR.CUIIO_VERS,
                  CR.ID_MD,
                  CR.DATA_REG,
                  CR.ID_USER,
                  CR.T_XML_FORM_ID,
                  CR.ID_SCHEMA,
                  CR.COL1, CR.COL2, CR.COL3, CR.COL4, CR.COL5, CR.COL6, CR.COL7, CR.COL8,
                  CR.COL9, CR.COL10, CR.COL11, CR.COL12, CR.COL13, CR.COL14, CR.COL15
                );
                
                -- 3. Fiecare rapoart importat se sterge din tabela DATA_ALL
                DELETE FROM USER_EREPORTING.DATA_ALL
                WHERE
                  PERIOADA = CR.PERIOADA
                  AND FORM = CR.FORM
                  AND CUIIO = CR.CUIIO
                  AND ID_MD <> -1 -- Nu sterge rinduri gresite
                ;
            END IF;
            
        END IF;
      END LOOP;
      
      EXCEPTION 
        WHEN DUP_VAL_ON_INDEX THEN RETURN; 
    -------------------------------------------------------------------------------

  END IMPORT_EREPORTING_TRIM_AGR;
PROCEDURE IMPORT_EREPORTING_ANUAL AS
  pPERIOADA NUMBER;
    vCURRENT_DAY NUMBER;
    vCURRENT_MONTH NUMBER;
  -- Importarea rapoartelor din e-reporting in CIS2 ------------------------------
      CURSOR C IS
      SELECT DISTINCT
        PERIOADA,
        FORM,
        FORM_VERS,
        CUIIO,
        CUIIO_VERS,
        ID_MD,
        DATA_REG,
        ID_USER,
        T_XML_FORM_ID,
        ID_SCHEMA,
        FILIAL,
        CASE WHEN FORPRO_FILIAL IS NULL THEN '0' ELSE FORPRO_FILIAL END AS FORPRO_FILIAL,
        MUNCA3_FILIAL,
        CASE WHEN FORM IN (3) AND ID_MD IN (11345,11346,11378,11377) THEN 0 ELSE COL1 END AS COL1,
        CASE 
          WHEN FORM IN (12) AND ID_SCHEMA IN (2) THEN COL2_1_CC 
          WHEN FORM IN (21) AND ID_SCHEMA IN (2) THEN COL2_3_COMERT 
          ELSE COL2 
        END AS COL2, 
        CASE WHEN FORM IN (8) AND COL3 IS NULL THEN COL3_INV ELSE COL3 END AS COL3, 
        CASE WHEN FORM IN (8) AND COL4 IS NULL THEN COL4_INV ELSE COL4 END AS COL4,
        COL5, COL6, COL7, COL8,
        COL9, COL10, COL11, COL12, COL13, COL14, COL15, COL16, COL31, COL32, COL33, COL34, COL35, COL36, COL37, COL38, COL39, COL40
      FROM
        (
          SELECT DISTINCT
            DE.PERIOADA,
            DE.FORM,
            DE.FORM_VERS,
            DE.CUIIO,
            DE.CUIIO_VERS,
            DE.ID_MD,
            DE.DATA_REG,
            9999 AS ID_USER,
            DE.T_XML_FORM_ID,
            DE.ID_SCHEMA,
            DE.FILIAL,
            CASE WHEN R.CAEM2 LIKE ('%O84%') THEN CASE WHEN SUBSTR(DE.FILIAL,0,2)=SUBSTR(R.CAEM2,0,2) THEN '0' ELSE SUBSTR(DE.FILIAL,2,5) END ELSE '0' END AS FORPRO_FILIAL,
            CASE WHEN DE.FILIAL IS NULL THEN '0' ELSE  DE.FILIAL
--            (SELECT CODUL7 FROM CIS2.CL_CUATM74 WHERE CODUL4=(CASE WHEN LENGTH(DE.FILIAL)=3 THEN '0'||DE.FILIAL ELSE DE.FILIAL END))
             END AS MUNCA3_FILIAL,
            DE.COL1, DE.COL2, AN_PREC.COL2_1_CC AS COL2_1_CC, AN_PREC.COL2_3_COMERT AS COL2_3_COMERT, DE.COL3, AN_PREC.COL3_2_INV AS COL3_INV, DE.COL4, AN_PREC.COL4_2_INV AS COL4_INV, DE.COL5, DE.COL6, DE.COL7, DE.COL8,
            DE.COL9, DE.COL10, DE.COL11, DE.COL12, DE.COL13, DE.COL14, DE.COL15, DE.COL16, COL31, DE.COL32, DE.COL33, DE.COL34, DE.COL35, DE.COL36, DE.COL37, DE.COL38, DE.COL39, DE.COL40
          FROM
            USER_EREPORTING.DATA_ALL DE LEFT JOIN
            -- se efectueaza pentru 2-INV_ANUL anul precedent COL3, COL4
            (SELECT
                  pPERIOADA AS PERIOADA,
                  A.FORM,
                  A.FORM_VERS,
                  A.CUIIO,
                  A.CUIIO_VERS,
                  B.RIND,
                  B.ID_MD,
                  CASE WHEN DE.ID_MD IS NULL THEN 0 ELSE 1 END AS ID_MD_EREPORTING,
                  SYSDATE AS DATA_REG,
                  '9999' AS ID_USER,
                  A.COL2_1_CC,
                  A.COL3_2_INV,
                  A.COL4_2_INV,
                  A.COL2_3_COMERT
                FROM
                (
                SELECT
                                          pPERIOADA AS PERIOADA,
                                          D.FORM,
                                          D.FORM_VERS,
                                          D.CAPITOL,
                                          D.CUIIO,
                                          D.CUIIO_VERS,
                                          D.RIND,
                                          D.ID_MD,
                                          CASE WHEN D.FORM IN (12) THEN D.COL1 ELSE NULL END AS COL2_1_CC,
                                          /*CASE WHEN D.FORM IN (8) AND (D.CAPITOL IN (323,325) AND D.RIND NOT IN ('170','180','190','61','62','63') )OR (D.CAPITOL=324 AND D.RIND='200') THEN D.COL1 ELSE D.COL2 END AS COL3_2_INV,
                                          CASE WHEN D.FORM IN (8) AND (D.CAPITOL IN (323,325) AND D.RIND NOT IN ('170','180','190','61','62','63') )OR (D.CAPITOL=324 AND D.RIND='200') THEN D.COL2 ELSE NULL   END AS COL4_2_INV*/
                                          CASE WHEN D.FORM IN (8) AND (D.CAPITOL IN (323) AND D.RIND NOT IN ('510','520','530') ) THEN D.COL1 ELSE NULL END AS COL3_2_INV,
                                          CASE WHEN D.FORM IN (8) AND (D.CAPITOL IN (323) /*AND D.RIND NOT IN ('510','520','530')*/ ) THEN D.COL2 ELSE NULL   END AS COL4_2_INV,
                                          CASE WHEN D.FORM IN (21) AND CAPITOL IN (357,358) THEN D.COL1 ELSE NULL END AS COL2_3_COMERT
                                        FROM
                                          CIS2.VW_DATA_ALL D
                                        WHERE
                                          D.PERIOADA IN (pPERIOADA-1) AND
                                          D.CUIIO IN (SELECT
                                                          DISTINCT
                                                          D.CUIIO
                                                        FROM
                                                          USER_EREPORTING.DATA_ALL D
                                                        WHERE
                                                          D.PERIOADA IN (pPERIOADA))
--                                          D.FORM IN (8) AND
--                                          AND D.CUIIO IN (40548765)
                --                          D.ID_MD IN (CR.ID_MD) AND
--                                          ((D.CAPITOL IN (323,325) AND D.RIND NOT IN ('170','180','190','61','62','63') )OR (D.CAPITOL=324 AND D.RIND='200'))
                ) A INNER JOIN 
                (
                SELECT
                  R.ID_MD,
                  R.FORM,
                  R.CAPITOL,
                  MAX(R.CAPITOL_VERS) AS CAPITOL_VERS,
                  R.RIND,
                  MAX(R.RIND_VERS) AS RIND_VERS
                FROM
                MD_RIND R INNER JOIN
                (
                SELECT
                  R.RIND,
                  R.FORM,
                  C.CAPITOL,
                  C.CAPITOL_VERS,
                  MAX(R.RIND_VERS) AS RIND_VERS
                FROM
                  MD_RIND R
                  INNER JOIN (
                  SELECT
                      C.CAPITOL, 
                      MAX(C.CAPITOL_VERS) AS CAPITOL_VERS
                    FROM
                      MD_CAPITOL C
                    WHERE
                      C.CAPITOL_VERS <= pPERIOADA-1
                    GROUP BY
                      C.CAPITOL
                  ) C ON (R.CAPITOL=C.CAPITOL AND R.CAPITOL_VERS=C.CAPITOL_VERS)
--                WHERE
--                  FORM IN (8)
                GROUP BY
                  R.RIND,R.FORM,
                  C.CAPITOL,
                  C.CAPITOL_VERS
                  ) RR ON (R.RIND=RR.RIND AND R.RIND_VERS=RR.RIND_VERS AND R.FORM=RR.FORM AND R.CAPITOL=RR.CAPITOL AND R.CAPITOL_VERS=RR.CAPITOL_VERS)
--                WHERE
--                  R.FORM IN (8)
                GROUP BY
                  R.ID_MD,
                  R.FORM,
                  R.CAPITOL,
                  R.RIND
--                  ORDER BY
--                    R.FORM,R.CAPITOL,R.RIND
                ) B ON (A.RIND=B.RIND AND A.CAPITOL=B.CAPITOL AND A.FORM=B.FORM)
                LEFT JOIN USER_EREPORTING.DATA_ALL DE ON (A.PERIOADA=DE.PERIOADA AND A.FORM=DE.FORM AND A.CUIIO=DE.CUIIO AND B.ID_MD=DE.ID_MD)
                --WHERE
                --  B.ID_MD IN (:ID_MD)
            ) AN_PREC ON (DE.PERIOADA=AN_PREC.PERIOADA AND AN_PREC.FORM=DE.FORM AND AN_PREC.CUIIO=DE.CUIIO AND AN_PREC.ID_MD=DE.ID_MD) INNER JOIN 
--------------------------------------------------------------------------------
            USER_EREPORTING.RENIM R ON (DE.CUIIO=R.CUIIO AND DE.CUIIO_VERS=R.CUIIO_VERS AND DE.ID_SCHEMA=R.ID_SCHEMA) INNER JOIN
            USER_EREPORTING.FORM_CUIIO FC ON (DE.CUIIO=FC.CUIIO AND DE.CUIIO_VERS=FC.CUIIO_VERS AND DE.FORM=FC.FORM AND DE.FORM_VERS=FC.FORM_VERS AND FC.STATUT <> '3' AND DE.ID_SCHEMA=FC.ID_SCHEMA)
    --        LEFT JOIN
    --        (
    --          SELECT DISTINCT D.FORM, D.PERIOADA, D.CUIIO FROM CIS2.DATA_ALL D
    --        ) DC ON(DC.FORM = DE.FORM AND DC.PERIOADA=DE.PERIOADA AND DC.CUIIO=DE.CUIIO)
          WHERE
    --        DC.CUIIO IS NULL   -- Exclude rapoarte existente in CIS2 -- AND 
              DE.ID_MD <> -1 -- Exclude rinduri cu identificatori eronate --
--              AND DE.CUIIO IN (40548765)
            /* ----------------------------------------------------------------- */
            AND DE.PERIOADA = pPERIOADA
--            AND DE.FORM     = :IMPORT_FORM
            AND (DE.COL1 <> 0 OR DE.COL2 <> 0 OR DE.COL3 <> 0 OR AN_PREC.COL3_2_INV <> 0 OR DE.COL4 <> 0 OR AN_PREC.COL4_2_INV <> 0 OR DE.COL5 <> 0 OR DE.COL6 <> 0 OR DE.COL7 <> 0 OR DE.COL8 <> 0 OR DE.COL9 <> 0 OR DE.COL10 <> 0 OR 
                 DE.COL11 <> 0 OR DE.COL12 <> 0 OR DE.COL13 <> 0 OR DE.COL14 <> 0 OR DE.COL15 <> 0 OR DE.COL16 <> 0 OR DE.COL31 IS NOT NULL OR DE.COL32 IS NOT NULL OR DE.COL33 IS NOT NULL OR DE.COL34 IS NOT NULL OR DE.COL35 IS NOT NULL OR 
                 DE.COL36 IS NOT NULL OR DE.COL37 IS NOT NULL OR DE.COL38 IS NOT NULL OR DE.COL39 IS NOT NULL OR DE.COL40 IS NOT NULL)
            
          UNION
         SELECT DISTINCT
                DE.PERIOADA,
                DE.FORM,
                DE.FORM_VERS,
                DE.CUIIO,
                DE.CUIIO_VERS,
                R.ID_MD,
                SYSDATE AS DATA_REG,
                9999 AS ID_USER,
                DE.T_XML_FORM_ID,
                DE.ID_SCHEMA,
                '0' AS FILIAL,
                '0' AS FORPRO_FILIAL,
                '0' AS MUNCA3_FILIAL,
                CASE WHEN R.RIND IN ('00') THEN COUNT(DISTINCT DE.FILIAL) ELSE 1 END AS COL1, NULL AS COL2,NULL AS COL2_1_CC, NULL AS COL2_3_COMERT, NULL AS COL3, NULL AS COL3_INV, NULL AS COL4, NULL AS COL4_INV, NULL AS COL5, NULL AS COL6, NULL AS COL7, NULL AS COL8,
                NULL AS COL9, NULL AS COL10, NULL AS COL11, NULL AS COL12, NULL AS COL13, NULL AS COL14, NULL AS COL15, NULL AS COL16, NULL AS COL31, NULL AS COL32, NULL AS COL33, NULL AS COL34, NULL AS COL35, NULL AS COL36, NULL AS COL37, NULL AS COL38, NULL AS COL39, NULL AS COL40
        FROM
          USER_EREPORTING.DATA_ALL DE INNER JOIN
          USER_EREPORTING.FORM_CUIIO FC ON (DE.CUIIO=FC.CUIIO AND DE.CUIIO_VERS=FC.CUIIO_VERS AND DE.FORM=FC.FORM AND DE.FORM_VERS=FC.FORM_VERS AND FC.STATUT <> '3' AND DE.ID_SCHEMA=FC.ID_SCHEMA) 
    --      LEFT JOIN
    --      (
    --        SELECT DISTINCT D.FORM, D.PERIOADA, D.CUIIO FROM CIS2.DATA_ALL D
    --      ) DC ON(DC.FORM = DE.FORM AND DC.PERIOADA=DE.PERIOADA AND DC.CUIIO=DE.CUIIO)
          RIGHT JOIN CIS2.MD_RIND R ON (DE.FORM=R.FORM)
          INNER JOIN (SELECT
                    --  ID_MD,
                      FORM,
                      FORM_VERS,
                      CAPITOL,
                      MAX(CAPITOL_VERS) AS CAPITOL_VERS,
                      RIND,
                      MAX(RIND_VERS) AS RIND_VERS
                    FROM
                      MD_RIND R
                    WHERE
                      R.RIND_VERS <= pPERIOADA AND
                      R.CAPITOL_VERS <= pPERIOADA AND
                      R.CAPITOL IN (0,100,3,1088,1143,1195)
                    GROUP BY
                    --  ID_MD,
                      FORM,
                      FORM_VERS,
                      CAPITOL,
                      RIND
                    ORDER BY
                      FORM) RR ON (R.FORM=RR.FORM AND R.CAPITOL=RR.CAPITOL AND R.CAPITOL_VERS=RR.CAPITOL_VERS AND R.RIND=RR.RIND AND R.RIND_VERS=RR.RIND_VERS)
        WHERE
    --      DC.CUIIO IS NULL AND
          DE.PERIOADA = pPERIOADA AND 
    --      R.FORM = :IMPORT_FORM AND
          R.CAPITOL IN (0,100,3,1088,1143,1195) AND
          R.RIND IN ('01','00','ER','1')
          AND R.STATUT <> '3'
--              AND DE.CUIIO IN (40548765)
        GROUP BY
          DE.PERIOADA,
                DE.FORM,
                DE.FORM_VERS,
                DE.CUIIO,
                DE.CUIIO_VERS,
                R.ID_MD,
                SYSDATE,
                DE.T_XML_FORM_ID,
                DE.ID_SCHEMA,
                R.RIND
        ) D;

  BEGIN
    pPERIOADA := GET_PERIOADA_ANUALA;
    SELECT
      EXTRACT(DAY FROM SYSDATE) AS CURRENT_DAY, EXTRACT(MONTH FROM SYSDATE) AS CURRENT_MONTH INTO vCURRENT_DAY, vCURRENT_MONTH
    FROM
      DUAL;
    
      FOR CR IN C
      LOOP
        IF CR.ID_SCHEMA = 2 THEN -- Identificam daca raport este in CIS2
        
            IF CR.FORM IN (64) AND ((vCURRENT_MONTH IN (1,2,3,4,5) AND vCURRENT_DAY <= 31) OR (vCURRENT_MONTH IN (6) AND vCURRENT_DAY <= 28)) THEN -- ASA
            
                -- 0. Sterge rapoartele daca exista in CIS2.DATA_ALL
                DELETE FROM CIS2.DATA_ALL
                WHERE
                  PERIOADA=CR.PERIOADA AND FORM=CR.FORM AND CUIIO=CR.CUIIO AND ID_MD=CR.ID_MD;
                
                -- 0. Sterge rapoartele daca exista in CIS2.CONTROL
                DELETE FROM CIS2.CONTROL
                WHERE
                  PERIOADA=CR.PERIOADA AND FORM=CR.FORM AND CUIIO=CR.CUIIO;
                  
                -- 1. Se insereaza rapoarte noi in CIS2
                INSERT INTO CIS2.DATA_ALL
                (
                  PERIOADA,
                  FORM,
                  FORM_VERS,
                  CUIIO,
                  CUIIO_VERS,
                  ID_MD,
                  DATA_REG,
                  ID_USER,
                  COL1, COL2, COL3, COL4, COL5, COL6, COL7, COL8,
                  COL9, COL10, COL11, COL12, COL13, COL14, COL15,
                  COL31, COL32, COL33, COL34, COL35, COL36, COL37, COL38, 
                  COL39, COL40
                )
                VALUES
                (
                  CR.PERIOADA,
                  CR.FORM,
                  CR.FORM_VERS,
                  CR.CUIIO,
                  CR.CUIIO_VERS,
                  CR.ID_MD,
                  CR.DATA_REG,
                  CR.ID_USER,
                  CR.COL1, CR.COL2, CR.COL3, CR.COL4, CR.COL5, CR.COL6, CR.COL7, CR.COL8,
                  CR.COL9, CR.COL10, CR.COL11, CR.COL12, CR.COL13, CR.COL14, CR.COL15, 
                  CR.COL31, CR.COL32, CR.COL33, CR.COL34, CR.COL35, CR.COL36, CR.COL37, 
                  CR.COL38, CR.COL39, CR.COL40
                );
                
                -- 2. Fiecare rapoart importat se insereaza in tabela DATA_ALL_PRIMIT
                INSERT INTO USER_EREPORTING.DATA_ALL_PRIMIT
                (
                  PERIOADA,
                  FORM,
                  FORM_VERS,
                  CUIIO,
                  CUIIO_VERS,
                  ID_MD,
                  DATA_REG,
                  ID_USER,
                  T_XML_FORM_ID,
                  ID_SCHEMA,
                  COL1, COL2, COL3, COL4, COL5, COL6, COL7, COL8,
                  COL9, COL10, COL11, COL12, COL13, COL14, COL15,
                  COL31, COL32, COL33, COL34, COL35, COL36, COL37, COL38, 
                  COL39, COL40
                )
                VALUES
                (
                  CR.PERIOADA,
                  CR.FORM,
                  CR.FORM_VERS,
                  CR.CUIIO,
                  CR.CUIIO_VERS,
                  CR.ID_MD,
                  CR.DATA_REG,
                  CR.ID_USER,
                  CR.T_XML_FORM_ID,
                  CR.ID_SCHEMA,
                  CR.COL1, CR.COL2, CR.COL3, CR.COL4, CR.COL5, CR.COL6, CR.COL7, CR.COL8,
                  CR.COL9, CR.COL10, CR.COL11, CR.COL12, CR.COL13, CR.COL14, CR.COL15, 
                  CR.COL31, CR.COL32, CR.COL33, CR.COL34, CR.COL35, CR.COL36, CR.COL37, 
                  CR.COL38, CR.COL39, CR.COL40
                );
                -- 3. Fiecare rapoart importat se sterge din tabela DATA_ALL
                DELETE FROM USER_EREPORTING.DATA_ALL
                WHERE
                  PERIOADA = CR.PERIOADA
                  AND FORM = CR.FORM
                  AND CUIIO = CR.CUIIO
                  AND ID_MD <> -1 -- Nu sterge rinduri gresite
                ;
            END IF;
            
            IF CR.FORM IN (8) AND ((vCURRENT_MONTH IN (1,2,3,4,5) AND vCURRENT_DAY <= 31) OR (vCURRENT_MONTH IN (6) AND vCURRENT_DAY <= 16)) THEN -- 2-INV-ANUAL
            
                -- 0. Sterge rapoartele daca exista in CIS2.DATA_ALL
                DELETE FROM CIS2.DATA_ALL
                WHERE
                  PERIOADA=CR.PERIOADA AND FORM=CR.FORM AND CUIIO=CR.CUIIO AND ID_MD=CR.ID_MD;
                
                -- 0. Sterge rapoartele daca exista in CIS2.CONTROL
                DELETE FROM CIS2.CONTROL
                WHERE
                  PERIOADA=CR.PERIOADA AND FORM=CR.FORM AND CUIIO=CR.CUIIO;
                  
                -- 1. Se insereaza rapoarte noi in CIS2
                INSERT INTO CIS2.DATA_ALL
                (
                  PERIOADA,
                  FORM,
                  FORM_VERS,
                  CUIIO,
                  CUIIO_VERS,
                  ID_MD,
                  DATA_REG,
                  ID_USER,
                  COL1, COL2, COL3, COL4, COL5, COL6, COL7, COL8,
                  COL9, COL10, COL11, COL12, COL13, COL14, COL15
                )
                VALUES
                (
                  CR.PERIOADA,
                  CR.FORM,
                  CR.FORM_VERS,
                  CR.CUIIO,
                  CR.CUIIO_VERS,
                  CR.ID_MD,
                  CR.DATA_REG,
                  CR.ID_USER,
                  CR.COL1, CR.COL2, CR.COL3, CR.COL4, CR.COL5, CR.COL6, CR.COL7, CR.COL8,
                  CR.COL9, CR.COL10, CR.COL11, CR.COL12, CR.COL13, CR.COL14, CR.COL15
                );
                
                -- 2. Fiecare rapoart importat se insereaza in tabela DATA_ALL_PRIMIT
                INSERT INTO USER_EREPORTING.DATA_ALL_PRIMIT
                (
                  PERIOADA,
                  FORM,
                  FORM_VERS,
                  CUIIO,
                  CUIIO_VERS,
                  ID_MD,
                  DATA_REG,
                  ID_USER,
                  T_XML_FORM_ID,
                  ID_SCHEMA,
                  COL1, COL2, COL3, COL4, COL5, COL6, COL7, COL8,
                  COL9, COL10, COL11, COL12, COL13, COL14, COL15
                )
                VALUES
                (
                  CR.PERIOADA,
                  CR.FORM,
                  CR.FORM_VERS,
                  CR.CUIIO,
                  CR.CUIIO_VERS,
                  CR.ID_MD,
                  CR.DATA_REG,
                  CR.ID_USER,
                  CR.T_XML_FORM_ID,
                  CR.ID_SCHEMA,
                  CR.COL1, CR.COL2, CR.COL3, CR.COL4, CR.COL5, CR.COL6, CR.COL7, CR.COL8,
                  CR.COL9, CR.COL10, CR.COL11, CR.COL12, CR.COL13, CR.COL14, CR.COL15
                );
                -- 3. Fiecare rapoart importat se sterge din tabela DATA_ALL
                DELETE FROM USER_EREPORTING.DATA_ALL
                WHERE
                  PERIOADA = CR.PERIOADA
                  AND FORM = CR.FORM
                  AND CUIIO = CR.CUIIO
                  AND ID_MD <> -1 -- Nu sterge rinduri gresite
                ;
            END IF;
            
            IF CR.FORM IN (20) AND (vCURRENT_MONTH IN (1) AND vCURRENT_DAY <= 31 OR (vCURRENT_MONTH IN (2) AND vCURRENT_DAY <= 15))  THEN -- 1-A-SC
            
                -- 0. Sterge rapoartele daca exista in CIS2.DATA_ALL
                DELETE FROM CIS2.DATA_ALL
                WHERE
                  PERIOADA=CR.PERIOADA AND FORM=CR.FORM AND CUIIO=CR.CUIIO AND ID_MD=CR.ID_MD;
                
                -- 0. Sterge rapoartele daca exista in CIS2.CONTROL
                DELETE FROM CIS2.CONTROL
                WHERE
                  PERIOADA=CR.PERIOADA AND FORM=CR.FORM AND CUIIO=CR.CUIIO;
                  
                -- 1. Se insereaza rapoarte noi in CIS2
                INSERT INTO CIS2.DATA_ALL
                (
                  PERIOADA,
                  FORM,
                  FORM_VERS,
                  CUIIO,
                  CUIIO_VERS,
                  ID_MD,
                  DATA_REG,
                  ID_USER,
                  COL1, COL2, COL3, COL4, COL5, COL6, COL7, COL8,
                  COL9, COL10, COL11, COL12, COL13, COL14, COL15
                )
                VALUES
                (
                  CR.PERIOADA,
                  CR.FORM,
                  CR.FORM_VERS,
                  CR.CUIIO,
                  CR.CUIIO_VERS,
                  CR.ID_MD,
                  CR.DATA_REG,
                  CR.ID_USER,
                  CR.COL1, CR.COL2, CR.COL3, CR.COL4, CR.COL5, CR.COL6, CR.COL7, CR.COL8,
                  CR.COL9, CR.COL10, CR.COL11, CR.COL12, CR.COL13, CR.COL14, CR.COL15
                );
                
                -- 2. Fiecare rapoart importat se insereaza in tabela DATA_ALL_PRIMIT
                INSERT INTO USER_EREPORTING.DATA_ALL_PRIMIT
                (
                  PERIOADA,
                  FORM,
                  FORM_VERS,
                  CUIIO,
                  CUIIO_VERS,
                  ID_MD,
                  DATA_REG,
                  ID_USER,
                  T_XML_FORM_ID,
                  ID_SCHEMA,
                  COL1, COL2, COL3, COL4, COL5, COL6, COL7, COL8,
                  COL9, COL10, COL11, COL12, COL13, COL14, COL15
                )
                VALUES
                (
                  CR.PERIOADA,
                  CR.FORM,
                  CR.FORM_VERS,
                  CR.CUIIO,
                  CR.CUIIO_VERS,
                  CR.ID_MD,
                  CR.DATA_REG,
                  CR.ID_USER,
                  CR.T_XML_FORM_ID,
                  CR.ID_SCHEMA,
                  CR.COL1, CR.COL2, CR.COL3, CR.COL4, CR.COL5, CR.COL6, CR.COL7, CR.COL8,
                  CR.COL9, CR.COL10, CR.COL11, CR.COL12, CR.COL13, CR.COL14, CR.COL15
                );
                
                -- 3. Fiecare rapoart importat se sterge din tabela DATA_ALL
                DELETE FROM USER_EREPORTING.DATA_ALL
                WHERE
                  PERIOADA = CR.PERIOADA
                  AND FORM = CR.FORM
                  AND CUIIO = CR.CUIIO
                  AND ID_MD <> -1 -- Nu sterge rinduri gresite
                ;
            END IF;
            
            IF CR.FORM IN (21) AND (vCURRENT_MONTH IN (1,2,3,4) AND vCURRENT_DAY <= 31) THEN -- 3-COMERT
            
                -- 0. Sterge rapoartele daca exista in CIS2.DATA_ALL
                DELETE FROM CIS2.DATA_ALL
                WHERE
                  PERIOADA=CR.PERIOADA AND FORM=CR.FORM AND CUIIO=CR.CUIIO AND ID_MD=CR.ID_MD;
                
                -- 0. Sterge rapoartele daca exista in CIS2.CONTROL
                DELETE FROM CIS2.CONTROL
                WHERE
                  PERIOADA=CR.PERIOADA AND FORM=CR.FORM AND CUIIO=CR.CUIIO;
                  
                -- 1. Se insereaza rapoarte noi in CIS2
                INSERT INTO CIS2.DATA_ALL
                (
                  PERIOADA,
                  FORM,
                  FORM_VERS,
                  CUIIO,
                  CUIIO_VERS,
                  ID_MD,
                  DATA_REG,
                  ID_USER,
                  COL1, COL2, COL3, COL4, COL5, COL6, COL7, COL8,
                  COL9, COL10, COL11, COL12, COL13, COL14, COL15
                )
                VALUES
                (
                  CR.PERIOADA,
                  CR.FORM,
                  CR.FORM_VERS,
                  CR.CUIIO,
                  CR.CUIIO_VERS,
                  CR.ID_MD,
                  CR.DATA_REG,
                  CR.ID_USER,
                  CR.COL1, CR.COL2, CR.COL3, CR.COL4, CR.COL5, CR.COL6, CR.COL7, CR.COL8,
                  CR.COL9, CR.COL10, CR.COL11, CR.COL12, CR.COL13, CR.COL14, CR.COL15
                );
                
                -- 2. Fiecare rapoart importat se insereaza in tabela DATA_ALL_PRIMIT
                INSERT INTO USER_EREPORTING.DATA_ALL_PRIMIT
                (
                  PERIOADA,
                  FORM,
                  FORM_VERS,
                  CUIIO,
                  CUIIO_VERS,
                  ID_MD,
                  DATA_REG,
                  ID_USER,
                  T_XML_FORM_ID,
                  ID_SCHEMA,
                  COL1, COL2, COL3, COL4, COL5, COL6, COL7, COL8,
                  COL9, COL10, COL11, COL12, COL13, COL14, COL15
                )
                VALUES
                (
                  CR.PERIOADA,
                  CR.FORM,
                  CR.FORM_VERS,
                  CR.CUIIO,
                  CR.CUIIO_VERS,
                  CR.ID_MD,
                  CR.DATA_REG,
                  CR.ID_USER,
                  CR.T_XML_FORM_ID,
                  CR.ID_SCHEMA,
                  CR.COL1, CR.COL2, CR.COL3, CR.COL4, CR.COL5, CR.COL6, CR.COL7, CR.COL8,
                  CR.COL9, CR.COL10, CR.COL11, CR.COL12, CR.COL13, CR.COL14, CR.COL15
                );
                
                -- 3. Fiecare rapoart importat se sterge din tabela DATA_ALL
                DELETE FROM USER_EREPORTING.DATA_ALL
                WHERE
                  PERIOADA = CR.PERIOADA
                  AND FORM = CR.FORM
                  AND CUIIO = CR.CUIIO
                  AND ID_MD <> -1 -- Nu sterge rinduri gresite
                ;
            END IF;
            
            IF CR.FORM IN (2) AND (vCURRENT_MONTH IN (1,2,3,4) AND vCURRENT_DAY <= 31) THEN -- 1-INF
            
                -- 0. Sterge rapoartele daca exista in CIS2.DATA_ALL
                DELETE FROM CIS2.DATA_ALL
                WHERE
                  PERIOADA=CR.PERIOADA AND FORM=CR.FORM AND CUIIO=CR.CUIIO AND ID_MD=CR.ID_MD;
                
                -- 0. Sterge rapoartele daca exista in CIS2.CONTROL
                DELETE FROM CIS2.CONTROL
                WHERE
                  PERIOADA=CR.PERIOADA AND FORM=CR.FORM AND CUIIO=CR.CUIIO;
                  
                -- 1. Se insereaza rapoarte noi in CIS2
                INSERT INTO CIS2.DATA_ALL
                (
                  PERIOADA,
                  FORM,
                  FORM_VERS,
                  CUIIO,
                  CUIIO_VERS,
                  ID_MD,
                  DATA_REG,
                  ID_USER,
                  COL1, COL2, COL3, COL4, COL5, COL6, COL7, COL8,
                  COL9, COL10, COL11, COL12, COL13, COL14, COL15
                )
                VALUES
                (
                  CR.PERIOADA,
                  CR.FORM,
                  CR.FORM_VERS,
                  CR.CUIIO,
                  CR.CUIIO_VERS,
                  CR.ID_MD,
                  CR.DATA_REG,
                  CR.ID_USER,
                  CR.COL1, CR.COL2, CR.COL3, CR.COL4, CR.COL5, CR.COL6, CR.COL7, CR.COL8,
                  CR.COL9, CR.COL10, CR.COL11, CR.COL12, CR.COL13, CR.COL14, CR.COL15
                );
                
                -- 2. Fiecare rapoart importat se insereaza in tabela DATA_ALL_PRIMIT
                INSERT INTO USER_EREPORTING.DATA_ALL_PRIMIT
                (
                  PERIOADA,
                  FORM,
                  FORM_VERS,
                  CUIIO,
                  CUIIO_VERS,
                  ID_MD,
                  DATA_REG,
                  ID_USER,
                  T_XML_FORM_ID,
                  ID_SCHEMA,
                  COL1, COL2, COL3, COL4, COL5, COL6, COL7, COL8,
                  COL9, COL10, COL11, COL12, COL13, COL14, COL15
                )
                VALUES
                (
                  CR.PERIOADA,
                  CR.FORM,
                  CR.FORM_VERS,
                  CR.CUIIO,
                  CR.CUIIO_VERS,
                  CR.ID_MD,
                  CR.DATA_REG,
                  CR.ID_USER,
                  CR.T_XML_FORM_ID,
                  CR.ID_SCHEMA,
                  CR.COL1, CR.COL2, CR.COL3, CR.COL4, CR.COL5, CR.COL6, CR.COL7, CR.COL8,
                  CR.COL9, CR.COL10, CR.COL11, CR.COL12, CR.COL13, CR.COL14, CR.COL15
                );
                
                -- 3. Fiecare rapoart importat se sterge din tabela DATA_ALL
                DELETE FROM USER_EREPORTING.DATA_ALL
                WHERE
                  PERIOADA = CR.PERIOADA
                  AND FORM = CR.FORM
                  AND CUIIO = CR.CUIIO
                  AND ID_MD <> -1 -- Nu sterge rinduri gresite
                ;
            END IF;
            
            IF CR.FORM IN (12) AND (vCURRENT_MONTH IN (1,2,3,4) AND vCURRENT_DAY <= 31 OR (vCURRENT_MONTH IN (5) AND vCURRENT_DAY <= 5)) THEN -- 1-CC
            
                -- 0. Sterge rapoartele daca exista in CIS2.DATA_ALL
                DELETE FROM CIS2.DATA_ALL
                WHERE
                  PERIOADA=CR.PERIOADA AND FORM=CR.FORM AND CUIIO=CR.CUIIO AND ID_MD=CR.ID_MD;
                
                -- 0. Sterge rapoartele daca exista in CIS2.CONTROL
                DELETE FROM CIS2.CONTROL
                WHERE
                  PERIOADA=CR.PERIOADA AND FORM=CR.FORM AND CUIIO=CR.CUIIO;
                  
                -- 1. Se insereaza rapoarte noi in CIS2
                INSERT INTO CIS2.DATA_ALL
                (
                  PERIOADA,
                  FORM,
                  FORM_VERS,
                  CUIIO,
                  CUIIO_VERS,
                  ID_MD,
                  DATA_REG,
                  ID_USER,
                  COL1, COL2, COL3, COL4, COL5, COL6, COL7, COL8,
                  COL9, COL10, COL11, COL12, COL13, COL14, COL15
                )
                VALUES
                (
                  CR.PERIOADA,
                  CR.FORM,
                  CR.FORM_VERS,
                  CR.CUIIO,
                  CR.CUIIO_VERS,
                  CR.ID_MD,
                  CR.DATA_REG,
                  CR.ID_USER,
                  CR.COL1, CR.COL2, CR.COL3, CR.COL4, CR.COL5, CR.COL6, CR.COL7, CR.COL8,
                  CR.COL9, CR.COL10, CR.COL11, CR.COL12, CR.COL13, CR.COL14, CR.COL15
                );
                
                -- 2. Fiecare rapoart importat se insereaza in tabela DATA_ALL_PRIMIT
                INSERT INTO USER_EREPORTING.DATA_ALL_PRIMIT
                (
                  PERIOADA,
                  FORM,
                  FORM_VERS,
                  CUIIO,
                  CUIIO_VERS,
                  ID_MD,
                  DATA_REG,
                  ID_USER,
                  T_XML_FORM_ID,
                  ID_SCHEMA,
                  COL1, COL2, COL3, COL4, COL5, COL6, COL7, COL8,
                  COL9, COL10, COL11, COL12, COL13, COL14, COL15
                )
                VALUES
                (
                  CR.PERIOADA,
                  CR.FORM,
                  CR.FORM_VERS,
                  CR.CUIIO,
                  CR.CUIIO_VERS,
                  CR.ID_MD,
                  CR.DATA_REG,
                  CR.ID_USER,
                  CR.T_XML_FORM_ID,
                  CR.ID_SCHEMA,
                  CR.COL1, CR.COL2, CR.COL3, CR.COL4, CR.COL5, CR.COL6, CR.COL7, CR.COL8,
                  CR.COL9, CR.COL10, CR.COL11, CR.COL12, CR.COL13, CR.COL14, CR.COL15
                );
                
                -- 3. Fiecare rapoart importat se sterge din tabela DATA_ALL
                DELETE FROM USER_EREPORTING.DATA_ALL
                WHERE
                  PERIOADA = CR.PERIOADA
                  AND FORM = CR.FORM
                  AND CUIIO = CR.CUIIO
                  AND ID_MD <> -1 -- Nu sterge rinduri gresite
                ;
            END IF;
            
            IF CR.FORM IN (4) AND vCURRENT_MONTH IN (1,2,3) AND vCURRENT_DAY <= 31  THEN -- 1-TR(auto)
            
                -- 0. Sterge rapoartele daca exista in CIS2.DATA_ALL
                DELETE FROM CIS2.DATA_ALL
                WHERE
                  PERIOADA=CR.PERIOADA AND FORM=CR.FORM AND CUIIO=CR.CUIIO AND ID_MD=CR.ID_MD;
                
                -- 0. Sterge rapoartele daca exista in CIS2.CONTROL
                DELETE FROM CIS2.CONTROL
                WHERE
                  PERIOADA=CR.PERIOADA AND FORM=CR.FORM AND CUIIO=CR.CUIIO;
                  
                -- 1. Se insereaza rapoarte noi in CIS2
                INSERT INTO CIS2.DATA_ALL
                (
                  PERIOADA,
                  FORM,
                  FORM_VERS,
                  CUIIO,
                  CUIIO_VERS,
                  ID_MD,
                  DATA_REG,
                  ID_USER,
                  COL1, COL2, COL3, COL4, COL5, COL6, COL7, COL8,
                  COL9, COL10, COL11, COL12, COL13, COL14, COL15
                )
                VALUES
                (
                  CR.PERIOADA,
                  CR.FORM,
                  CR.FORM_VERS,
                  CR.CUIIO,
                  CR.CUIIO_VERS,
                  CR.ID_MD,
                  CR.DATA_REG,
                  CR.ID_USER,
                  CR.COL1, CR.COL2, CR.COL3, CR.COL4, CR.COL5, CR.COL6, CR.COL7, CR.COL8,
                  CR.COL9, CR.COL10, CR.COL11, CR.COL12, CR.COL13, CR.COL14, CR.COL15
                );
                
                -- 2. Fiecare rapoart importat se insereaza in tabela DATA_ALL_PRIMIT
                INSERT INTO USER_EREPORTING.DATA_ALL_PRIMIT
                (
                  PERIOADA,
                  FORM,
                  FORM_VERS,
                  CUIIO,
                  CUIIO_VERS,
                  ID_MD,
                  DATA_REG,
                  ID_USER,
                  T_XML_FORM_ID,
                  ID_SCHEMA,
                  COL1, COL2, COL3, COL4, COL5, COL6, COL7, COL8,
                  COL9, COL10, COL11, COL12, COL13, COL14, COL15
                )
                VALUES
                (
                  CR.PERIOADA,
                  CR.FORM,
                  CR.FORM_VERS,
                  CR.CUIIO,
                  CR.CUIIO_VERS,
                  CR.ID_MD,
                  CR.DATA_REG,
                  CR.ID_USER,
                  CR.T_XML_FORM_ID,
                  CR.ID_SCHEMA,
                  CR.COL1, CR.COL2, CR.COL3, CR.COL4, CR.COL5, CR.COL6, CR.COL7, CR.COL8,
                  CR.COL9, CR.COL10, CR.COL11, CR.COL12, CR.COL13, CR.COL14, CR.COL15
                );
                
                -- 3. Fiecare rapoart importat se sterge din tabela DATA_ALL
                DELETE FROM USER_EREPORTING.DATA_ALL
                WHERE
                  PERIOADA = CR.PERIOADA
                  AND FORM = CR.FORM
                  AND CUIIO = CR.CUIIO
                  AND ID_MD <> -1 -- Nu sterge rinduri gresite
                ;
            END IF;
            
            
            IF CR.FORM IN (16) AND (vCURRENT_MONTH IN (1,2) AND vCURRENT_DAY <= 31 OR (vCURRENT_MONTH IN (3) AND vCURRENT_DAY <= 25))  THEN -- FORPRO
            
                -- 0. Sterge rapoartele daca exista in CIS2.DATA_ALL
                DELETE FROM CIS2.DATA_ALL
                WHERE
                  PERIOADA=CR.PERIOADA AND FORM=CR.FORM AND CUIIO=CR.CUIIO AND ID_MD=CR.ID_MD AND FILIAL=CR.FORPRO_FILIAL;
                
                -- 0. Sterge rapoartele daca exista in CIS2.CONTROL
                DELETE FROM CIS2.CONTROL
                WHERE
                  PERIOADA=CR.PERIOADA AND FORM=CR.FORM AND CUIIO=CR.CUIIO;
                  
                -- 1. Se insereaza rapoarte noi in CIS2
                INSERT INTO CIS2.DATA_ALL
                (
                  PERIOADA,
                  FORM,
                  FORM_VERS,
                  CUIIO,
                  CUIIO_VERS,
                  ID_MD,
                  DATA_REG,
                  ID_USER,
                  FILIAL,
                  COL1, COL2, COL3, COL4, COL5, COL6, COL7, COL8,
                  COL9, COL10, COL11, COL12, COL13, COL14, COL15
                )
                VALUES
                (
                  CR.PERIOADA,
                  CR.FORM,
                  CR.FORM_VERS,
                  CR.CUIIO,
                  CR.CUIIO_VERS,
                  CR.ID_MD,
                  CR.DATA_REG,
                  CR.ID_USER,
                  CR.FORPRO_FILIAL,
                  CR.COL1, CR.COL2, CR.COL3, CR.COL4, CR.COL5, CR.COL6, CR.COL7, CR.COL8,
                  CR.COL9, CR.COL10, CR.COL11, CR.COL12, CR.COL13, CR.COL14, CR.COL15
                );
                
                -- 2. Fiecare rapoart importat se insereaza in tabela DATA_ALL_PRIMIT
                INSERT INTO USER_EREPORTING.DATA_ALL_PRIMIT
                (
                  PERIOADA,
                  FORM,
                  FORM_VERS,
                  CUIIO,
                  CUIIO_VERS,
                  ID_MD,
                  DATA_REG,
                  ID_USER,
                  T_XML_FORM_ID,
                  ID_SCHEMA,
                  FILIAL,
                  COL1, COL2, COL3, COL4, COL5, COL6, COL7, COL8,
                  COL9, COL10, COL11, COL12, COL13, COL14, COL15
                )
                VALUES
                (
                  CR.PERIOADA,
                  CR.FORM,
                  CR.FORM_VERS,
                  CR.CUIIO,
                  CR.CUIIO_VERS,
                  CR.ID_MD,
                  CR.DATA_REG,
                  CR.ID_USER,
                  CR.T_XML_FORM_ID,
                  CR.ID_SCHEMA,
                  CR.FILIAL,
                  CR.COL1, CR.COL2, CR.COL3, CR.COL4, CR.COL5, CR.COL6, CR.COL7, CR.COL8,
                  CR.COL9, CR.COL10, CR.COL11, CR.COL12, CR.COL13, CR.COL14, CR.COL15
                );
                
                -- 3. Fiecare rapoart importat se sterge din tabela DATA_ALL
                DELETE FROM USER_EREPORTING.DATA_ALL
                WHERE
                  PERIOADA = CR.PERIOADA
                  AND FORM = CR.FORM
                  AND CUIIO = CR.CUIIO
                  AND ID_MD <> -1 -- Nu sterge rinduri gresite
                ;
            END IF;
            
            IF CR.FORM IN (48) AND ((vCURRENT_MONTH IN (3,4,5,6,7,8) AND vCURRENT_DAY <= 31) OR (vCURRENT_MONTH IN (9) AND vCURRENT_DAY <= 4 ) )  THEN -- 1-INOV
            
                -- 0. Sterge rapoartele daca exista in CIS2.DATA_ALL
                DELETE FROM CIS2.DATA_ALL
                WHERE
                  PERIOADA=CR.PERIOADA AND FORM=CR.FORM AND CUIIO=CR.CUIIO AND ID_MD=CR.ID_MD AND FILIAL=CR.FORPRO_FILIAL;
                
                -- 0. Sterge rapoartele daca exista in CIS2.CONTROL
                DELETE FROM CIS2.CONTROL
                WHERE
                  PERIOADA=CR.PERIOADA AND FORM=CR.FORM AND CUIIO=CR.CUIIO;
                  
                -- 1. Se insereaza rapoarte noi in CIS2
                INSERT INTO CIS2.DATA_ALL
                (
                  PERIOADA,
                  FORM,
                  FORM_VERS,
                  CUIIO,
                  CUIIO_VERS,
                  ID_MD,
                  DATA_REG,
                  ID_USER,
                  FILIAL,
                  COL1, COL2, COL3, COL4, COL5, COL6, COL7, COL8,
                  COL9, COL10, COL11, COL12, COL13, COL14, COL15
                )
                VALUES
                (
                  CR.PERIOADA,
                  CR.FORM,
                  CR.FORM_VERS,
                  CR.CUIIO,
                  CR.CUIIO_VERS,
                  CR.ID_MD,
                  CR.DATA_REG,
                  CR.ID_USER,
                  CR.FORPRO_FILIAL,
                  CR.COL1, CR.COL2, CR.COL3, CR.COL4, CR.COL5, CR.COL6, CR.COL7, CR.COL8,
                  CR.COL9, CR.COL10, CR.COL11, CR.COL12, CR.COL13, CR.COL14, CR.COL15
                );
                
                -- 2. Fiecare rapoart importat se insereaza in tabela DATA_ALL_PRIMIT
                INSERT INTO USER_EREPORTING.DATA_ALL_PRIMIT
                (
                  PERIOADA,
                  FORM,
                  FORM_VERS,
                  CUIIO,
                  CUIIO_VERS,
                  ID_MD,
                  DATA_REG,
                  ID_USER,
                  T_XML_FORM_ID,
                  ID_SCHEMA,
                  FILIAL,
                  COL1, COL2, COL3, COL4, COL5, COL6, COL7, COL8,
                  COL9, COL10, COL11, COL12, COL13, COL14, COL15
                )
                VALUES
                (
                  CR.PERIOADA,
                  CR.FORM,
                  CR.FORM_VERS,
                  CR.CUIIO,
                  CR.CUIIO_VERS,
                  CR.ID_MD,
                  CR.DATA_REG,
                  CR.ID_USER,
                  CR.T_XML_FORM_ID,
                  CR.ID_SCHEMA,
                  CR.FILIAL,
                  CR.COL1, CR.COL2, CR.COL3, CR.COL4, CR.COL5, CR.COL6, CR.COL7, CR.COL8,
                  CR.COL9, CR.COL10, CR.COL11, CR.COL12, CR.COL13, CR.COL14, CR.COL15
                );
                
                -- 3. Fiecare rapoart importat se sterge din tabela DATA_ALL
                DELETE FROM USER_EREPORTING.DATA_ALL
                WHERE
                  PERIOADA = CR.PERIOADA
                  AND FORM = CR.FORM
                  AND CUIIO = CR.CUIIO
                  AND ID_MD <> -1 -- Nu sterge rinduri gresite
                ;
            END IF;
            
            IF CR.FORM IN (3) AND ((vCURRENT_MONTH IN (1,2,3,4) AND vCURRENT_DAY <= 31) /* OR (vCURRENT_MONTH IN (5) AND vCURRENT_DAY <= 20 )*/) THEN -- MUNCA3
            
                -- 0. Sterge rapoartele daca exista in CIS2.DATA_ALL
                DELETE FROM CIS2.DATA_ALL
                WHERE
                  PERIOADA=CR.PERIOADA AND FORM=CR.FORM AND CUIIO=CR.CUIIO AND ID_MD=CR.ID_MD AND FILIAL=CR.MUNCA3_FILIAL;
                
                -- 0. Sterge rapoartele daca exista in CIS2.CONTROL
                DELETE FROM CIS2.CONTROL
                WHERE
                  PERIOADA=CR.PERIOADA AND FORM=CR.FORM AND CUIIO=CR.CUIIO;
                  
                -- 1. Se insereaza rapoarte noi in CIS2
                INSERT INTO CIS2.DATA_ALL
                (
                  PERIOADA,
                  FORM,
                  FORM_VERS,
                  CUIIO,
                  CUIIO_VERS,
                  ID_MD,
                  DATA_REG,
                  ID_USER,
                  FILIAL,
                  COL1, COL2, COL3, COL4, COL5, COL6, COL7, COL8,
                  COL9, COL10, COL11, COL12, COL13, COL14, COL15
                )
                VALUES
                (
                  CR.PERIOADA,
                  CR.FORM,
                  CR.FORM_VERS,
                  CR.CUIIO,
                  CR.CUIIO_VERS,
                  CR.ID_MD,
                  CR.DATA_REG,
                  CR.ID_USER,
                  CR.MUNCA3_FILIAL,
                  CR.COL1, CR.COL2, CR.COL3, CR.COL4, CR.COL5, CR.COL6, CR.COL7, CR.COL8,
                  CR.COL9, CR.COL10, CR.COL11, CR.COL12, CR.COL13, CR.COL14, CR.COL15
                );
                
                -- 2. Fiecare rapoart importat se insereaza in tabela DATA_ALL_PRIMIT
                INSERT INTO USER_EREPORTING.DATA_ALL_PRIMIT
                (
                  PERIOADA,
                  FORM,
                  FORM_VERS,
                  CUIIO,
                  CUIIO_VERS,
                  ID_MD,
                  DATA_REG,
                  ID_USER,
                  T_XML_FORM_ID,
                  ID_SCHEMA,
                  FILIAL,
                  COL1, COL2, COL3, COL4, COL5, COL6, COL7, COL8,
                  COL9, COL10, COL11, COL12, COL13, COL14, COL15
                )
                VALUES
                (
                  CR.PERIOADA,
                  CR.FORM,
                  CR.FORM_VERS,
                  CR.CUIIO,
                  CR.CUIIO_VERS,
                  CR.ID_MD,
                  CR.DATA_REG,
                  CR.ID_USER,
                  CR.T_XML_FORM_ID,
                  CR.ID_SCHEMA,
                  CR.FILIAL,
                  CR.COL1, CR.COL2, CR.COL3, CR.COL4, CR.COL5, CR.COL6, CR.COL7, CR.COL8,
                  CR.COL9, CR.COL10, CR.COL11, CR.COL12, CR.COL13, CR.COL14, CR.COL15
                );
                
                -- 3. Fiecare rapoart importat se sterge din tabela DATA_ALL
                DELETE FROM USER_EREPORTING.DATA_ALL
                WHERE
                  PERIOADA = CR.PERIOADA
                  AND FORM = CR.FORM
                  AND CUIIO = CR.CUIIO
                  AND ID_MD <> -1 -- Nu sterge rinduri gresite
                ;
            END IF;
            
            IF CR.FORM IN (56) AND ((vCURRENT_MONTH IN (9,10,11) AND vCURRENT_DAY <= 31) ) THEN -- DMA
            
                -- 0. Sterge rapoartele daca exista in CIS2.DATA_ALL
                DELETE FROM CIS2.DATA_ALL
                WHERE
                  PERIOADA=CR.PERIOADA AND FORM=CR.FORM AND CUIIO=CR.CUIIO AND ID_MD=CR.ID_MD;
                
                -- 0. Sterge rapoartele daca exista in CIS2.CONTROL
                DELETE FROM CIS2.CONTROL
                WHERE
                  PERIOADA=CR.PERIOADA AND FORM=CR.FORM AND CUIIO=CR.CUIIO;
                  
                -- 1. Se insereaza rapoarte noi in CIS2
                INSERT INTO CIS2.DATA_ALL
                (
                  PERIOADA,
                  FORM,
                  FORM_VERS,
                  CUIIO,
                  CUIIO_VERS,
                  ID_MD,
                  DATA_REG,
                  ID_USER,
                  FILIAL,
                  COL1, COL2, COL3, COL4, COL5, COL6, COL7, COL8,
                  COL9, COL10, COL11, COL12, COL13, COL14, COL15,
                  COL31, COL32, COL33, COL34, COL35, COL36
                )
                VALUES
                (
                  CR.PERIOADA,
                  CR.FORM,
                  CR.FORM_VERS,
                  CR.CUIIO,
                  CR.CUIIO_VERS,
                  CR.ID_MD,
                  CR.DATA_REG,
                  CR.ID_USER,
                  CR.MUNCA3_FILIAL,
                  CR.COL1, CR.COL2, CR.COL3, CR.COL4, CR.COL5, CR.COL6, CR.COL7, CR.COL8,
                  CR.COL9, CR.COL10, CR.COL11, CR.COL12, CR.COL13, CR.COL14, CR.COL15,
                  CR.COL31,  CR.COL32,  CR.COL33,  CR.COL34,  CR.COL35,  CR.COL36
                );
                
                -- 2. Fiecare rapoart importat se insereaza in tabela DATA_ALL_PRIMIT
                INSERT INTO USER_EREPORTING.DATA_ALL_PRIMIT
                (
                  PERIOADA,
                  FORM,
                  FORM_VERS,
                  CUIIO,
                  CUIIO_VERS,
                  ID_MD,
                  DATA_REG,
                  ID_USER,
                  T_XML_FORM_ID,
                  ID_SCHEMA,
                  FILIAL,
                  COL1, COL2, COL3, COL4, COL5, COL6, COL7, COL8,
                  COL9, COL10, COL11, COL12, COL13, COL14, COL15,
                  COL31, COL32, COL33, COL34, COL35, COL36
                )
                VALUES
                (
                  CR.PERIOADA,
                  CR.FORM,
                  CR.FORM_VERS,
                  CR.CUIIO,
                  CR.CUIIO_VERS,
                  CR.ID_MD,
                  CR.DATA_REG,
                  CR.ID_USER,
                  CR.T_XML_FORM_ID,
                  CR.ID_SCHEMA,
                  CR.FILIAL,
                  CR.COL1, CR.COL2, CR.COL3, CR.COL4, CR.COL5, CR.COL6, CR.COL7, CR.COL8,
                  CR.COL9, CR.COL10, CR.COL11, CR.COL12, CR.COL13, CR.COL14, CR.COL15,
                  CR.COL31,  CR.COL32,  CR.COL33,  CR.COL34,  CR.COL35,  CR.COL36
                );
                
                -- 3. Fiecare rapoart importat se sterge din tabela DATA_ALL
                DELETE FROM USER_EREPORTING.DATA_ALL
                WHERE
                  PERIOADA = CR.PERIOADA
                  AND FORM = CR.FORM
                  AND CUIIO = CR.CUIIO
                  AND ID_MD <> -1 -- Nu sterge rinduri gresite
                ;
            END IF;
            
            IF CR.FORM IN (67) AND ((vCURRENT_MONTH IN (1,2,3,4,5,6) AND vCURRENT_DAY <= 31) ) THEN -- 1-INVEST-ANUAL
            
                -- 0. Sterge rapoartele daca exista in CIS2.DATA_ALL
                DELETE FROM CIS2.DATA_ALL
                WHERE
                  PERIOADA=CR.PERIOADA AND FORM=CR.FORM AND CUIIO=CR.CUIIO AND ID_MD=CR.ID_MD;
                
                -- 0. Sterge rapoartele daca exista in CIS2.CONTROL
                DELETE FROM CIS2.CONTROL
                WHERE
                  PERIOADA=CR.PERIOADA AND FORM=CR.FORM AND CUIIO=CR.CUIIO;
                  
                -- 1. Se insereaza rapoarte noi in CIS2
                INSERT INTO CIS2.DATA_ALL
                (
                  PERIOADA,
                  FORM,
                  FORM_VERS,
                  CUIIO,
                  CUIIO_VERS,
                  ID_MD,
                  DATA_REG,
                  ID_USER,
                  FILIAL,
                  COL1, COL2, COL3, COL4, COL5, COL6, COL7, COL8,
                  COL9, COL10, COL11, COL12, COL13, COL14, COL15,
                  COL31, COL32, COL33, COL34, COL35, COL36
                )
                VALUES
                (
                  CR.PERIOADA,
                  CR.FORM,
                  CR.FORM_VERS,
                  CR.CUIIO,
                  CR.CUIIO_VERS,
                  CR.ID_MD,
                  CR.DATA_REG,
                  CR.ID_USER,
                  CR.MUNCA3_FILIAL,
                  CR.COL1, CR.COL2, CR.COL3, CR.COL4, CR.COL5, CR.COL6, CR.COL7, CR.COL8,
                  CR.COL9, CR.COL10, CR.COL11, CR.COL12, CR.COL13, CR.COL14, CR.COL15,
                  CR.COL31,  CR.COL32,  CR.COL33,  CR.COL34,  CR.COL35,  CR.COL36
                );
                
                -- 2. Fiecare rapoart importat se insereaza in tabela DATA_ALL_PRIMIT
                INSERT INTO USER_EREPORTING.DATA_ALL_PRIMIT
                (
                  PERIOADA,
                  FORM,
                  FORM_VERS,
                  CUIIO,
                  CUIIO_VERS,
                  ID_MD,
                  DATA_REG,
                  ID_USER,
                  T_XML_FORM_ID,
                  ID_SCHEMA,
                  FILIAL,
                  COL1, COL2, COL3, COL4, COL5, COL6, COL7, COL8,
                  COL9, COL10, COL11, COL12, COL13, COL14, COL15,
                  COL31, COL32, COL33, COL34, COL35, COL36
                )
                VALUES
                (
                  CR.PERIOADA,
                  CR.FORM,
                  CR.FORM_VERS,
                  CR.CUIIO,
                  CR.CUIIO_VERS,
                  CR.ID_MD,
                  CR.DATA_REG,
                  CR.ID_USER,
                  CR.T_XML_FORM_ID,
                  CR.ID_SCHEMA,
                  CR.FILIAL,
                  CR.COL1, CR.COL2, CR.COL3, CR.COL4, CR.COL5, CR.COL6, CR.COL7, CR.COL8,
                  CR.COL9, CR.COL10, CR.COL11, CR.COL12, CR.COL13, CR.COL14, CR.COL15,
                  CR.COL31,  CR.COL32,  CR.COL33,  CR.COL34,  CR.COL35,  CR.COL36
                );
                
                -- 3. Fiecare rapoart importat se sterge din tabela DATA_ALL
                DELETE FROM USER_EREPORTING.DATA_ALL
                WHERE
                  PERIOADA = CR.PERIOADA
                  AND FORM = CR.FORM
                  AND CUIIO = CR.CUIIO
                  AND ID_MD <> -1 -- Nu sterge rinduri gresite
                ;
            END IF;
            
            IF CR.FORM IN (39) AND ((vCURRENT_MONTH IN (12) AND vCURRENT_DAY <= 30) ) THEN -- 9-AGR
            
                -- 0. Sterge rapoartele daca exista in CIS2.DATA_ALL
                DELETE FROM CIS2.DATA_ALL
                WHERE
                  PERIOADA=CR.PERIOADA AND FORM=CR.FORM AND CUIIO=CR.CUIIO AND ID_MD=CR.ID_MD;
                
                -- 0. Sterge rapoartele daca exista in CIS2.CONTROL
                DELETE FROM CIS2.CONTROL
                WHERE
                  PERIOADA=CR.PERIOADA AND FORM=CR.FORM AND CUIIO=CR.CUIIO;
                  
                -- 1. Se insereaza rapoarte noi in CIS2
                INSERT INTO CIS2.DATA_ALL
                (
                  PERIOADA,
                  FORM,
                  FORM_VERS,
                  CUIIO,
                  CUIIO_VERS,
                  ID_MD,
                  DATA_REG,
                  ID_USER,
                  FILIAL,
                  COL1, COL2, COL3, COL4, COL5, COL6, COL7, COL8
                )
                VALUES
                (
                  CR.PERIOADA,
                  CR.FORM,
                  CR.FORM_VERS,
                  CR.CUIIO,
                  CR.CUIIO_VERS,
                  CR.ID_MD,
                  CR.DATA_REG,
                  CR.ID_USER,
                  CR.MUNCA3_FILIAL,
                  CR.COL1, CR.COL2, CR.COL3, CR.COL4, CR.COL5, CR.COL6, CR.COL7, CR.COL8
                );
                
                -- 2. Fiecare rapoart importat se insereaza in tabela DATA_ALL_PRIMIT
                INSERT INTO USER_EREPORTING.DATA_ALL_PRIMIT
                (
                  PERIOADA,
                  FORM,
                  FORM_VERS,
                  CUIIO,
                  CUIIO_VERS,
                  ID_MD,
                  DATA_REG,
                  ID_USER,
                  T_XML_FORM_ID,
                  ID_SCHEMA,
                  FILIAL,
                  COL1, COL2, COL3, COL4, COL5, COL6, COL7, COL8
                )
                VALUES
                (
                  CR.PERIOADA,
                  CR.FORM,
                  CR.FORM_VERS,
                  CR.CUIIO,
                  CR.CUIIO_VERS,
                  CR.ID_MD,
                  CR.DATA_REG,
                  CR.ID_USER,
                  CR.T_XML_FORM_ID,
                  CR.ID_SCHEMA,
                  CR.FILIAL,
                  CR.COL1, CR.COL2, CR.COL3, CR.COL4, CR.COL5, CR.COL6, CR.COL7, CR.COL8
                );
                
                -- 3. Fiecare rapoart importat se sterge din tabela DATA_ALL
                DELETE FROM USER_EREPORTING.DATA_ALL
                WHERE
                  PERIOADA = CR.PERIOADA
                  AND FORM = CR.FORM
                  AND CUIIO = CR.CUIIO
                  AND ID_MD <> -1 -- Nu sterge rinduri gresite
                ;
            END IF;
            
            IF CR.FORM IN (71) AND ((vCURRENT_MONTH IN (1,2,3,4) AND vCURRENT_DAY <= 30) OR (vCURRENT_MONTH IN (5) AND vCURRENT_DAY <= 5 )) THEN -- 1-INF.rev/1-TIC
            
                -- 0. Sterge rapoartele daca exista in CIS2.DATA_ALL
                DELETE FROM CIS2.DATA_ALL
                WHERE
                  PERIOADA=CR.PERIOADA AND FORM=CR.FORM AND CUIIO=CR.CUIIO AND ID_MD=CR.ID_MD;
                
                -- 0. Sterge rapoartele daca exista in CIS2.CONTROL
                DELETE FROM CIS2.CONTROL
                WHERE
                  PERIOADA=CR.PERIOADA AND FORM=CR.FORM AND CUIIO=CR.CUIIO;
                  
                -- 1. Se insereaza rapoarte noi in CIS2
                INSERT INTO CIS2.DATA_ALL
                (
                  PERIOADA,
                  FORM,
                  FORM_VERS,
                  CUIIO,
                  CUIIO_VERS,
                  ID_MD,
                  DATA_REG,
                  ID_USER,
                  FILIAL,
                  COL1, COL2, COL3, COL4
                )
                VALUES
                (
                  CR.PERIOADA,
                  CR.FORM,
                  CR.FORM_VERS,
                  CR.CUIIO,
                  CR.CUIIO_VERS,
                  CR.ID_MD,
                  CR.DATA_REG,
                  CR.ID_USER,
                  CR.MUNCA3_FILIAL,
                  CR.COL1, CR.COL2, CR.COL3, CR.COL4
                );
                
                -- 2. Fiecare rapoart importat se insereaza in tabela DATA_ALL_PRIMIT
                INSERT INTO USER_EREPORTING.DATA_ALL_PRIMIT
                (
                  PERIOADA,
                  FORM,
                  FORM_VERS,
                  CUIIO,
                  CUIIO_VERS,
                  ID_MD,
                  DATA_REG,
                  ID_USER,
                  T_XML_FORM_ID,
                  ID_SCHEMA,
                  FILIAL,
                  COL1, COL2, COL3, COL4
                )
                VALUES
                (
                  CR.PERIOADA,
                  CR.FORM,
                  CR.FORM_VERS,
                  CR.CUIIO,
                  CR.CUIIO_VERS,
                  CR.ID_MD,
                  CR.DATA_REG,
                  CR.ID_USER,
                  CR.T_XML_FORM_ID,
                  CR.ID_SCHEMA,
                  CR.FILIAL,
                  CR.COL1, CR.COL2, CR.COL3, CR.COL4
                );
                
                -- 3. Fiecare rapoart importat se sterge din tabela DATA_ALL
                DELETE FROM USER_EREPORTING.DATA_ALL
                WHERE
                  PERIOADA = CR.PERIOADA
                  AND FORM = CR.FORM
                  AND CUIIO = CR.CUIIO
                  AND ID_MD <> -1 -- Nu sterge rinduri gresite
                ;
            END IF;
            
            IF CR.FORM IN (34) AND ((vCURRENT_MONTH IN (1,2,3,4) AND vCURRENT_DAY <= 30) OR (vCURRENT_MONTH IN (5) AND vCURRENT_DAY <= 15 ) ) THEN -- 14-AGR
            
                -- 0. Sterge rapoartele daca exista in CIS2.DATA_ALL
                DELETE FROM CIS2.DATA_ALL
                WHERE
                  PERIOADA=CR.PERIOADA AND FORM=CR.FORM AND CUIIO=CR.CUIIO AND ID_MD=CR.ID_MD;
                
                -- 0. Sterge rapoartele daca exista in CIS2.CONTROL
                DELETE FROM CIS2.CONTROL
                WHERE
                  PERIOADA=CR.PERIOADA AND FORM=CR.FORM AND CUIIO=CR.CUIIO;
                  
                -- 1. Se insereaza rapoarte noi in CIS2
                INSERT INTO CIS2.DATA_ALL
                (
                  PERIOADA,
                  FORM,
                  FORM_VERS,
                  CUIIO,
                  CUIIO_VERS,
                  ID_MD,
                  DATA_REG,
                  ID_USER,
                  FILIAL,
                  COL1, COL2, COL3, COL4, COL5
                )
                VALUES
                (
                  CR.PERIOADA,
                  CR.FORM,
                  CR.FORM_VERS,
                  CR.CUIIO,
                  CR.CUIIO_VERS,
                  CR.ID_MD,
                  CR.DATA_REG,
                  CR.ID_USER,
                  CR.MUNCA3_FILIAL,
                  CR.COL1, CR.COL2, CR.COL3, CR.COL4, CR.COL5
                );
                
                -- 2. Fiecare rapoart importat se insereaza in tabela DATA_ALL_PRIMIT
                INSERT INTO USER_EREPORTING.DATA_ALL_PRIMIT
                (
                  PERIOADA,
                  FORM,
                  FORM_VERS,
                  CUIIO,
                  CUIIO_VERS,
                  ID_MD,
                  DATA_REG,
                  ID_USER,
                  T_XML_FORM_ID,
                  ID_SCHEMA,
                  FILIAL,
                  COL1, COL2, COL3, COL4, COL5
                )
                VALUES
                (
                  CR.PERIOADA,
                  CR.FORM,
                  CR.FORM_VERS,
                  CR.CUIIO,
                  CR.CUIIO_VERS,
                  CR.ID_MD,
                  CR.DATA_REG,
                  CR.ID_USER,
                  CR.T_XML_FORM_ID,
                  CR.ID_SCHEMA,
                  CR.FILIAL,
                  CR.COL1, CR.COL2, CR.COL3, CR.COL4, CR.COL5
                );
                
                -- 3. Fiecare rapoart importat se sterge din tabela DATA_ALL
                DELETE FROM USER_EREPORTING.DATA_ALL
                WHERE
                  PERIOADA = CR.PERIOADA
                  AND FORM = CR.FORM
                  AND CUIIO = CR.CUIIO
                  AND ID_MD <> -1 -- Nu sterge rinduri gresite
                ;
            END IF;
            
            IF CR.FORM IN (35) AND ((vCURRENT_MONTH IN (1,2,3,4) AND vCURRENT_DAY <= 30)  OR (vCURRENT_MONTH IN (5) AND vCURRENT_DAY <= 15 )) THEN -- 15-AGR
            
                -- 0. Sterge rapoartele daca exista in CIS2.DATA_ALL
                DELETE FROM CIS2.DATA_ALL
                WHERE
                  PERIOADA=CR.PERIOADA AND FORM=CR.FORM AND CUIIO=CR.CUIIO AND ID_MD=CR.ID_MD;
                
                -- 0. Sterge rapoartele daca exista in CIS2.CONTROL
                DELETE FROM CIS2.CONTROL
                WHERE
                  PERIOADA=CR.PERIOADA AND FORM=CR.FORM AND CUIIO=CR.CUIIO;
                  
                -- 1. Se insereaza rapoarte noi in CIS2
                INSERT INTO CIS2.DATA_ALL
                (
                  PERIOADA,
                  FORM,
                  FORM_VERS,
                  CUIIO,
                  CUIIO_VERS,
                  ID_MD,
                  DATA_REG,
                  ID_USER,
                  FILIAL,
                  COL1, COL2, COL3, COL4, COL5, COL6, COL7, COL8
                )
                VALUES
                (
                  CR.PERIOADA,
                  CR.FORM,
                  CR.FORM_VERS,
                  CR.CUIIO,
                  CR.CUIIO_VERS,
                  CR.ID_MD,
                  CR.DATA_REG,
                  CR.ID_USER,
                  CR.MUNCA3_FILIAL,
                  CR.COL1, CR.COL2, CR.COL3, CR.COL4, CR.COL5, CR.COL6, CR.COL7, CR.COL8
                );
                
                -- 2. Fiecare rapoart importat se insereaza in tabela DATA_ALL_PRIMIT
                INSERT INTO USER_EREPORTING.DATA_ALL_PRIMIT
                (
                  PERIOADA,
                  FORM,
                  FORM_VERS,
                  CUIIO,
                  CUIIO_VERS,
                  ID_MD,
                  DATA_REG,
                  ID_USER,
                  T_XML_FORM_ID,
                  ID_SCHEMA,
                  FILIAL,
                  COL1, COL2, COL3, COL4, COL5, COL6, COL7, COL8
                )
                VALUES
                (
                  CR.PERIOADA,
                  CR.FORM,
                  CR.FORM_VERS,
                  CR.CUIIO,
                  CR.CUIIO_VERS,
                  CR.ID_MD,
                  CR.DATA_REG,
                  CR.ID_USER,
                  CR.T_XML_FORM_ID,
                  CR.ID_SCHEMA,
                  CR.FILIAL,
                  CR.COL1, CR.COL2, CR.COL3, CR.COL4, CR.COL5, CR.COL6, CR.COL7, CR.COL8
                );
                
                -- 3. Fiecare rapoart importat se sterge din tabela DATA_ALL
                DELETE FROM USER_EREPORTING.DATA_ALL
                WHERE
                  PERIOADA = CR.PERIOADA
                  AND FORM = CR.FORM
                  AND CUIIO = CR.CUIIO
                  AND ID_MD <> -1 -- Nu sterge rinduri gresite
                ;
            END IF;
            
            IF CR.FORM IN (36) AND ((vCURRENT_MONTH IN (1,2,3,4) AND vCURRENT_DAY <= 30)  OR (vCURRENT_MONTH IN (5) AND vCURRENT_DAY <= 15 )) THEN -- 16-AGR
            
                -- 0. Sterge rapoartele daca exista in CIS2.DATA_ALL
                DELETE FROM CIS2.DATA_ALL
                WHERE
                  PERIOADA=CR.PERIOADA AND FORM=CR.FORM AND CUIIO=CR.CUIIO AND ID_MD=CR.ID_MD;
                
                -- 0. Sterge rapoartele daca exista in CIS2.CONTROL
                DELETE FROM CIS2.CONTROL
                WHERE
                  PERIOADA=CR.PERIOADA AND FORM=CR.FORM AND CUIIO=CR.CUIIO;
                  
                -- 1. Se insereaza rapoarte noi in CIS2
                INSERT INTO CIS2.DATA_ALL
                (
                  PERIOADA,
                  FORM,
                  FORM_VERS,
                  CUIIO,
                  CUIIO_VERS,
                  ID_MD,
                  DATA_REG,
                  ID_USER,
                  FILIAL,
                  COL1, COL2, COL3, COL4, COL5, COL6, COL7, COL8, COL9, COL10, COL11, COL12, COL13, COL14, COL15, COL16
                )
                VALUES
                (
                  CR.PERIOADA,
                  CR.FORM,
                  CR.FORM_VERS,
                  CR.CUIIO,
                  CR.CUIIO_VERS,
                  CR.ID_MD,
                  CR.DATA_REG,
                  CR.ID_USER,
                  CR.MUNCA3_FILIAL,
                  CR.COL1, CR.COL2, CR.COL3, CR.COL4, CR.COL5, CR.COL6, CR.COL7, CR.COL8, CR.COL9, CR.COL10, CR.COL11, CR.COL12, CR.COL13, CR.COL14, CR.COL15, CR.COL16
                );
                
                -- 2. Fiecare rapoart importat se insereaza in tabela DATA_ALL_PRIMIT
                INSERT INTO USER_EREPORTING.DATA_ALL_PRIMIT
                (
                  PERIOADA,
                  FORM,
                  FORM_VERS,
                  CUIIO,
                  CUIIO_VERS,
                  ID_MD,
                  DATA_REG,
                  ID_USER,
                  T_XML_FORM_ID,
                  ID_SCHEMA,
                  FILIAL,
                  COL1, COL2, COL3, COL4, COL5, COL6, COL7, COL8, COL9, COL10, COL11, COL12, COL13, COL14, COL15, COL16
                )
                VALUES
                (
                  CR.PERIOADA,
                  CR.FORM,
                  CR.FORM_VERS,
                  CR.CUIIO,
                  CR.CUIIO_VERS,
                  CR.ID_MD,
                  CR.DATA_REG,
                  CR.ID_USER,
                  CR.T_XML_FORM_ID,
                  CR.ID_SCHEMA,
                  CR.FILIAL,
                  CR.COL1, CR.COL2, CR.COL3, CR.COL4, CR.COL5, CR.COL6, CR.COL7, CR.COL8, CR.COL9, CR.COL10, CR.COL11, CR.COL12, CR.COL13, CR.COL14, CR.COL15, CR.COL16
                );
                
                -- 3. Fiecare rapoart importat se sterge din tabela DATA_ALL
                DELETE FROM USER_EREPORTING.DATA_ALL
                WHERE
                  PERIOADA = CR.PERIOADA
                  AND FORM = CR.FORM
                  AND CUIIO = CR.CUIIO
                  AND ID_MD <> -1 -- Nu sterge rinduri gresite
                ;
            END IF;
            
            IF CR.FORM IN (43) AND ((vCURRENT_MONTH IN (7) AND vCURRENT_DAY <= 9)  --OR (vCURRENT_MONTH IN (5) AND vCURRENT_DAY <= 15 )
                                   ) THEN -- 4-AGR
            
                -- 0. Sterge rapoartele daca exista in CIS2.DATA_ALL
                DELETE FROM CIS2.DATA_ALL
                WHERE
                  PERIOADA=CR.PERIOADA AND FORM=CR.FORM AND CUIIO=CR.CUIIO AND ID_MD=CR.ID_MD;
                
                -- 0. Sterge rapoartele daca exista in CIS2.CONTROL
                DELETE FROM CIS2.CONTROL
                WHERE
                  PERIOADA=CR.PERIOADA AND FORM=CR.FORM AND CUIIO=CR.CUIIO;
                  
                -- 1. Se insereaza rapoarte noi in CIS2
                INSERT INTO CIS2.DATA_ALL
                (
                  PERIOADA,
                  FORM,
                  FORM_VERS,
                  CUIIO,
                  CUIIO_VERS,
                  ID_MD,
                  DATA_REG,
                  ID_USER,
                  FILIAL,
                  COL1, COL2, COL3, COL4, COL5, COL6, COL7, COL8, COL9, COL10, COL11, COL12, COL13, COL14, COL15, COL16
                )
                VALUES
                (
                  CR.PERIOADA,
                  CR.FORM,
                  CR.FORM_VERS,
                  CR.CUIIO,
                  CR.CUIIO_VERS,
                  CR.ID_MD,
                  CR.DATA_REG,
                  CR.ID_USER,
                  CR.MUNCA3_FILIAL,
                  CR.COL1, CR.COL2, CR.COL3, CR.COL4, CR.COL5, CR.COL6, CR.COL7, CR.COL8, CR.COL9, CR.COL10, CR.COL11, CR.COL12, CR.COL13, CR.COL14, CR.COL15, CR.COL16
                );
                
                -- 2. Fiecare rapoart importat se insereaza in tabela DATA_ALL_PRIMIT
                INSERT INTO USER_EREPORTING.DATA_ALL_PRIMIT
                (
                  PERIOADA,
                  FORM,
                  FORM_VERS,
                  CUIIO,
                  CUIIO_VERS,
                  ID_MD,
                  DATA_REG,
                  ID_USER,
                  T_XML_FORM_ID,
                  ID_SCHEMA,
                  FILIAL,
                  COL1, COL2, COL3, COL4, COL5, COL6, COL7, COL8, COL9, COL10, COL11, COL12, COL13, COL14, COL15, COL16
                )
                VALUES
                (
                  CR.PERIOADA,
                  CR.FORM,
                  CR.FORM_VERS,
                  CR.CUIIO,
                  CR.CUIIO_VERS,
                  CR.ID_MD,
                  CR.DATA_REG,
                  CR.ID_USER,
                  CR.T_XML_FORM_ID,
                  CR.ID_SCHEMA,
                  CR.FILIAL,
                  CR.COL1, CR.COL2, CR.COL3, CR.COL4, CR.COL5, CR.COL6, CR.COL7, CR.COL8, CR.COL9, CR.COL10, CR.COL11, CR.COL12, CR.COL13, CR.COL14, CR.COL15, CR.COL16
                );
                
                -- 3. Fiecare rapoart importat se sterge din tabela DATA_ALL
                DELETE FROM USER_EREPORTING.DATA_ALL
                WHERE
                  PERIOADA = CR.PERIOADA
                  AND FORM = CR.FORM
                  AND CUIIO = CR.CUIIO
                  AND ID_MD <> -1 -- Nu sterge rinduri gresite
                ;
            END IF;
            
        END IF;
      END LOOP;
      
      EXCEPTION 
        WHEN DUP_VAL_ON_INDEX THEN RETURN; 
    -------------------------------------------------------------------------------

  END IMPORT_EREPORTING_ANUAL;
  
  PROCEDURE IMPORT_EREPORTING_RSF AS
  pPERIOADA NUMBER;
    vCURRENT_DAY NUMBER;
    vCURRENT_MONTH NUMBER;
  -- Importarea rapoartelor din e-reporting in CIS2 ------------------------------
      CURSOR C IS
      SELECT
        PERIOADA,
        FORM,
        FORM_VERS,
        CUIIO,
        CUIIO_VERS,
        ID_MD,
        DATA_REG,
        ID_USER,
        T_XML_FORM_ID,
        ID_SCHEMA,
        COL1, COL2, COL3, COL4, COL5, COL6, COL7, COL8,
        COL9, COL10, COL11, COL12, COL13, COL14, COL15
      FROM
        (
          SELECT DISTINCT
            DE.PERIOADA,
            DE.FORM,
            DE.FORM_VERS,
            DE.CUIIO,
            DE.CUIIO_VERS,
            DE.ID_MD,
            DE.DATA_REG,
            9999 AS ID_USER,
            DE.T_XML_FORM_ID,
            DE.ID_SCHEMA,
            DE.COL1, DE.COL2, DE.COL3, DE.COL4, DE.COL5, DE.COL6, DE.COL7, DE.COL8,
            DE.COL9, DE.COL10, DE.COL11, DE.COL12, DE.COL13, DE.COL14, DE.COL15
          FROM
            USER_EREPORTING.DATA_ALL_FR DE INNER JOIN
            USER_EREPORTING.FORM_CUIIO FC ON (DE.CUIIO=FC.CUIIO AND DE.CUIIO_VERS=FC.CUIIO_VERS AND DE.FORM=FC.FORM AND DE.FORM_VERS=FC.FORM_VERS AND FC.STATUT <> '3' AND DE.ID_SCHEMA=FC.ID_SCHEMA)
    --        LEFT JOIN
    --        (
    --          SELECT DISTINCT D.FORM, D.PERIOADA, D.CUIIO FROM CIS2.DATA_ALL D
    --        ) DC ON(DC.FORM = DE.FORM AND DC.PERIOADA=DE.PERIOADA AND DC.CUIIO=DE.CUIIO)
          WHERE
    --        DC.CUIIO IS NULL   -- Exclude rapoarte existente in CIS2 -- AND 
              DE.ID_MD <> -1 -- Exclude rinduri cu identificatori eronate --
--              AND DE.CUIIO IN (38912844)
            /* ----------------------------------------------------------------- */
            AND DE.PERIOADA = pPERIOADA
    --        AND DE.FORM     = :IMPORT_FORM
--            AND (DE.COL1 <> '' OR DE.COL2 <> '' OR DE.COL3 <> '' OR DE.COL4 <> '')
            /* ----------------------------------------------------------------- */
    --      ORDER BY
    --        DE.PERIOADA,
    --        DE.FORM,
    --        DE.CUIIO,
    --        DE.ID_MD
            
        ) D
        ORDER BY
          PERIOADA,
          FORM,
          CUIIO,
          DATA_REG,
          T_XML_FORM_ID,
          ID_MD;

  BEGIN
    pPERIOADA := GET_PERIOADA_ANUALA;
    SELECT
      EXTRACT(DAY FROM SYSDATE) AS CURRENT_DAY, EXTRACT(MONTH FROM SYSDATE) AS CURRENT_MONTH INTO vCURRENT_DAY, vCURRENT_MONTH
    FROM
      DUAL;
    
      FOR CR IN C
      LOOP
        IF CR.ID_SCHEMA = 2 THEN -- Identificam daca raport este in CIS2
        
            IF CR.FORM IN (59) AND ((vCURRENT_MONTH IN (1,2,3,4,5) AND vCURRENT_DAY <= 31) OR (vCURRENT_MONTH IN (6) AND vCURRENT_DAY <= 20)) THEN -- RSF2  
            -- OR (vCURRENT_MONTH IN (6) AND vCURRENT_DAY <= 10)) THEN -- 2-INV-ANUAL
                -- 0. Sterge rapoartele daca exista in CIS2.DATA_ALL
                DELETE FROM CIS2.DATA_ALL_FR
                WHERE
                  PERIOADA=CR.PERIOADA AND FORM=CR.FORM AND CUIIO=CR.CUIIO AND ID_MD=CR.ID_MD;
                
                -- 0. Sterge rapoartele daca exista in CIS2.CONTROL
                DELETE FROM CIS2.CONTROL
                WHERE
                  PERIOADA=CR.PERIOADA AND FORM=CR.FORM AND CUIIO=CR.CUIIO;
                  
                -- 1. Se insereaza rapoarte noi in CIS2
                INSERT INTO CIS2.DATA_ALL_FR
                (
                  PERIOADA,
                  FORM,
                  FORM_VERS,
                  CUIIO,
                  CUIIO_VERS,
                  ID_MD,
                  DATA_REG,
                  ID_USER,
                  COL1, COL2, COL3, COL4, COL5, COL6, COL7, COL8,
                  COL9, COL10, COL11, COL12, COL13, COL14, COL15
                )
                VALUES
                (
                  CR.PERIOADA,
                  CR.FORM,
                  CR.FORM_VERS,
                  CR.CUIIO,
                  CR.CUIIO_VERS,
                  CR.ID_MD,
                  CR.DATA_REG,
                  CR.ID_USER,
                  CR.COL1, CR.COL2, CR.COL3, CR.COL4, CR.COL5, CR.COL6, CR.COL7, CR.COL8,
                  CR.COL9, CR.COL10, CR.COL11, CR.COL12, CR.COL13, CR.COL14, CR.COL15
                );
                
                -- 2. Fiecare rapoart importat se insereaza in tabela DATA_ALL_PRIMIT
                INSERT INTO USER_EREPORTING.DATA_ALL_FR_PRIMIT
                (
                  PERIOADA,
                  FORM,
                  FORM_VERS,
                  CUIIO,
                  CUIIO_VERS,
                  ID_MD,
                  DATA_REG,
                  ID_USER,
                  T_XML_FORM_ID,
                  ID_SCHEMA,
                  COL1, COL2, COL3, COL4, COL5, COL6, COL7, COL8,
                  COL9, COL10, COL11, COL12, COL13, COL14, COL15
                )
                VALUES
                (
                  CR.PERIOADA,
                  CR.FORM,
                  CR.FORM_VERS,
                  CR.CUIIO,
                  CR.CUIIO_VERS,
                  CR.ID_MD,
                  CR.DATA_REG,
                  CR.ID_USER,
                  CR.T_XML_FORM_ID,
                  CR.ID_SCHEMA,
                  CR.COL1, CR.COL2, CR.COL3, CR.COL4, CR.COL5, CR.COL6, CR.COL7, CR.COL8,
                  CR.COL9, CR.COL10, CR.COL11, CR.COL12, CR.COL13, CR.COL14, CR.COL15
                );
                
                -- 3. Fiecare rapoart importat se sterge din tabela DATA_ALL
                DELETE FROM USER_EREPORTING.DATA_ALL_FR
                WHERE
                  PERIOADA = CR.PERIOADA
                  AND FORM = CR.FORM
                  AND CUIIO = CR.CUIIO
                  AND ID_MD <> -1 -- Nu sterge rinduri gresite
                ;
            END IF;
            
            IF CR.FORM IN (57) AND ((vCURRENT_MONTH IN (1,2,3,4,5) AND vCURRENT_DAY <= 31) OR (vCURRENT_MONTH IN (6) AND vCURRENT_DAY <= 20)) THEN -- RSF1  
            -- OR (vCURRENT_MONTH IN (6) AND vCURRENT_DAY <= 10)) THEN -- 2-INV-ANUAL
                -- 0. Sterge rapoartele daca exista in CIS2.DATA_ALL
                DELETE FROM CIS2.DATA_ALL_FR
                WHERE
                  PERIOADA=CR.PERIOADA AND FORM=CR.FORM AND CUIIO=CR.CUIIO AND ID_MD=CR.ID_MD;
                
                -- 0. Sterge rapoartele daca exista in CIS2.CONTROL
                DELETE FROM CIS2.CONTROL
                WHERE
                  PERIOADA=CR.PERIOADA AND FORM=CR.FORM AND CUIIO=CR.CUIIO;
                  
                -- 1. Se insereaza rapoarte noi in CIS2
                INSERT INTO CIS2.DATA_ALL_FR
                (
                  PERIOADA,
                  FORM,
                  FORM_VERS,
                  CUIIO,
                  CUIIO_VERS,
                  ID_MD,
                  DATA_REG,
                  ID_USER,
                  COL1, COL2, COL3, COL4, COL5, COL6, COL7, COL8,
                  COL9, COL10, COL11, COL12, COL13, COL14, COL15
                )
                VALUES
                (
                  CR.PERIOADA,
                  CR.FORM,
                  CR.FORM_VERS,
                  CR.CUIIO,
                  CR.CUIIO_VERS,
                  CR.ID_MD,
                  CR.DATA_REG,
                  CR.ID_USER,
                  CR.COL1, CR.COL2, CR.COL3, CR.COL4, CR.COL5, CR.COL6, CR.COL7, CR.COL8,
                  CR.COL9, CR.COL10, CR.COL11, CR.COL12, CR.COL13, CR.COL14, CR.COL15
                );
                
                -- 2. Fiecare rapoart importat se insereaza in tabela DATA_ALL_PRIMIT
                INSERT INTO USER_EREPORTING.DATA_ALL_FR_PRIMIT
                (
                  PERIOADA,
                  FORM,
                  FORM_VERS,
                  CUIIO,
                  CUIIO_VERS,
                  ID_MD,
                  DATA_REG,
                  ID_USER,
                  T_XML_FORM_ID,
                  ID_SCHEMA,
                  COL1, COL2, COL3, COL4, COL5, COL6, COL7, COL8,
                  COL9, COL10, COL11, COL12, COL13, COL14, COL15
                )
                VALUES
                (
                  CR.PERIOADA,
                  CR.FORM,
                  CR.FORM_VERS,
                  CR.CUIIO,
                  CR.CUIIO_VERS,
                  CR.ID_MD,
                  CR.DATA_REG,
                  CR.ID_USER,
                  CR.T_XML_FORM_ID,
                  CR.ID_SCHEMA,
                  CR.COL1, CR.COL2, CR.COL3, CR.COL4, CR.COL5, CR.COL6, CR.COL7, CR.COL8,
                  CR.COL9, CR.COL10, CR.COL11, CR.COL12, CR.COL13, CR.COL14, CR.COL15
                );
                
                -- 3. Fiecare rapoart importat se sterge din tabela DATA_ALL
                DELETE FROM USER_EREPORTING.DATA_ALL_FR
                WHERE
                  PERIOADA = CR.PERIOADA
                  AND FORM = CR.FORM
                  AND CUIIO = CR.CUIIO
                  AND ID_MD <> -1 -- Nu sterge rinduri gresite
                ;
            END IF;
            IF CR.FORM IN (63) AND ((vCURRENT_MONTH IN (1,2,3,4,5) AND vCURRENT_DAY <= 31) OR (vCURRENT_MONTH IN (6) AND vCURRENT_DAY <= 20)) THEN -- RSF1  
            -- OR (vCURRENT_MONTH IN (6) AND vCURRENT_DAY <= 10)) THEN -- 2-INV-ANUAL
                -- 0. Sterge rapoartele daca exista in CIS2.DATA_ALL
                DELETE FROM CIS2.DATA_ALL_FR
                WHERE
                  PERIOADA=CR.PERIOADA AND FORM=CR.FORM AND CUIIO=CR.CUIIO AND ID_MD=CR.ID_MD;
                
                -- 0. Sterge rapoartele daca exista in CIS2.CONTROL
                DELETE FROM CIS2.CONTROL
                WHERE
                  PERIOADA=CR.PERIOADA AND FORM=CR.FORM AND CUIIO=CR.CUIIO;
                  
                -- 1. Se insereaza rapoarte noi in CIS2
                INSERT INTO CIS2.DATA_ALL_FR
                (
                  PERIOADA,
                  FORM,
                  FORM_VERS,
                  CUIIO,
                  CUIIO_VERS,
                  ID_MD,
                  DATA_REG,
                  ID_USER,
                  COL1, COL2, COL3, COL4, COL5, COL6, COL7, COL8,
                  COL9, COL10, COL11, COL12, COL13, COL14, COL15
                )
                VALUES
                (
                  CR.PERIOADA,
                  CR.FORM,
                  CR.FORM_VERS,
                  CR.CUIIO,
                  CR.CUIIO_VERS,
                  CR.ID_MD,
                  CR.DATA_REG,
                  CR.ID_USER,
                  CR.COL1, CR.COL2, CR.COL3, CR.COL4, CR.COL5, CR.COL6, CR.COL7, CR.COL8,
                  CR.COL9, CR.COL10, CR.COL11, CR.COL12, CR.COL13, CR.COL14, CR.COL15
                );
                
                -- 2. Fiecare rapoart importat se insereaza in tabela DATA_ALL_PRIMIT
                INSERT INTO USER_EREPORTING.DATA_ALL_FR_PRIMIT
                (
                  PERIOADA,
                  FORM,
                  FORM_VERS,
                  CUIIO,
                  CUIIO_VERS,
                  ID_MD,
                  DATA_REG,
                  ID_USER,
                  T_XML_FORM_ID,
                  ID_SCHEMA,
                  COL1, COL2, COL3, COL4, COL5, COL6, COL7, COL8,
                  COL9, COL10, COL11, COL12, COL13, COL14, COL15
                )
                VALUES
                (
                  CR.PERIOADA,
                  CR.FORM,
                  CR.FORM_VERS,
                  CR.CUIIO,
                  CR.CUIIO_VERS,
                  CR.ID_MD,
                  CR.DATA_REG,
                  CR.ID_USER,
                  CR.T_XML_FORM_ID,
                  CR.ID_SCHEMA,
                  CR.COL1, CR.COL2, CR.COL3, CR.COL4, CR.COL5, CR.COL6, CR.COL7, CR.COL8,
                  CR.COL9, CR.COL10, CR.COL11, CR.COL12, CR.COL13, CR.COL14, CR.COL15
                );
                
                -- 3. Fiecare rapoart importat se sterge din tabela DATA_ALL
                DELETE FROM USER_EREPORTING.DATA_ALL_FR
                WHERE
                  PERIOADA = CR.PERIOADA
                  AND FORM = CR.FORM
                  AND CUIIO = CR.CUIIO
                  AND ID_MD <> -1 -- Nu sterge rinduri gresite
                ;
            END IF;
            IF CR.FORM IN (66) AND ((vCURRENT_MONTH IN (1,2,3,4,5) AND vCURRENT_DAY <= 31) OR (vCURRENT_MONTH IN (6) AND vCURRENT_DAY <= 20)) THEN -- RSF3  
            -- OR (vCURRENT_MONTH IN (6) AND vCURRENT_DAY <= 10)) THEN -- 2-INV-ANUAL
                -- 0. Sterge rapoartele daca exista in CIS2.DATA_ALL
                DELETE FROM CIS2.DATA_ALL_FR
                WHERE
                  PERIOADA=CR.PERIOADA AND FORM=CR.FORM AND CUIIO=CR.CUIIO AND ID_MD=CR.ID_MD;
                
                -- 0. Sterge rapoartele daca exista in CIS2.CONTROL
                DELETE FROM CIS2.CONTROL
                WHERE
                  PERIOADA=CR.PERIOADA AND FORM=CR.FORM AND CUIIO=CR.CUIIO;
                  
                -- 1. Se insereaza rapoarte noi in CIS2
                INSERT INTO CIS2.DATA_ALL_FR
                (
                  PERIOADA,
                  FORM,
                  FORM_VERS,
                  CUIIO,
                  CUIIO_VERS,
                  ID_MD,
                  DATA_REG,
                  ID_USER,
                  COL1, COL2, COL3, COL4, COL5, COL6, COL7, COL8,
                  COL9, COL10, COL11, COL12, COL13, COL14, COL15
                )
                VALUES
                (
                  CR.PERIOADA,
                  CR.FORM,
                  CR.FORM_VERS,
                  CR.CUIIO,
                  CR.CUIIO_VERS,
                  CR.ID_MD,
                  CR.DATA_REG,
                  CR.ID_USER,
                  CR.COL1, CR.COL2, CR.COL3, CR.COL4, CR.COL5, CR.COL6, CR.COL7, CR.COL8,
                  CR.COL9, CR.COL10, CR.COL11, CR.COL12, CR.COL13, CR.COL14, CR.COL15
                );
                
                -- 2. Fiecare rapoart importat se insereaza in tabela DATA_ALL_PRIMIT
                INSERT INTO USER_EREPORTING.DATA_ALL_FR_PRIMIT
                (
                  PERIOADA,
                  FORM,
                  FORM_VERS,
                  CUIIO,
                  CUIIO_VERS,
                  ID_MD,
                  DATA_REG,
                  ID_USER,
                  T_XML_FORM_ID,
                  ID_SCHEMA,
                  COL1, COL2, COL3, COL4, COL5, COL6, COL7, COL8,
                  COL9, COL10, COL11, COL12, COL13, COL14, COL15
                )
                VALUES
                (
                  CR.PERIOADA,
                  CR.FORM,
                  CR.FORM_VERS,
                  CR.CUIIO,
                  CR.CUIIO_VERS,
                  CR.ID_MD,
                  CR.DATA_REG,
                  CR.ID_USER,
                  CR.T_XML_FORM_ID,
                  CR.ID_SCHEMA,
                  CR.COL1, CR.COL2, CR.COL3, CR.COL4, CR.COL5, CR.COL6, CR.COL7, CR.COL8,
                  CR.COL9, CR.COL10, CR.COL11, CR.COL12, CR.COL13, CR.COL14, CR.COL15
                );
                
                -- 3. Fiecare rapoart importat se sterge din tabela DATA_ALL
                DELETE FROM USER_EREPORTING.DATA_ALL_FR
                WHERE
                  PERIOADA = CR.PERIOADA
                  AND FORM = CR.FORM
                  AND CUIIO = CR.CUIIO
                  AND ID_MD <> -1 -- Nu sterge rinduri gresite
                ;
            END IF;
        END IF;
      END LOOP;
      
      EXCEPTION 
        WHEN DUP_VAL_ON_INDEX THEN RETURN; 
    -------------------------------------------------------------------------------

  END IMPORT_EREPORTING_RSF;
      
END PKG_IMPORT_EREPORTING;
/