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





SELECT 
  D.UNIT_CODE,
  D.UNIT_CODE_VERS,
  D.NR_GOSP,
  D.NR_MAPS,         
  D.SURNAME,         
  D.NAME,            
  D.PATRONIMIC,      
  D.CUATM,           
  D.ADDRESS_1,       
  D.ADDRESS_2,       
  D.ADDRESS_3,       
  D.ADDRESS_4,       
  D.ENVIRONMENT,     
  D.CSID,            
  D.EDIT_USER 
            
            FROM USER_BANCU.REG_UNIT_3_CMPA_2024 D
            
                            LEFT JOIN CIS2.REG_UNIT_GC RN
                        ON     D.UNIT_CODE = RN.UNIT_CODE
                  AND D.UNIT_CODE_VERS = RN.UNIT_CODE_VERS
                  AND D.NR_GOSP = RN.NR_GOSP
                  AND D.NR_MAPS = RN.NR_MAPS
                  
                  
                  WHERE 
                  
                  RN.UNIT_CODE IS  NOT  NULL
                  
                  
                  ORDER BY 
                   D.NR_GOSP
                  
                  
                  