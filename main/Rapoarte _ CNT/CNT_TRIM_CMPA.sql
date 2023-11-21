  SELECT 
  F.DEN_SHORT,
                   L.FORM,
                   L.FORM_VERS,
                   COUNT(L.UNIT_CODE) AS CNT

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
                      WHERE FORM IN (58,61,62) AND UNIT_CODE_VERS <= :pPERIOADA_TRIM
                      
                      
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
 WHERE FC.FORM IN (58,61,62) 
 
 AND FC.STATUT <> '3'
 
) L 
 
                            INNER JOIN CIS2.MD_FORM F ON F.FORM  = L.FORM AND F.FORM_VERS  = L.FORM_VERS
             
             GROUP BY 
                     F.DEN_SHORT,
                   L.FORM,
                   L.FORM_VERS      