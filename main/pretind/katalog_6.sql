

INSERT INTO 


 SELECT 
  D.CUIIO,
  2012 CUIIO_VERS,
  D.DENUMIRE,
  D.CUATM,  
  D.CFP,
  D.CFOJ,
  D.COCM,
  D.CAEM2,
  D.CAEM,
  D.IDNO
 FROM
 
 (
 SELECT
  D.CUIIO,
  D.CUIIO_VERS,
  D.DENUMIRE,
  D.CUATM CUATM_4,
  L.CODUL7 CUATM,  
  D.CFP,
  D.CFOJ,
  D.COCM,
  DD.CAEM2,
  D.CAEM,
  D.IDNO    

FROM USER_BANCU.PRETIND_2024 D

                                
                                
                                INNER JOIN CIS2.CL_CUATM74 L ON D.CUATM = L.CODUL4 
                                 LEFT JOIN  USER_BANCU.VW_MAX_RENIM_CIS2   DD ON DD.CUIIO = D.CUIIO    
                                
                                
                                
                                ) D
                                
                           

                       -- LEFT JOIN  USER_BANCU.VW_MAX_RENIM_CIS2   DD ON DD.CUIIO = D.CUIIO    
                                
                 --    LEFT JOIN CIS2.VW_CL_CUATM C ON C.CODUL =  D.CUATM
                        
                       LEFT JOIN CIS2.VW_CL_CAEM2 C ON C.CODUL =  D.CAEM2
                        
                    --  LEFT JOIN CIS2.VW_CL_CFOJ C ON C.CODUL =  L.CFOJ
                       
                        WHERE 
                        
                        C.CODUL IS  NOT  NULL 
                                        ;
                                        
                                        
                                        
                                        
                                        
                                