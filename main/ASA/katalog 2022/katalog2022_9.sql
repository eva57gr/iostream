DECLARE -- ====================================================================

  CURSOR C IS
        
  SELECT 
 
  L.CUIIO,
  L.CUIIO_VERS,
  L.DENUMIRE,
  L.CUATM,
  L.CFP,
  L.CFOJ,
  L.COCM,
  L.CAEM2,
  L.CAEM,
  L.IDNO,
  L.PERS,
  L.ETAPA_PROD 
        FROM USER_BANCU.PROD_2023 L   
        
        
        ;

BEGIN -- ======================================================================
  FOR CR IN C
  LOOP
    UPDATE CIS.RENIM SET 
      
       ETAPA_PROD = CR.ETAPA_PROD

      
    WHERE 
      CUIIO  = CR.CUIIO 
      AND
      CUIIO_VERS = CR.CUIIO_VERS 
      
      
      
    ;
  END LOOP;
END; -- =======================================================================