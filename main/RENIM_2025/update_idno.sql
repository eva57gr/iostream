 SELECT 
 
        L.CUIIO,
        L.CUIIO_VERS,
        L.DENUMIRE,
        L.CUATM,
        L.CFP,
        L.CFOJ,
        L.CAEM2,
        RTRIM(TRIM(L.IDNO)) AS IDNO
         FROM  USER_BANCU.AGRO_16 L
        
        WHERE
        (L.IDNO IS NOT NULL
        AND  
        L.IDNO NOT IN ('???????'))
        AND 
        L.CFOJ IS NOT NULL
        
        AND 
           
        L.CFP IS NOT NULL
        
        
        
        GROUP BY 
        L.CUIIO,
        L.CUIIO_VERS,
        L.DENUMIRE,
        L.CUATM,
        L.CFP,
        L.CFOJ,
        L.CAEM2,
        L.IDNO
        
        HAVING 
        LENGTH(L.IDNO) > 13
        
        ORDER BY        
        IDNO