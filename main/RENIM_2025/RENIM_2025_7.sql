 SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM
              ( 
              SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS.FORM_CUIIO
                                  WHERE FORM IN (:pFORM) AND CUIIO_VERS <= :pPERIOADA
                                  
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE 
             FC.FORM IN (:pFORM) AND FC.STATUT <> '3') FC
             
             
             WHERE
             
             FC.CUIIO_VERS <> 2013;
 
 
-- INSERT INTO CIS.RENIM (
--  CUIIO,
--  CUIIO_VERS,
--  DENUMIRE,
--  EDIT_USER,
--  STATUT,
--  CUATM,
--  CFP,
--  CFOJ,
--  COCM,
--  CAEM,
--  BUGET,
--  TIP,
--  PROD,
--  FOR_CUB,
--  ETAPA_PROD,
--  RENIM_PERS,
--  CAEM2  
-- )
--



SELECT 


  CUIIO,
  1064 CUIIO_VERS,
  DENUMIRE,
  EDIT_USER,
  STATUT,
  CUATM,
  CFP,
  CFOJ,
  COCM,
  CAEM,
  BUGET,
  TIP,
  PROD,
  FOR_CUB,
  ETAPA_PROD,
  RENIM_PERS,
  CAEM2      
                    FROM   --USER_BANCU.VW_RENIM_2012_CIS2
                     
                      --     USER_BANCU.VW_MAX_RENIM_CIS
                    
                    --   VW_RENIM_2013_CIS2
                          USER_BANCU.VW_MAX_RENIM_TRIM_CIS
                      --   VW_MAX_RENIM_299_CIS
                          
                    
                    WHERE 
                  
                  

                    
                   
CUIIO IN (

 SELECT CUIIO
        FROM  USER_BANCU.IDNO
---------------------------------------


)
-------------------------------------


--AND CUIIO_VERS <>  1064         


--AND 
--
--
--CUIIO NOT IN (
--
--SELECT 
-- CUIIO
-- 
-- FROM    VW_RENIM_2013_CIS2
-- 
--    --    USER_BANCU.VW_MAX_RENIM_CIS2
--                    
-- 
--                    
--                    WHERE 
--                  
--                  
--
--                    
--                   
--CUIIO IN (
--
-- SELECT
-- DISTINCT  CUIIO
--        FROM  USER_BANCU.RENIM_2_INVEST_24
--
--          )
--
--        
--        AND 
--        
--        
--        CUIIO_VERS  =  2013 
--
--)

ORDER BY 

CUIIO;




SELECT 
 CUIIO
 
 FROM   -- VW_RENIM_2013_CIS2
 
        USER_BANCU.VW_MAX_RENIM_TRIM_CIS2
                    
 
                    
                    WHERE 
                  
                  

                    
                   
CUIIO IN (

 SELECT
 DISTINCT  CUIIO
        FROM  USER_BANCU.RENIM_5_CON

          )

        
        AND 
        
        
        CUIIO_VERS  =  1063 