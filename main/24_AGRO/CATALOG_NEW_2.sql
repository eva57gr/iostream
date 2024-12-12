SELECT 
L.CUIIO 
FROM
(
SELECT 
CUIIO
FROM USER_BANCU.IDNO

UNION ALL 

SELECT 
TO_NUMBER(SUBSTR(CUIIO, 1, LENGTH(CUIIO) - 2)) AS CUIIO
FROM USER_BANCU.IDNO


ORDER BY
CUIIO) L LEFT JOIN (

      SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS2.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (45) AND CUIIO_VERS <= 1063
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (45) AND FC.STATUT <> '3' 

) R ON R.CUIIO = L.CUIIO 

WHERE 
R.CUIIO IS NULL 