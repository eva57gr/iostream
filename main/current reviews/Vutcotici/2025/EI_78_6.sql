
SELECT 
 TO_NUMBER(CR.NR_ROW) AS ORDINE,
  CR.NUME_ROW AS NR_ROW,
   SUM(CASE WHEN C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%' THEN L.COL1 ELSE NULL END) AS KATALOG,
   SUM(CASE WHEN C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%' THEN L.COL2 ELSE NULL END) AS CIS2,
   SUM(CASE WHEN C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%' THEN L.COL3 ELSE NULL END) AS EREPORTING,
   SUM(CASE WHEN C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%' THEN L.COL4 ELSE NULL END) AS ONLY_CIS2
  
  FROM
  (

-----------------------------------------------------------------

  SELECT 
    C.CODUL,
    C.FULL_CODE,
    COUNT (DISTINCT FC.CUIIO) AS COL1,
    NULL AS COL2,
    NULL AS COL3,
     NULL AS COL4
  FROM (

SELECT
FC.CUIIO,
R.CUATM
FROM
(
SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS2.FORM_CUIIO  FC
                         
              
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (:pFORM) AND CUIIO_VERS <= :pPERIOADA 
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE 
             FC.FORM IN (:pFORM) 
             AND FC.STATUT <> '3'
             AND FC.FORM_VERS IN (:pFORM_VERS)) FC 
                     INNER JOIN CIS2.RENIM R
               ON (R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS)
                INNER JOIN CIS.VW_CL_CUATM C   ON C.CODUL = R.CUATM 
                ) FC
                
                 INNER JOIN CIS.VW_CL_CUATM C ON C.CODUL = FC.CUATM
                GROUP BY C.CODUL, C.FULL_CODE
              ------------------------------------------------------------------------  
              
              UNION 
              
                
    SELECT 
    C.CODUL,
    C.FULL_CODE,
    NULL AS COL1,
    COUNT (DISTINCT FC.CUIIO) AS COL2,
    NULL AS COL3,
    NULL AS COL4
  FROM (

  SELECT DISTINCT   
                    D.CUIIO,
                    MAX(R.CUATM) CUATM
                    
    FROM CIS2.DATA_ALL D
    INNER JOIN CIS2.RENIM R ON R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS 
    WHERE D.PERIOADA = :pPERIOADA 
      AND D.FORM IN (:pFORM)
      AND D.DATA_REG > TO_DATE('01/01/2025 00:00:00', 'MM/DD/YYYY HH24:MI:SS') 
      AND D.FORM_VERS IN (:pFORM_VERS) 
      
      GROUP BY
      D.CUIIO
      ) FC
                
                 INNER JOIN CIS.VW_CL_CUATM C ON C.CODUL = FC.CUATM
                GROUP BY C.CODUL, C.FULL_CODE
                
                
                UNION 
                
                SELECT 
    C.CODUL,
    C.FULL_CODE,
    NULL AS COL1,
    NULL AS COL2,
    COUNT (DISTINCT FC.CUIIO) AS COL3,
    NULL AS COL4
    
  FROM (

  SELECT DISTINCT   
                    D.CUIIO,
                    MAX(R.CUATM) CUATM
                    
    FROM USER_EREPORTING.DATA_ALL_PRIMIT D
    INNER JOIN CIS2.RENIM R ON R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS 
    WHERE D.PERIOADA = :pPERIOADA 
      AND D.FORM IN (:pFORM)
      AND D.ID_SCHEMA = '2'
       AND D.FORM_VERS IN (:pFORM_VERS)  
      AND D.DATA_REG > TO_DATE('01/01/2025 00:00:00', 'MM/DD/YYYY HH24:MI:SS') 
      
       GROUP BY
      D.CUIIO
       ) FC
                
                 INNER JOIN CIS.VW_CL_CUATM C ON C.CODUL = FC.CUATM
                GROUP BY C.CODUL, C.FULL_CODE
                
                
                
                UNION 
                
                
                
                SELECT 
    C.CODUL,
    C.FULL_CODE,
    NULL AS COL1,
    NULL AS COL2,
    NULL AS COL3,
    COUNT (DISTINCT FC.CUIIO) AS COL4
   
    
  FROM (

  SELECT DISTINCT   
                    D.CUIIO,
                    MAX(R.CUATM) CUATM
                    
    FROM CIS2.DATA_ALL D
    INNER JOIN CIS2.RENIM R ON R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS 
    WHERE D.PERIOADA = :pPERIOADA 
      AND D.FORM IN (:pFORM)
     
     
      AND D.DATA_REG > TO_DATE('01/01/2025 00:00:00', 'MM/DD/YYYY HH24:MI:SS') 
      AND D.FORM_VERS IN (:pFORM_VERS) 
      
      AND D.CUIIO NOT IN (
      SELECT DISTINCT CUIIO FROM USER_EREPORTING.DATA_ALL_PRIMIT
      WHERE 
        PERIOADA = :pPERIOADA AND
        FORM IN (:pFORM) AND
        ID_SCHEMA = '2' AND
        DATA_REG > TO_DATE('01/01/2025 00:00:00', 'MM/DD/YYYY HH24:MI:SS')
    )
      GROUP BY
      D.CUIIO
    
      ) FC
                
                 INNER JOIN CIS.VW_CL_CUATM C ON C.CODUL = FC.CUATM
                GROUP BY C.CODUL, C.FULL_CODE
              
              
              ---------------------------------------------------------------------------  
                ) L
                
              
INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = L.CODUL
CROSS JOIN (
  SELECT
    DECODE(CS.CODUL, 
      '0000000','01','0100000','02','1111111','03','0300000','04',
      '1400000','05','3400000','06','3600000','07','4100000','08','4300000','09',
      '4500000','10','4800000','11','6200000','12','7100000','13','7400000','14',
      '7800000','15','2222222','16','1000000','17','2500000','18','3100000','19',
      '3800000','20','5300000','21','5500000','22','6000000','23','6400000','24',
      '6700000','25','8000000','26','8300000','27','8900000','28','9200000','29',
      '3333333','30','1200000','31','1700000','32','2100000','33','2700000','34',
      '2900000','35','5700000','36','8500000','37','8700000','38','9600000','39',
      '9601000', '40',
      '9602000', '41',
      '9603000', '42'
    ) AS NR_ROW,
    CS.DENUMIRE AS NUME_ROW,
    CS.CODUL AS CS_CUATM
  FROM CIS2.VW_CL_CUATM CS
  WHERE CS.CODUL IN (
    '0000000','0100000','1111111','0300000','1400000','3400000','3600000','4100000','4300000','4500000',
    '4800000','6200000','7100000','7400000','7800000','2222222','1000000','2500000','3100000','3800000',
    '5300000','5500000','6000000','6400000','6700000','8000000','8300000','8900000','9200000','3333333',
    '1200000','1700000','2100000','2700000','2900000','5700000','8500000','8700000','9600000',
    '9601000','9602000','9603000'
  )
) CR 
WHERE 1=1
GROUP BY 
  CR.NUME_ROW, 
  TO_NUMBER(CR.NR_ROW),
  CR.CS_CUATM 
ORDER BY
  CR.NR_ROW