         SELECT 
                    FC.UNIT_CODE,    
                    FC.UNIT_CODE_VERS,
                    FC.NR_GOSP,         
                    FC.NR_MAPS,
                    FC.FORM,
                    FC.FORM_VERS,      
                    FC.STATUT    
                   
                   
              FROM(        


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
                   
                   
                   
                   SELECT UNIT_CODE, MAX (UNIT_CODE_VERS) UNIT_CODE_VERS
                                   FROM CIS2.FORM_REG_UNIT_GC
                                  WHERE FORM IN (:pFORM) AND UNIT_CODE_VERS <= :pPERIOADA 
                               GROUP BY UNIT_CODE
                               
                               
                               
                               
                               ) BB
                       ON (    BB.UNIT_CODE = FC.UNIT_CODE
                           AND BB.UNIT_CODE_VERS = FC.UNIT_CODE_VERS)
             WHERE FC.FORM IN (:pFORM) AND FC.STATUT <> '3'
             
             ) FC 
             
             
--             WHERE 
--             1=1
--             AND FC.UNIT_CODE_VERS = 1044