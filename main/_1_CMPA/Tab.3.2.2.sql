INSERT INTO CIS2.TABLE_OUT 
(
  PERIOADA,
  FORM,
  FORM_VERS,
  ID_MDTABLE,
  COD_CUATM,
  NR_SECTIE,
  NUME_SECTIE,
  NR_SECTIE1,
  NUME_SECTIE1,
  NR_SECTIE2,
  NUME_SECTIE2,
  NR_ROW,
  ORDINE,
  DECIMAL_POS,
  NUME_ROW,  
  COL1, COL2, COL3,
  COL4, COL5, COL6,
  COL7, COL8, COL9,
  COL10, COL11, COL12,
  COL13, COL14, COL15,
  COL16, COL17, COL18
)


SELECT
--    :pPERIOADA AS PERIOADA,
--    :pFORM AS FORM,
--    :pFORM_VERS AS FORM_VERS,
--    :pID_MDTABLE AS ID_MDTABLE,
--    :pCOD_CUATM AS COD_CUATM,
--    '0' AS NR_SECTIE,
--    '0' AS NUME_SECTIE,
--    '0' AS NR_SECTIE1,
--    '0' AS NUME_SECTIE1,
--    '0' AS NR_SECTIE2,
--    '0' AS NUME_SECTIE2,
--     RIND||'~'||ROWNUM AS  NR_ROW,   
     ORDINE,
    '002002002002002002' AS DECIMAL_POS,
    DENUMIRE AS NUME_ROW, 
    COL1,
    COL2, 
    COL3,
    COL4, 
    COL5, 
    COL6,
    COL7, 
    COL8, 
    COL9,
    
     COL10,
     COL11,
    COL12, 
    COL13,
    COL14, 
    COL15, 
    COL16,
    COL17, 
    COL18 

    
    
    
