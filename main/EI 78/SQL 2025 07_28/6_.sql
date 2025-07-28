 CREATE OR REPLACE FORCE VIEW USER_BANCU.EI_78_1053 
AS
 SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   R.CUATM,
                   R.IDNO,
                   R.DENUMIRE
                   
                   
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
                                  WHERE FORM IN (44) AND CUIIO_VERS <= 1053
                                  
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE 
             FC.FORM IN (44) AND FC.STATUT <> '3') FC
             
                            INNER JOIN CIS2.RENIM R ON R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS 