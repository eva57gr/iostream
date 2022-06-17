
INSERT INTO CIS2.FORM_CUIIO R (
        CUIIO,
        CUIIO_VERS,
        FORM,
        FORM_VERS,
        STATUT 
)



 SELECT 
 
        L.CUIIO,
        L.CUIIO_VERS,
        43 FORM,
        2000   FORM_VERS,
        '1' STATUT
       
        FROM USER_BANCU.ADD_NEW_SU L
        
        WHERE 
        
        L.CUIIO NOT IN (
        4138408287
        ) 
                      
                                                  