FROM
(
  SELECT 
         RR.ORDINE AS ORDINE, 
         RR.RIND AS RIND,
         RR.DENUMIRE  DENUMIRE, 
       
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1112') AND D.RIND BETWEEN '010' AND '132' AND D.RIND IN (RR.RIND)  
         AND (D.CUATM_FULL LIKE '%'||'0000000'||';%')  THEN D.COL5 ELSE NULL END)) AS COL1,
         
         CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1112') AND D.RIND BETWEEN '010' AND '132' AND D.RIND IN (RR.RIND) 
         AND (D.CUATM_FULL LIKE '%'||'0000000'||';%')   THEN D.COL6 ELSE NULL END)) AS COL2,
         
         ROUND(( CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1112') AND D.RIND BETWEEN '010' AND '132' AND D.RIND IN (RR.RIND) 
         AND (D.CUATM_FULL LIKE '%'||'0000000'||';%')   THEN D.COL6 ELSE NULL END))/
         CIS2.NOZERO(CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1112') AND D.RIND BETWEEN '010' AND '132' 
         
         AND (D.CUATM_FULL LIKE '%'||'0000000'||';%')  AND D.RIND IN (RR.RIND)  THEN D.COL5 ELSE NULL END)))),2) AS COL3,
         
         
         ---------------------------------------------------------------------------------------------------------------
             CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1112') AND D.RIND BETWEEN '010' AND '132' AND D.RIND IN (RR.RIND)  
         AND (D.CUATM_FULL LIKE '%'||'0100000'||';%')  THEN D.COL5 ELSE NULL END)) AS COL4,
               CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1112') AND D.RIND BETWEEN '010' AND '132' AND D.RIND IN (RR.RIND) 
         AND (D.CUATM_FULL LIKE '%'||'0100000'||';%')   THEN D.COL6 ELSE NULL END)) AS COL5,
         
         ROUND(( CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1112') AND D.RIND BETWEEN '010' AND '132' AND D.RIND IN (RR.RIND) 
         AND (D.CUATM_FULL LIKE '%'||'0100000'||';%')   THEN D.COL6 ELSE NULL END))/
         CIS2.NOZERO(CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1112') AND D.RIND BETWEEN '010' AND '132' 
         
         AND (D.CUATM_FULL LIKE '%'||'0100000'||';%')  AND D.RIND IN (RR.RIND)  THEN D.COL5 ELSE NULL END)))),2) AS COL6,
         
         -----------------------------------------------------------------------------------------------------------------
         
          CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1112') AND D.RIND BETWEEN '010' AND '132' AND D.RIND IN (RR.RIND)  
         AND (D.CUATM_FULL LIKE '%'||'1111111'||';%')  THEN D.COL5 ELSE NULL END)) AS COL7,
               CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1112') AND D.RIND BETWEEN '010' AND '132' AND D.RIND IN (RR.RIND) 
         AND (D.CUATM_FULL LIKE '%'||'1111111'||';%')   THEN D.COL6 ELSE NULL END)) AS COL8,
         
         ROUND(( CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1112') AND D.RIND BETWEEN '010' AND '132' AND D.RIND IN (RR.RIND) 
         AND (D.CUATM_FULL LIKE '%'||'1111111'||';%')   THEN D.COL6 ELSE NULL END))/
         CIS2.NOZERO(CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1112') AND D.RIND BETWEEN '010' AND '132' 
         
         AND (D.CUATM_FULL LIKE '%'||'1111111'||';%')  AND D.RIND IN (RR.RIND)  THEN D.COL5 ELSE NULL END)))),2) AS COL9,
         
         -------------------------------------------------------------------------------------------------------------------
         
         -----------------------------------------------------------------------------------------------------------------
         
          CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1112') AND D.RIND BETWEEN '010' AND '132' AND D.RIND IN (RR.RIND)  
         AND (D.CUATM_FULL LIKE '%'||'2222222'||';%')  THEN D.COL5 ELSE NULL END)) AS COL10,
               CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1112') AND D.RIND BETWEEN '010' AND '132' AND D.RIND IN (RR.RIND) 
         AND (D.CUATM_FULL LIKE '%'||'2222222'||';%')   THEN D.COL6 ELSE NULL END)) AS COL11,
         
         ROUND(( CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1112') AND D.RIND BETWEEN '010' AND '132' AND D.RIND IN (RR.RIND) 
         AND (D.CUATM_FULL LIKE '%'||'2222222'||';%')   THEN D.COL6 ELSE NULL END))/
         CIS2.NOZERO(CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1112') AND D.RIND BETWEEN '010' AND '132' 
         
         AND (D.CUATM_FULL LIKE '%'||'2222222'||';%')  AND D.RIND IN (RR.RIND)  THEN D.COL5 ELSE NULL END)))),2) AS COL12,
         
         -----------------------------------------------------------------------------------------------------------------
         
          CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1112') AND D.RIND BETWEEN '010' AND '132' AND D.RIND IN (RR.RIND)  
         AND (D.CUATM_FULL LIKE '%'||'3333333'||';%')  THEN D.COL5 ELSE NULL END)) AS COL13,
         
               CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1112') AND D.RIND BETWEEN '010' AND '132' AND D.RIND IN (RR.RIND) 
         AND (D.CUATM_FULL LIKE '%'||'3333333'||';%')   THEN D.COL6 ELSE NULL END)) AS COL14,
         
         ROUND(( CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1112') AND D.RIND BETWEEN '010' AND '132' AND D.RIND IN (RR.RIND) 
         AND (D.CUATM_FULL LIKE '%'||'3333333'||';%')   THEN D.COL6 ELSE NULL END))/
         CIS2.NOZERO(CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1112') AND D.RIND BETWEEN '010' AND '132' 
         
         AND (D.CUATM_FULL LIKE '%'||'3333333'||';%')  AND D.RIND IN (RR.RIND)  THEN D.COL5 ELSE NULL END)))),2) AS COL15,
         
         -----------------------------------------------------------------------------------------------------------------
         
          CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1112') AND D.RIND BETWEEN '010' AND '132' AND D.RIND IN (RR.RIND)  
         AND (D.CUATM_FULL LIKE '%'||'9600000'||';%')  THEN D.COL5 ELSE NULL END)) AS COL16,
         
               CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1112') AND D.RIND BETWEEN '010' AND '132' AND D.RIND IN (RR.RIND) 
         AND (D.CUATM_FULL LIKE '%'||'9600000'||';%')   THEN D.COL6 ELSE NULL END)) AS COL17,
         
         ROUND(( CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1112') AND D.RIND BETWEEN '010' AND '132' AND D.RIND IN (RR.RIND) 
         AND (D.CUATM_FULL LIKE '%'||'9600000'||';%')   THEN D.COL6 ELSE NULL END))/
         CIS2.NOZERO(CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN ('1112') AND D.RIND BETWEEN '010' AND '132' 
         
         AND (D.CUATM_FULL LIKE '%'||'9600000'||';%')  AND D.RIND IN (RR.RIND)  THEN D.COL5 ELSE NULL END)))),2) AS COL18
         
         
         
     
  
   FROM
  CIS2.VW_DATA_ALL_GC  D

  CROSS JOIN ( SELECT  RIND, DENUMIRE,ORDINE 
               FROM    CIS2.MD_RIND       
               WHERE   FORM= 61 AND CAPITOL = 1112 /*AND RIND NOT IN ('-')*/ ORDER BY ORDINE) RR   
               
               
               INNER JOIN CIS2.REG_UNIT_GC RU
                ON  D.UNIT_CODE = RU.UNIT_CODE
                AND D.UNIT_CODE_VERS = RU.UNIT_CODE_VERS
                AND D.NR_GOSP = RU.NR_GOSP
                AND D.NR_MAPS = RU.NR_MAPS
                
                INNER  JOIN VW_CL_CUATM CT ON RU.CUATM = CT.CODUL 
    
WHERE
  (D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA)  AND  
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
 (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (61)AND  RR.RIND BETWEEN '010' AND '132' AND D.CAPITOL IN ('1112')  
  
  GROUP BY 
  RR.ORDINE, 
  RR.RIND,
  RR.DENUMIRE 
  ORDER BY RR.ORDINE
  
)