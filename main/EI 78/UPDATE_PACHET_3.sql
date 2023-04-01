

create table  USER_BANCU.TABLE_OUT_EI_78_1
AS 
        
SELECT *
        
        
        FROM TABLE_OUT D
        
        
       
  --12215    
    WHERE
      
      D.FORM IN  (44)     AND
      D.ID_MDTABLE  IN (12215) AND 
      D.COD_CUATM  IN (0150000) AND 
      D.FORM_VERS IN (1004);
      
      
       SELECT * 
      FROM USER_BANCU.TABLE_OUT_EI_78_1