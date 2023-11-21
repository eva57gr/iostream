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
                                  WHERE FORM IN (5,6,11,13,15,18,19,26,29,33,44,45,74) AND CUIIO_VERS <= :pPERIOADA_TRIM
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (5,6,11,13,15,18,19,26,29,33,44,45,74) AND FC.STATUT <> '3'
             
             ) L
             
                            INNER JOIN CIS2.MD_FORM F ON F.FORM  = L.FORM AND F.FORM_VERS  = L.FORM_VERS
             
             GROUP BY 
                     F.DEN_SHORT,
                   L.FORM,
                   L.FORM_VERS      
             
             

UNION  ALL 

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
                                  WHERE FORM IN (SELECT FORM
  FROM CIS2.MD_FORM
 WHERE FORM_VERS = 2000
 AND  FORM <>  100) AND CUIIO_VERS <= :pPERIOADA_ANUL
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (SELECT FORM
  FROM CIS2.MD_FORM
 WHERE FORM_VERS = 2000
 AND  FORM <>  100) AND FC.STATUT <> '3'
             
             ) L
             
                            INNER JOIN CIS2.MD_FORM F ON F.FORM  = L.FORM AND F.FORM_VERS  = L.FORM_VERS
             
             GROUP BY 
                     F.DEN_SHORT,
                   L.FORM,
                   L.FORM_VERS      
             
             

UNION ALL 
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
              FROM CIS.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS.FORM_CUIIO
                                  WHERE FORM IN (SELECT FORM
  FROM CIS.MD_FORM
 WHERE FORM_VERS = 1004) AND CUIIO_VERS <= :pPERIOADA_TRIM
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (SELECT FORM
  FROM CIS.MD_FORM
 WHERE FORM_VERS = 1004) AND FC.STATUT <> '3'
             
             ) L
             
                            INNER JOIN CIS.MD_FORM F ON F.FORM  = L.FORM AND F.FORM_VERS  = L.FORM_VERS
             
             GROUP BY 
                     F.DEN_SHORT,
                   L.FORM,
                   L.FORM_VERS      
             


UNION ALL 

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
              FROM CIS.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS.FORM_CUIIO
                                  WHERE FORM IN (SELECT FORM
  FROM CIS.MD_FORM
 WHERE 
 FORM_VERS = 299
  AND  FORM <>  100
 
 ) AND CUIIO_VERS <= :pPERIOADA_LUNA
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (SELECT FORM
  FROM CIS.MD_FORM
 WHERE 
 FORM_VERS = 299
  AND  FORM <>  100
 
 ) AND FC.STATUT <> '3'
             
             ) L
             
                            INNER JOIN CIS.MD_FORM F ON F.FORM  = L.FORM AND F.FORM_VERS  = L.FORM_VERS
             
             GROUP BY 
                     F.DEN_SHORT,
                   L.FORM,
                   L.FORM_VERS      
             


UNION ALL 

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
              FROM CIS.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS.FORM_CUIIO
                                  WHERE FORM IN (
                                  
                                  SELECT FORM
  FROM CIS.MD_FORM
 WHERE 
 FORM_VERS = 1999
  -- AND  FORM <>  200
 
 ) AND CUIIO_VERS <= :pPERIOADA_ANUL
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (SELECT FORM
  FROM CIS.MD_FORM
 WHERE 
 FORM_VERS = 1999
  --AND  FORM <>  100
 
 ) AND FC.STATUT <> '3'
             
             ) L
             
                            INNER JOIN CIS.MD_FORM F ON F.FORM  = L.FORM AND F.FORM_VERS  = L.FORM_VERS
             
             GROUP BY 
                     F.DEN_SHORT,
                   L.FORM,
                   L.FORM_VERS      
             
             
             
             

ORDER BY
FORM_VERS