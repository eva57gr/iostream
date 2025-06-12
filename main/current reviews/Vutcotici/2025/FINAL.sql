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
                          D.CUATM,
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
             
              SELECT DISTINCT D.CUIIO,
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
            
                   INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = L.CUATM
                   
                   UNION ALL 
                   
                   
                   
    SELECT 
    NULL CUIIO,
    DENUMIRE,
    CODUL CUATM,
    NULL DATA_REG,
    FULL_CODE,
    NULL COL1 
                   
                   FROM CIS2.VW_CL_CUATM
                   
                   WHERE 
                   PRGS IN ('2')
                   AND CODUL NOT IN ('0000000')
                   
                   
                   
                   ORDER BY 
                   FULL_CODE )
                   
                   
                   
                   
                                    
                   
                   
WHERE 

CUATM LIKE '17%'