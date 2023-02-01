-- INSERT INTO CIS.RENIM (
-- 
-- 
--   CUIIO,
--    CUIIO_VERS,
--    DENUMIRE,
--    EDIT_USER,
--    STATUT,
--    CUATM,
--    CFP,
--    CFOJ,
--    COCM,
--    CAEM,
--    BUGET,
--    TIP,
--    PROD,
--    FOR_CUB,
--    ETAPA_PROD,
--    RENIM_PERS,
--    CAEM2
--
-- 
-- )




SELECT 
    CUIIO,
    2011 CUIIO_VERS,
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

                    FROM USER_BANCU.VW_MAX_RENIM_CIS       
                    
    
                  
                    WHERE 
                    
                    CUIIO IN (
            SELECT 
        L.CUIIO
       
        FROM 


(

SELECT     R.CUIIO,
           R.CUIIO_VERS
          
      FROM (SELECT FC.CUIIO,
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
             WHERE FC.FORM IN (:pFORM) AND FC.STATUT <> '3') FC
           INNER JOIN CIS.RENIM R
               ON (R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS)
               
               
               WHERE 
               
               R.CUIIO_VERS <>   2011
                ) L
        
        ) 
        
        AND CUIIO_VERS <>   2011