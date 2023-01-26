 SELECT 
 
        L.CUIIO,
        L.CUIIO_VERS,
        L.DENUMIRE,
        L.CUATM,
        L.CFP,
        L.CFOJ,
        L.CAEM2,
        L.IDNO
        FROM USER_BANCU.ADD_NEW_1_INOV_2022 L
        
        
                 --      LEFT JOIN CIS2.VW_CL_CUATM C ON C.CODUL =  L.CUATM
                        
                       -- LEFT JOIN CIS2.VW_CL_CAEM2 C ON C.CODUL =  L.CAEM2
                        
                       LEFT JOIN CIS2.VW_CL_CFOJ C ON C.CODUL =  L.CFOJ
                       
                        WHERE 
                        
                        C.CODUL IS  NULL 