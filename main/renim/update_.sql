DECLARE -- ====================================================================

  CURSOR C IS

SELECT
  D.CUIIO,
  D.CUIIO_VERS,
  D.DENUMIRE,
  D.CUATM,
  D.CFP,
  D.CFOJ,
  D.CAEM2,
  D.IDNO
  FROM TRIM_2_24_AGRO D
  
  
  ORDER BY 
  D.CFOJ
  
  ;        
  
BEGIN -- ======================================================================
  FOR CR IN C
  LOOP
    UPDATE CIS2.RENIM SET 
      
      DENUMIRE = CR.DENUMIRE,
      CUATM = CR.CUATM
--      CFP = CR.CFP,
    --  CFOJ = CR.CFOJ
--      CAEM2 = CR.CAEM2,
--      IDNO = CR.IDNO
      

    WHERE 
      CUIIO  = CR.CUIIO 
      AND
      CUIIO_VERS = CR.CUIIO_VERS 
      
      
      
    ;
  END LOOP;
END; -- =======================================================================


