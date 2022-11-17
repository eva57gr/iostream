
SELECT 
CUIIO 
FROM 

(
SELECT

    D.CUIIO,
    R.DENUMIRE,
    D.RIND,
    SUM(D.COL1) AS COL1
    
    
     FROM CIS2.VW_DATA_ALL D    
                INNER JOIN CIS2.RENIM R ON R.CUIIO = D.CUIIO AND R.CUIIO_VERS  = D.CUIIO_VERS   
     
     WHERE 
     
     D.FORM  =  34
     AND D.PERIOADA = 2010
     AND D.CAPITOL = 383
     AND D.RIND IN ('90')
     
     GROUP BY 
     D.CUIIO,
     R.DENUMIRE,
     D.RIND      
       
      
      HAVING 
      SUM(D.COL1) < 50000
     
     ORDER BY 
     SUM(D.COL1) DESC 
    

)
