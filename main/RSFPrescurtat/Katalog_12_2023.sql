SELECT *

                    FROM USER_BANCU.VW_MAX_RENIM_CIS2
                    
                    WHERE 
                    
                    CUIIO IN (
                    
                    
                    SELECT 
          R.CUIIO
--          R.CUIIO_VERS,
----           57 FORM,
----           2009 FORM_VERS,
----           '1' STATUT 
--
--           R.IDNO
--           
           
      FROM (
      
      SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS2.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (63) AND 
                                  FORM_VERS = 2000 AND 
                                  CUIIO_VERS <= 2011
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE 
             FC.FORM IN (63) 
             AND FC.STATUT <> '3'
             AND FC.FORM_VERS = 2000
             
      




       ) FC
           INNER JOIN CIS2.RENIM R
               ON (R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS)
               
               WHERE
               1=1
               and   R.cuiio_vers <>  2011 
                    
                    )