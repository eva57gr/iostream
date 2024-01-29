







                    
                        SELECT 
                                D.*
                            
                            FROM CIS2.VW_DATA_ALL_FR D
                            
                            WHERE 
                            
                                D.FORM IN (57)
                                
                                AND D.PERIOADA IN (:pPERIOADA)
                                
                                
                                AND 
                                DATA_REG <= TO_DATE('01/14/2024 00:00:00', 'MM/DD/YYYY HH24:MI:SS')
                                
                                
--                                (
----                                DATA_REG <= TO_DATE('01/05/2024 00:00:00', 'MM/DD/YYYY HH24:MI:SS')
--                                 
--                                DATA_REG >= TO_DATE('01/01/2024 00:00:00', 'MM/DD/YYYY HH24:MI:SS')
--                                )
--                                
                                
                                
                                ORDER BY
                                 DATA_REG ASC  