                SELECT 
                       D.CUIIO,
                       R.DENUMIRE,
                       R.CUATM,
                       C.DENUMIRE CUATM_DENUMIRE,
                       D.RIND,
                       SUM(D.COL1) AS COL1,
                       SUM(D.COL2) AS COL2,
                       SUM(D.COL3) AS COL3,
                       SUM(D.COL4) AS COL4    
                
                        FROM CIS2.VW_DATA_ALL D
                        
                                    INNER JOIN CIS2.RENIM R ON R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS
                                    INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = R.CUATM 
                        
                        WHERE 
                        D.FORM = :pFORM 
                        AND D.PERIOADA = :pPERIOADA  
                        AND D.CAPITOL IN (401)
                        AND D.RIND IN ('2300')
                        
                        GROUP BY 
                      D.CUIIO,
                       R.DENUMIRE,
                       R.CUATM,
                       C.DENUMIRE,
                       D.RIND
                         
                         ORDER BY 
                         SUM(D.COL1) DESC