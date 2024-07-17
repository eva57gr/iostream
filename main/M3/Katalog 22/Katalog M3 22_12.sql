DECLARE -- ====================================================================

  CURSOR C IS
        
        
 SELECT 
 
        L.CUIIO,
        L.CUIIO_VERS,
        L.DENUMIRE,
        L.CUATM,
        L.CFP,
        L.CFOJ,
        L.CAEM2,
        L.BUGET,
        L.TIP
     --   L.IDNO
        FROM USER_BANCU.RSF_CFP L
      ----------------------------------------------  
  ----------------------------------------------      
--        WHERE 
--        
--            L.CUIIO = 4130138667
          
          ;

BEGIN -- ======================================================================
  FOR CR IN C
  LOOP
    UPDATE CIS2.RENIM SET 
      
    --   CAEM2 = CR.CAEM2,
     --  DENUMIRE = CR.DENUMIRE,
    --   CUATM = CR.CUATM
       CFP = CR.CFP
     --  CFOJ = CR.CFOJ
      -- BUGET = CR.BUGET,
     --  TIP = CR.TIP
 --     IDNO = CR.IDNO
      
    WHERE 
      CUIIO  = CR.CUIIO 
      AND
      CUIIO_VERS = CR.CUIIO_VERS 
      
      
      
    ;
  END LOOP;
END; -- =======================================================================