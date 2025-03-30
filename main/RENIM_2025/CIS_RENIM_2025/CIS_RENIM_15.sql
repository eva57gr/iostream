INSERT INTO CIS.FORM_CUIIO R (
        CUIIO,
        CUIIO_VERS,
        FORM,
        FORM_VERS,
        STATUT 
)


SELECT FC.CUIIO,
                   1064 CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM(     
      
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
             WHERE FC.FORM IN (44) 
             AND FC.STATUT <> '3'
          
             
             
             ) FC
             
      

WHERE 
FC.CUIIO_VERS <> 1064