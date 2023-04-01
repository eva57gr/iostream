SELECT

      D.PERIOADA,
      D.FORM, 
      D.COD_CUATM,
    
      SUBSTR(D.NR_ROW, 1, INSTR(D.NR_ROW, '-') - 1)  NR_ROW,
    
      D.COL1 AS COL1
      

    FROM TABLE_OUT D
       
  --12215    
    WHERE
      
      D.FORM IN  (:pFORM)     AND
      D.ID_MDTABLE  IN (:pID_MDTABLE) AND 
      D.COD_CUATM  IN (:pCOD_CUATM) AND 
      D.FORM_VERS IN (:pFORM_VERS)
      
      
      