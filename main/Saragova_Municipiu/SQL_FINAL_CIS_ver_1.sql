--
--CREATE OR REPLACE FORCE VIEW VW_36_CNT
--(
--
--
--    CUIIO,
--    DENUMIRE,
--    CUATM,
--    COL1 
-- 
-- )
--AS 

SELECT 
    CUIIO,
    DENUMIRE,
    CUATM,
    COL1 
FROM
(
SELECT 
    L.CUIIO,
    C.DENUMIRE,
    L.CUATM,
    C.FULL_CODE,
    L.COL1    
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
                          'CIS' AS COL1
                          
            FROM CIS.VW_DATA_ALL D
            
                 
           WHERE D.PERIOADA = :pPERIOADA AND D.FORM IN (:pFORM)
           
           AND D.CUIIO NOT IN (
            SELECT DISTINCT D.CUIIO
                          
                          
            FROM USER_EREPORTING.VW_DATA_ALL_PRIMIT D
                                        INNER JOIN CIS2.RENIM R ON R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS 
                
           WHERE D.PERIOADA  = :pPERIOADA   AND D.FORM IN (:pFORM)
             AND D.ID_SCHEMA = '1'
           
           )
           
           
           UNION 
           
            SELECT DISTINCT D.CUIIO,
                          D.CUIIO_VERS,
                          D.CUATM,
                          D.FORM,
                          'EREPORTING' AS COL1
            FROM USER_EREPORTING.VW_DATA_ALL_PRIMIT D
                INNER JOIN CIS.RENIM R ON R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS 
           WHERE D.PERIOADA  = :pPERIOADA   AND D.FORM IN (:pFORM)
             AND D.ID_SCHEMA = '1'
             
             ) D  LEFT JOIN (
             
              SELECT DISTINCT D.CUIIO,
                          D.CUIIO_VERS,
                          D.CUATM,
                          D.FORM,
                          'CIS' AS COL1
                          
            FROM CIS.VW_DATA_ALL D
            
                 
           WHERE D.PERIOADA = :pPERIOADA AND D.FORM IN (:pFORM)
             ) R ON D.CUIIO = R.CUIIO
             
             
             WHERE
             
             R.CUIIO IS NOT NULL
            ) L 
            
                   INNER JOIN CIS.VW_CL_CUATM C ON C.CODUL = L.CUATM
                   
                   UNION ALL 
                   
                   
                   
    SELECT 
    NULL CUIIO,
    DENUMIRE,
    CODUL CUATM,
    FULL_CODE,
    NULL COL1 
                   
                   FROM CIS2.VW_CL_CUATM
                   
                   WHERE 
                   PRGS IN ('2')
                   AND CODUL NOT IN ('0000000')
                   
                   
                   
                   ORDER BY 
                   FULL_CODE )
                   
                   
                   WHERE 
                   1=1 
                 --  AND CUATM LIKE '01%'
                   
                   
                   
                   
                   ;
                   
                   
                   
--SELECT *
--   
--
--      FROM  VW_36_CNT;
                   