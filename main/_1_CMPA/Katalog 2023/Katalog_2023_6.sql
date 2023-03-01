
--
--INSERT INTO CIS2.REG_UNIT_GC
--
--(
--
--UNIT_CODE,
--  UNIT_CODE_VERS,
--  NR_GOSP,
--  NR_MAPS,         
--  SURNAME,         
--  NAME,            
--  PATRONIMIC,      
--  CUATM,           
--  ADDRESS_1,       
--  ADDRESS_2,       
--  ADDRESS_3,       
--  ADDRESS_4,       
--  ENVIRONMENT,     
--  CSID,            
--  EDIT_USER 
--)



----------------------------------------------------
SELECT 
  UNIT_CODE,
  1056 UNIT_CODE_VERS,
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
    1=1
   AND  UNIT_CODE IN (
    
     SELECT UNIT_CODE
             
                FROM USER_BANCU.REG_UNIT_GC_C2
    
    )
    
    AND UNIT_CODE_VERS <>   1056