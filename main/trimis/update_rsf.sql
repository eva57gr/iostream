 SELECT 
 
        L.CUIIO,
        L.CUIIO_VERS,
        L.DENUMIRE,
        L.CUATM,
        L.CFP,
        L.CFOJ,
        L.CAEM2
       
        
        FROM  IDNO L 
           LEFT JOIN CIS2.RENIM R 
        
        ON L.CUIIO =   R.CUIIO AND L.CUIIO_VERS = R.CUIIO_VERS
        
        WHERE
        R.CUIIO IS   NOT  NULL 
        
       AND 
        TRIM(L.CUATM) <>  TRIM(R.CUATM)
--        AND  
--        TRIM(L.CAEM2) <>  TRIM(R.CAEM2)
--        AND
--        TRIM(L.CFP) = TRIM(R.CFP)
--          AND
--        TRIM(L.CFOJ) <>  TRIM(R.CFOJ)







