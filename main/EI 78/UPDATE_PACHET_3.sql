

create table  USER_BANCU.TABLE_OUT_EI_78_2
AS 
        
SELECT *
        
        
        FROM TABLE_OUT D
        
        
       
  --12215    
    WHERE
      
      D.FORM IN  (44)     AND
      D.ID_MDTABLE  IN (12695) AND 
      D.COD_CUATM  IN (0000000) AND 
      D.FORM_VERS IN (1004)
      AND D.PERIOADA IN (1055)
      
      
      ;
      
      
       SELECT * 
      FROM USER_BANCU.TABLE_OUT_EI_78_2 
      
      WHERE 
  --    COL1 IS   NULL 
      
       NUME_ROW LIKE '%41300493%'
      
    --  TABLE_OUT
      
--      WHERE 
--      
--      NUME_ROW LIKE '%38583441%'
      
      