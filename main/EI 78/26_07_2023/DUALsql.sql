SELECT
D.CUIIO,
SUM(D.COL1) AS COL1,
SUM(D.COL2) AS COL2

FROM
(
SELECT 
 
    D.CUIIO,
    D.PERIOADA,
    SUM(D.COL4) COL1,
    SUM(D.COL4) / CR.COL1 AS COL2,
    CR.COL1 AS COL3 
FROM (
   SELECT 
        19206  AS CUIIO,
        1057 PERIOADA,
        9806 COL4
    
    FROM DUAL
    
    UNION ALL 
    
    SELECT 
        19206  AS CUIIO,
        1056 PERIOADA,
        1688 COL4
       FROM DUAL 
        
        ) D 
        
        CROSS JOIN (
        SELECT
           D.PERIOADA,
            SUM(D.COL1) AS COL1
                        
                  FROM (
                  SELECT 
        44519  AS ID_MD,
        1057 PERIOADA,
        19.456 COL1
    
    FROM DUAL
    
    UNION ALL 
    
    SELECT 
        44519  AS ID_MD,
        1056 PERIOADA,
        18.8453 COL1
    
    FROM DUAL
                  ) D
                        WHERE
                        (D.PERIOADA = :pPERIOADA) AND  
                            
                           D.ID_MD  = 44519 
                           
                           
                           GROUP BY 
                           D.PERIOADA
                           
                         
  ) CR
        ----------------------------------------------------------------------------   
        
   WHERE 

  (D.PERIOADA = :pPERIOADA) AND 
 
 
  
  
  D.CUIIO = 19206
 
  GROUP BY 
  D.PERIOADA, 
  D.CUIIO,
  CR.COL1
  
  
  UNION 
  
  SELECT 
 
    D.CUIIO,
    D.PERIOADA,
    
    SUM(D.COL4) COL1,
    SUM(D.COL4) / CR.COL1 AS COL2,
    CR.COL1 AS COL3 
FROM CIS2.DATA_ALL D 
        
        CROSS JOIN (
        SELECT
           D.PERIOADA,
            SUM(D.COL1) AS COL1
                        
                  FROM (
                  SELECT 
        44519  AS ID_MD,
        1057 PERIOADA,
        19.456 COL1
    
    FROM DUAL
    
    UNION ALL 
    
    SELECT 
        44519  AS ID_MD,
        1056 PERIOADA,
        18.8453 COL1
    
    FROM DUAL
                  ) D
                        WHERE
                        (D.PERIOADA = :pPERIOADA-1) AND 
                            
                           D.ID_MD  = 44519 
                           
                           
                           GROUP BY 
                           D.PERIOADA
                           
                         
  ) CR
        ----------------------------------------------------------------------------   
        
   WHERE 

  (D.PERIOADA = :pPERIOADA-1) AND 
  (D.FORM =44) AND
 
  D.FORM IN (44) 
  
  AND D.CUIIO = 19206
 
  GROUP BY 
D.PERIOADA,
  D.CUIIO,
  CR.COL1
  
  ORDER BY
  CUIIO
  
  ) D 
  
 GROUP BY
 D.CUIIO 