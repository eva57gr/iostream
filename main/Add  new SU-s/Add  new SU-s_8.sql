DECLARE -- ====================================================================

  CURSOR C IS
        
        
  
 
        SELECT 
        L.CUIIO,
        L.CUIIO_VERS,
        L.DENUMIRE,
        L.CUATM,
        L.CFP,
--      --  L.CFOJ,
        L.CAEM2,
        L.IDNO
        
        FROM USER_BANCU.ADD_EI_78_23 L
        
        
--        WHERE 
--        
--            L.CUIIO = 4130138667
          
          ;

BEGIN -- ======================================================================
  FOR CR IN C
  LOOP
    UPDATE CIS2.RENIM SET 
      
        CAEM2 = CR.CAEM2,
        DENUMIRE = CR.DENUMIRE,
        CUATM = CR.CUATM,
        CFP = CR.CFP,
--      -- CFOJ = CR.CFOJ
        IDNO = CR.IDNO
 --     
  --  ETAPA_PROD = CR.ETAPA_PROD
    
    
    WHERE 
      CUIIO  = CR.CUIIO 
      AND
      CUIIO_VERS = CR.CUIIO_VERS 
      
      
      
    ;
  END LOOP;
END; -- =======================================================================