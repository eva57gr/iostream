----
--INSERT INTO CIS2.FORM_CUIIO (
--                    CUIIO,
--                    CUIIO_VERS,
--                    FORM,
--                    FORM_VERS,
--                    STATUT 
--)

               SELECT 
                   R.CUIIO,
                   1061 CUIIO_VERS,
                   33 FORM,
                   1004 FORM_VERS,
                   '1' STATUT
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
                                  WHERE FORM IN (33) AND CUIIO_VERS <= 1061
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE 
             FC.FORM IN (33) AND FC.STATUT <> '3'
             
             ) FC RIGHT  JOIN (

             SELECT DISTINCT CUIIO
FROM USER_BANCU.TRIM_2_24_AGRO


             ) R ON R.CUIIO = FC.CUIIO 
             
             WHERE 
             FC.CUIIO IS   NULL
             
--             AND FC.CUIIO_VERS <> 1061 
             
