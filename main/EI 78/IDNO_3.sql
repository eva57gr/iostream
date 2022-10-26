    SELECT 
    L.CUIIO,
    L.CUIIO_VERS,
    L.IDNO,
    TRIM(R.IDNO) R_IDNO
    
        FROM USER_BANCU.ADD_NEW_SU L    
        
                                LEFT JOIN CIS2.RENIM R ON R.CUIIO = L.CUIIO AND R.CUIIO_VERS = L.CUIIO_VERS
                                
                                WHERE 
                                R.CUIIO IS NOT NULL 
                                
                                
                                 
                                
                                 