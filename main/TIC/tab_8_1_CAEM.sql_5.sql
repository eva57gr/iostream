SELECT 
TRIM(L.CUIIO) CUIIO,
TRIM(R.CUIIO_VERS) CUIIO_VERS,
TRIM(L.CFP) CFP
FROM USER_BANCU.M1 L LEFT JOIN (
SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS2.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (76) AND CUIIO_VERS <= 1064
                                  
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE 
             FC.FORM IN (76) AND FC.STATUT <> '3'
             and FC.FORM_VERS = 1004 
) R ON R.CUIIO = L.CUIIO 

WHERE
R.CUIIO IS NOT NULL