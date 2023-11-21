        SELECT    
                   F.DEN_SHORT,
                   L.FORM,
                   L.FORM_VERS,
                   COUNT(L.CUIIO) AS CNT
                  
                   
                   FROM
      
      (
      SELECT       
                   FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS2.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (5,6,11,13,15,18,19,26,29,33,44,45,58,61,62,74) AND CUIIO_VERS <= :pPERIOADA_TRIM
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (5,6,11,13,15,18,19,26,29,33,44,45,58,61,62,74) AND FC.STATUT <> '3'
             
             ) L
             
                            INNER JOIN CIS2.MD_FORM F ON F.FORM  = L.FORM AND F.FORM_VERS  = L.FORM_VERS
             
             GROUP BY 
                     F.DEN_SHORT,
                   L.FORM,
                   L.FORM_VERS      
             
             