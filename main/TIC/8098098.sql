
SELECT 
    CUIIO
    

                    FROM  
                          USER_BANCU.VW_MAX_RENIM_CIS2_2013
                          --USER_BANCU.VW_MAX_RENIM_TRIM_CIS2
                    
                    WHERE 
                    
                    CUIIO IN (
                
SELECT 
    CUIIO
    

                    FROM  
                          USER_BANCU.VW_MAX_RENIM_CIS2
                          --USER_BANCU.VW_MAX_RENIM_TRIM_CIS2
                    
                    WHERE 
                    
             (       CUIIO IN (
                  SELECT  
                      L.CUIIO
  

                   FROM USER_BANCU.KAT_112 L 
            
    )         

AND CUIIO_VERS <> 2013 )

AND CUIIO NOT IN 

(
SELECT 
    CUIIO
    

                    FROM  
                          USER_BANCU.VW_MAX_RENIM_CIS2_2013
                          --USER_BANCU.VW_MAX_RENIM_TRIM_CIS2
                    
                    WHERE 
                    
                    CUIIO IN (
                  SELECT  
                      L.CUIIO
  

                   FROM USER_BANCU.KAT_112 L             
    )         
)


AND CUIIO_VERS <> 2013             
    )         




