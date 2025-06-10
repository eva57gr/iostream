  SELECT 
        SUBSTR(CODUL, 2, 4) AS COL3
    FROM CIS2.VW_CL_CAEM2
    WHERE 
        PRIM IN ('1') AND 
        (
           
            SUBSTR(CODUL,2,4)  IN ('3514')
            OR 
            SUBSTR(CODUL,2,4)  IN ('3523')
            OR 
            SUBSTR(CODUL,2,3)  IN ('451')
            OR 
            SUBSTR(CODUL,2,4)  IN ('4531')
            OR 
            SUBSTR(CODUL,2,3)  IN ('454')
            OR 
            SUBSTR(CODUL,2,3)  between  ('462') AND ('469')
           
        )
        
        
        
        
        --64-112	ASA - CAP.1 Daca sunt completate rd. 112  în CAP.4 trebuie sa fie un CAEM ?i anume  3514, 3523, 451, 4531, 454, 462-469