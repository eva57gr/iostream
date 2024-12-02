DECLARE
    
  CURSOR UPD_TABLE_OUT IS
    SELECT 
      NR_ROW,

      T.COL1 AS COL1,
      T.COL2 AS COL2,
      T.COL3 AS COL3,
      T.COL4 AS COL4,
      T.COL5 AS COL5,
      T.COL6 AS COL6,
      T.COL7 AS COL7,
      T.COL8 AS COL8,
      T.COL9 AS COL9,
      T.COL10 AS COL10,
      T.COL11 AS COL11

    FROM TABLE_OUT T
      
    WHERE
      T.COD_CUATM IN (:pCOD_CUATM)  AND
      T.FORM = :pFORM         AND
      T.ID_MDTABLE=:pID_MDTABLE  AND      
      T.PERIOADA = :pPERIOADA
      
      
      ;

BEGIN
  
    FOR V_GT IN UPD_TABLE_OUT LOOP
        UPDATE TABLE_OUT 
        
        SET 
            COL2 = V_GT.COL2/NOZERO(V_GT.COL1)*100,           
            COL3 = V_GT.COL3/NOZERO(V_GT.COL1)*100,
            COL4 = V_GT.COL4/NOZERO(V_GT.COL1)*100,
            COL5 = V_GT.COL5/NOZERO(V_GT.COL1)*100,
            COL6 = V_GT.COL6/NOZERO(V_GT.COL1)*100,
            COL7 = V_GT.COL7/NOZERO(V_GT.COL1)*100,
            COL8 = V_GT.COL8/NOZERO(V_GT.COL1)*100,
            COL9 = V_GT.COL9/NOZERO(V_GT.COL1)*100,
            COL10 = V_GT.COL10/NOZERO(V_GT.COL1)*100,
            COL11 = V_GT.COL11/NOZERO(V_GT.COL1)*100
            
        WHERE 
          COD_CUATM IN (:pCOD_CUATM)   AND
          PERIOADA IN (:pPERIOADA)     AND 
          ID_MDTABLE IN (:pID_MDTABLE) AND
          FORM IN (:pFORM)             AND
          FORM_VERS IN (:pFORM_VERS)   AND
          SUBSTR(NR_ROW,0,8) IN (V_GT.NR_ROW);
        
    END LOOP;   

END;