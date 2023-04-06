--
--
--create table  USER_BANCU.TABLE_OUT_EI_78_3
--AS 
--        
SELECT *
        
        
        FROM CIS2.TABLE_OUT D
        
        
       
  --12215    
    WHERE
      
         
      D.FORM IN  (44)     AND
      D.ID_MDTABLE  IN (12731) AND 
      D.COD_CUATM  IN (:pCOD_CUATM) AND 
      D.FORM_VERS IN (:pFORM_VERS)
       and    D.PERIOADA IN (:pPERIOADA)  
      
      AND SUBSTR(D.NR_ROW, 1, INSTR(D.NR_ROW, '-') - 1) = 41300493
      
      
      ;
      
      
       SELECT * 
      FROM USER_BANCU.TABLE_OUT_EI_78_4 
      
      WHERE 
  --    COL1 IS   NULL 
      
       NUME_ROW LIKE '%41300493%'
      
    --  TABLE_OUT
      
--      WHERE 
--      
--      NUME_ROW LIKE '%38583441%'
      
      