            

                INSERT INTO CIS2.X_BAZA_SONDAJ
                (
                
                CUIIO,
                PERS_IT,
                CIF_IT,
                ANUL    
                
                )
                
            
            
            
            SELECT 
                L.CUIIO,
                L.PERS_IT,
                L.CIF_IT,
                L.ANUL     

                    FROM USER_BANCU.X_BAZA_SONDAJ_TEST L LEFT JOIN 
                    
                                       CIS2.X_BAZA_SONDAJ R ON L.CUIIO = R.CUIIO AND 
                                                                     L.ANUL = R.ANUL  
                                                                     
                                                                     
                                                                     
                                                               WHERE 
                                                               
                                                               R.CUIIO IS  NULL;       
                    
                                
                    
                    
                     