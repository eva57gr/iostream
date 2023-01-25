 SELECT 
 
        L.CUIIO,
        L.CUIIO_VERS,
        L.DENUMIRE,
        L.CUATM,
        L.CFP,
        L.CFOJ,
        L.CAEM2
        FROM USER_BANCU.ADD_NEW_1_TUR L
        
        
                       LEFT JOIN CIS2.VW_CL_CUATM C ON C.CODUL =  L.CUATM
                        
                    --   LEFT JOIN CIS2.VW_CL_CAEM2 C ON C.CODUL =  L.CAEM2
                        
                        WHERE 
                        
                        C.CODUL IS  NULL 



                