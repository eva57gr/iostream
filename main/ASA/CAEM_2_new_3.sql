SELECT 
        SUBSTR(CODUL, 2, 4) AS COL3
    FROM CIS2.VW_CL_CAEM2
    WHERE 
        PRIM IN ('1') AND 
        (
            SUBSTR(CODUL, 2, 3) IN ('451', '454')
            OR 
            SUBSTR(CODUL, 2, 2) IN ('47')
            OR 
            SUBSTR(CODUL, 2, 4) IN ('4532') 
         --   64-111	ASA - CAP.1 Daca sunt completate rd. 111  în CAP.4 trebuie sa fie un CAEM ?i anume G451, 4532, 454, 47

        )
