    
    CREATE OR REPLACE FORCE VIEW VW_45
(


    CUIIO,
--    CUIIO_VERS,
--    CUATM,
    COL1
 
 )
AS 
SELECT
    DISTINCT 
    D.CUIIO,
    D.COL1
    
    FROM 

    (
    SELECT DISTINCT D.CUIIO,
--                          D.CUIIO_VERS,
--                          D.CUATM,
--                          D.FORM,
                          'CIS2' AS COL1
                          
            FROM CIS2.VW_DATA_ALL D
            
                 
           WHERE D.PERIOADA = 1063 AND D.FORM IN (45)
           
           AND D.CUIIO NOT IN (
            SELECT DISTINCT D.CUIIO
                          
                          
            FROM USER_EREPORTING.VW_DATA_ALL_PRIMIT D
                
           WHERE D.PERIOADA  = 1063   AND D.FORM IN (45)
             AND D.ID_SCHEMA = '2'
           
           )
           
           
           UNION 
           
            SELECT DISTINCT D.CUIIO,
--                          D.CUIIO_VERS,
--                          D.CUATM,
--                          D.FORM,
                          'EREPORTING' AS COL1
            FROM USER_EREPORTING.VW_DATA_ALL_PRIMIT D
                
           WHERE D.PERIOADA  = 1063   AND D.FORM IN (45)
             AND D.ID_SCHEMA = '2'
             
             ) D  LEFT JOIN (
             
              SELECT DISTINCT D.CUIIO,
--                          D.CUIIO_VERS,
--                          D.CUATM,
--                          D.FORM,
                          'CIS2' AS COL1
                          
            FROM CIS2.VW_DATA_ALL D
            
                 
           WHERE D.PERIOADA = 1063 AND D.FORM IN (45)
             ) R ON D.CUIIO = R.CUIIO
             
             
             WHERE
             
             R.CUIIO IS NOT NULL