SELECT 

            SUBSTR(CODUL,2,4) AS COL3
                
                FROM  CIS2.VW_CL_CAEM2
                
                WHERE 
                PRIM IN ('1')
                
                AND 
                (
                SUBSTR(CODUL,2,2)  IN ('47','45')
                
                )