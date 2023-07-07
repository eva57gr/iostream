SELECT
CUIIO,
LISTAGG(DEN_SHORT, ',') WITHIN GROUP (ORDER BY DEN_SHORT) AS DEN_SHORT 
FROM 

    (
    SELECT '37787130' AS CUIIO,
            '4' AS DEN_SHORT
            
     FROM DUAL       
     
     
     UNION 
     
         SELECT '37787130' AS CUIIO,
            '44' AS DEN_SHORT
            
     FROM DUAL       
     
     
          UNION 
     
         SELECT '37787130' AS CUIIO,
            '21' AS DEN_SHORT
            
     FROM DUAL  )
     
     GROUP BY 
     CUIIO