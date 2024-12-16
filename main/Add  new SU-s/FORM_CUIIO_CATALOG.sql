----------------------------
--------------------------------
SELECT 
                   FC.CUIIO
--                   FC.CUIIO_VERS,
--                   FC.FORM,
--                   FC.FORM_VERS,
--                   FC.STATUT
                   
                   FROM 

(      
      SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS.FORM_CUIIO
                                  WHERE FORM IN (:pFORM) AND CUIIO_VERS <= :pPERIOADA
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (:pFORM) AND FC.STATUT <> '3' 
             
             
             
             
             
             ) FC LEFT JOIN (
             
             SELECT 
             CUIIO
             FROM USER_BANCU.C5
             ) R ON R.CUIIO = FC.CUIIO 
              
             WHERE 
              R.CUIIO  IS   NULL 
             
             
             
             -- 10023
             -- 9832