 SELECT 
 
        L.CUIIO,
        L.CUIIO_VERS,
        L.DENUMIRE,
        L.CUATM,
        L.CFP,
        L.CFOJ,
        L.CAEM2,
        L.BUGET M3_BUGET,
        R.BUGET RENIM_BUGET,
        
        L.TIP M3_TIP,
        R.TIP RENIM_TIP,
        
        
        L.IDNO
        
        FROM  ADD_NEW_SU_M3_2024 L 
           LEFT JOIN CIS2.RENIM R 
        
        ON L.CUIIO =   R.CUIIO AND L.CUIIO_VERS = R.CUIIO_VERS
        
        WHERE
        R.CUIIO IS NOT   NULL 
        
        AND 
        TRIM(L.CUATM) <>  TRIM(R.CUATM)
--        AND  
--        TRIM(L.CAEM2) <>  TRIM(R.CAEM2)
--        AND
--        TRIM(L.CFP) = TRIM(R.CFP)
--          AND
--        TRIM(L.CFOJ) <>  TRIM(R.CFOJ)

--         AND
--        TRIM(L.BUGET) =  TRIM(R.BUGET)
        
--         AND
--        TRIM(L.TIP) =   TRIM(R.TIP)









