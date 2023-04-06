SELECT
DISTINCT 
      D.PERIOADA,
      D.FORM, 
      D.ID_MDTABLE,
      D.COD_CUATM,
      D.FORM_VERS,
    
      SUBSTR(D.NR_ROW, 1, INSTR(D.NR_ROW, '-') - 1)  NR_ROW,
    
      D.COL1 AS COL1
      

    FROM 
    
    CIS2.TABLE_OUT D
    
   -- USER_BANCU.TABLE_OUT_EI_78 D 
       
  --12215    
    WHERE
      
      D.FORM IN  (:pFORM)     AND
      D.ID_MDTABLE  IN (:pID_MDTABLE) AND 
      D.COD_CUATM  IN (:pCOD_CUATM) AND 
      D.FORM_VERS IN (:pFORM_VERS) AND 
      D.PERIOADA IN (:pPERIOADA) 
      
      AND D.COL1 IS NOT NULL