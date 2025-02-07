 SELECT 
 
        L.CUIIO,
        L.CUIIO_VERS,
        L.DENUMIRE,
        L.CUATM,
        L.CFP,
        L.CFOJ,
        L.CAEM2,
        L.IDNO
        
        FROM  USER_BANCU.IDNO L 
           LEFT JOIN ADD_NEW_SU_M3_2024 R 
        
        ON L.CUIIO =   R.CUIIO
        
            WHERE
        R.CUIIO IS    NULL