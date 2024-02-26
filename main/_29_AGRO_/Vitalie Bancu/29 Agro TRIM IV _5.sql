DECLARE -- ====================================================================

  CURSOR C IS
        
        
              SELECT 
                    L.CUIIO,
                    L.CUIIO_VERS
                    
                FROM USER_BANCU.VW_KATALOG_29_AGRO_1059 L  
                            

          
          ;

BEGIN -- ======================================================================
  FOR CR IN C
  LOOP
    UPDATE USER_BANCU.TRIM_4_29_AGRO SET 
      
--    --    CAEM2 = CR.CAEM2,
--         DENUMIRE = CR.DENUMIRE,
--        CUATM = CR.CUATM,
--         CFP = CR.CFP,
--        CFOJ = CR.CFOJ
         CUIIO_VERS = CR.CUIIO_VERS
 --     
  --  ETAPA_PROD = CR.ETAPA_PROD
    
    
    WHERE 
      CUIIO  = CR.CUIIO 
--      AND
--      CUIIO_VERS = CR.CUIIO_VERS 
      
      
      
    ;
  END LOOP;
END; -- =======================================================================


