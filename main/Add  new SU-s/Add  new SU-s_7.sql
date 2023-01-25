--INSERT INTO CIS2.FORM_CUIIO R (
--        CUIIO,
--        CUIIO_VERS,
--        FORM,
--        FORM_VERS,
--        STATUT 
--)



 SELECT 
 
        L.CUIIO,
        L.CUIIO_VERS,
        6 FORM,
        1004    FORM_VERS,
        '1' STATUT
       
        FROM --USER_BANCU.ADD_NEW_SU L

               CIS2.RENIM     L  
        WHERE 
   
        




CUIIO IN (
            SELECT CUIIO 
        FROM USER_BANCU.ADD_NEW_1_TUR


)  

AND CUIIO_VERS IN  (1056)


               
              
        
                                        