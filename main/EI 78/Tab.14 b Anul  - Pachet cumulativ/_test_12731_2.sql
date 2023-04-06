--
--
create table  USER_BANCU.TABLE_OUT_EI_78_4
AS 

SELECT *

--      D.PERIOADA,
--      D.FORM, 
--      D.COD_CUATM,
--    
--      SUBSTR(D.NR_ROW, 1, INSTR(D.NR_ROW, '-') - 1)  NR_ROW,
--    
--      D.COL1 AS COL1
      

    FROM 
    
    cis2.TABLE_OUT D
    
   -- USER_BANCU.TABLE_OUT_EI_78 D 
       
  --12215    
    WHERE
      
      D.FORM IN  (44)     AND
      D.ID_MDTABLE  IN (12731) AND 
      D.COD_CUATM  IN (0000000) AND 
      D.FORM_VERS IN (1004)
       and    D.PERIOADA IN (1055)  
      
      AND SUBSTR(D.NR_ROW, 1, INSTR(D.NR_ROW, '-') - 1) = 41300493
--      AND D.COL1 IS NOT NULL
      
      
      order BY 
      sUBSTR(D.NR_ROW, 1, INSTR(D.NR_ROW, '-') - 1)