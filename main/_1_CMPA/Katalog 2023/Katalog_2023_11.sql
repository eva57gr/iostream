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
--
SELECT 
  UNIT_CODE,
   UNIT_CODE_VERS,
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
      
      UNIT_CODE  IN (
      
      
      249718,
249606,
250851,
249807,
249272,
251044,
249671,
249949,
250276,
251940,
249761,
249556,
250460,
251651,
250570,
251179,
252048,
251315,
250921,
251630,
250798

 )
 
 
 AND UNIT_CODE_VERS <>   1060
 
 
 ORDER BY
 UNIT_CODE_VERS