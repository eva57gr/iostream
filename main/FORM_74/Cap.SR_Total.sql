
SELECT 
L.CUIIO,
L.CUATM,
C.DENUMIRE,
C.FULL_CODE 
FROM 
(
 SELECT 
                    DISTINCT D.CUIIO,
                    D.CUATM 
                    FROM CIS2.VW_DATA_ALL D 
                    
                  
                                     
                     
 
                    
                    WHERE
                   (D.FORM=:pFORM) AND
                   (D.FORM_VERS=:pFORM_VERS) AND
                  
                   (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND   
                    D.PERIOADA IN (:pPERIOADA) AND
                    D.FORM IN (74) 
                    AND D.CAPITOL  <> 1199
                    
                    ) L LEFT JOIN (
                    
                    
                    SELECT 
                    DISTINCT D.CUIIO 
                    FROM CIS2.VW_DATA_ALL D 
                    
                  
                                     
                     
 
                    
                    WHERE
                   (D.FORM=:pFORM) AND
                   (D.FORM_VERS=:pFORM_VERS) AND
                  
                   (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND   
                    D.PERIOADA IN (:pPERIOADA) AND
                    D.FORM IN (74) 
                    AND D.CAPITOL  =  1199
                    
                    AND D.RIND NOT IN ('CD')
                    ) R ON R.CUIIO = L.CUIIO 
                    
                    
                    
                        INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = L.CUATM 
                    
                    WHERE 
                    
                    R.CUIIO IS NULL 
                    
                    ORDER BY 
                    C.FULL_CODE
                   