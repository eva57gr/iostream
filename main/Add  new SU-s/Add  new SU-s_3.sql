 SELECT 
 
        L.CUIIO,
        L.CUIIO_VERS,
        L.DENUMIRE,
        L.CUATM,
        L.CFP,
        L.CFOJ
        FROM USER_BANCU.ADD_NEW_SU L
        
        
                        LEFT JOIN CIS2.VW_CL_CUATM C ON C.CODUL =  L.CUATM
                        
                        WHERE 
                        
                        C.CODUL IS NOT NULL 



                