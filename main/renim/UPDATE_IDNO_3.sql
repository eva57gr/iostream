DECLARE -- ====================================================================

  CURSOR C IS
        
        
  
     SELECT  CUIIO, 
                    
                            IDNO
                            
                            FROM USER_BANCU.CIS2_R_29
                            
                            
--                            WHERE 
--                            
--                            CUIIO_VERS = 2011
--                    
--                            AND IDNO IS NOT  NULL   
--                            
----                            AND CUIIO = 40420077
        
        

          
          ;

BEGIN -- ======================================================================
  FOR CR IN C
  LOOP
    UPDATE CIS2.RENIM SET 
      
--    --    CAEM2 = CR.CAEM2,
--        DENUMIRE = CR.DENUMIRE,
--        CUATM = CR.CUATM,
--        CFP = CR.CFP,
--        CFOJ = CR.CFOJ
        IDNO = CR.IDNO
 --     
  --  ETAPA_PROD = CR.ETAPA_PROD
    
    
    WHERE 
      CUIIO  = CR.CUIIO 
--      AND
--      CUIIO_VERS = CR.CUIIO_VERS 
      
      
      
    ;
  END LOOP;
END; -- =======================================================================


