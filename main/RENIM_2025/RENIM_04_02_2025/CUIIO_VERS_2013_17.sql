SELECT 
L.CUIIO,
--L.CUIIO_VERS,
R.CUATM

FROM


(
SELECT L.CUIIO,
       R.CUIIO_VERS
FROM USER_BANCU.F_XML_FORMS L LEFT JOIN (
SELECT FC.CUIIO,
       FC.CUIIO_VERS  
              FROM(
SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS2.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (:pFORM) AND CUIIO_VERS <= :pPERIOADA
                                  
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE 
             FC.FORM IN (:pFORM) AND FC.STATUT <> '3'
             --and FC.FORM_VERS = 1004 
             
             ) FC
             
             
             WHERE
               1=1

) R  ON R.CUIIO = L.CUIIO



            
WHERE 
R.CUIIO  IS NOT  NULL  ) L  INNER JOIN CIS2.RENIM R ON R.CUIIO = L.CUIIO AND R.CUIIO_VERS = L.CUIIO_VERS