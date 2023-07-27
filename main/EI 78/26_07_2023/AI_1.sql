-- You SQL wrong


--I modified the query to be more explicit.
--You have to add the sum of columns 1 and 2 from both periods.
--Here you did not understand correctly. The sum must be added to the results of columns 1 and 2 from both periods.


--It will explain what the formula is
-- For PERIOADA 1056
--COL1 = SUM(D.COL4) - 1688 
--COL2 = COL2 = SUM(D.COL4) / CR.COL1 -   1688 / 18.8453 = 89.57140507
-- For PERIOADA 1057
--COL1 = SUM(D.COL4) - 9806
--COL2 = SUM(D.COL4) / CR.COL1 -   9806 / 19.456 = 504.009046052632--
--Now I need the sum of the results from PERIODA 1056 + 1057.
-- COL1 = COL1_1056 + COL1_1057 = 1688 + 9806 = 11494
--COL2 = COL2_1056 + COL2_1057 = 89.57140507 + 504.009046052632 = 593.580451124453
-- This is corect SQL  

--Work with this SQL. That is it  more explicit.  


SELECT 
D.CUIIO,
SUM(D.COL1) AS COL1,
SUM(D.COL2) AS COL2

FROM
(
SELECT 
 
    D.CUIIO,
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

  D.CUIIO,
  CR.COL1
  
  
  UNION 
  
  SELECT 
 
    D.CUIIO,
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

  D.CUIIO,
  CR.COL1
  
  ORDER BY
  CUIIO
  
  ) D 
  
 GROUP BY
 
 D.CUIIO 
 