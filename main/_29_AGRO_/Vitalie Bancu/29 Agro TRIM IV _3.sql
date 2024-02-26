



                SELECT 
                    L.CUIIO,
                    L.CUIIO_VERS,
                    L.CUATM
                  
                FROM USER_BANCU.VW_KATALOG_29_AGRO_1059 L   
                                                LEFT JOIN  USER_BANCU.TRIM_4_29_AGRO R ON R.CUIIO = L.CUIIO 
--                                                
                                                WHERE 
                                                R.CUIIO IS NULL 
                                                
                                                --1063 --USER_BANCU.TRIM_4_29_AGRO
                                                --USER_BANCU.VW_KATALOG_29_AGRO_1059 6690 
                                                -- 6690 - 1063 =5627
                                                
                                                
                                                
                                                ORDER BY 
                                                    L.CUIIO   ;    
                                                    
                                                    
                                                    
                                                    
                                                    
                                                    
                                                    
                                                    
       SELECT 
                    L.CUIIO
                  
                  
                FROM USER_BANCU.VW_KATALOG_29_AGRO_1059 L   
                                                LEFT JOIN  USER_BANCU.TRIM_4_29_AGRO R ON R.CUIIO = L.CUIIO 
--                                                
                                                WHERE 
                                                R.CUIIO IS NOT NULL 
                                                                                     
                                                    
                                                    
                                                    
                                                    
                                                    
                                                    
                                                    
                                                    
                                                    
                                                    
                                                    
                      