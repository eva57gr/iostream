CREATE OR REPLACE FORCE VIEW USER_BANCU.VW_29_AGRO_1061
(

                   CUIIO,
                   CUIIO_VERS,
                   DENUMIRE,
                   CUATM,
                   CFP,
                   CFOJ,
                   CAEM2,
                   IDNO
)
AS

SELECT             FC.CUIIO,
                   FC.CUIIO_VERS,
                   R.DENUMIRE,
                   R.CUATM,
                   R.CFP,
                   R.CFOJ,
                   R.CAEM2,
                   R.IDNO
                   
                
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
             FC.FORM IN (45) AND FC.STATUT <> '3' ) FC 
             
                    INNER JOIN CIS2.RENIM R ON R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS 
 