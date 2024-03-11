 INSERT INTO CIS2.FORM_REG_UNIT_GC

(
UNIT_CODE, 
UNIT_CODE_VERS,
NR_GOSP,
NR_MAPS,
FORM,
FORM_VERS,
STATUT
            
)


SELECT 
D.UNIT_CODE, 
D.UNIT_CODE_VERS,
D.NR_GOSP,
D.NR_MAPS,
61 FORM,
1004 FORM_VERS,
'1' STATUT
            
        

FROM 
(
SELECT 
FC.UNIT_CODE, 
FC.UNIT_CODE_VERS,
FC.NR_GOSP,
FC.NR_MAPS,
FC.FORM,
FC.FORM_VERS,
FC.STATUT    
  FROM CIS2.FORM_REG_UNIT_GC  FC
       INNER JOIN (  
       
       SELECT UNIT_CODE, 
       
       
       
       MAX (UNIT_CODE_VERS) UNIT_CODE_VERS,
       NR_GOSP,
       NR_MAPS
                       FROM CIS2.FORM_REG_UNIT_GC
                      WHERE FORM IN (:pFORM) AND UNIT_CODE_VERS <= :pPERIOADA
                      
                      
                   GROUP BY 
                   UNIT_CODE,
                    NR_GOSP,
                     NR_MAPS
                   
                   
                   
                   
                   
                   ) BB
           ON (    BB.UNIT_CODE = FC.UNIT_CODE
               AND BB.UNIT_CODE_VERS = FC.UNIT_CODE_VERS
               AND BB.NR_GOSP = FC.NR_GOSP
               AND BB.NR_MAPS = FC.NR_MAPS
               
               )
 WHERE FC.FORM IN (:pFORM) AND FC.STATUT <> '3'
 
 
 
 
 
 ) FC 
 
                                              RIGHT JOIN  USER_BANCU.REG_UNIT_GC3_2024 D  ON FC.UNIT_CODE = D.UNIT_CODE  
                                              
                                              
                                              WHERE 
                                              
                                              FC.UNIT_CODE IS  NULL 
 
 
-- WHERE 
-- FC.UNIT_CODE_VERS = 1048
     
     
--     )
     
--     AND FC.UNIT_CODE_VERS  = 1060
--     AND FC.FORM = 61
--     AND FC.UNIT_CODE_VERS = 1056
--     AND FC.STATUT = '1' 