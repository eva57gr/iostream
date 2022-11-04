SELECT
 PERIOADA,  FORM,   FORM_VERS,  ID_MDTABLE, COD_CUATM,  NR_SECTIE,  NUME_SECTIE, NR_SECTIE1,
 NUME_SECTIE1,  NR_SECTIE2,  NUME_SECTIE2, NR_ROW, ORDINE,  DECIMAL_POS, NUME_ROW, 
 ROUND(COL1,1) AS COL1, ROUND(COL2,0) AS COL2, ROUND(COL3,0) AS COL3, ROUND(COL4,0) AS COL4, ROUND(COL5,0) AS COL5, ROUND(COL6,0) AS COL6
FROM(
SELECT 
  :pPERIOADA AS PERIOADA,
  :pFORM AS FORM,
  :pFORM_VERS AS FORM_VERS,
  :pID_MDTABLE AS ID_MDTABLE,
  :pCOD_CUATM AS COD_CUATM,
  
   RR.NR_ROW AS NR_SECTIE,         
   RR.NUME_ROW AS NUME_SECTIE,
   
  '0' AS NR_SECTIE1,
  '0' AS NUME_SECTIE1,
  '0' AS NR_SECTIE2,
  '0' AS NUME_SECTIE2,
  
  D.RIND ||', Col.'|| CC.NR_COLUMN||'~'||RR.NR_ROW||'.'|| CC.NR_COLUMN AS NR_ROW,

  TO_NUMBER(D.CAPITOL||'.'||D.RIND||CC.NR_COLUMN) AS ORDINE,
  '000000' AS DECIMAL_POS,
--CC.CLMN,

 REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(RD.DENUMIRE,'<br>'),'nbsp'),'&;'),'</b>'),'<br />'),'<b>') AS NUME_ROW,

 SUM(CASE WHEN (DD.COL4 BETWEEN RR.PERS_FROM AND RR.PERS_TO OR DD.COL4 = RR.PERS)  THEN 
             CASE WHEN  D.CAPITOL IN (1124, 1125)  THEN DECODE(CC.NR_COLUMN, '1', D.COL1) 
                   WHEN  D.CAPITOL IN (1126)              THEN DECODE(CC.NR_COLUMN, '1', D.COL1, '2', D.COL2)
                   WHEN  D.CAPITOL IN (1127)              THEN DECODE(CC.NR_COLUMN, '1', D.COL3, '2', D.COL4, '3', D.COL5)
                   WHEN  D.CAPITOL IN (1128)              THEN DECODE(CC.NR_COLUMN, '1', D.COL8, '2', D.COL9, '3', D.COL10) END END)  AS COL1,

 SUM(CASE WHEN (DD.COL4 BETWEEN RR.PERS_FROM AND RR.PERS_TO OR DD.COL4 = RR.PERS)  AND D.CFP IN ('11','12','13') THEN 
             CASE WHEN  D.CAPITOL IN (1124, 1125) THEN DECODE(CC.NR_COLUMN, '1', D.COL1) 
                   WHEN  D.CAPITOL IN (1126)              THEN DECODE(CC.NR_COLUMN, '1', D.COL1, '2', D.COL2)
                   WHEN  D.CAPITOL IN (1127)              THEN DECODE(CC.NR_COLUMN, '1', D.COL3, '2', D.COL4, '3', D.COL5)
                   WHEN  D.CAPITOL IN (1128)              THEN DECODE(CC.NR_COLUMN, '1', D.COL8, '2', D.COL9, '3', D.COL10) END END)  AS COL2,
                   
                                                                                                        
 SUM(CASE WHEN (DD.COL4 BETWEEN RR.PERS_FROM AND RR.PERS_TO OR DD.COL4 = RR.PERS) AND  D.CFP IN ('14','15','16','17','18','19') THEN 
             CASE WHEN  D.CAPITOL IN (1124, 1125)  THEN DECODE(CC.NR_COLUMN, '1', D.COL1) 
                   WHEN  D.CAPITOL IN (1126)              THEN DECODE(CC.NR_COLUMN, '1', D.COL1, '2', D.COL2)
                   WHEN  D.CAPITOL IN (1127)              THEN DECODE(CC.NR_COLUMN, '1', D.COL3, '2', D.COL4, '3', D.COL5)
                   WHEN  D.CAPITOL IN (1128)              THEN DECODE(CC.NR_COLUMN, '1', D.COL8, '2', D.COL9, '3', D.COL10) END END)  AS COL3,
                   
                                                                                                                           
 SUM(CASE WHEN (DD.COL4 BETWEEN RR.PERS_FROM AND RR.PERS_TO OR DD.COL4 = RR.PERS) AND  D.CFP IN ('20','21') THEN 
             CASE WHEN  D.CAPITOL IN (1124, 1125)  THEN DECODE(CC.NR_COLUMN, '1', D.COL1) 
                   WHEN  D.CAPITOL IN (1126)              THEN DECODE(CC.NR_COLUMN, '1', D.COL1, '2', D.COL2)
                   WHEN  D.CAPITOL IN (1127)              THEN DECODE(CC.NR_COLUMN, '1', D.COL3, '2', D.COL4, '3', D.COL5)
                   WHEN  D.CAPITOL IN (1128)              THEN DECODE(CC.NR_COLUMN, '1', D.COL8, '2', D.COL9, '3', D.COL10) END END)  AS COL4,                   
                   
                                                                                                        
 SUM(CASE WHEN (DD.COL4 BETWEEN RR.PERS_FROM AND RR.PERS_TO OR DD.COL4 = RR.PERS) AND  D.CFP IN ('22','23','24','25','26','27') THEN 
             CASE WHEN  D.CAPITOL IN (1124, 1125)  THEN DECODE(CC.NR_COLUMN, '1', D.COL1)
                   WHEN  D.CAPITOL IN (1126)              THEN DECODE(CC.NR_COLUMN, '1', D.COL1, '2', D.COL2) 
                   WHEN  D.CAPITOL IN (1127)              THEN DECODE(CC.NR_COLUMN, '1', D.COL3, '2', D.COL4, '3', D.COL5)
                   WHEN  D.CAPITOL IN (1128)              THEN DECODE(CC.NR_COLUMN, '1', D.COL8, '2', D.COL9, '3', D.COL10) END END)  AS COL5,                   
                    
                                                                                                        
 SUM(CASE WHEN (DD.COL4 BETWEEN RR.PERS_FROM AND RR.PERS_TO OR DD.COL4 = RR.PERS) AND  D.CFP IN ('28') THEN 
             CASE WHEN  D.CAPITOL IN (1124, 1125)  THEN DECODE(CC.NR_COLUMN, '1', D.COL1) 
                   WHEN  D.CAPITOL IN (1126)              THEN DECODE(CC.NR_COLUMN, '1', D.COL1, '2', D.COL2)
                   WHEN  D.CAPITOL IN (1127)              THEN DECODE(CC.NR_COLUMN, '1', D.COL3, '2', D.COL4, '3', D.COL5)
                   WHEN  D.CAPITOL IN (1128)              THEN DECODE(CC.NR_COLUMN, '1', D.COL8, '2', D.COL9, '3', D.COL10) END END)  AS COL6
   
