DECLARE -- ====================================================================

  CURSOR C IS
        
        
  
                SELECT 
                   FC.CUIIO,
                   FC.CUIIO_VERS

              FROM CIS2.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (15) AND CUIIO_VERS <= 1060
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (15) AND FC.STATUT <> '3'
                            

          
          ;

BEGIN -- ======================================================================
  FOR CR IN C
  LOOP
    UPDATE USER_BANCU.ADD_1_CC SET 
      
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


