SELECT 
TRIM(L.CUIIO) CUIIO,
L.DENUMIRE,
L.CUATM,
L.CFP,
L.CFOJ,
L.COCM,       
L.CAEM2,
L.IDNO        


FROM USER_BANCU.ASA_2024 L LEFT JOIN (

SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS2.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (64) AND CUIIO_VERS <= 2013
                                  
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE 
             FC.FORM IN (64) AND FC.STATUT <> '3'
             
) R ON R.CUIIO = L.CUIIO 

WHERE
R.CUIIO IS  NULL
