SELECT 
  UNIT_CODE,
  1052 UNIT_CODE_VERS,
  NR_GOSP,
  NR_MAPS,         
  SURNAME,         
  NAME,            
  PATRONIMIC,      
  CUATM,           
  ADDRESS_1,       
  ADDRESS_2,       
  ADDRESS_3,       
  ADDRESS_4,       
  ENVIRONMENT,     
  CSID,            
  EDIT_USER 

    FROM USER_BANCU.REG_UNIT_GC_MAX
    
    WHERE 
    UNIT_CODE IN (
    
     SELECT 
            UNIT_CODE
            FROM USER_BANCU.CMPA2_1052_FINAL
    
    )
    
    AND UNIT_CODE_VERS <>  1052