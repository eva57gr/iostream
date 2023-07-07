  SELECT FC.CUIIO,
  MF.DEN_SHORT,
                --   FC.CUIIO_VERS,
                
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
                   
                   FROM 

      (
      
      SELECT FC.CUIIO,
                  -- FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS.FORM_CUIIO  FC
                   INNER JOIN (  
                   SELECT CUIIO, 
                   MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS.FORM_CUIIO
                                  WHERE 
                                  1=1
                               GROUP BY CUIIO) 
                               BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
                           
                          
             
             WHERE 
       
             FC.STATUT <> '3'
             
             AND FC.CUIIO IN (
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
             FC.CUIIO,
                --   FC.CUIIO_VERS,
                   FC.FORM,
                    FC.FORM_VERS,
                   FC.STATUT
                   
                   
                  
) FC 
 INNER JOIN CIS.MD_FORM MF ON  MF.FORM = FC.FORM AND MF.FORM_VERS = FC.FORM_VERS
 
                   ORDER BY 
                        FC.CUIIO,
                --   FC.CUIIO_VERS,
                   FC.FORM,
               --    FC.FORM_VERS,
                   FC.STATUT