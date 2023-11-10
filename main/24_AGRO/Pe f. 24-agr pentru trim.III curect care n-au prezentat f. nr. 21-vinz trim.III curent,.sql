SELECT 
D.CUIIO,
D.CUIIO_VERS,
R.DENUMIRE,
R.CUATM,
R.IDNO  

FROM       



      (
      
--      SELECT FC.CUIIO,
--                   FC.CUIIO_VERS,
--                   FC.FORM,
--                   FC.FORM_VERS,
--                   FC.STATUT
--              FROM CIS2.FORM_CUIIO  FC
--                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
--                                   FROM CIS2.FORM_CUIIO
--                                  WHERE FORM IN (45) AND CUIIO_VERS <= 1058
--                               GROUP BY CUIIO) BB
--                       ON (    BB.CUIIO = FC.CUIIO
--                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
--             WHERE FC.FORM IN (45) AND FC.STATUT <> '3'
--             
--             
--             
--             UNION 
             
                   SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS2.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (45) AND CUIIO_VERS <= 1058
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (45) AND FC.STATUT <> '3'
             


 ) 
             
             
             
             D
             
             
             
             
                                INNER JOIN CIS2.RENIM R ON 
                                R.CUIIO = D.CUIIO
                                AND R.CUIIO_VERS = D.CUIIO_VERS 
             
             
             WHERE 
             
             
             D.CUIIO NOT IN (
             
             SELECT FC.CUIIO
--                   FC.CUIIO_VERS,
--                   FC.FORM,
--                   FC.FORM_VERS,
--                   FC.STATUT
              FROM CIS2.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (26) AND CUIIO_VERS <= 1058
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (26) AND FC.STATUT <> '3'
             )