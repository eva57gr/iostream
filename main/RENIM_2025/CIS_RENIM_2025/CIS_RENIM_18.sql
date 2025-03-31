SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM (
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
             and FC.FORM_VERS = 1004 ) FC 
             
             
             WHERE 
             
             FC.CUIIO IN  (
             38167145,
40237373,
40922650,
40030666,
40193598,
40334863,
41316979,
40748056,
41004091,
37775339,
40028505,
38993357,
40606876,
41031691,
40780640,
40082440,
38959691,
41316703,
41093516,
41269918,
38857648,
41031296,
40209974,
40777141,
40780574,
40841073,
40964794,
37759850,
40082226,
40800199

             )