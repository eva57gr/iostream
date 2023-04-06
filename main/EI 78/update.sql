DECLARE -- ====================================================================

  CURSOR C IS
        
        
  
 
        SELECT 
        L.CUIIO,
        L.CUIIO_VERS,
        L.DENUMIRE,
        L.CUATM,
        L.CFP,
--      --  L.CFOJ,
        L.CAEM2,
        L.IDNO
        
        FROM USER_BANCU.ADD_EI_78_23 L
        
        
--        WHERE 
--        
--            L.CUIIO = 4130138667
          
          ;

BEGIN -- ======================================================================
  FOR CR IN C
  LOOP
    UPDATE CIS2.RENIM SET 
      
        CAEM2 = CR.CAEM2,
        DENUMIRE = CR.DENUMIRE,
        CUATM = CR.CUATM,
        CFP = CR.CFP,
--      -- CFOJ = CR.CFOJ
        IDNO = CR.IDNO
 --     
  --  ETAPA_PROD = CR.ETAPA_PROD
    
    
    WHERE 
      CUIIO  = CR.CUIIO 
      AND
      CUIIO_VERS = CR.CUIIO_VERS 
      
      
      
    ;
  END LOOP;
END; -- =======================================================================


DECLARE -- ====================================================================

  CURSOR C IS
        
        
  
 
        SELECT 
        L.CUIIO,
        L.CUIIO_VERS,
        L.DENUMIRE,
        L.CUATM,
        L.CFP,
--      --  L.CFOJ,
        L.CAEM2,
        L.IDNO
        
        FROM USER_BANCU.ADD_EI_78_23 L
        
        
--        WHERE 
--        
--            L.CUIIO = 4130138667
          
          ;

DECLARE
    
  CURSOR UPD_TABLE_OUT IS
    SELECT
      DI.COL1 AS COL1,
      DI.RIND AS RIND

    FROM VW_DATA_ALL DI
      INNER JOIN MD_PERIOADA M ON (M.PERIOADA = :pPERIOADA AND DI.ANUL = M.ANUL)
      
    WHERE
      DI.FORM = 100            AND
      DI.CAPITOL = 37          AND 
      DI.CUIIO = 4             AND 
      DI.NUM = (MOD(:pPERIOADA,4)+1)*3 AND
      DI.RIND IN ('01');

BEGIN
  
    FOR V_GT IN UPD_TABLE_OUT LOOP
    
        UPDATE TABLE_OUT 
        
        SET COL2 = COL2/NOZERO(V_GT.COL1) 

            
        WHERE 
          COD_CUATM IN (:pCOD_CUATM)   AND
          PERIOADA IN (:pPERIOADA)     AND 
          ID_MDTABLE IN (:pID_MDTABLE) AND
          FORM IN (:pFORM)             AND
          FORM_VERS IN (:pFORM_VERS);   
        
    END LOOP;   

END; =======================================================================