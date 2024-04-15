SELECT
D.RIND,
D.DENUMIRE,
D.ORDINE,
SUM(D.COL1) AS COL1,
SUM(D.COL2) AS COL2,
--SUM(D.COL3) AS COL3_3,
ROUND((SUM(D.COL1) / SUM(D.COL3) * 100 ),1)   AS COL3,
--SUM(D.COL4) AS COL4_4,
ROUND((SUM(D.COL2) / SUM(D.COL4) * 100 ),1)   AS COL4
 

FROM    
( 
    SELECT
    '00' AS RIND,
    'Autorizatii de construire eliberate pentru cladiri rezidentiale - total (r.01 + r.05)' AS DENUMIRE,
    0 AS ORDINE,
    SUM(D.COL1) AS COL1,
    SUM(D.COL2) AS COL2,
    NULL AS COL3,
    NULL AS COL4
    
  FROM
    CIS2.VW_DATA_ALL D
  WHERE
    D.FORM = 15 AND
    D.CAPITOL = 1000 AND
    D.RIND IN('01', '05')
    AND D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA
    
   -- AND  D.PERIOADA IN (:pPERIOADA)
    AND (CIS2.D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%')
    
    
    AND D.CUIIO = 4496728
    
    
    UNION 
    
     SELECT
    '00' AS RIND,
    'Autorizatii de construire eliberate pentru cladiri rezidentiale - total (r.01 + r.05)' AS DENUMIRE,
    0 AS ORDINE,
    NULL AS COL1,
    NULL AS COL2,
    SUM(D.COL1) AS COL3,
    SUM(D.COL2) AS COL4
  FROM
    CIS2.VW_DATA_ALL D
  WHERE
    D.FORM = 15 AND
    D.CAPITOL = 1000 AND
    D.RIND IN('01', '03', '04', '05', '06', '07')  
    AND  D.PERIOADA BETWEEN FLOOR((:pPERIOADA/4)*4)-4 AND :pPERIOADA
    AND (CIS2.D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%')
      AND D.CUIIO = 4496728
    
    ORDER BY
    ORDINE
    ) D
    
    
    GROUP BY
    D.RIND,
D.DENUMIRE,
D.ORDINE