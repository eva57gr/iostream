
SELECT D.*

FROM


(

        SELECT D.*    
        FROM CIS2.CONTROL D
        
        WHERE 
        D.FORM = 64
        AND D.PERIOADA = 2010
        
        AND D.REZULTAT <> 'OK'
        
        ) D
        
        
        WHERE 
        
        D.CONTROL IN (
        
        SELECT 
      B.CONTROL

      
        
        FROM CIS2.MD_CONTROL B  INNER JOIN (
        SELECT 
        A.CONTROL, 
        MAX(A.CONTROL_VERS) CONTROL_VERS
        
        FROM CIS2.MD_CONTROL A
        
        
         WHERE
         1=1
         AND A.FORM  = 64
               
         GROUP BY 
          A.CONTROL
         
         ORDER BY 
          A.CONTROL
        
        )  A  ON A.CONTROL = B.CONTROL AND A.CONTROL_VERS = B.CONTROL_VERS   
        
        
         WHERE
         1=1
         AND B.FORM  = 64
         AND B.STATUT <> '3'
         AND B.PRIORITATEA = '2'
         
         
       
        )
        
        
        
        ORDER BY 
        D.CUIIO