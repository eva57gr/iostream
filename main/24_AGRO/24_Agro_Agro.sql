


        -----------------------------------------------------
             SELECT L.CUIIO
               
               FROM USER_BANCU.AGRO_24_CTIF L  
               
                          LEFT JOIN (
                          
                          
                                SELECT 
                                    D.CUIIO,
                                    D.CUATM
                                      
                                      FROM CIS2.VW_DATA_ALL D
                                      
                                            WHERE
                                                D.FORM = 26
                                                AND D.PERIOADA = 1061
                          
                          ) R ON R.CUIIO = L.CUIIO
                          
                          WHERE
                          
                          R.CUIIO IS NULL
               
                