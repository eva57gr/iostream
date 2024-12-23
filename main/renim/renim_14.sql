--INSERT INTO CIS2.FORM_CUIIO  (
--
--CUIIO,
--CUIIO_VERS,
--FORM,
--FORM_VERS,
--STATUT
--
--)

SELECT 
L.CUIIO,
L.CUIIO_VERS,
4 FORM,
2000 FROM_VERS,
'1' STATUT


FROM USER_BANCU.IDNO L  LEFT JOIN (


            SELECT 
                CUIIO,
                CUIIO_VERS
                FROM CIS2.FORM_CUIIO
                
                WHERE 
                FORM = 4
                AND CUIIO_VERS = 2013
                AND STATUT = '1'
) R ON R.CUIIO = L.CUIIO

WHERE 
R.CUIIO IS NULL 