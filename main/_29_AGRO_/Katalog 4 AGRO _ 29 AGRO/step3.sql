
--INSERT INTO CIS2.FORM_CUIIO (
--                    CUIIO,
--                    CUIIO_VERS,
--                    FORM,
--                    FORM_VERS,
--                    STATUT 
--)

               SELECT 
                   FC.CUIIO,
                   1057 CUIIO_VERS,
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
                                  WHERE FORM IN (45) AND CUIIO_VERS <= 1057
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE 
             FC.FORM IN (45) AND FC.STATUT <> '3'
             
             ) FC LEFT  JOIN (

             SELECT CUIIO
FROM USER_BANCU.VW_4_AGRO_1057


             ) R ON R.CUIIO = FC.CUIIO 
             
             WHERE 
             R.CUIIO IS     NULL 
              