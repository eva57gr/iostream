SELECT 
                D.CUIIO, 
                MF.FORM DEN_FORM,
                MF.DEN_SHORT
                
                
                        FROM CIS2.VW_DATA_ALL D
                         INNER JOIN CIS2.MD_FORM MF ON  MF.FORM = D.FORM AND MF.FORM_VERS = D.FORM_VERS
                        WHERE 
                        
                        D.ANUL = 2022
                        
                        AND D.CUIIO IN (
                        41349476,
41000696,
40866092,
40220770,
41169047,
40774533,
41419515,
40065952,
20283170,
41290889,
41101569,
41286379,
40669115,
37787130
                        )
                        
                        GROUP BY 
                          D.CUIIO, 
                MF.FORM,
                MF.DEN_SHORT
                
                
                ORDER BY 
                D.CUIIO
                