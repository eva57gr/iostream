DECLARE
    
  CURSOR C IS
    SELECT
     DISTINCT 
      D.PERIOADA,
      D.FORM, 
      D.COD_CUATM,
    
      SUBSTR(D.NR_ROW, 1, INSTR(D.NR_ROW, '-') - 1)  NR_ROW,
    
      D.COL1 AS COL1
      

    FROM 
    
    TABLE_OUT D
    
  --  USER_BANCU.TABLE_OUT_EI_78_4 D 
       
  --12215    
    WHERE
      
      D.FORM IN  (:pFORM)     AND
      D.ID_MDTABLE  IN (:pID_MDTABLE) AND 
      D.COD_CUATM  IN (:pCOD_CUATM) AND 
      D.FORM_VERS IN (:pFORM_VERS)
        and 
      D.PERIOADA IN (:pPERIOADA)   
      
      AND D.COL1 IS NOT NULL
       
      
      ;  
      
      
      
      

BEGIN
  
    FOR CR IN C LOOP
    
     
    
       UPDATE TABLE_OUT 
        
  --  UPDATE  USER_BANCU.TABLE_OUT_EI_78_4
    
      
        SET  COL1 = CR.COL1 

--      SELECT *
      
--      FROM TABLE_OUT         
        WHERE 
          COD_CUATM IN (:pCOD_CUATM)   AND
          PERIOADA IN (:pPERIOADA)     AND 
          ID_MDTABLE IN (:pID_MDTABLE) AND
          FORM IN (:pFORM)             AND
          FORM_VERS IN (:pFORM_VERS) AND    
          SUBSTR(NR_ROW, 1, INSTR(NR_ROW, '-') - 1) =  CR.NR_ROW  
          
          AND COL1 IS NULL 
          
          ;
         
        
       
        
    
            
    END LOOP;   

END;