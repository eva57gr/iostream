CREATE OR REPLACE FORCE VIEW VW_27
(


    CUIIO,
    CUIIO_VERS,
    CUATM,
    FORM,
    COL1
 
 )
AS 
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
            
                 
           WHERE D.PERIOADA = 2013 AND D.FORM IN (27)
           
           AND D.CUIIO NOT IN (
            SELECT DISTINCT D.CUIIO
                          
                          
            FROM USER_EREPORTING.VW_DATA_ALL_PRIMIT D
                                        INNER JOIN CIS2.RENIM R ON R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS 
                
           WHERE D.PERIOADA  = 2013   AND D.FORM IN (27)
             AND D.ID_SCHEMA = '2'
           
           )
           
           
           UNION 
           
            SELECT DISTINCT D.CUIIO,
                          D.CUIIO_VERS,
                          D.CUATM,
                          D.FORM,
                          'EREPORTING' AS COL1
            FROM USER_EREPORTING.VW_DATA_ALL_PRIMIT D
                INNER JOIN CIS2.RENIM R ON R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS 
           WHERE D.PERIOADA  = 2013   AND D.FORM IN (27)
             AND D.ID_SCHEMA = '2'
             
             ) D  LEFT JOIN (
             
              SELECT DISTINCT D.CUIIO,
                          D.CUIIO_VERS,
                          D.CUATM,
                          D.FORM,
                          'CIS2' AS COL1
                          
            FROM CIS2.VW_DATA_ALL D
            
                 
           WHERE D.PERIOADA = 2013 AND D.FORM IN (27)
             ) R ON D.CUIIO = R.CUIIO
             
             
             WHERE
             
             R.CUIIO IS NOT NULL;
             
             
            SELECT *    
            FROM  VW_27