SELECT 
       D.CUIIO
    FROM
      CIS2.VW_DATA_ALL D  
    WHERE   
       D.PERIOADA IN (:pPERIOADA) AND
       D.FORM = 71 
   
        AND D.FORM_VERS = 2011
        
        AND D.CAPITOL = 1195
GROUP BY 
       D.CUIIO
       
       
      HAVING 
      SUM(CASE WHEN D.CAPITOL = 1195 AND D.RIND IN '1' AND NVAL(D.COL1) = 1 THEN NVAL(D.COL1) ELSE 0 END) > 0    
       
ORDER BY
       D.CUIIO
    
