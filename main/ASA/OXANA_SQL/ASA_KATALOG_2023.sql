CREATE OR REPLACE FORCE VIEW  VW_KATALOG_ASA_2023
(

          CUIIO,
          IDNO,
          fULL_CODE
 )
AS 
SELECT 
          R.CUIIO,
          R.IDNO,
          C.fULL_CODE

           
           
      FROM (SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS2.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (64) AND 
                                  --FORM_VERS = 2009 AND 
                                  CUIIO_VERS <= 2012
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE 
             FC.FORM IN (64) 
             AND FC.STATUT <> '3'
      
             
             ) FC
           INNER JOIN CIS2.RENIM R
               ON (R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS)
               
           INNER join CIS2.VW_CL_CUATM c ON c.codul = R.cuatm    
               ORDER by
               C.fULL_CODE
               
               
