

SELECT 
L.CUIIO 
FROM 


(
            SELECT 
                DISTINCT D.CUIIO
                
                    FROM   CIS2.VW_DATA_ALL D
                    
                    WHERE 
                    (D.PERIOADA=:pPERIOADA) AND
  (D.FORM=:pFORM) AND
  (D.FORM_VERS=:pFORM_VERS) AND
  (:pID_MDTABLE=:pID_MDTABLE) AND
   D.FORM = 47 AND
   D.CAPITOL IN (1034,1035) 
   
   
   
   ) L LEFT JOIN (
   
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
                                  WHERE FORM IN (:pFORM) AND CUIIO_VERS <= :pPERIOADA
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (:pFORM) AND FC.STATUT <> '3' )  FC
   
   ) D ON D.CUIIO = L.CUIIO 
   
   WHERE 
   
   D.CUIIO IS  NULL 