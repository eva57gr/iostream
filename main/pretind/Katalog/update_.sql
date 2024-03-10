DECLARE -- ====================================================================

  CURSOR C IS
        
        
SELECT CUIIO,
       CUIIO_VERS,     
       FORM,
       FORM_VERS,
       '3' STATUT
  FROM CIS2.FORM_CUIIO
 WHERE CUIIO_VERS = 2012 AND FORM = 71 AND FORM_VERS = 2000 AND STATUT = '1'
 
 
 GROUP BY 
 CUIIO,
       CUIIO_VERS,     
       FORM,
       FORM_VERS,
       ROWNUM
 
 HAVING 
 ROWNUM < 2 
                            

          
          ;

BEGIN -- ======================================================================
  FOR CR IN C
  LOOP
    UPDATE CIS2.FORM_CUIIO SET 
      
--    --    CAEM2 = CR.CAEM2,
--         DENUMIRE = CR.DENUMIRE,
--        CUATM = CR.CUATM,
--         CFP = CR.CFP,
--        CFOJ = CR.CFOJ
         STATUT = CR.STATUT
 --     
  --  ETAPA_PROD = CR.ETAPA_PROD
    
    
    WHERE 
      STATUT  = CR.STATUT 
      AND
      CUIIO_VERS = CR.CUIIO_VERS 
      
      AND FORM  = CR.FORM 
      AND FORM_VERS = CR.FORM_VERS 
      
      
    ;
  END LOOP;
END; -- =======================================================================


