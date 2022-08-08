
SELECT 
CUIIO,
DENUMIRE,
CUATM,
COL31 AS CAEM2,
CAPITOL,
CAPITOL_DEN,
COL1
FROM 

(
SELECT 
            DISTINCT D.CUIIO,
                     R.DENUMIRE,
                     R.CUATM,
                     D.CAPITOL,
                     D.CAPITOL_DEN,
                     SUM(D.COL1) AS COL1,
                     D.COL31   
   

            
          
            
                FROM CIS2.VW_DATA_ALL D
                                     INNER JOIN CIS2.RENIM R ON R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS    
                        
                
                    WHERE 
                    
                 
        
                    D.FORM IN (64)
                    AND D.PERIOADA = 2010   
               
        
 
              
              
              
            

GROUP BY 
            D.CUIIO,
            D.COL31,
            D.CAPITOL,
               R.DENUMIRE,
                     R.CUATM,
                     D.CAPITOL_DEN   
           
            
            
            HAVING 
(
               D.COL31  LIKE  '45%' 
                    OR
                      D.COL31  LIKE  '46%'
                     OR 
                     
                      D.COL31  LIKE  '47%'   
                      
                      ) )
                      
                      WHERE 
                      
                      CUIIO IN (
                      SELECT 
       DISTINCT  D.CUIIO    
 
            FROM CIS2.VW_DATA_ALL D
                    WHERE 
                    D.FORM IN (64)
                    AND D.PERIOADA = 2010   
   
                    GROUP BY 
                    D.CUIIO 
                    
                    HAVING 
                   SUM(CASE  WHEN D.CAPITOL IN (1178,1179,1180) THEN NVAL(D.COL1) ELSE 0 END ) > 0
         
                      
                      )
                      
                     






ORDER BY 
CUIIO