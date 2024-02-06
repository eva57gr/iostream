SELECT 
 
        L.CUIIO,
        L.CUIIO_VERS,
        L.DENUMIRE,
        L.CUATM,
        L.CFP,
        L.CFOJ,
        L.CAEM2,
        L.TIP,
        L.BUGET
        FROM  USER_BANCU.TIC_23 L
        
                    
                    LEFT JOIN CIS2.VW_CL_CUATM C  ON C.CODUL =  L.CUATM  
                     --LEFT JOIN CIS2.VW_CL_CAEM2  C  ON C.CODUL =  L.CAEM2  
                      --  LEFT JOIN CIS2.VW_CL_CFP  C  ON C.CODUL =  L.CFP  
                   -- 
                    
                    WHERE 
                    
                    C.CODUL IS null 