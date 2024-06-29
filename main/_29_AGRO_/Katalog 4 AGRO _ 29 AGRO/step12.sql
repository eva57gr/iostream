            SELECT 
                DISTINCT D.CUIIO,
                D.CUIIO_VERS,
                D.CUATM
                
                    FROM CIS2.VW_DATA_ALL D
                    
                    WHERE
                    D.FORM IN (45)
                    AND D.PERIOADA IN (:pPERIOADA)
                    
                    AND 
                    
                    D.CUIIO IN (
                    
                    SELECT 
                   FC.CUIIO
             
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
             
             ) FC LEFT  JOIN (

             SELECT CUIIO
FROM USER_BANCU.VW_4_AGRO_1061


             ) R ON R.CUIIO = FC.CUIIO 
             
             WHERE 
             R.CUIIO IS   NULL 
             
                    )
                    
                    
                    