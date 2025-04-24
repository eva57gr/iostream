SELECT 
    CC.CODUL,
    CC.DENUMIRE,
    CC.FULL_CODE,
    COUNT (DISTINCT CASE WHEN D.COL1 IS NOT NULL THEN D.CUIIO END) AS   TOTAL,
    COUNT (DISTINCT CASE WHEN D.COL1 IN ('EREPORTING') THEN D.CUIIO END) AS   EREPORTING,
    COUNT (DISTINCT CASE WHEN D.COL1 IN ('CIS2') THEN D.CUIIO END ) AS   CIS2
   FROM  (
   SELECT
    DISTINCT 
    D.CUIIO,
     D.CUIIO_VERS,
     D.CUATM,
    D.FORM,
    D.COL1
    
    FROM 

    (
    SELECT DISTINCT D.CUIIO,
                         D.CUIIO_VERS,
                          D.CUATM,
                          D.FORM,
                          'CIS2' AS COL1
                          
            FROM CIS2.VW_DATA_ALL D
            
                 --208
           WHERE D.PERIOADA = :pPERIOADA AND D.FORM IN (:pFORM)
           
           AND D.CUIIO NOT IN (
            SELECT DISTINCT D.CUIIO
                          
                          
            FROM USER_EREPORTING.DATA_ALL_PRIMIT D
                                      --  INNER JOIN CIS2.RENIM R ON R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS 
                
           WHERE 
             D.PERIOADA  = :pPERIOADA   AND D.FORM IN (:pFORM)
             AND D.ID_SCHEMA = '2'
             AND D.DATA_REG  > TO_DATE('01/01/2025 00:00:00', 'MM/DD/YYYY HH24:MI:SS') 
           
           )
           
           
           UNION 
           
            SELECT DISTINCT D.CUIIO,
                          D.CUIIO_VERS,
                          R.CUATM,
                          D.FORM,
                          'EREPORTING' AS COL1
            FROM USER_EREPORTING.DATA_ALL_PRIMIT D
                INNER JOIN CIS2.RENIM R ON R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS 
           WHERE D.PERIOADA  = :pPERIOADA   AND D.FORM IN (:pFORM)
             AND D.ID_SCHEMA = '2'
              AND D.DATA_REG  > TO_DATE('01/01/2025 00:00:00', 'MM/DD/YYYY HH24:MI:SS') 
             
             ) D  LEFT JOIN (
             
              SELECT DISTINCT D.CUIIO,
                          D.CUIIO_VERS,
                          R.CUATM,
                          D.FORM,
                          'CIS2' AS COL1
                          
            FROM CIS2.DATA_ALL D
            INNER JOIN CIS2.RENIM R ON R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS 
            
               
           WHERE D.PERIOADA = :pPERIOADA AND D.FORM IN (:pFORM)
           
            AND D.DATA_REG  > TO_DATE('01/01/2025 00:00:00', 'MM/DD/YYYY HH24:MI:SS') 
             ) R ON D.CUIIO = R.CUIIO
             
             
             WHERE
             
             R.CUIIO IS NOT NULL
             
             
             
             
             ) D
   
                 INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = D.CUATM
                 INNER JOIN CIS2.VW_CL_CUATM CC ON C.FULL_CODE LIKE '%'||CC.CODUL||';%'
                 
                 
                 
                 WHERE 
                 
                 D.CUIIO IS NOT NULL
                 
                 AND CC.PRGS IN ('2')
                 
                 GROUP BY 
                  CC.CODUL,
                  CC.DENUMIRE,
                  CC.FULL_CODE
                 
                 ORDER BY 
                 CC.FULL_CODE
                 
                 
                
                 
                 
                 
                 
                 
