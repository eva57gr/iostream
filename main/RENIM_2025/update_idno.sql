 SELECT 
 
        L.CUIIO,
        L.CUIIO_VERS,
        L.DENUMIRE,
        L.CUATM,
        L.CFP,
        L.CFOJ,
        L.CAEM2,
        TRIM(L.IDNO) AS IDNO
         FROM  USER_BANCU.AGRO_36 L
        
        WHERE
        (L.IDNO IS NOT NULL
        AND  
        L.IDNO NOT IN ('???????'))
        AND 
        L.CFOJ IS NOT NULL
        
        AND 
           
        L.CFP IS NOT NULL
        
        ORDER BY
        TRIM(L.IDNO)