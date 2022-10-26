DECLARE -- ====================================================================

  CURSOR C IS
        
        
     SELECT 
    L.CUIIO,
    L.CUIIO_VERS,
    L.IDNO,
    TRIM(R.IDNO) R_IDNO
    
        FROM USER_BANCU.ADD_NEW_SU L    
        
                                LEFT JOIN CIS2.RENIM R ON R.CUIIO = L.CUIIO AND R.CUIIO_VERS = L.CUIIO_VERS
                                
                                WHERE 
                                R.CUIIO IS NOT NULL 
                                
                                
                                 
                                
                                 
          
          ;

BEGIN -- ======================================================================
  FOR CR IN C
  LOOP
    UPDATE CIS2.RENIM SET 
--      CAEM2 = CR.CAEM2,
--      DENUMIRE = CR.DENUMIRE,
--      CUATM = CR.CUATM,
--      CFP = CR.CFP,
--      CFOJ = CR.CFOJ,
      IDNO = CR.IDNO
      
    WHERE 
      CUIIO  = CR.CUIIO AND
      CUIIO_VERS = CR.CUIIO_VERS 
      
      
      
    ;
  END LOOP;
END; -- =======================================================================