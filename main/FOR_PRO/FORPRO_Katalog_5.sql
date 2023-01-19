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
        FROM USER_BANCU.ADD_NEW_SU L
        
        
        WHERE 
        
            L.CUIIO IN (
            SELECT 
        R.CUIIO
        
            
        FROM     USER_BANCU.ADD_NEW_SU_M3 L  
        RIGHT  JOIN  USER_BANCU.ADD_NEW_SU R 
        ON L.CUIIO = R.CUIIO
        
                WHERE 
                L.CUIIO IS  NULL   
            )

          ;

BEGIN -- ======================================================================
  FOR CR IN C
  LOOP
    UPDATE CIS2.RENIM SET 
      
       CAEM2 = CR.CAEM2,
     --  DENUMIRE = CR.DENUMIRE,
       CUATM = CR.CUATM,
       CFP = CR.CFP,
       CFOJ = CR.CFOJ,
       BUGET = CR.BUGET,
       TIP = CR.TIP
 --     IDNO = CR.IDNO
      
    WHERE 
      CUIIO  = CR.CUIIO 
      AND
      CUIIO_VERS = CR.CUIIO_VERS 
      
      
      
    ;
  END LOOP;
END; -- =======================================================================