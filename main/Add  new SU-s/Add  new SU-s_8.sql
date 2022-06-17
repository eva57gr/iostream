DECLARE -- ====================================================================

  CURSOR C IS
        
        
 SELECT 
 
        L.CUIIO,
        L.CUIIO_VERS,
        L.DENUMIRE,
        L.CUATM,
        L.CFP,
        L.CFOJ
        FROM USER_BANCU.ADD_NEW_SU L
          
          ;

BEGIN -- ======================================================================
  FOR CR IN C
  LOOP
    UPDATE RENIM SET 
      DENUMIRE = CR.DENUMIRE,
      CUATM  = CR.CUATM,
      CFP = CR.CFP,
      CFOJ = CR.CFOJ
    WHERE 
      CUIIO  = CR.CUIIO AND
      CUIIO_VERS = CR.CUIIO_VERS 
      
      
      
    ;
  END LOOP;
END; -- =======================================================================