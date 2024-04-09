SELECT
SUBSTR(CODUL,2,4) AS COL3,
FULL_CODE
                
                FROM  CIS2.VW_CL_CAEM2
                
                WHERE 
                PRIM IN ('1')
                
                AND 
                (
                SUBSTR(CODUL,2,2)  IN ('47')
                OR 
                SUBSTR(CODUL,2,3) IN ('451','453','454','462','463','464','465','466','467','468','469')
                 OR 
                SUBSTR(CODUL,2,4) IN ('3514','3523')
                )
                
                
                ORDER BY 
                FULL_CODE