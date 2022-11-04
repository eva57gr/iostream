SELECT
 PERIOADA,  FORM,   FORM_VERS,  ID_MDTABLE, COD_CUATM,  NR_SECTIE,  NUME_SECTIE, NR_SECTIE1,
 NUME_SECTIE1,  NR_SECTIE2,  NUME_SECTIE2, NR_ROW, ORDINE,  DECIMAL_POS, NUME_ROW, 
 COL1, COL2, COL3, COL4, COL5, COL6,COL7, COL8, COL9, COL10, COL11, COL12
FROM(
  --------
SELECT 
  :pPERIOADA AS PERIOADA,
  :pFORM AS FORM,
  :pFORM_VERS AS FORM_VERS,
  :pID_MDTABLE AS ID_MDTABLE,
  :pCOD_CUATM AS COD_CUATM,
  
   '0' AS NR_SECTIE,         
   '0' AS NUME_SECTIE,
   
  '0' AS NR_SECTIE1,
  '0' AS NUME_SECTIE1,
  '0' AS NR_SECTIE2,
  '0' AS NUME_SECTIE2,
  
  D.RIND ||', Col.'|| CC.NR_COLUMN||'~'||RR.NR_ROW||'.'|| CC.NR_COLUMN AS NR_ROW,

  TO_NUMBER(D.CAPITOL||'.'||D.RIND||CC.NR_COLUMN) AS ORDINE,
  '000000000000' AS DECIMAL_POS,
--CC.CLMN,

 REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(RD.DENUMIRE,'<br>'),'nbsp'),'&;'),'</b>'),'<br />'),'<b>') AS NUME_ROW,

 SUM(DISTINCT CASE WHEN DD.COL4 BETWEEN RR.PERS_FROM AND RR.PERS_TO THEN ROUND(CASE WHEN D.CAPITOL IN (1124, 1125, 1126)  THEN DECODE(CC.NR_COLUMN, '1', D.COL1)
                                                                                    WHEN D.CAPITOL IN (1127)       THEN DECODE(CC.NR_COLUMN, '1', D.COL3, '2', D.COL4, '3', D.COL5)
                                                                                    WHEN D.CAPITOL IN (1128)       THEN DECODE(CC.NR_COLUMN, '1', D.COL8, '2', D.COL9, '3', D.COL10) END) END)  AS COL1,
                                                                                     
 SUM(DISTINCT CASE WHEN DD.COL4 BETWEEN RR.PERS_FROM AND RR.PERS_TO THEN ROUND(CASE  WHEN D.CFOJ IN ('420') AND D.CAPITOL IN (1124, 1125, 1126) THEN DECODE(CC.NR_COLUMN, '1', D.COL1)
                                                                                     WHEN D.CFOJ IN ('420') AND D.CAPITOL IN (1127)       THEN DECODE(CC.NR_COLUMN, '1', D.COL3, '2', D.COL4, '3', D.COL5)
                                                                                     WHEN D.CFOJ IN ('420') AND D.CAPITOL IN (1128)       THEN DECODE(CC.NR_COLUMN, '1', D.COL8, '2', D.COL9, '3', D.COL10) END) END) AS COL2,
                                                                                   
 
 SUM(DISTINCT CASE WHEN DD.COL4 BETWEEN RR.PERS_FROM AND RR.PERS_TO THEN ROUND(CASE  WHEN D.CFOJ IN ('500','510','520')  AND D.CAPITOL IN (1124, 1125, 1126) THEN DECODE(CC.NR_COLUMN, '1', D.COL1)
                                                                                     WHEN D.CFOJ IN ('500','510','520')  AND D.CAPITOL IN (1127)       THEN DECODE(CC.NR_COLUMN, '1', D.COL3, '2', D.COL4, '3', D.COL5)
                                                                                     WHEN D.CFOJ IN ('500','510','520')  AND D.CAPITOL IN (1128)       THEN DECODE(CC.NR_COLUMN, '1', D.COL8, '2', D.COL9, '3', D.COL10) END) END) AS COL3,
                                                                                     
 
 SUM(DISTINCT CASE WHEN DD.COL4 BETWEEN RR.PERS_FROM AND RR.PERS_TO THEN ROUND(CASE  WHEN D.CFOJ IN ('530')  AND D.CAPITOL IN (1124, 1125, 1126) THEN DECODE(CC.NR_COLUMN, '1', D.COL1)
                                                                                     WHEN D.CFOJ IN ('530')  AND D.CAPITOL IN (1127)       THEN DECODE(CC.NR_COLUMN, '1', D.COL3, '2', D.COL4, '3', D.COL5)
                                                                                     WHEN D.CFOJ IN ('530')  AND D.CAPITOL IN (1128)       THEN DECODE(CC.NR_COLUMN, '1', D.COL8, '2', D.COL9, '3', D.COL10) END) END) AS COL4,
                                                                                    

 SUM(DISTINCT CASE WHEN DD.COL4 BETWEEN RR.PERS_FROM AND RR.PERS_TO THEN ROUND(CASE  WHEN  D.CFOJ IN ('540','541','550','560') AND D.CAPITOL IN (1124, 1125, 1126) THEN DECODE(CC.NR_COLUMN, '1', D.COL1)
                                                                                     WHEN  D.CFOJ IN ('540','541','550','560') AND D.CAPITOL IN (1127)       THEN DECODE(CC.NR_COLUMN, '1', D.COL3, '2', D.COL4, '3', D.COL5)
                                                                                     WHEN  D.CFOJ IN ('540','541','550','560') AND D.CAPITOL IN (1128)       THEN DECODE(CC.NR_COLUMN, '1', D.COL8, '2', D.COL9, '3', D.COL10) END) END) AS COL5,
 

 SUM(DISTINCT CASE WHEN DD.COL4 BETWEEN RR.PERS_FROM AND RR.PERS_TO THEN ROUND(CASE  WHEN  D.CFOJ IN ('540') AND D.CAPITOL IN (1124, 1125, 1126) THEN DECODE(CC.NR_COLUMN, '1', D.COL1)
                                                                                     WHEN  D.CFOJ IN ('540') AND D.CAPITOL IN (1127)       THEN DECODE(CC.NR_COLUMN, '1', D.COL3, '2', D.COL4, '3', D.COL5)
                                                                                     WHEN  D.CFOJ IN ('540') AND D.CAPITOL IN (1128)       THEN DECODE(CC.NR_COLUMN, '1', D.COL8, '2', D.COL9, '3', D.COL10) END) END) AS COL6, 
 
 SUM(DISTINCT CASE WHEN DD.COL4 BETWEEN RR.PERS_FROM AND RR.PERS_TO THEN ROUND(CASE  WHEN D.CFOJ IN ('541') AND D.CAPITOL IN (1124, 1125, 1126) THEN DECODE(CC.NR_COLUMN, '1', D.COL1)
                                                                                     WHEN D.CFOJ IN ('541') AND D.CAPITOL IN (1127)       THEN DECODE(CC.NR_COLUMN, '1', D.COL3, '2', D.COL4, '3', D.COL5)
                                                                                     WHEN D.CFOJ IN ('541') AND D.CAPITOL IN (1128)       THEN DECODE(CC.NR_COLUMN, '1', D.COL8, '2', D.COL9, '3', D.COL10) END) END) AS COL7, 

 SUM(DISTINCT CASE WHEN DD.COL4 BETWEEN RR.PERS_FROM AND RR.PERS_TO THEN ROUND(CASE  WHEN D.CFOJ IN ('550') AND D.CAPITOL IN (1124, 1125, 1126) THEN DECODE(CC.NR_COLUMN, '1', D.COL1)
                                                                                     WHEN D.CFOJ IN ('550') AND D.CAPITOL IN (1127)       THEN DECODE(CC.NR_COLUMN, '1', D.COL3, '2', D.COL4, '3', D.COL5)
                                                                                     WHEN D.CFOJ IN ('550') AND D.CAPITOL IN (1128)       THEN DECODE(CC.NR_COLUMN, '1', D.COL8, '2', D.COL9, '3', D.COL10) END) END) AS COL8, 

 SUM(DISTINCT CASE WHEN DD.COL4 BETWEEN RR.PERS_FROM AND RR.PERS_TO THEN ROUND(CASE  WHEN D.CFOJ IN ('590') AND D.CAPITOL IN (1124, 1125, 1126) THEN DECODE(CC.NR_COLUMN, '1', D.COL1)
                                                                                     WHEN D.CFOJ IN ('590') AND D.CAPITOL IN (1127)       THEN DECODE(CC.NR_COLUMN, '1', D.COL3, '2', D.COL4, '3', D.COL5)
                                                                                     WHEN D.CFOJ IN ('590') AND D.CAPITOL IN (1128)       THEN DECODE(CC.NR_COLUMN, '1', D.COL8, '2', D.COL9, '3', D.COL10) END) END) AS COL9, 

 SUM(DISTINCT CASE WHEN DD.COL4 BETWEEN RR.PERS_FROM AND RR.PERS_TO THEN ROUND(CASE  WHEN D.CFOJ IN ('620') AND D.CAPITOL IN (1124, 1125, 1126) THEN DECODE(CC.NR_COLUMN, '1', D.COL1)
                                                                                     WHEN D.CFOJ IN ('620') AND D.CAPITOL IN (1127)       THEN DECODE(CC.NR_COLUMN, '1', D.COL3, '2', D.COL4, '3', D.COL5)
                                                                                     WHEN D.CFOJ IN ('620') AND D.CAPITOL IN (1128)       THEN DECODE(CC.NR_COLUMN, '1', D.COL8, '2', D.COL9, '3', D.COL10) END) END) AS COL10, 

 SUM(DISTINCT CASE WHEN DD.COL4 BETWEEN RR.PERS_FROM AND RR.PERS_TO THEN ROUND(CASE  WHEN D.CFOJ IN ('690') AND D.CAPITOL IN (1124, 1125, 1126) THEN DECODE(CC.NR_COLUMN, '1', D.COL1)
                                                                                     WHEN D.CFOJ IN ('690') AND D.CAPITOL IN (1127)       THEN DECODE(CC.NR_COLUMN, '1', D.COL3, '2', D.COL4, '3', D.COL5)
                                                                                     WHEN D.CFOJ IN ('690') AND D.CAPITOL IN (1128)       THEN DECODE(CC.NR_COLUMN, '1', D.COL8, '2', D.COL9, '3', D.COL10) END) END) AS COL11,  

 SUM(DISTINCT CASE WHEN DD.COL4 BETWEEN RR.PERS_FROM AND RR.PERS_TO THEN ROUND(CASE  WHEN D.CFOJ IN ('993') AND D.CAPITOL IN (1124, 1125, 1126) THEN DECODE(CC.NR_COLUMN, '1', D.COL1)
                                                                                     WHEN D.CFOJ IN ('993') AND D.CAPITOL IN (1127)       THEN DECODE(CC.NR_COLUMN, '1', D.COL3, '2', D.COL4, '3', D.COL5)
                                                                                     WHEN D.CFOJ IN ('993') AND D.CAPITOL IN (1128)       THEN DECODE(CC.NR_COLUMN, '1', D.COL8, '2', D.COL9, '3', D.COL10) END) END) AS COL12  
    FROM                                                                                 
 CIS2.VW_DATA_ALL D  
 INNER JOIN CIS2.VW_CL_CFOJ C ON C.CODUL = D.CFOJ                  
 INNER JOIN CIS2.VW_CL_CFOJ CC ON (C.FULL_CODE LIKE '%'||CC.CODUL||';%')
