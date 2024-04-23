DECLARE
  CURSOR UPD_TABLE_OUT_AC IS
    SELECT
      '00' NR_ROW,
      T.COL1 AS COL1,
      T.COL2 AS COL2
    FROM CIS2.TABLE_OUT T
    WHERE
      T.COD_CUATM IN (:pCOD_CUATM)  AND
      T.FORM = :pFORM         AND
      T.ID_MDTABLE = 12877   AND      
      T.PERIOADA =(:pPERIOADA-4) AND
      T.NR_ROW IN ('01')
      
      
      UNION 
      
    SELECT
      '02' NR_ROW,
      T.COL1 AS COL1,
      T.COL2 AS COL2
    FROM CIS2.TABLE_OUT T
    WHERE
      T.COD_CUATM IN (:pCOD_CUATM)  AND
      T.FORM = :pFORM         AND
      T.ID_MDTABLE = 12877   AND      
      T.PERIOADA =(:pPERIOADA-4) AND
      T.NR_ROW IN ('03')
      
      
            UNION 
      
    SELECT
      '05' NR_ROW,
      T.COL1 AS COL1,
      T.COL2 AS COL2
    FROM CIS2.TABLE_OUT T
    WHERE
      T.COD_CUATM IN (:pCOD_CUATM)  AND
      T.FORM = :pFORM         AND
      T.ID_MDTABLE = 12877   AND      
      T.PERIOADA =(:pPERIOADA-4) AND
      T.NR_ROW IN ('09')
      
      
                  UNION 
      
    SELECT
      '08' NR_ROW,
      T.COL1 AS COL1,
      T.COL2 AS COL2
    FROM CIS2.TABLE_OUT T
    WHERE
      T.COD_CUATM IN (:pCOD_CUATM)  AND
      T.FORM = :pFORM         AND
      T.ID_MDTABLE = 12877   AND      
      T.PERIOADA =(:pPERIOADA-4) AND
      T.NR_ROW IN ('05')
      
            
                  UNION 
      
    SELECT
      '09' NR_ROW,
      T.COL1 AS COL1,
      T.COL2 AS COL2
    FROM CIS2.TABLE_OUT T
    WHERE
      T.COD_CUATM IN (:pCOD_CUATM)  AND
      T.FORM = :pFORM         AND
      T.ID_MDTABLE = 12877   AND      
      T.PERIOADA =(:pPERIOADA-4) AND
      T.NR_ROW IN ('07')
      
      
                        UNION 
      
    SELECT
      '10' NR_ROW,
      T.COL1 AS COL1,
      T.COL2 AS COL2
    FROM CIS2.TABLE_OUT T
    WHERE
      T.COD_CUATM IN (:pCOD_CUATM)  AND
      T.FORM = :pFORM         AND
      T.ID_MDTABLE = 12877   AND      
      T.PERIOADA =(:pPERIOADA-4) AND
      T.NR_ROW IN ('06')
      
      
      UNION 
      
    SELECT
      '12' NR_ROW,
      T.COL1 AS COL1,
      T.COL2 AS COL2
    FROM CIS2.TABLE_OUT T
    WHERE
      T.COD_CUATM IN (:pCOD_CUATM)  AND
      T.FORM = :pFORM         AND
      T.ID_MDTABLE = 12877   AND      
      T.PERIOADA =(:pPERIOADA-4) AND
      T.NR_ROW IN ('08')
      
      ;
      
    

BEGIN
    FOR C IN UPD_TABLE_OUT_AC LOOP
        UPDATE CIS2.TABLE_OUT 
        SET
            COL3 = ROUND(COL1/CIS2.NOZERO(C.COL1)*100,1),
            COL4 = ROUND(COL2/CIS2.NOZERO(C.COL2)*100,1)
        WHERE 
          NR_ROW = C.NR_ROW    AND
          COD_CUATM IN (:pCOD_CUATM)   AND
          PERIOADA IN (:pPERIOADA)     AND 
          ID_MDTABLE=:pID_MDTABLE AND 
          FORM IN (:pFORM)             AND
          FORM_VERS IN (:pFORM_VERS)AND
          NR_ROW IN ('00','01','02','03','04','05','06','07','08','09','10','11','12','13');  
    END LOOP;  
END;