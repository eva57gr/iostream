
SELECT 
L.CUIIO,
R.CUIIO_VERS,
R.IDNO
 
FROM

(
SELECT 
                         
                         
                         R.CUIIO
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
               ON (R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS) ) L  LEFT JOIN CIS2.RENIM R ON R.CUIIO = L.CUIIO AND R.CUIIO_VERS = 2010
               
               WHERE 
               R.CUIIO IS not  NULL 
               
               ORDER BY 
               R.IDNO DESC