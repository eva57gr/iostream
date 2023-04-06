SELECT

      D.PERIOADA,
      D.FORM, 
      D.COD_CUATM,
    
      SUBSTR(D.NR_ROW, 1, INSTR(D.NR_ROW, '-') - 1)  NR_ROW,
    
      D.COL1 AS COL1
      

    FROM 
    
    cis2.TABLE_OUT D
    
   -- USER_BANCU.TABLE_OUT_EI_78 D 
       
  --12215    
    WHERE
      
      D.FORM IN  (:pFORM)     AND
      D.ID_MDTABLE  IN (:pID_MDTABLE) AND 
      D.COD_CUATM  IN (:pCOD_CUATM) AND 
      D.FORM_VERS IN (:pFORM_VERS)
       and    D.PERIOADA IN (:pPERIOADA)  
      
      AND SUBSTR(D.NR_ROW, 1, INSTR(D.NR_ROW, '-') - 1) = 41300493
--      AND D.COL1 IS NOT NULL
      
      
      order BY 
      sUBSTR(D.NR_ROW, 1, INSTR(D.NR_ROW, '-') - 1)
      
      