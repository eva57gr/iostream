 UPDATE    USER_BANCU.REG_UNIT_GC_C2
             SET UNIT_CODE_VERS = 1056;
             
             
             SELECT *
             
                FROM USER_BANCU.REG_UNIT_GC_C2;
                
                
                
--                 SET CUATM = CASE WHEN (LENGTH(CUATM) = 6 AND (SUBSTR(CUATM,1,1) = 1  OR SUBSTR(CUATM,1,1) = 3 )) THEN '0'||CUATM ELSE CUATM END,