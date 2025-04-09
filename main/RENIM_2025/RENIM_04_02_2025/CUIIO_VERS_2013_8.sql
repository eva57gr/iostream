SELECT
  D.CUIIO,
  D.CUIIO_VERS,
  D.DENUMIRE,
  D.CUATM, 
  D.CFP,
  D.CFOJ,
  D.COCM,
  D.CAEM2,
  D.CAEM, ----------------------
  D.IDNO    

FROM USER_BANCU.RENIM_NEW D

                                
--                                
----                                INNER JOIN CIS2.CL_CUATM74 L ON D.CUATM = L.CODUL4 
--                                 LEFT JOIN  USER_BANCU.VW_MAX_RENIM_CIS2   DD ON DD.CUIIO = D.CUIIO    
--                                
--                                
--                                
--                                ) D
                                
                           

                     --  LEFT JOIN  USER_BANCU.VW_MAX_RENIM_CIS2   DD ON DD.CUIIO = D.CUIIO    
                                
                       LEFT JOIN CIS2.VW_CL_CUATM C ON C.CODUL =  D.CUATM
                        
                       --LEFT JOIN CIS2.VW_CL_CAEM2 C ON C.CODUL =  D.CAEM2
                        
                    --   LEFT JOIN CIS2.VW_CL_CFP C ON C.CODUL =  D.CFP
                       
                        WHERE 
                        
                        C.CODUL IS     NULL 