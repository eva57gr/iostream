




                                        SELECT 
                                        COUNT ( DISTINCT D.UNIT_CODE) AS CNT   

                                        FROM CIS2.VW_DATA_ALL_GC D
                                        
                                            WHERE
                                            
                                            D.PERIOADA IN (:pPERIOADA)
                                            AND D.FORM IN (:pFORM)