INNER JOIN CIS2.MD_RIND RD ON D.RIND=RD.RIND AND D.ID_MD=RD.ID_MD
INNER JOIN

  (
-------------------------------------------------------------------------------
SELECT 
 DISTINCT D.CUIIO,D.CUIIO_VERS, D. CUATM, D.CFOJ,
SUM(CASE WHEN D.CAPITOL IN (1127) AND D.RIND IN ('400') THEN  D.COL4 ELSE 0 END)  AS COL4 
FROM   
    CIS2.VW_DATA_ALL D       
WHERE
  D.FORM IN (64)             AND 
  D.FORM_VERS = :PFORM_VERS  AND      
  D.PERIOADA =:pPERIOADA AND
  D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%'   AND
  D.CAPITOL IN (1123,1124,1125,1126,1127,1128) 
-- AND  D.CUIIO=40075114
 GROUP BY D.CUIIO,D.CUATM, D.CUIIO_VERS, D.CFOJ

)DD ON D.CUIIO=DD.CUIIO AND D.CUIIO_VERS=DD.CUIIO_VERS
       
 
   CROSS JOIN
  ( 
    SELECT 'Întreprinderile cu numarul de salariati 0-249 persoane'              AS NUME_ROW, '01' AS NR_ROW, 0 AS PERS_FROM, 249 AS PERS_TO FROM DUAL --UNION        
    
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

  D.CAPITOL IN (1124,1125,1126,1127,1128) AND((D.ID_MD BETWEEN 58733 AND 58785) OR D.ID_MD IN (58791,59030,59032))
 -- AND  D.CUIIO=40075114
  
  GROUP BY RR.NUME_ROW,RR.NR_ROW, D.RIND,RD.DENUMIRE,D.CAPITOL, CC.NR_COLUMN

ORDER BY D.RIND||'~'||RR.NR_ROW||'.'||CC.NR_COLUMN)

WHERE COL1>0 OR COL2>0 OR  COL3>0 OR  COL4>0 OR COL5>0 OR  COL6>0 