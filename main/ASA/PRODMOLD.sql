


SELECT *

    FROM USER_BANCU.VW_KATALOG_PROD_MOLD_22;


CREATE OR REPLACE FORCE VIEW USER_BANCU.VW_KATALOG_PROD_MOLD_22
(CUIIO, CUIIO_VERS, DENUMIRE, CUATM, CFP, 
 CFOJ, CAEM2)
AS 
SELECT  
    R.CUIIO,
    R.CUIIO_VERS,
    R.DENUMIRE,
   
    R.CUATM,
    R.CFP,
    R.CFOJ,
   
    R.CAEM2
          
      FROM (SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS.FORM_CUIIO
                                  WHERE FORM IN (10) AND CUIIO_VERS <= 2011
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (10) AND FC.STATUT <> '3') FC
           INNER JOIN CIS.RENIM R
               ON (R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS);