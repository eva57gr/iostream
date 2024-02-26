
SELECT

FC.CUIIO,
SUBSTR(TO_CHAR(FC.CUIIO), 1,8) NEW_CUIIO

FROM
(


SELECT FC.CUIIO

              FROM CIS2.FORM_CUIIO  FC
                   INNER JOIN (  
                   
                   
                   SELECT CUIIO, 
                   MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (:pFORM) AND CUIIO_VERS <= :pPERIOADA
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
            

 WHERE FC.FORM IN (:pFORM) AND FC.STATUT <> '3' 
             

 FC
             
             
             WHERE
             
             FC.CUIIO  LIKE '%'||41070998||'%' 
             
             
             
             ORDER BY
             FC.CUIIO 