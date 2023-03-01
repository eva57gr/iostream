--INSERT INTO CIS2.FORM_REG_UNIT_GC
--
--(
--UNIT_CODE, 
--UNIT_CODE_VERS,
--NR_GOSP,
--NR_MAPS,
--FORM,
--FORM_VERS,
--STATUT
--            
--)


SELECT 
D.UNIT_CODE, 
D.UNIT_CODE_VERS,
D.NR_GOSP,
D.NR_MAPS,
61 FORM,
1004 FORM_VERS,
'1' STATUT
            
           
            
            FROM USER_BANCU.CMPA1_v1 D
            
                            LEFT JOIN REG_UNIT_GC RN
                        ON     D.UNIT_CODE = RN.UNIT_CODE
                  AND D.UNIT_CODE_VERS = RN.UNIT_CODE_VERS
                  AND D.NR_GOSP = RN.NR_GOSP
                  AND D.NR_MAPS = RN.NR_MAPS
                  
                  
                  WHERE 
                  
                  RN.UNIT_CODE IS NOT  NULL