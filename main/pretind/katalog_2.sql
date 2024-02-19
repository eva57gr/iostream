 SELECT 
  D.CUIIO,
  D.CUIIO_VERS,
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
  D.CAEM2,
  D.CAEM,
  D.IDNO    

FROM USER_BANCU.PRETIND_2024 D

                                INNER JOIN CIS2.CL_CUATM74 L ON D.CUATM = L.CODUL4 ) D
                                
                                
                                
                                
                                        
                                