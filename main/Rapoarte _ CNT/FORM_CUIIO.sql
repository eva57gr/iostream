--Acest CUIIO participa in 8 rapoarte dar pe web - http://webapp.statistica.md/repForm/ 
-- nu se afiseaza toate 
--Maria Chiperi m-a sunat
      SELECT       
                   FC.CUIIO,
                   MAX(FC.CUIIO_VERS) CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
                   
              FROM CIS2.FORM_CUIIO  FC
                   INNER JOIN (  
                   SELECT 
                   CUIIO,
                   FORM, 
                   MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                 
                               
                               GROUP BY 
                               CUIIO,
                               FORM
                               ) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE 
              
             FC.STATUT <> '3'
             AND FC.CUIIO = 41105900
             
           
GROUP BY
   FC.CUIIO,
                  
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT 
             

ORDER BY 

FC.FORM