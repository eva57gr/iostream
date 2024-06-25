               SELECT 
                 DISTINCT 
                 
                   FC.UNIT_CODE,
                   FC.UNIT_CODE_VERS,

                   MAX(RR.NAME) NAME

              FROM
              (  

             SELECT 
                   FC.UNIT_CODE,
                   FC.UNIT_CODE_VERS,
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
                         

                           
             WHERE 
             FC.FORM IN (:pFORM) AND FC.STATUT <> '3' 
             
             
             ORDER BY
             FC.UNIT_CODE_VERS
             
             
             
             ) FC
             
              LEFT JOIN  CIS2.REG_UNIT_GC RR 
                               ON RR.UNIT_CODE = FC.UNIT_CODE
                           AND RR.UNIT_CODE_VERS = FC.UNIT_CODE_VERS
                           
                           
                           GROUP BY
                                              FC.UNIT_CODE,
                                              FC.UNIT_CODE_VERS