FROM  
 CIS2.VW_DATA_ALL_COEF D  
INNER JOIN CIS2.VW_CL_CFP VC ON (D.CFP = VC.CODUL)
INNER JOIN CIS2.MD_RIND RD ON D.RIND=RD.RIND AND D.ID_MD=RD.ID_MD
INNER JOIN

  (
-------------------------------------------------------------------------------
SELECT 

 DISTINCT D.CUIIO,D.CUIIO_VERS, D. CUATM,
SUM(CASE WHEN D.CAPITOL IN (1127) AND D.RIND IN ('400') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0  END)  AS COL4,
SUM(CASE WHEN D.CAPITOL IN (100) AND D.RIND IN ('CD') AND D.COL1 IS NOT NULL THEN D.COL1 ELSE 0  END)  AS CD 
FROM   
    CIS2.VW_DATA_ALL D       
WHERE
  D.FORM IN (64)             AND 
  D.FORM_VERS = :PFORM_VERS  AND      
  D.PERIOADA =:pPERIOADA AND
  D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%'   AND
  D.CAPITOL IN (1127,100) AND
  D.RIND IN ('400', 'CD')
 --AND  D.CUIIO=41234282
 GROUP BY D.CUIIO,D.CUATM, D.CUIIO_VERS
  HAVING
 SUM(CASE WHEN D.CAPITOL IN (100) AND D.RIND IN ('CD') AND D.COL1 IS NOT NULL THEN D.COL1 ELSE 0  END) >0

)DD ON D.CUIIO=DD.CUIIO AND D.CUIIO_VERS=DD.CUIIO_VERS
    
 
   CROSS JOIN
  ( 
    SELECT 'Întreprinderile cu numarul de salariati 0-9 persoane'              AS NUME_ROW, '01' AS NR_ROW, 0 AS PERS_FROM, 9 AS PERS_TO, NULL AS PERS FROM DUAL UNION
    SELECT 'Întreprinderile cu numarul de salariati 0-49 persoane'             AS NUME_ROW, '02' AS NR_ROW, 0 AS PERS_FROM, 49 AS PERS_TO, NULL AS PERS FROM DUAL UNION
    SELECT 'Întreprinderile cu numarul de salariati 0-249 persoane'            AS NUME_ROW, '03' AS NR_ROW, 0 AS PERS_FROM, 249 AS PERS_TO, NULL AS PERS FROM DUAL UNION
    SELECT 'Întreprinderile cu numarul de salariati 250 si mai mult persoane'  AS NUME_ROW, '04' AS NR_ROW, 250 AS PERS_FROM, 99999999 AS PERS_TO, NULL AS PERS FROM DUAL UNION
    SELECT 'Total republica Moldova'                                         AS NUME_ROW, '05' AS NR_ROW, 0 AS PERS_FROM, 99999999 AS PERS_TO, NULL AS PERS FROM DUAL
        
    
  ) RR
  
  CROSS JOIN               
       (                                                                        
       SELECT '1' AS NR_COLUMN FROM DUAL UNION                                  
       SELECT '2' AS NR_COLUMN FROM DUAL UNION
       SELECT '3' AS NR_COLUMN FROM DUAL                             
       ) CC           
  WHERE
  D.FORM IN (64)             AND 
  D.FORM_VERS = :PFORM_VERS  AND      
  D.PERIOADA =:pPERIOADA AND
  D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%'   AND
  D.CAPITOL IN (1123,1124,1125,1126,1127,1128,1129) AND((D.ID_MD BETWEEN 58733 AND 58785) OR D.ID_MD IN (58791,59030,59032))
-- AND D.CUIIO = 227548
  
 GROUP BY RR.NUME_ROW,RR.NR_ROW, D.RIND,RD.DENUMIRE,D.CAPITOL, CC.NR_COLUMN
 

ORDER BY D.RIND||'~'||RR.NR_ROW||'.'||CC.NR_COLUMN)