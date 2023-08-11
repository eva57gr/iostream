
      SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM 
              (
      
      SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM 
              
              
              CIS.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS.FORM_CUIIO
                                  WHERE FORM IN (:pFORM) AND CUIIO_VERS <= :pPERIOADA
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             
             
             WHERE FC.FORM IN (:pFORM) AND FC.STATUT <> '3' ) FC 
             
             
             WHERE 
             
             FC.CUIIO IN (
--             38506156,
--4069600,
--2749305,
--2585447,
--38398608,
--40922732,
--40878818,
--40451787,
--41350901,
--41406027,
--41562267,
--40062896,
--40795373,
--40938880,
--68819,
--40440594,
--37032905,
--40322831,
--38934573,
--40789730,
--40284869,
--40941505,
--38779026,
--41305303,
--37727062,
--4065035,
--40956292,
--41074281,
--41370298,
--41523750,
--41115139,
--40858499,
--41021801,
--40687171,
--38911307,
--40946135

40687171,
39033346
             )
   
     
              
               
               
              