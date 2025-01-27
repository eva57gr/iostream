--    
--    CREATE OR REPLACE FORCE VIEW VW_27
--(
--
--
--    CUIIO,
--    CUIIO_VERS,
--    CUATM,
--    COL1
-- 
-- )
--AS 
    
    SELECT
    DISTINCT 
    D.CUIIO,
--    D.CUIIO_VERS,
--    D.CUATM,
    D.COL1
    
    FROM 

    (
    SELECT DISTINCT D.CUIIO,
--                          D.CUIIO_VERS,
--                          D.CUATM,
--                          D.FORM,
                          'CIS2' AS COL1
                          
            FROM CIS2.VW_DATA_ALL D
            
                 
           WHERE D.PERIOADA = 2013 AND D.FORM IN (27)
           
           AND D.CUIIO NOT IN (
            SELECT DISTINCT D.CUIIO
                          
                          
            FROM USER_EREPORTING.VW_DATA_ALL_PRIMIT D
                
           WHERE D.PERIOADA  = 2013   AND D.FORM IN (27)
             AND D.ID_SCHEMA = '2'
           
           )
           
           
           UNION 
           
            SELECT DISTINCT D.CUIIO,
--                          D.CUIIO_VERS,
--                          D.CUATM,
--                          D.FORM,
                          'EREPORTING' AS COL1
            FROM USER_EREPORTING.VW_DATA_ALL_PRIMIT D
                
           WHERE D.PERIOADA  = 2013   AND D.FORM IN (27)
             AND D.ID_SCHEMA = '2'
             
             ) D