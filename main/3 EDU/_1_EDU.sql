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
                                  WHERE FORM IN (40) AND 
                                  FORM_VERS = 2000 AND 
                                  CUIIO_VERS <= 2013
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE 
             FC.FORM IN (40) 
             AND FC.STATUT <> '3'
             AND FC.FORM_VERS = 2000
             
             ) FC
           INNER JOIN CIS2.RENIM R
               ON (R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS)
               
               WHERE
               1=1
              -- and   R.cuiio_vers =    2012 
               
               AND 
               R.CUIIO IN (


7026617,

  7026285,

  7027829,

  7026652,

  7026770,

7032032,

7032150,

7036573,

7026617,

7026285,

7027829,

7026652,

7026770,

  7035958,

 7035740,

 7029320,

7029395,

7030145


)

--               AND     R.IDNO IS NOT   NULL