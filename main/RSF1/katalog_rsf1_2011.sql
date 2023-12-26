SELECT 
          R.CUIIO,
          R.CUIIO_VERS,
          R.IDNO
           
           
      FROM (SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS2.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (57) AND 
                                  FORM_VERS = 2009 AND 
                                  CUIIO_VERS <= 2011
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE 
             FC.FORM IN (57) 
             AND FC.STATUT <> '3'
             AND FC.FORM_VERS = 2009
             
             ) FC
           INNER JOIN CIS2.RENIM R
               ON (R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS)
               
               WHERE
               1=1
               and   R.cuiio_vers =    2011 
               
               
               
               


