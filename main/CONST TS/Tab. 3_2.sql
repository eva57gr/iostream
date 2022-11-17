DECLARE
    
  CURSOR UPD_TABLE_OUT IS
    
    
    SELECT
      SUM(DI.COL1) AS COL1

    FROM VW_DATA_ALL DI
      
    WHERE
      DI.FORM = 100            AND
      DI.CAPITOL = 36          AND 
      DI.CUIIO = 2             AND 
      DI.PERIOADA = :pPERIOADA AND
      DI.RIND = '01'
      
      
      
      ;

BEGIN
  
    FOR V_GT IN UPD_TABLE_OUT LOOP
    
        UPDATE TABLE_OUT 
        
        SET COL2 = COL2/NOZERO(V_GT.COL1),
            COL4 = COL4/NOZERO(V_GT.COL1),
            COL6 = COL6/NOZERO(V_GT.COL1),
            COL8 = COL8/NOZERO(V_GT.COL1)
            
        WHERE 
          COD_CUATM IN (:pCOD_CUATM)   AND
          PERIOADA IN (:pPERIOADA)     AND 
          ID_MDTABLE IN (:pID_MDTABLE) AND
          FORM IN (:pFORM)             AND
          FORM_VERS IN (:pFORM_VERS)   AND
          NR_ROW IN ('01','02','03','04','05','06');
            
    END LOOP;   

END;