SELECT *
      
      FROM CIS2.VW_DATA_ALL 
        
        WHERE 
        
        1=1
        AND FORM = 37 
        
        AND PERIOADA = 1826
        
        AND CUIIO IN (
           SELECT CUIIO
        FROM USER_BANCU.LIV_2

        )