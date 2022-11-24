--
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
        39 FORM,
        2000    FORM_VERS,
        '1' STATUT
       
        FROM --USER_BANCU.ADD_NEW_SU L

               CIS2.RENIM     L  
        WHERE 
   
        
L.CUIIO IN (



SELECT CUIIO
        FROM USER_BANCU.ADD_NEW_SU
)

AND FORM = 4

AND  CUIIO_VERS = 2011

      --  AND CUIIO_VERS IN (2011)
               
               
              
        
                                        