
--INSERT INTO CIS2.FORM_CUIIO 
--(
--
--                   CUIIO,
--                   CUIIO_VERS,
--                   FORM,
--                   FORM_VERS,
--                   STATUT
--                   
--)



            SELECT 
                   FC.CUIIO,
                   2013 CUIIO_VERS,
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
              FROM CIS2.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (:pFORM) AND CUIIO_VERS <= :pPERIOADA
                                  
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE 
             FC.FORM IN (:pFORM) AND FC.STATUT <> '3'
             --AND FC.FORM_VERS = 2011
             
             ) FC 
             
             
             WHERE 
          

            FC.CUIIO IN (
            
            SELECT CUIIO
                FROM IDNO
            )

         AND   FC.CUIIO_VERS =     2013
          
          
          --------------------------------------------
























;
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
              FROM CIS2.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (:pFORM) AND CUIIO_VERS <= :pPERIOADA
                                  
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE 
             FC.FORM IN (:pFORM) AND FC.STATUT <> '3'
             --AND FC.FORM_VERS = 2011
             
             ) FC 
             
             
             WHERE 
          

            FC.CUIIO IN (
            
            SELECT CUIIO
                FROM IDNO
            )

        AND   FC.CUIIO_VERS <>    2013
          
          
          