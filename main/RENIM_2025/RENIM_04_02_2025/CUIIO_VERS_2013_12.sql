------------------------------------------------------------------------------------
--INSERT INTO CIS2.FORM_CUIIO R (
--        CUIIO,
--        CUIIO_VERS,
--        FORM,
--        FORM_VERS,
--        STATUT 
--)
--


--SELECT * 
--
--
-- FROM CIS2.FORM_CUIIO 
-- 
-- WHERE
-- 
-- CUIIO IN (
--
--
--
--SELECT 
--        L.CUIIO
--        2013 CUIIO_VERS,
--        27 FORM,
--        2000    FORM_VERS,
--        '1' STATUT
--        
--        FROM 
--
--
--(


SELECT   
         L.CUIIO 
         -- R_CUIIO,       
        -- L.CUIIO  CUIIO
         
         FROM (

SELECT     R.CUIIO,
           R.CUIIO_VERS
          
      FROM (
      
      
      SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS2.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (44) AND CUIIO_VERS <= 1064
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (44) AND FC.STATUT <> '3'
           --  AND FC.FORM_VERS = 2011
             
             
             ) FC
           INNER JOIN CIS2.RENIM R
               ON (R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS) ) R 
               
               RIGHT  JOIN (
               
              SELECT 
    DISTINCT D.CUIIO 
        FROM CIS2.VW_DATA_ALL  D
        WHERE
        D.FORM IN(:pFORM) AND
        D.PERIOADA IN (:pPERIOADA)
        

        
               ) L ON L.CUIIO = R.CUIIO
               
               
               WHERE 
               R.CUIIO IS     NULL  
           --    )
               

-- L )  
              
               
               
--              AND CUIIO_VERS = 2013
--              
--              AND FORM = 27 