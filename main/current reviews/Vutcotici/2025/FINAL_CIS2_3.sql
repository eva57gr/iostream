SELECT 
    CUIIO,
    DENUMIRE,
    CUATM,
    DATA_REG,
    COL1 
FROM
(
SELECT 
    L.CUIIO,
    C.DENUMIRE,
    L.CUATM,
    L.DATA_REG,
    C.FULL_CODE,
    L.COL1    
            FROM  (
             SELECT
    DISTINCT 
    D.CUIIO,
     D.CUIIO_VERS,
     D.CUATM,
    D.FORM,
    D.DATA_REG,
    D.COL1
    
    FROM 

    (
                  SELECT DISTINCT 
                          D.CUIIO,
                          D.CUIIO_VERS,
                          MAX(D.CUATM) CUATM,
                          D.FORM,
                          MAX(D.DATA_REG) DATA_REG,
                          'CIS2' AS COL1
                          
            FROM CIS2.VW_DATA_ALL D
            
                 
           WHERE D.PERIOADA = :pPERIOADA AND D.FORM IN (:pFORM)
           
           AND D.CUIIO NOT IN (
            SELECT DISTINCT D.CUIIO
                          
                          
            FROM USER_EREPORTING.VW_DATA_ALL_PRIMIT D
                                        INNER JOIN CIS2.RENIM R ON R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS 
                
           WHERE D.PERIOADA  = :pPERIOADA   AND D.FORM IN (:pFORM)
             AND D.ID_SCHEMA = '2'
             
             )
           
           GROUP BY
             D.CUIIO,
             D.CUIIO_VERS,
             D.CUATM,
             D.FORM
           
           
           UNION 
           
            SELECT DISTINCT 
                          D.CUIIO,
                          D.CUIIO_VERS,
                          D.CUATM,
                          D.FORM,
                          MAX(D.DATA_REG) DATA_REG,
                          'EREPORTING' AS COL1
            FROM USER_EREPORTING.VW_DATA_ALL_PRIMIT D
                INNER JOIN CIS2.RENIM R ON R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS 
           WHERE D.PERIOADA  = :pPERIOADA   AND D.FORM IN (:pFORM)
             AND D.ID_SCHEMA = '2'
             
             GROUP BY
             D.CUIIO,
             D.CUIIO_VERS,
             D.CUATM,
             D.FORM
             
             ) D  LEFT JOIN (
             
              SELECT DISTINCT 
                          D.CUIIO,
                          D.CUIIO_VERS,
                          D.CUATM,
                          D.FORM,
                          'CIS2' AS COL1
                          
            FROM CIS2.VW_DATA_ALL D
            
                 
           WHERE D.PERIOADA = :pPERIOADA AND D.FORM IN (:pFORM)
             ) R ON D.CUIIO = R.CUIIO
             
             
             WHERE
             
             R.CUIIO IS NOT NULL
            ) L 
            
                   INNER JOIN ( 
 
SELECT
D.ITEM_CODE CODUL,
D.A01 AS PRGS,
D.NAME DENUMIRE,
D. ITEM_PATH AS FULL_CODE
 FROM CIS2.VW_CLS_CLASS_ITEM D INNER JOIN (
 SELECT 
ITEM_CODE,
MAX(ITEM_CODE_VERS) ITEM_CODE_VERS

FROM CIS2.VW_CLS_CLASS_ITEM

WHERE 
CLASS_CODE IN ('CUATM') 
GROUP BY 
ITEM_CODE
 ) DD ON D.ITEM_CODE = DD.ITEM_CODE AND D.ITEM_CODE_VERS = DD.ITEM_CODE_VERS  AND D.CLASS_CODE IN ('CUATM')
WHERE 
D. ITEM_PATH LIKE '%'||:pCOD_CUATM||';%'

ORDER BY
D. ITEM_PATH
 
) C ON C.CODUL = L.CUATM
                   
                   UNION ALL 
                   
                   
                   
    SELECT 
    NULL CUIIO,
    DENUMIRE,
    CODUL CUATM,
    NULL DATA_REG,
    FULL_CODE,
    NULL COL1 
                   
                   FROM ( 
 
SELECT
D.ITEM_CODE CODUL,
D.A01 AS PRGS,
D.NAME DENUMIRE,
D. ITEM_PATH AS FULL_CODE
 FROM CIS2.VW_CLS_CLASS_ITEM D INNER JOIN (
 SELECT 
ITEM_CODE,
MAX(ITEM_CODE_VERS) ITEM_CODE_VERS

FROM CIS2.VW_CLS_CLASS_ITEM

WHERE 
CLASS_CODE IN ('CUATM') 
GROUP BY 
ITEM_CODE
 ) DD ON D.ITEM_CODE = DD.ITEM_CODE AND D.ITEM_CODE_VERS = DD.ITEM_CODE_VERS  AND D.CLASS_CODE IN ('CUATM')
WHERE 
D. ITEM_PATH LIKE '%'||:pCOD_CUATM||';%'

ORDER BY
D. ITEM_PATH
 
)
                   
                   WHERE 
                   PRGS IN ('2','3','4','6','8','9')
                   AND CODUL NOT IN ('0000000')
                   
                   
                   
                   ORDER BY 
                   FULL_CODE,
                   CUIIO DESC
                   
                   
                   
                   )
                   
                   
                   
                   
                                    
                   
                   
--WHERE 
------
--CUATM LIKE '45%'


--
--AND 
--COL1  LIKE 'CIS2%'