--
--INSERT INTO CIS2.RENIM R (
--        CUIIO,
--        CUIIO_VERS,
--        DENUMIRE,
--        EDIT_USER,
--        STATUT,
--        CUATM,
--        CFP,
--        CFOJ
--)



 SELECT 
 
        L.CUIIO,
        L.CUIIO_VERS,
        L.DENUMIRE,
        1   EDIT_USER,
        '1' STATUT,
        L.CUATM,
        L.CFP,
        L.CFOJ
        FROM USER_BANCU.ADD_NEW_SU L
        
        
                        LEFT JOIN CIS.RENIM C ON C.CUIIO  =  L.CUIIO  
                                                  AND C.CUIIO_VERS  =  L.CUIIO_VERS  
                        
                        WHERE 
                        
                        C.CUIIO  IS NOT   NULL 