DECLARE -- ====================================================================

  CURSOR C IS
        
        
  
SELECT 
CUIIO,
CUIIO_VERS,
TIP_LOCAL
  FROM USER_BANCU.ADD_1_CC

;

BEGIN -- ======================================================================
  FOR CR IN C
  LOOP
    UPDATE CIS2.RENIM SET 
      
--    --    CAEM2 = CR.CAEM2,
--         DENUMIRE = CR.DENUMIRE,
--        CUATM = CR.CUATM,
--         CFP = CR.CFP,
--        CFOJ = CR.CFOJ
         TIP_LOCAL = CR.TIP_LOCAL
 --     
  --  ETAPA_PROD = CR.ETAPA_PROD
    
    
    WHERE 
      CUIIO  = CR.CUIIO 
      AND
      CUIIO_VERS = CR.CUIIO_VERS 
      
      
      
    ;
  END LOOP;
END; -- =======================================================================


