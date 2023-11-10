
--1. Frisrt - First I must update this table 

DECLARE -- ====================================================================

  CURSOR C IS
        
        
            SELECT 
                L.CUIIO,
                L.PERS_IT,
                L.CIF_IT,
                L.ANUL     

                    FROM USER_BANCU.X_BAZA_SONDAJ_TEST L LEFT JOIN 
                    
                                       CIS2.X_BAZA_SONDAJ R ON L.CUIIO = R.CUIIO AND 
                                                                     L.ANUL = R.ANUL  
                                                                     
                                                                     
                                                                     
                                                               WHERE 
                                                               
                                                               R.CUIIO IS NOT NULL ;

BEGIN -- ======================================================================
  FOR CR IN C
  LOOP
    UPDATE CIS2.X_BAZA_SONDAJ SET 
      PERS_IT = CR.PERS_IT,
      CIF_IT = CR.CIF_IT
      
    WHERE 
      CUIIO  = CR.CUIIO AND
      ANUL = CR.ANUL 
      
      
      
    ;
  END LOOP;
END; -- =======================================================================