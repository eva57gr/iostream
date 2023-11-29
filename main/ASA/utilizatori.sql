



                SELECT 
                      D.CUIIO,  
                      D.CAPITOL,
                      D.RIND,
                      D.USER_NAME,
                      D.DATA_REG
                
                
                        FROM CIS2.VW_DATA_ALL D 
                        
                        
                            WHERE 
                            
                                D.FORM  IN (:pFORM)
                                AND D.PERIOADA IN (:pPERIOADA)
                                
                                
              
GROUP BY 


                D.CUIIO,  
                      D.CAPITOL,
                      D.RIND,
                      D.USER_NAME,
                      D.DATA_REG
                      
                      
                      HAVING 
                      D.USER_NAME <>   'bancuvitalie'
                      
                      ORDER BY 
                
                      D.DATA_REG DESC