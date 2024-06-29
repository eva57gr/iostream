--
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
                   45 FORM,
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
                                  WHERE FORM IN (45) AND CUIIO_VERS <= 1061
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE 
             FC.FORM IN (45) AND FC.STATUT <> '3'
             
             ) FC RIGHT  JOIN (

             SELECT CUIIO
FROM USER_BANCU.VW_4_AGRO_1061


             ) R ON R.CUIIO = FC.CUIIO 
             
             WHERE 
             FC.CUIIO IS   NULL 
             
--             AND R.CUIIO IN (
--             
--
--SELECT CUIIO 
--
--FROM RENIM 
--
--WHERE
--
--CUIIO IN 
--
--(
--SELECT 
--                   R.CUIIO
--
--FROM
--
--(
--SELECT FC.CUIIO,
--                   FC.CUIIO_VERS,
--                   FC.FORM,
--                   FC.FORM_VERS,
--                   FC.STATUT
--              FROM CIS2.FORM_CUIIO  FC
--                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
--                                   FROM CIS2.FORM_CUIIO
--                                  WHERE FORM IN (45) AND CUIIO_VERS <= 1061
--                               GROUP BY CUIIO) BB
--                       ON (    BB.CUIIO = FC.CUIIO
--                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
--             WHERE 
--             FC.FORM IN (45) AND FC.STATUT <> '3'
--             
--             ) FC RIGHT  JOIN (
--
--             SELECT CUIIO
--FROM USER_BANCU.VW_4_AGRO_1061
--
--
--             ) R ON R.CUIIO = FC.CUIIO 
--             
--             WHERE 
--             FC.CUIIO IS   NULL 
--)
--
--AND 
--CUIIO_VERS  IN (1061)
--
--             
--             ) 
              
             
            
             
