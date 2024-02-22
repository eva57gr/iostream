DECLARE -- ====================================================================

  CURSOR C IS
SELECT
  D.CUIIO,
  D.CUIIO_VERS,
  D.DENUMIRE,
  D.CUATM
  FROM USER_BANCU.KAT_6_IT D ;        
  
BEGIN -- ======================================================================
  FOR CR IN C
  LOOP
    UPDATE USER_EREPORTING.RENIM_EXTRA SET 
      
      DENUMIRE = CR.DENUMIRE,
        CUATM = CR.CUATM

    WHERE 
      CUIIO  = CR.CUIIO 
      AND
      CUIIO_VERS = CR.CUIIO_VERS 
      
      
      
    ;
  END LOOP;
END; -- =======================================================================


