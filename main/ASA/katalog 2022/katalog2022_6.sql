--
--INSERT INTO CIS2.RENIM R (
--        CUIIO,
--        CUIIO_VERS,
--        DENUMIRE,
--        EDIT_USER,
--        STATUT,
--        CUATM,
--        CFP,
--        CFOJ,
--        CAEM2,
--        IDNO
--)
--


 SELECT 
 
        L.CUIIO,
        L.CUIIO_VERS,
        TRIM(L.DENUMIRE) DENUMIRE,
        1   EDIT_USER,
        '1' STATUT,
       TRIM(L.CUATM)  CUATM,
        TRIM(L.CFP) CFP,
        TRIM(L.CFOJ) CFOJ ,
        TRIM(L.CAEM2) CAEM2,
        TRIM(L.IDNO) IDNO
        FROM USER_BANCU.ADD_NEW_1_INOV_2022 L
        
        
                        LEFT JOIN CIS2.RENIM C ON C.CUIIO  =  L.CUIIO  
                                                  AND C.CUIIO_VERS  =  L.CUIIO_VERS  
                        
                        WHERE 
                        
                        C.CUIIO IS  NULL 
                        
                        
                        ORDER BY 
                        L.CFOJ
                        