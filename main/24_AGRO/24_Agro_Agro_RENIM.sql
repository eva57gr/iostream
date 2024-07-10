SELECT     
           R.CUIIO,
           R.DENUMIRE,
           R.CUATM,
           C.DENUMIRE,
           C.FULL_CODE,
           R.IDNO
           --R.CUIIO_VERS
          
      FROM (
      
      
      SELECT       FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS2.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (:pFORM) AND CUIIO_VERS <= :pPERIOADA
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (:pFORM) AND FC.STATUT <> '3'
             
             
             
             
             
             ) FC
           INNER JOIN CIS2.RENIM R
               ON (R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS)
               INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = R.CUATM
               
               WHERE 
               FC.CUIIO IN (
               
               


        -----------------------------------------------------
             SELECT L.CUIIO
--             ,
--                    R.CUATM    
--               
               FROM USER_BANCU.AGRO_24_CTIF L  
               
                          LEFT JOIN (
                          
                          
                                SELECT 
                                    D.CUIIO,
                                    D.CUATM
                                      
                                      FROM CIS2.VW_DATA_ALL D
                                      
                                            WHERE
                                                D.FORM = 26
                                                AND D.PERIOADA = 1061
                          
                          ) R ON R.CUIIO = L.CUIIO
                          
                          WHERE
                          
                          R.CUIIO IS NULL
               
                
               )
               
               
               ORDER BY 
               C.FULL_CODE 