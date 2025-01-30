SELECT
    
     D.CUIIO,
     
  
     SUM(CASE WHEN D.FORM IN (5)  AND D.CAPITOL  IN  (27)   AND D.RIND IN ('10','20') THEN  D.COL1 ELSE 0 END) 
     
     AS REZULTAT
      
    
    FROM CIS.VW_DATA_ALL  D 
   
          
    

  WHERE
  (D.PERIOADA =  479) AND 
  (D.CUIIO=:CUIIO) AND 
 
  
  D.FORM IN (5)  AND D.CAPITOL  IN  (27,0)  
  
  
  
  
  GROUP BY 
  
  D.CUIIO
 